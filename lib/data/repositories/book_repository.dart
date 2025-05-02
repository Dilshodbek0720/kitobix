import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kitobix/data/models/book/book_model.dart';
import 'package:kitobix/data/models/universal_data/universal_data.dart';
import 'package:kitobix/utils/constants/app_constants.dart';

class BookRepository {
  final FirebaseFirestore base = FirebaseFirestore.instance;

  Future<UniversalData> addBook({required BookModel bookModel}) async {
    try {
      DocumentReference newBook = await base
          .collection(FirebaseCollections.books)
          .add(bookModel.toJson());
      await base.collection(FirebaseCollections.books).doc(newBook.id).update({
        "bookId": newBook.id,
      });
      return UniversalData(data: "Book added!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> updateBook({required BookModel bookModel}) async {
    try {
      await base
          .collection(FirebaseCollections.books)
          .doc(bookModel.bookId)
          .update(bookModel.toJson());

      return UniversalData(data: "Book updated!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> deleteBook({required String bookId}) async {
    try {
      await base.collection(FirebaseCollections.books).doc(bookId).delete();

      return UniversalData(data: "Book deleted!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Stream<List<BookModel>> getBooks() => FirebaseFirestore.instance
      .collection(FirebaseCollections.books)
      .snapshots()
      .map(
        (event1) =>
            event1.docs.map((doc) => BookModel.fromJson(doc.data())).toList(),
      );
}
