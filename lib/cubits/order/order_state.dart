import 'package:equatable/equatable.dart';
import 'package:kitobix/data/models/book/book_model.dart';
import 'package:kitobix/data/models/form/form_status.dart';

class OrderState extends Equatable {
  final List<BookModel> books;
  final BookModel bookModel;
  final FormStatus status;

  const OrderState({
    required this.books,
    required this.bookModel,
    required this.status,
  });

  OrderState copyWith({
    BookModel? bookModel,
    FormStatus? status,
    List<BookModel>? books,
  }) {
    return OrderState(
      bookModel: bookModel ?? this.bookModel,
      status: status ?? this.status,
      books: books ?? this.books,
    );
  }

  @override
  List<Object?> get props => [bookModel, status, books];
}
