import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitobix/data/models/book/book_model.dart';
import 'package:kitobix/utils/colors/app_colors.dart';
import 'package:kitobix/utils/icons/app_icons.dart';
import 'package:kitobix/utils/size/size_extension.dart';
import 'package:kitobix/utils/theme/custom_text_style.dart';
import 'package:lottie/lottie.dart';

class BookSearchItemView extends StatelessWidget {
  const BookSearchItemView(
      {super.key, required this.onTap, required this.bookModel});

  final VoidCallback onTap;
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 0.4, color: AppColors.slate50),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width / 5,
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
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          bookModel.name,
                          style: CustomTextStyle.headlineMedium(
                            context,
                          ),
                        ),
                        6.ph,
                        Text(
                          bookModel.author,
                          style: CustomTextStyle.labelMedium(
                            context,
                          ),
                        ),
                        6.ph,
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 8,
                            bottom: 8,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: AppColors.amber50,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      bookModel.rate,
                                      style: CustomTextStyle.bodyMedium(
                                        context,
                                      ),
                                    ),
                                    6.pw,
                                    SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: SvgPicture.asset(
                                        AppIcons.rateStar,
                                        colorFilter: const ColorFilter.mode(
                                          AppColors.amber500,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
