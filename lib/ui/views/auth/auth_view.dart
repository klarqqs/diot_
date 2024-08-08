import 'package:doit/ui/common/app_button.dart';
import 'package:doit/ui/common/app_colors.dart';
import 'package:doit/ui/common/app_scaffold.dart';
import 'package:doit/ui/common/validations.dart';
import 'package:doit/ui/views/auth/widgets/app_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import 'auth_viewmodel.dart';

class AuthView extends StackedView<AuthViewModel> {
  final bool isLogin;
  AuthView({
    Key? key,
    this.isLogin = false,
  }) : super(key: key);

  final GlobalKey<FormState> _signupFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  Widget builder(
    BuildContext context,
    AuthViewModel viewModel,
    Widget? child,
  ) {
    return AppScaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: viewModel.pageToggle
            ? _buildCreateAccount(viewModel, context)
            : _buildWelcomeBack(viewModel),
      ),
    );
  }

  Widget _buildWelcomeBack(AuthViewModel viewModel) {
    return Form(
      key: _loginFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                const Spacer(),
                Image.asset(
                  'assets/logo.png',
                  height: 32,
                ),
                SizedBox(height: 12.h),
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: kDefaultIconDarkColor,
                    letterSpacing: 0,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 32.h),
                AppTextField(
                  textEditingController: viewModel.email,
                  validator: (String? value) =>
                      Validation.validateEmail(value!),
                  hintText: "Email address",
                ),
                SizedBox(height: 16.h),
                AppTextField(
                  textEditingController: viewModel.password,
                  validator: (String? val) => Validation.validatePassword(val!),
                  hintText: "Password",
                ),
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(
                    textAlign: TextAlign.start,
                    TextSpan(
                      text: "Forgot Password?",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: kcMediumGrey.withOpacity(.5),
                        letterSpacing: 0,
                        overflow: TextOverflow.ellipsis,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // viewModel.navigationService
                          //     .navigateToAuthForgotPasswordView();
                        },
                    ),
                  ),
                ),
                const Spacer(),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            text: "Sign in",
                            onPressed: () {
                              if (_loginFormKey.currentState!.validate()) {
                                viewModel.navigateToHome();
                              }
                            },
                          ),
                        ),
                        SizedBox(width: 12.h),
                        SizedBox(
                          width: 56,
                          child: TextButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(vertical: 12.h),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                              ),
                              side: MaterialStateProperty.all(
                                const BorderSide(
                                  width: 1.0,
                                  color: kcPrimaryColor,
                                ),
                              ),
                            ),
                            onPressed: () => {},
                            child: SvgPicture.asset(
                              'assets/finger_print.svg',
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Center(
                      child: Text.rich(
                        textAlign: TextAlign.start,
                        TextSpan(
                          text: "Don’t have an account? ",
                          style: TextStyle(
                            fontSize: 12.5.sp,
                            fontWeight: FontWeight.w500,
                            color: kcMediumGrey.withOpacity(.5),
                            letterSpacing: 0,
                            overflow: TextOverflow.ellipsis,
                          ),
                          children: [
                            TextSpan(
                              text: "Create account",
                              style: TextStyle(
                                fontSize: 12.5.sp,
                                fontWeight: FontWeight.w500,
                                color: kcPrimaryColor,
                                letterSpacing: 0,
                                overflow: TextOverflow.ellipsis,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  viewModel.togglePage();
                                },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreateAccount(AuthViewModel viewModel, BuildContext context) {
    return Form(
      key: _signupFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create\nAccount",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: kDefaultIconDarkColor,
                      letterSpacing: 0,
                      overflow: TextOverflow.ellipsis,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * .4),
                    child: Text.rich(
                      textAlign: TextAlign.start,
                      TextSpan(
                        text: "Please fill the details below to create a ",
                        style: TextStyle(
                          fontSize: 12.5.sp,
                          fontWeight: FontWeight.w500,
                          color: kcMediumGrey,
                          letterSpacing: 0,
                          overflow: TextOverflow.ellipsis,
                        ),
                        children: [
                          TextSpan(
                            text: "DO-IT ",
                            style: TextStyle(
                              fontSize: 12.5.sp,
                              fontWeight: FontWeight.w500,
                              color: kcPrimaryColor,
                              letterSpacing: 0,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          TextSpan(
                            text: "account",
                            style: TextStyle(
                              fontSize: 12.5.sp,
                              fontWeight: FontWeight.w500,
                              color: kcMediumGrey,
                              letterSpacing: 0,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  AppTextField(
                    textEditingController: viewModel.name,
                    validator: Validation.validateString,
                    hintText: "Name",
                  ),
                  SizedBox(height: 16.h),
                  AppTextField(
                    textEditingController: viewModel.email,
                    validator: (String? value) =>
                        Validation.validateEmail(value!),
                    hintText: "Email address",
                  ),
                  SizedBox(height: 16.h),
                  AppTextField(
                    textEditingController: viewModel.phone,
                    validator: (String? value) =>
                        Validation.validatePhoneNumber(value!),
                    hintText: "Phone Number",
                  ),
                  SizedBox(height: 16.h),
                  AppTextField(
                    textEditingController: viewModel.password,
                    validator: (String? val) =>
                        Validation.validatePassword(val!),
                    hintText: "Password",
                  ),
                  SizedBox(height: 10.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text.rich(
                      textAlign: TextAlign.start,
                      TextSpan(
                        text: "Password must be atleast 8 characters",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: kcMediumGrey.withOpacity(.5),
                          letterSpacing: 0,
                          overflow: TextOverflow.ellipsis,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // viewModel.navigationService
                            //     .navigateToAuthForgotPasswordView();
                          },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                AppButton(
                  text: "Create account",
                  onPressed: () {
                    if (_signupFormKey.currentState!.validate()) {
                      viewModel.navigateToHome();
                    }
                  },
                ),
                SizedBox(height: 10.h),
                Center(
                  child: Text.rich(
                    textAlign: TextAlign.start,
                    TextSpan(
                      text: "Already have an account?",
                      style: TextStyle(
                        fontSize: 12.5.sp,
                        fontWeight: FontWeight.w500,
                        color: kcMediumGrey.withOpacity(.5),
                        letterSpacing: 0,
                        overflow: TextOverflow.ellipsis,
                      ),
                      children: [
                        TextSpan(
                          text: " Log in",
                          style: TextStyle(
                            fontSize: 12.5.sp,
                            fontWeight: FontWeight.w500,
                            color: kcPrimaryColor,
                            letterSpacing: 0,
                            overflow: TextOverflow.ellipsis,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              viewModel.togglePage();
                            },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  AuthViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AuthViewModel();

  @override
  void onViewModelReady(AuthViewModel viewModel) {
    viewModel.pageToggle = isLogin ? false : true;
    viewModel.notifyListeners();
    super.onViewModelReady(viewModel);
  }
}
