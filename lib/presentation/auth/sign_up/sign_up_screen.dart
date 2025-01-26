import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitobix/presentation/app_routes.dart';
import 'package:kitobix/presentation/auth/widgets/auth_navigation_button.dart';
import 'package:kitobix/presentation/auth/widgets/auth_text_field.dart';
import 'package:kitobix/presentation/auth/widgets/custom_appbar.dart';
import 'package:kitobix/presentation/auth/widgets/network_auth_button.dart';
import 'package:kitobix/presentation/auth/widgets/text_widget.dart';
import 'package:kitobix/presentation/widgets/global_button.dart';
import 'package:kitobix/utils/colors/app_colors.dart';
import 'package:kitobix/utils/icons/app_icons.dart';
import 'package:kitobix/utils/size/screen_size.dart';
import 'package:kitobix/utils/size/size_extension.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isChecked = false;

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppbar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height*120/figmaHeight,
                          width: MediaQuery.of(context).size.height*120/figmaHeight,
                          child: Image.asset(AppIcons.bookLogo),
                        )
                      ],
                    ),
                    const TextWidget(title: "Register"),
                    16.ph,
                    AuthTextField(hintText: "Email", onChanged: (v){ }, focusNode: emailFocus,isPassword: false,parolkoz: null,),
                    16.ph,
                    AuthTextField(hintText: "Password", onChanged: (v){ }, focusNode: passwordFocus,isPassword: true,parolkoz: " ",),
                    28.ph,
                    AuthNavigatorButton(title: "Don’t have an account?", onTap: (){
                      Navigator.pushReplacementNamed(context, RouteNames.signInScreen);
                    }, onTapTitle: "Sign in"),
                    // const Spacer(),
                  ],
                ),
              ),
            ),
          ),
          const Divider(height: 1,),
          Padding(
            padding: EdgeInsets.only(left: 24.w, top: 24.h, right: 24.w, bottom: 36.h),
            child: GlobalButton(color: AppColors.primary50, textColor: AppColors.white, title: "Register", radius: 8, onTap: (){
              // successDialog(context: context, title: "Sign in Successful!", image: AppIcons.success, onTap: (){ },text: "Please wait...\nYou will be directed to the homepage.");
            }),
          ),
        ],
      ),
    );
  }
}
