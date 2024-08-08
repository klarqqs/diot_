// ignore_for_file: must_be_immutable

import 'package:animations/animations.dart';
import 'package:doit/app/app.router.dart';
import 'package:doit/ui/common/app_colors.dart';
import 'package:doit/ui/views/auth/user_model.dart';
import 'package:doit/ui/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'bottom_navigation_viewmodel.dart';

class BottomNavigationView extends StackedView<BottomNavigationViewModel> {
  UserModel user;
  BottomNavigationView({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BottomNavigationViewModel viewModel,
    Widget? child,
  ) {
    Widget getViewForIndex(int index) {
      switch (index) {
        case 0:
          return HomeView(user: user);
        case 1:
          return const SizedBox();
        case 2:
          return const SizedBox();
        default:
          return const SizedBox();
      }
    }

    // ignore: no_leading_underscores_for_local_identifiers
    void _onItemTap(int index) {
      viewModel.updateCurrentIndex(index);
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kcPrimaryColor,
        onPressed: () {
          viewModel.navigationService.navigateToCreateItemView(isProject: true);
        },
        tooltip: 'Add project',
        elevation: 0,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> primaryAnimation,
                Animation<double> secondaryAnimation) =>
            FadeThroughTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
        child: getViewForIndex(viewModel.currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: viewModel.currentIndex,
        onTap: _onItemTap,
        elevation: 16,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedLabelStyle:
            GoogleFonts.questrial(fontWeight: FontWeight.bold),
        selectedLabelStyle: GoogleFonts.questrial(fontWeight: FontWeight.bold),
        selectedItemColor: kcPrimaryColor,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 20.5),
              child: viewModel.currentIndex == 0
                  ? SvgPicture.asset(
                      "assets/item1.svg",
                    )
                  : SvgPicture.asset(
                      "assets/item3.svg",
                    ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 20.5),
              child: viewModel.currentIndex == 1
                  ? SvgPicture.asset(
                      "assets/arcticons_zoho-projects.svg",
                    )
                  : SvgPicture.asset(
                      "assets/item4.svg",
                    ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 20.5),
              child: viewModel.currentIndex == 2
                  ? SvgPicture.asset(
                      "assets/item2.svg",
                    )
                  : SvgPicture.asset(
                      "assets/item2.svg",
                    ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }

  @override
  BottomNavigationViewModel viewModelBuilder(BuildContext context) =>
      BottomNavigationViewModel();
  @override
  Future<void> onViewModelReady(BottomNavigationViewModel viewModel) async {
    super.onViewModelReady(viewModel);
    await viewModel.getLoginDetails();
  }
}
