import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitobix/cubits/book/book_state.dart';
import 'package:kitobix/data/models/book/book_model.dart';
import 'package:kitobix/data/models/form/form_status.dart';
import 'package:kitobix/data/models/universal_data/universal_data.dart';
import 'package:kitobix/data/repositories/book_repository.dart';

class BookCubit extends Cubit<BookState> {
  final BookRepository bookRepository;

  BookCubit({required this.bookRepository})
      : super(
          const BookState(
            books: [],
            bookModel: BookModel(
              bookId: '',
              name: '',
              author: '',
              type: '',
              description: '',
              rate: '',
              image: '',
              file: '',
              audio: '',
            ),
            status: FormStatus.pure,
          ),
        );

  Future<void> addBook() async {
    emit(state.copyWith(status: FormStatus.loading));
    UniversalData data =
        await bookRepository.addBook(bookModel: state.bookModel);
    if (data.error.isEmpty) {
      emit(state.copyWith(
        status: FormStatus.success,
      ));
    } else {
      emit(state.copyWith(
        status: FormStatus.failure,
      ));
    }
  }

  Future<void> updateBook() async {
    emit(state.copyWith(status: FormStatus.loading));
    UniversalData data =
        await bookRepository.updateBook(bookModel: state.bookModel);
    if (data.error.isEmpty) {
      emit(state.copyWith(
        status: FormStatus.success,
      ));
    } else {
      emit(state.copyWith(
        status: FormStatus.failure,
      ));
    }
  }

  Future<void> deleteBook({required String bookId}) async {
    emit(state.copyWith(status: FormStatus.loading));
    UniversalData data = await bookRepository.deleteBook(bookId: bookId);
    if (data.error.isEmpty) {
      emit(state.copyWith(
        status: FormStatus.success,
      ));
    } else {
      emit(state.copyWith(
        status: FormStatus.failure,
      ));
    }
  }

  void updateModel({required BookModel bookModel}) {
    emit(state.copyWith(bookModel: bookModel));
  }
}
