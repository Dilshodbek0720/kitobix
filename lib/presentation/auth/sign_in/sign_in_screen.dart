import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitobix/cubits/auth/auth_cubit.dart';
import 'package:kitobix/data/local/storage_repository.dart'
    show StorageRepository;
import 'package:kitobix/data/models/form/form_status.dart';
import 'package:kitobix/data/repositories/auth_repository.dart';
import 'package:kitobix/presentation/app_routes.dart';
import 'package:kitobix/presentation/auth/widgets/auth_navigation_button.dart';
import 'package:kitobix/presentation/auth/widgets/auth_text_field.dart';
import 'package:kitobix/presentation/auth/widgets/custom_appbar.dart';
import 'package:kitobix/presentation/auth/widgets/network_auth_button.dart';
import 'package:kitobix/presentation/auth/widgets/text_widget.dart';
import 'package:kitobix/presentation/widgets/buttons/global_button.dart';
import 'package:kitobix/utils/colors/app_colors.dart';
import 'package:kitobix/utils/constants/storage_keys.dart';
import 'package:kitobix/utils/icons/app_icons.dart';
import 'package:kitobix/utils/size/screen_size.dart';
import 'package:kitobix/utils/size/size_extension.dart';
import 'package:kitobix/utils/ui_utils/show_error_message.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isChecked = false;

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppbar(),
      body: BlocListener<AuthCubit, AuthState>(
        child: Column(
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
                            height: MediaQuery.of(context).size.height *
                                120 /
                                figmaHeight,
                            width: MediaQuery.of(context).size.height *
                                120 /
                                figmaHeight,
                            child: Image.asset(AppIcons.bookLogo),
                          )
                        ],
                      ),
                      const TextWidget(title: "Hisobingizga kirish"),
                      16.ph,
                      AuthTextField(
                        hintText: "Email",
                        onChanged: context.read<AuthCubit>().updateEmail,
                        focusNode: emailFocus,
                        isPassword: false,
                        parolkoz: null,
                      ),
                      16.ph,
                      AuthTextField(
                        hintText: "Password",
                        onChanged: context.read<AuthCubit>().updatePassword,
                        focusNode: passwordFocus,
                        isPassword: true,
                        parolkoz: " ",
                      ),
                      16.ph,
                      Row(
                        children: [
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              // Navigator.pushNamed(context, RouteNames.resetPassword);
                            },
                            child: Text(
                              "Parolni unutdingizmi?",
                              style: TextStyle(
                                color: AppColors.black,
                                fontFamily: "Urbanist",
                                fontSize: 16.sp,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ),
                        ],
                      ),
                      28.ph,
                      Center(
                        child: Text(
                          "Yoki quyidagilar orqali kiring",
                          style: TextStyle(
                            color: AppColors.neutral80,
                            fontFamily: "Urbanist",
                            fontSize: 16.sp,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ),
                      24.ph,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          NetworkAuthButton(
                              icon: SvgPicture.asset(AppIcons.google),
                              onTap: () {
                                context
                                    .read<AuthRepository>()
                                    .signInWithGoogle();
                              }),
                          NetworkAuthButton(
                              icon: SvgPicture.asset(AppIcons.facebook),
                              onTap: () {}),
                          NetworkAuthButton(
                              icon: SvgPicture.asset(
                                AppIcons.twitter,
                                colorFilter: const ColorFilter.mode(
                                    AppColors.info, BlendMode.srcIn),
                              ),
                              onTap: () {}),
                        ],
                      ),
                      24.ph,
                      AuthNavigatorButton(
                          title: "Hisobingiz yo‘qmi?",
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteNames.signUpScreen);
                          },
                          onTapTitle: "Ro‘yxatdan o‘tish"),
                      // const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(
              height: 1,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 24.w, top: 24.h, right: 24.w, bottom: 36.h),
              child: GlobalButton(
                color: AppColors.primary50,
                textColor: AppColors.white,
                title: "Kirish",
                onTap: () {
                  context.read<AuthCubit>().logIn(context);
                  // successDialog(context: context, title: "Sign in Successful!", image: AppIcons.success, onTap: (){ },text: "Please wait...\nYou will be directed to the homepage.");
                },
              ),
            ),
          ],
        ),
        listener: (context, state) async {
          if (state.status == FormStatus.authenticated) {
            await StorageRepository.putString(
              StorageKeys.userId,
              FirebaseAuth.instance.currentUser?.uid ?? "",
            );
            if (context.mounted) {
              Navigator.pushReplacementNamed(context, RouteNames.tabBox);
            }
          } else if (state.status == FormStatus.failure) {
            showErrorMessage(message: state.statusMessage, context: context);
          }
        },
      ),
    );
  }
}
