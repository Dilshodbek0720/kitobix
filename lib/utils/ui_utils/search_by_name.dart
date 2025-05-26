import 'package:kitobix/data/models/book/book_model.dart';

List<BookModel> searchByName(List<BookModel> models, String query) {
  List<BookModel> results = [];

  for (BookModel model in models) {
    if (model.name.toLowerCase().contains(query.toLowerCase())) {
      results.add(model);
    }
  }
  return results;
}
