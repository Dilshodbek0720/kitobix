import 'package:equatable/equatable.dart';
import 'package:kitobix/data/models/book/book_model.dart';
import 'package:kitobix/data/models/form/form_status.dart';

class BookState extends Equatable {
  final List<BookModel> books;
  final BookModel bookModel;
  final FormStatus status;

  const BookState({
    required this.books,
    required this.bookModel,
    required this.status,
  });

  BookState copyWith({
    BookModel? bookModel,
    FormStatus? status,
    List<BookModel>? books,
  }) {
    return BookState(
      bookModel: bookModel ?? this.bookModel,
      status: status ?? this.status,
      books: books ?? this.books,
    );
  }

  @override
  List<Object?> get props => [bookModel, status, books];
}
