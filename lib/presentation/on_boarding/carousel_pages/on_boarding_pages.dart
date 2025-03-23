import 'package:flutter/material.dart';
import 'package:kitobix/presentation/app_routes.dart';
import 'package:kitobix/presentation/on_boarding/carousel_pages/widgets/page_view_icon_index.dart';
import 'package:kitobix/presentation/on_boarding/carousel_pages/widgets/page_view_item.dart';
import 'package:kitobix/presentation/widgets/global_button.dart';
import 'package:kitobix/utils/colors/app_colors.dart';
import 'package:kitobix/utils/icons/app_icons.dart';
import 'package:kitobix/utils/size/size_extension.dart';

class OnBoardingPages extends StatefulWidget {
  const OnBoardingPages({super.key});

  @override
  State<OnBoardingPages> createState() => _OnBoardingPagesState();
}

class _OnBoardingPagesState extends State<OnBoardingPages> {
  int pageIndex = 0;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: height,
            width: width,
            child: Image.asset(AppIcons.onBoardingBackground),
          ),
          Column(
            children: [
              Expanded(
                child: PageView(
                  onPageChanged: (index) {
                    setState(() {
                      pageIndex = index;
                    });
                  },
                  controller: pageController,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: const [
                    PageViewItem(
                      title: "Biz bilan maroqli mutola!",
                      img: AppIcons.onBoarding1,
                    ),
                    PageViewItem(
                      title: "Yangidan yangi kitoblar!",
                      img: AppIcons.onBoarding2,
                    ),
                    PageViewItem(
                      title: "Hozirdan tinglashni boshlang!",
                      img: AppIcons.onBoarding3,
                    ),
                  ],
                ),
              ),
              PageIndexItem(activePageIndex: pageIndex),
              20.ph,
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width / 16,
                  vertical: width / 16,
                ),
                child: GlobalButton(
                  color: AppColors.primary50,
                  title: pageIndex != 2 ? "Next" : "Lets Get Started",
                  radius: 16,
                  textColor: AppColors.white,
                  onTap: () async {
                    if (pageIndex < 2) {
                      pageIndex++;
                      setState(() {
                        pageController.animateToPage(
                          pageIndex,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear,
                        );
                      });
                    }
                    if (pageIndex == 2) {
                      // await StorageRepository.putBool(StorageKeys.welcomeDone, true);
                      if (context.mounted) {
                        Navigator.pushReplacementNamed(
                          context,
                          RouteNames.signInScreen,
                        );
                      }
                    }
                  },
                ),
              ),
              24.ph,
            ],
          )
        ],
      ),
    );
  }
}
