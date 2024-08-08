import 'package:doit/app/app.router.dart';
import 'package:doit/ui/common/app_colors.dart';
import 'package:doit/ui/common/app_scaffold.dart';
import 'package:doit/ui/common/time_agos_extention.dart';
import 'package:doit/ui/views/auth/user_model.dart';
import 'package:doit/ui/views/create_item/create_item_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserModel user;

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return AppScaffold(
      appbar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: _buildAppBarTitle(context),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: SvgPicture.asset('assets/notification.svg'),
          ),
        ],
        centerTitle: false,
        leading: const SizedBox.shrink(),
        leadingWidth: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildDashboard(context, viewModel),
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Task in Progress",
                    style: GoogleFonts.workSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -.2,
                      color: kcBackgroundColor,
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () => viewModel.navigationService
                  //       .navigateToProjectsView(projects: projects, tasks: tasks),
                  //   child: Text(
                  //     "See all",
                  //     style: GoogleFonts.workSans(
                  //       fontSize: 12,
                  //       fontWeight: FontWeight.w500,
                  //       letterSpacing: -.2,
                  //       color: kcPrimaryColor,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              _buildTasksList(context, viewModel),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTasksList(BuildContext context, HomeViewModel viewModel) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.h),
          _buildTasksListView(viewModel),
        ],
      ),
    );
  }

  Widget _buildTasksListView(HomeViewModel viewModel) {
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: ListView.builder(
        reverse: true,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: viewModel.tasks.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: _buildTaskItem(context, index, viewModel),
          );
        },
      ),
    );
  }

  Widget _buildTaskItem(
      BuildContext context, int index, HomeViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.05),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTaskHeader(index, viewModel),
          const SizedBox(height: 8),
          _buildTaskDetails(context, index, viewModel),
        ],
      ),
    );
  }

  Row _buildTaskHeader(int index, HomeViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          viewModel.tasks[index]["name"],
          style: GoogleFonts.dmSans(
            color: kcBackgroundColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xff58028C),
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          child: Text(
            DateTime.parse(
              viewModel.projects[index]["created"],
            ).timeAgo(numericDates: false),
            style: GoogleFonts.dmSans(
              color: Colors.white,
              fontSize: 11.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  Row _buildTaskDetails(
      BuildContext context, int index, HomeViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Team members",
              style: GoogleFonts.dmSans(
                fontSize: 10.sp,
                color: kcMediumGrey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            _buildTeamMembersList(index, viewModel),
            const SizedBox(height: 12),
            _buildTaskDateInfo(index, viewModel),
          ],
        ),
        const SizedBox(width: 12),
        SvgPicture.asset(
          'assets/dooo.svg',
          height: 70,
        ),
      ],
    );
  }

  SizedBox _buildTeamMembersList(int index, HomeViewModel viewModel) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: viewModel.tasks[index]['staffs'].length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: const Color.fromARGB(255, 255, 99, 21),
              child: Center(
                child: CircleAvatar(
                  radius: 11.5,
                  backgroundColor: const Color(0xffFCF4F0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SvgPicture.asset(getARandomAvatar()),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTaskDateInfo(int index, HomeViewModel viewModel) {
    return Row(
      children: [
        _buildDateInfo2("start", viewModel.tasks[index]["created"], true),
        const SizedBox(width: 18),
        _buildDateInfo2("end", viewModel.tasks[index]["end"], false),
      ],
    );
  }

  Column _buildDateInfo(String label, String date, bool is1) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.dmSans(
            color: is1 ? const Color(0xffF30909) : const Color(0xff009A49),
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          date.split(' ')[0],
          style: GoogleFonts.dmSans(
            color: kcBackgroundColor,
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Column _buildDateInfo2(String label, String date, bool is1) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: GoogleFonts.dmSans(
            color: is1 ? const Color(0xffF30909) : const Color(0xff009A49),
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          date.split(' ')[0],
          style: GoogleFonts.dmSans(
            color: kcBackgroundColor,
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildAppBarTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hi ${user.name ?? user.email!.split('@')[0]}",
            style: const TextStyle(
              fontSize: 24,
              color: kcBackgroundColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 2.h),
          const Text(
            "Welcome onboard",
            style: TextStyle(
              fontSize: 12,
              color: kcPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboard(
    BuildContext context,
    HomeViewModel viewModel,
  ) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 7.5;
    final double itemWidth = size.width / 3.2;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        childAspectRatio: (itemWidth / itemHeight),
      ),
      itemCount: viewModel.dashboardCardModels.length,
      itemBuilder: (context, index) {
        DashboardCardModel cardModel = viewModel.dashboardCardModels[index];
        return _buildDashboardCard(context, viewModel, cardModel);
      },
    );
  }

  Widget _buildDashboardCard(
    BuildContext context,
    HomeViewModel viewModel,
    DashboardCardModel cardModel,
  ) {
    return GestureDetector(
      onTap: () => _handleCardTap(viewModel, cardModel),
      child: Container(
        padding: const EdgeInsets.all(18.0),
        decoration: BoxDecoration(
          color: cardModel.color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(cardModel.icon),
                Text(
                  _getCardCount(viewModel, cardModel),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(cardModel.name),
          ],
        ),
      ),
    );
  }

  void _handleCardTap(HomeViewModel viewModel, DashboardCardModel cardModel) {
    switch (cardModel.name) {
      case "Projects":
        viewModel.navigationService.navigateToProjectsView(
          projects: viewModel.projects,
          tasks: viewModel.tasks,
        );
        break;
      case "Tasks":
        viewModel.navigationService.navigateToProjectsView(
          projects: viewModel.projects,
          tasks: viewModel.tasks,
          isProject: false,
        );
        break;
      case "Completed Tasks":
        viewModel.navigationService.navigateToProjectsView(
          projects: viewModel.projects,
          tasks: viewModel.tasks,
          isProject: false,
          isCompleted: true,
        );
        break;
      case "Overdue Tasks":
        viewModel.navigationService.navigateToProjectsView(
          projects: viewModel.projects,
          tasks: viewModel.tasks,
          isProject: false,
          isOverdue: true,
        );
        break;
    }
  }

  String _getCardCount(HomeViewModel viewModel, DashboardCardModel cardModel) {
    switch (cardModel.name) {
      case "Projects":
        return viewModel.totalProjects.toString();
      case "Tasks":
        return viewModel.totalTasks.toString();
      case "Completed Tasks":
        return viewModel.completedTasks.toString();
      case "Overdue Tasks":
        return viewModel.overdueTasks.toString();
      default:
        return '0';
    }
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    viewModel.getProjects();
    super.onViewModelReady(viewModel);
  }
}
