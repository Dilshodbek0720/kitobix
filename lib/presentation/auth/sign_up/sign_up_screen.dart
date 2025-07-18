import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitobix/cubits/auth/auth_cubit.dart';
import 'package:kitobix/data/local/storage_repository.dart';
import 'package:kitobix/data/models/form/form_status.dart';
import 'package:kitobix/presentation/app_routes.dart';
import 'package:kitobix/presentation/auth/widgets/auth_navigation_button.dart';
import 'package:kitobix/presentation/auth/widgets/auth_text_field.dart';
import 'package:kitobix/presentation/auth/widgets/custom_appbar.dart';
import 'package:kitobix/presentation/auth/widgets/text_widget.dart';
import 'package:kitobix/presentation/widgets/buttons/global_button.dart';
import 'package:kitobix/utils/colors/app_colors.dart';
import 'package:kitobix/utils/constants/storage_keys.dart';
import 'package:kitobix/utils/icons/app_icons.dart';
import 'package:kitobix/utils/size/screen_size.dart';
import 'package:kitobix/utils/size/size_extension.dart';
import 'package:kitobix/utils/ui_utils/show_error_message.dart';

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
      body: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) {
          return Column(
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
                        const TextWidget(title: "Ro‘yxatdan o‘tish"),
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
                        28.ph,
                        AuthNavigatorButton(
                            title: "Hisobingiz yo‘qmi?",
                            onTap: () {
                              Navigator.pop(context);
                            },
                            onTapTitle: "Kirish"),
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
                    title: "Ro‘yxatdan o‘tish",
                    onTap: () {
                      context.read<AuthCubit>().signUp(context);
                    }),
              ),
            ],
          );
        },
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
