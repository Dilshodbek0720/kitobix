import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitobix/cubits/tab/tab_cubit.dart';
import 'package:kitobix/data/models/book/book_model.dart';
import 'package:kitobix/data/repositories/book_repository.dart';
import 'package:kitobix/presentation/app_routes.dart';
import 'package:kitobix/presentation/tab_box/home/widgets/book_item_view.dart';
import 'package:kitobix/presentation/tab_box/home/widgets/see_all_item.dart';
import 'package:kitobix/utils/icons/app_icons.dart';
import 'package:kitobix/utils/size/size_extension.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<BookModel> books = [];

  @override
  void initState() {
    context.read<BookRepository>().getBooks().listen((event) {
      books = event;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 40,
          width: 165,
          child: Image.asset(AppIcons.audioBooks),
        ),
        actions: [
          // CustomIconButton(
          //   onTap: () {
          //     Navigator.pushNamed(context, RouteNames.addBookScreen);
          //   },
          //   icon: AppIcons.plus,
          // ),
          20.pw,
        ],
        automaticallyImplyLeading: false,
      ),
      body: Column(
        spacing: 16,
        children: [
          Expanded(
            child: StreamBuilder(
              stream: context.read<BookRepository>().getBooks(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          SeeAllItem(
                              onTap: () {
                                context.read<TabCubit>().changeTabIndex(1);
                              },
                              title: "Yangi qo'shilganlar"),
                          GridView(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 0.62,
                            ),
                            children: List.generate(
                              books.length,
                              (index) {
                                return BookItemView(
                                  bookModel: books[index],
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      RouteNames.detailBookScreen,
                                      arguments: books[index],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Lottie.asset(AppIcons.emptyLottie),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          )
        ],
      ),
    );
  }
}
