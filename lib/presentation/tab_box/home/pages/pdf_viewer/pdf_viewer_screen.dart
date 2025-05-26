import 'package:flutter/material.dart';
import 'package:kitobix/data/models/book/book_model.dart';
import 'package:kitobix/presentation/widgets/custom_appbar.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerPage extends StatelessWidget {
  final BookModel bookModel;

  const PdfViewerPage({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: bookModel.name,
        isLeading: true,
      ),
      body: SfPdfViewer.network(bookModel.file),
    );
  }
}
