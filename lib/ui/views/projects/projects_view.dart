import 'package:doit/app/app.router.dart';
import 'package:doit/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:doit/ui/common/app_scaffold.dart';
import 'package:doit/ui/common/outline_btn.dart';
import 'package:doit/ui/common/time_agos_extention.dart';
import 'package:doit/ui/views/create_item/create_item_viewmodel.dart';
import 'projects_viewmodel.dart';

class ProjectsView extends StackedView<ProjectsViewModel> {
  final List<dynamic> projects;
  final List<dynamic> tasks;
  final bool isProject;
  final bool isCompleted;
  final bool isOverdue;

  const ProjectsView({
    Key? key,
    required this.projects,
    required this.tasks,
    this.isProject = true,
    this.isCompleted = false,
    this.isOverdue = false,
  }) : super(key: key);

  @override
  Widget builder(
      BuildContext context, ProjectsViewModel viewModel, Widget? child) {
    return AppScaffold(
      appbar: _buildAppBar(context, viewModel),
      backgroundColor: const Color(0xffF8F8F8),
      body: isProject
          ? _buildProjectsList(context, viewModel)
          : isCompleted
              ? _buildCompletedTasksList(context, viewModel)
              : isOverdue
                  ? _buildOverdueTasksList(context, viewModel)
                  : _buildTasksList(context, viewModel),
    );
  }

  AppBar _buildAppBar(BuildContext context, ProjectsViewModel viewModel) {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xffF8F8F8),
      leading: GestureDetector(
        onTap: () => viewModel.navigationService.back(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset('assets/back.svg'),
        ),
      ),
      actions: [
        if (isProject)
          Padding(
            padding:
                const EdgeInsets.only(right: 24.0, top: 10.0, bottom: 10.0),
            child: SizedBox(
              width: 120,
              child: OutlineBtn(
                text: "Create project",
                onPressed: () {
                  viewModel.navigationService
                      .navigateToCreateItemView(isProject: true);
                },
              ),
            ),
          ),
      ],
      leadingWidth: 88,
      centerTitle: false,
    );
  }

  Widget _buildProjectsList(BuildContext context, ProjectsViewModel viewModel) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.h),
            const Text(
              "Projects",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6.h),
            _buildProjectsListView(viewModel),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectsListView(ProjectsViewModel viewModel) {
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: ListView.builder(
        reverse: true,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: _buildProjectItem(context, index),
          );
        },
      ),
    );
  }

  Widget _buildProjectItem(BuildContext context, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProjectHeader(index),
          const SizedBox(height: 18),
          _buildProjectDetails(context, index),
        ],
      ),
    );
  }

  Row _buildProjectHeader(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundColor: const Color.fromARGB(255, 255, 99, 21),
              child: Center(
                child: CircleAvatar(
                  radius: 14.5,
                  backgroundColor: const Color(0xffFCF4F0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      // child: SvgPicture.asset(viewModel.selectedAvatar),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              projects[index]["name"],
              style: GoogleFonts.dmSans(
                color: kcBackgroundColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xff009A49),
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          child: Text(
            DateTime.parse(
              projects[index]["created"],
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

  Row _buildProjectDetails(BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _buildDateInfo("start", projects[index]["created"], true),
            const SizedBox(width: 18),
            _buildDateInfo("end", projects[index]["end"], false),
          ],
        ),
        _buildAddTaskButton(context, index),
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

  SizedBox _buildAddTaskButton(BuildContext context, int index) {
    return SizedBox(
      height: 24,
      width: 72,
      child: OutlineBtn(
        onPressed: () {
          ProjectsViewModel().navigationService.navigateToCreateItemView(
                isProject: false,
                project: projects[index],
              );
        },
        text: "Add Task",
      ),
    );
  }

  Widget _buildTasksList(BuildContext context, ProjectsViewModel viewModel) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.h),
            const Text(
              "Tasks",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6.h),
            _buildTasksListView(viewModel),
          ],
        ),
      ),
    );
  }

  Widget _buildTasksListView(ProjectsViewModel viewModel) {
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: ListView.builder(
        reverse: true,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: _buildTaskItem(context, index),
          );
        },
      ),
    );
  }

  Widget _buildCompletedTasksList(
      BuildContext context, ProjectsViewModel viewModel) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.h),
            const Text(
              "Completed Tasks",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6.h),
            _buildCompletedTasksListView(viewModel),
          ],
        ),
      ),
    );
  }

  Widget _buildCompletedTasksListView(ProjectsViewModel viewModel) {
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: ListView.builder(
        reverse: true,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return tasks[index]["isComplete"] != false
              ? const SizedBox.shrink()
              : GestureDetector(
                  child: _buildTaskItem(context, index),
                );
        },
      ),
    );
  }

  Widget _buildOverdueTasksList(
      BuildContext context, ProjectsViewModel viewModel) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.h),
            const Text(
              "Overdue Tasks",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6.h),
            _buildOverdueTasksListView(viewModel),
          ],
        ),
      ),
    );
  }

  Widget _buildOverdueTasksListView(ProjectsViewModel viewModel) {
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: ListView.builder(
        reverse: true,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return tasks[index]["isOverduce"] != false
              ? const SizedBox.shrink()
              : GestureDetector(
                  child: _buildTaskItem(context, index),
                );
        },
      ),
    );
  }

  Widget _buildTaskItem(BuildContext context, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTaskHeader(index),
          const SizedBox(height: 8),
          _buildTaskDetails(context, index),
        ],
      ),
    );
  }

  Row _buildTaskHeader(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          tasks[index]["name"],
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
              projects[index]["created"],
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

  Row _buildTaskDetails(BuildContext context, int index) {
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
            _buildTeamMembersList(index),
            const SizedBox(height: 12),
            _buildTaskDateInfo(index),
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

  SizedBox _buildTeamMembersList(int index) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: tasks[index]['staffs'].length,
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

  Widget _buildTaskDateInfo(int index) {
    return Row(
      children: [
        _buildDateInfo2("start", tasks[index]["created"], true),
        const SizedBox(width: 18),
        _buildDateInfo2("end", tasks[index]["end"], false),
      ],
    );
  }

  @override
  ProjectsViewModel viewModelBuilder(BuildContext context) =>
      ProjectsViewModel();
}
