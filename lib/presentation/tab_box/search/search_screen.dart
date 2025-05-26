import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitobix/data/models/book/book_model.dart';
import 'package:kitobix/data/repositories/book_repository.dart';
import 'package:kitobix/presentation/app_routes.dart';
import 'package:kitobix/presentation/tab_box/search/widgets/book_search_item_view.dart';
import 'package:kitobix/presentation/widgets/inputs/text_input_view.dart';
import 'package:kitobix/utils/icons/app_icons.dart';
import 'package:kitobix/utils/ui_utils/search_by_name.dart';
import 'package:lottie/lottie.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
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
