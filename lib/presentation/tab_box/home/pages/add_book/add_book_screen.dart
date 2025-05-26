import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kitobix/cubits/book/book_cubit.dart';
import 'package:kitobix/cubits/book/book_state.dart';
import 'package:kitobix/data/models/book/book_model.dart';
import 'package:kitobix/data/models/form/form_status.dart';
import 'package:kitobix/data/models/universal_data/universal_data.dart';
import 'package:kitobix/presentation/widgets/buttons/global_button.dart';
import 'package:kitobix/presentation/widgets/inputs/text_input_view.dart';
import 'package:kitobix/presentation/widgets/painter/dashed_border_painter.dart';
import 'package:kitobix/utils/colors/app_colors.dart';
import 'package:kitobix/utils/icons/app_icons.dart';
import 'package:kitobix/utils/size/size_extension.dart';
import 'package:kitobix/utils/theme/custom_text_style.dart';
import 'package:kitobix/utils/ui_utils/loading_dialog.dart';
import 'package:kitobix/utils/ui_utils/show_error_message.dart';
import 'package:kitobix/utils/ui_utils/upload_image.dart';
import 'package:lottie/lottie.dart';

class AddBookScreen extends StatefulWidget {
  const AddBookScreen({super.key, this.bookModel});

  final BookModel? bookModel;

  @override
  State<AddBookScreen> createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  ImagePicker picker = ImagePicker();
  String image = "";
  String file = "";
  TextEditingController nameController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController audioController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController rateController = TextEditingController();

