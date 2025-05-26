import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitobix/data/models/book/book_model.dart';
import 'package:kitobix/data/models/form/form_status.dart';
import 'package:kitobix/data/models/universal_data/universal_data.dart';
import 'package:kitobix/data/repositories/order_repository.dart';
import 'package:kitobix/utils/ui_utils/show_error_message.dart';
import 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepository orderRepository;

  OrderCubit({required this.orderRepository})
      : super(
          const OrderState(
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
        await orderRepository.addBook(bookModel: state.bookModel);
    if (data.error.isEmpty) {
      emit(state.copyWith(
        status: FormStatus.success,
      ));
      showToastMessage(data.data);
    } else {
      emit(state.copyWith(
        status: FormStatus.failure,
      ));
    }
  }

  Future<void> updateBook() async {
    emit(state.copyWith(status: FormStatus.loading));
    UniversalData data =
        await orderRepository.updateBook(bookModel: state.bookModel);
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
    UniversalData data = await orderRepository.deleteBook(bookId: bookId);
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
