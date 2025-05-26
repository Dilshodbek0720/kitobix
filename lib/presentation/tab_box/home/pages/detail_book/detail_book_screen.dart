import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitobix/cubits/order/order_cubit.dart';
import 'package:kitobix/data/models/book/book_model.dart';
import 'package:kitobix/presentation/app_routes.dart';
import 'package:kitobix/presentation/tab_box/home/widgets/rating_stars_widget.dart';
import 'package:kitobix/presentation/widgets/buttons/custom_icon_button.dart';
import 'package:kitobix/utils/colors/app_colors.dart';
import 'package:kitobix/utils/icons/app_icons.dart';
import 'package:kitobix/utils/size/size_extension.dart';
import 'package:kitobix/utils/theme/custom_text_style.dart';
import 'package:lottie/lottie.dart';

class DetailBookScreen extends StatelessWidget {
  const DetailBookScreen({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Center(
          child: CustomIconButton(
            onTap: () {
              Navigator.pop(context);
            },
            icon: AppIcons.arrowLeft,
          ),
        ),
        actions: [
          CustomIconButton(
            onTap: () {
              context.read<OrderCubit>().updateModel(
                    bookModel: BookModel(
                      bookId: '',
                      type: bookModel.type,
                      rate: bookModel.rate,
                      name: bookModel.name,
                      author: bookModel.author,
                      description: bookModel.description,
                      image: bookModel.image,
                      file: bookModel.file,
                      audio: bookModel.audio,
                    ),
                  );
              context.read<OrderCubit>().addBook();
            },
            icon: AppIcons.plusAdditional,
            title: "Albatta, o'qiyman",
          ),
          12.pw,
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: SizedBox(
                      height: 270 * MediaQuery.sizeOf(context).width / 375,
                      width: 180 * MediaQuery.sizeOf(context).width / 375,
                      child: CachedNetworkImage(
                        imageUrl: bookModel.image,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Padding(
                          padding: EdgeInsets.all(20.r),
                          child: Lottie.asset(AppIcons.loader),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                ],
              ),
              28.ph,
              Text(
                bookModel.name,
                style: CustomTextStyle.displayMedium(context, fontSize: 28),
              ),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      bookModel.author,
                      style: CustomTextStyle.displaySmall(
                        context,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  16.pw,
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: 1, color: AppColors.neutral60),
                    ),
                    child: Text(
                      bookModel.type,
                      style: CustomTextStyle.bodyMedium(context),
                    ),
                  )
                ],
              ),
              16.ph,
              Row(
                children: [
                  RatingStarsWidget(
                      rating: double.parse(bookModel.rate).round()),
                  12.pw,
                  Text(
                    bookModel.rate,
                    style: CustomTextStyle.displaySmall(
                      context,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              24.ph,
              Row(
                children: [
                  Expanded(
                    child: CustomIconButton(
                      height: 54,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouteNames.audioViewerScreen,
                          arguments: bookModel,
                        );
                      },
                      icon: AppIcons.play,
                      title: "Play Audio",
                      iconColor: AppColors.white,
                      textColor: AppColors.white,
                      bgColor: AppColors.primary50,
                    ),
                  ),
                  16.pw,
                  Expanded(
                    child: CustomIconButton(
                      height: 54,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouteNames.pdfViewerScreen,
                          arguments: bookModel,
                        );
                      },
                      title: "Read Book",
                      icon: AppIcons.document,
                      iconColor: AppColors.primary50,
                      textColor: AppColors.primary50,
                    ),
                  ),
                ],
              ),
              24.ph,
              Text(
                "Kitob haqida",
                style: CustomTextStyle.headlineLarge(
                  context,
                  color: AppColors.neutral80,
                ),
              ),
              Text(
                bookModel.description,
                style: CustomTextStyle.headlineSmall(
                  context,
                  color: AppColors.neutral80,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
