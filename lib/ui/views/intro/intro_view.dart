import 'package:animations/animations.dart';
import 'package:doit/app/app.router.dart';
import 'package:doit/ui/common/app_button.dart';
import 'package:doit/ui/common/app_colors.dart';
import 'package:doit/ui/common/app_scaffold.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'intro_viewmodel.dart';

class IntroView extends StackedView<IntroViewModel> {
  const IntroView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    IntroViewModel viewModel,
    Widget? child,
  ) {
    return AppScaffold(
        backgroundColor: Colors.white,
        body: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> primaryAnimation,
                  Animation<double> secondaryAnimation) =>
              FadeThroughTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 24),
                Image.asset(
                  'assets/intro.png',
                  width: MediaQuery.of(context).size.width * .8,
                ),
                const SizedBox(height: 32),
                Column(
                  children: [
                    AppButton(
                      text: "Create accoint",
                      onPressed: () {
                        viewModel.navigationService.navigateToAuthView();
                      },
                    ),
                    SizedBox(height: 10.h),
                    Center(
                      child: Text.rich(
                        textAlign: TextAlign.start,
                        TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(
                            fontSize: 12.5.sp,
                            fontWeight: FontWeight.w500,
                            color: kcMediumGrey.withOpacity(.5),
                            letterSpacing: 0,
                            overflow: TextOverflow.ellipsis,
                          ),
                          children: [
                            TextSpan(
                              text: "Sign in",
                              style: TextStyle(
                                fontSize: 12.5.sp,
                                fontWeight: FontWeight.w500,
                                color: kcPrimaryColor,
                                letterSpacing: 0,
                                overflow: TextOverflow.ellipsis,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  viewModel.navigationService
                                      .navigateToAuthView(
                                    isLogin: true,
                                  );
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
        )
            .animate()
            .fadeIn(curve: Curves.easeOutExpo, duration: 500.ms)
            .scale(delay: 500.ms) //
        );
  }

  @override
  IntroViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      IntroViewModel();
}