  @override
  void initState() {
    if (widget.bookModel != null) {
      image = widget.bookModel!.image;
      file = widget.bookModel!.file;
      nameController.text = widget.bookModel!.name;
      authorController.text = widget.bookModel!.author;
      descriptionController.text = widget.bookModel!.description;
      audioController.text = widget.bookModel!.audio;
      typeController.text = widget.bookModel!.type;
      rateController.text = widget.bookModel!.rate;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.bookModel == null ? "Add Screen" : "Update Screen",
          style: const TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(AppIcons.arrowLeft),
        ),
        actions: [
          widget.bookModel != null
              ? IconButton(
                  onPressed: () {
                    context
                        .read<BookCubit>()
                        .deleteBook(bookId: widget.bookModel!.bookId);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                )
              : const SizedBox(),
          6.pw
        ],
      ),
      body: BlocConsumer<BookCubit, BookState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                spacing: 16,
                children: [
                  TextInputView(
                    hintText: "Book Name",
                    caption: "Book Name",
                    controller: nameController,
                  ),
                  TextInputView(
                    caption: "Author",
                    hintText: "Author",
                    controller: authorController,
                  ),
                  TextInputView(
                    caption: "Description",
                    hintText: "Description",
                    controller: descriptionController,
                  ),
                  TextInputView(
                    caption: "Type of book",
                    hintText: "Type of book",
                    controller: typeController,
                  ),
                  TextInputView(
                    caption: "Rate of book",
                    hintText: "Rate of book",
                    controller: rateController,
                  ),
                  TextInputView(
                    caption: "Audio link",
                    hintText: "Audio link",
                    controller: audioController,
                  ),
                  TextButton(
                    onPressed: () {
                      showBottomSheetDialog();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Select Image"),
                        10.pw,
                        const Icon(Icons.photo_outlined)
                      ],
                    ),
                  ),
                  image.isNotEmpty
                      ? Container(
                          height: MediaQuery.of(context).size.width / 1.8,
                          width: MediaQuery.of(context).size.width / 1.8,
                          margin: EdgeInsets.symmetric(
                              horizontal: 80.w, vertical: 20.h),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: AppColors.slate100),
                              borderRadius: BorderRadius.circular(30.r)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30.r),
                            child: CachedNetworkImage(
                              imageUrl: image,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Padding(
                                  padding: EdgeInsets.all(20.r),
                                  child: Lottie.asset(AppIcons.loader)),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  CustomPaint(
                    painter: DashedBorderPainter(
                      color: AppColors.slate300,
                      borderRadius: 14,
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        final result = await FilePicker.platform.pickFiles();

                        if (result != null) {
                          XFile xFile = XFile(result.files.single.path!);
                          UniversalData data = await imageUploader(xFile);
                          setState(() {
                            file = data.data as String;
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: AppColors.slate50,
                        ),
                        width: double.infinity,
                        height: 152,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 8.0,
                            children: [
                              file.isNotEmpty
                                  ? Text(
                                      "Fayl tanlandi!",
                                      style: CustomTextStyle.labelMedium(
                                        context,
                                        color: AppColors.primary500,
                                      ),
                                    )
                                  : const SizedBox(),
                              SvgPicture.asset(AppIcons.upload),
                              Builder(
                                builder: (context) {
                                  return Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Tanlay oladigan fayl turi: ",
                                          style: CustomTextStyle.labelMedium(
                                            context,
                                            color: AppColors.slate300,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "PDF",
                                          style: CustomTextStyle.labelMedium(
                                            context,
                                            color: AppColors.primary500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.center,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GlobalButton(
                    title:
                        widget.bookModel == null ? "Add Book" : "Update Book",
                    textColor: AppColors.white,
                    onTap: () {
                      if (image.isNotEmpty &&
                          file.isNotEmpty &&
                          nameController.text.isNotEmpty &&
                          authorController.text.isNotEmpty &&
                          descriptionController.text.isNotEmpty &&
                          audioController.text.isNotEmpty &&
                          typeController.text.isNotEmpty &&
                          rateController.text.isNotEmpty) {
                        if (widget.bookModel == null) {
                          context.read<BookCubit>().updateModel(
                                bookModel: BookModel(
                                  bookId: '',
                                  type: typeController.text,
                                  rate: rateController.text,
                                  name: nameController.text,
                                  author: authorController.text,
                                  description: descriptionController.text,
                                  audio: audioController.text,
                                  image: image,
                                  file: file,
                                ),
                              );
                          context.read<BookCubit>().addBook();
                        } else {
                          context.read<BookCubit>().updateModel(
                                bookModel: BookModel(
                                  bookId: widget.bookModel!.bookId,
                                  type: typeController.text,
                                  rate: rateController.text,
                                  name: nameController.text,
                                  author: authorController.text,
                                  description: descriptionController.text,
                                  audio: audioController.text,
                                  image: image,
                                  file: file,
                                ),
                              );
                          context.read<BookCubit>().updateBook();
                        }
                      } else {
                        showErrorMessage(
                            message: "Malumotni to'liq kiriting!",
                            context: context);
                      }
                    },
                  )
                ],
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state.status == FormStatus.success) {
            debugPrint("Muvaffaqqiyatli");
            Navigator.pop(context);
          }
          if (state.status == FormStatus.failure) {
            showErrorMessage(message: "Xatolik yuz berdi!", context: context);
          }
        },
      ),
    );
  }

  void showBottomSheetDialog() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(24),
          height: 180,
          decoration: const BoxDecoration(
            color: AppColors.slate50,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  _getFromCamera();
                  Navigator.pop(context);
                },
                leading: const Icon(
                  Icons.camera_alt,
                  color: AppColors.slate800,
                ),
                title: Text(
                  "Select from Camera",
                  style: CustomTextStyle.labelMedium(context),
                ),
              ),
              ListTile(
                onTap: () {
                  _getFromGallery();
                  Navigator.pop(context);
                },
                leading: const Icon(
                  Icons.photo,
                  color: AppColors.slate800,
                ),
                title: Text(
                  "Select from Gallery",
                  style: CustomTextStyle.labelMedium(context),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> _getFromCamera() async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 512,
      maxWidth: 512,
    );
    if (mounted) {
      showLoading(context: context);
    }
    if (xFile != null && context.mounted) {
      UniversalData data = await imageUploader(xFile);
      setState(() {
        image = data.data as String;
      });
    }
    if (mounted) {
      hideLoading(context: context);
    }
  }

  Future<void> _getFromGallery() async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
    );
    if (mounted) {
      showLoading(context: context);
    }
    if (xFile != null && context.mounted) {
      UniversalData data = await imageUploader(xFile);
      setState(() {
        image = data.data as String;
      });
    }
    if (mounted) {
      hideLoading(context: context);
    }
  }
}
