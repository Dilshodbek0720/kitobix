import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitobix/cubits/auth/auth_cubit.dart';
import 'package:kitobix/cubits/tab/tab_cubit.dart';
import 'package:kitobix/data/local/storage_repository.dart';
import 'package:kitobix/data/models/book/book_model.dart';
import 'package:kitobix/data/repositories/order_repository.dart';
import 'package:kitobix/presentation/app_routes.dart';
import 'package:kitobix/presentation/tab_box/search/widgets/book_search_item_view.dart';
import 'package:kitobix/presentation/widgets/buttons/custom_icon_button.dart';
import 'package:kitobix/presentation/widgets/inputs/text_input_view.dart';
import 'package:kitobix/utils/constants/storage_keys.dart';
import 'package:kitobix/utils/icons/app_icons.dart';
import 'package:kitobix/utils/size/size_extension.dart';
import 'package:kitobix/utils/theme/custom_text_style.dart';
import 'package:kitobix/utils/ui_utils/search_by_name.dart';
import 'package:lottie/lottie.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  List<BookModel> books = [];

  @override
  void initState() {
    context.read<OrderRepository>().getBooks().listen((event) {
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
          CustomIconButton(
            onTap: () async {
              StorageRepository.deleteString(StorageKeys.userId);
              await context.read<AuthCubit>().logOutUser();
              if (context.mounted) {
                Navigator.pushReplacementNamed(
                    context, RouteNames.signInScreen);
                context.read<TabCubit>().changeTabIndex(0);
              }
            },
            icon: AppIcons.logOut,
          ),
          20.pw,
        ],
        automaticallyImplyLeading: false,
      ),
      body: Column(
        spacing: 16,
        children: [
          Expanded(
            child: StreamBuilder(
              stream: context.read<OrderRepository>().getBooks(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        16.ph,
                        Text(
                          "Mening Kitoblarim",
                          style: CustomTextStyle.displayMedium(
                            context,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: TextInputView(
                              hintText: "Search anything",
                              onChanged: (v) {
                                setState(() {
                                  books = searchByName(snapshot.data!, v);
                                });
                              }),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: List.generate(
                                books.length,
                                (index) {
                                  return BookSearchItemView(
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
                          ),
                        ),
                      ],
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
