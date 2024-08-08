import 'package:doit/ui/common/validations.dart';
import 'package:doit/ui/views/create_item/bottom_sheets/avatar_bootom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:doit/ui/common/app_button.dart';
import 'package:doit/ui/common/app_scaffold.dart';
import 'package:doit/ui/views/auth/widgets/app_text_field.dart';
import 'package:doit/ui/views/create_item/bottom_sheets/staffs_bottom_sheet.dart';
import 'package:doit/ui/views/create_item/bottom_sheets/tags_bottom_sheet.dart';
import 'package:doit/ui/views/create_item/create_item_viewmodel.dart';

class CreateItemView extends StackedView<CreateItemViewModel> {
  final bool isProject;
  final dynamic project;

  CreateItemView({
    Key? key,
    this.isProject = true,
    this.project,
  }) : super(key: key);

  final GlobalKey<FormState> _createProjectFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _createTaskFormKey = GlobalKey<FormState>();

  @override
  Widget builder(
    BuildContext context,
    CreateItemViewModel viewModel,
    Widget? child,
  ) {
    return AppScaffold(
      backgroundColor: Colors.white,
      appbar: _buildAppBar(context, viewModel),
      body: isProject
          ? _buildProjectForm(context, viewModel)
          : _buildTaskForm(context, viewModel),
    );
  }

  AppBar _buildAppBar(BuildContext context, CreateItemViewModel viewModel) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () => viewModel.navigationService.back(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset('assets/back.svg'),
        ),
      ),
      leadingWidth: 88,
      centerTitle: false,
    );
  }

  Widget _buildProjectForm(
      BuildContext context, CreateItemViewModel viewModel) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _createProjectFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h),
              const Text(
                "Create project",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  GestureDetector(
                    child: CircleAvatar(
                      radius: 28.5,
                      backgroundColor: const Color.fromARGB(255, 255, 99, 21),
                      child: Center(
                        child: CircleAvatar(
                          radius: 28,
                          backgroundColor: const Color(0xffFCF4F0),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: viewModel.selectedAvatar == ""
                                  ? null
                                  : SvgPicture.asset(viewModel.selectedAvatar),
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () => _showAvatarBottomSheet(context, viewModel),
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: AppTextField(
                      isSingleBorder: true,
                      hintText: "Project name",
                      textEditingController: viewModel.name,
                      validator: (value) => Validation.validateString(value),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppTextField(
                      isSingleBorder: true,
                      hintText: "Created (from)",
                      textEditingController: viewModel.created,
                      shouldReadOnly: true,
                      validator: (value) => Validation.validateString(value),
                      onTap: () => viewModel.showCupertinoDatePicker(
                        context,
                        viewModel.created,
                        viewModel.createdD,
                      ),
                    ),
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: AppTextField(
                      isSingleBorder: true,
                      hintText: "End (to)",
                      textEditingController: viewModel.end,
                      validator: (value) => Validation.validateString(value),
                      shouldReadOnly: true,
                      onTap: () => viewModel.showCupertinoDatePicker(
                        context,
                        viewModel.end,
                        viewModel.endD,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _buildStaffsSection(context, viewModel),
              const SizedBox(height: 24),
              _buildTagsSection(context, viewModel),
              const SizedBox(height: 24),
              Text(
                'Description',
                style: GoogleFonts.dmSans(
                  color: Colors.grey,
                  fontSize: 12.5.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              const AppTextField(hintText: "Description", minLines: 4),
              const SizedBox(height: 24),
              AppButton(
                text: 'Create project',
                onPressed: () => {
                  if (_createProjectFormKey.currentState!.validate())
                    {
                      viewModel.addProject(),
                    }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaskForm(BuildContext context, CreateItemViewModel viewModel) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _createTaskFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h),
              const Text(
                "Add task",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12.h),
              AppTextField(
                isSingleBorder: true,
                hintText: "Task name",
                validator: (value) => Validation.validateString(value),
                textEditingController: viewModel.name,
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppTextField(
                      isSingleBorder: true,
                      hintText: "Created (from)",
                      validator: (value) => Validation.validateString(value),
                      textEditingController: viewModel.created,
                      shouldReadOnly: true,
                      onTap: () => viewModel.showCupertinoDatePicker(
                        context,
                        viewModel.created,
                        viewModel.createdD,
                      ),
                    ),
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: AppTextField(
                      isSingleBorder: true,
                      hintText: "End (to)",
                      validator: (value) => Validation.validateString(value),
                      textEditingController: viewModel.end,
                      shouldReadOnly: true,
                      onTap: () => viewModel.showCupertinoDatePicker(
                        context,
                        viewModel.end,
                        viewModel.endD,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _buildStaffsSection(context, viewModel),
              const SizedBox(height: 24),
              _buildTagsSection(context, viewModel),
              const SizedBox(height: 24),
              Text(
                'Comments',
                style: GoogleFonts.dmSans(
                  color: Colors.grey,
                  fontSize: 12.5.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              const AppTextField(hintText: "Comments", minLines: 4),
              const SizedBox(height: 24),
              AppButton(
                text: 'Add task',
                onPressed: () => {
                  if (_createTaskFormKey.currentState!.validate())
                    {
                      viewModel.addTask(),
                    }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStaffsSection(
      BuildContext context, CreateItemViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Add staffs:",
          style: GoogleFonts.dmSans(
            color: Colors.grey,
            fontSize: 12.5.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        GestureDetector(
          onTap: () => showStaffsBottomSheet(context, viewModel),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12.0.h),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.withOpacity(.8),
                  width: .55.w,
                ),
              ),
              borderRadius: BorderRadius.all(Radius.circular(0.r)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 30,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: viewModel.selectedStaffs
                          .map((staff) => Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor:
                                      const Color.fromARGB(255, 255, 99, 21),
                                  child: Center(
                                    child: CircleAvatar(
                                      radius: 14.5,
                                      backgroundColor: const Color(0xffFCF4F0),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: SvgPicture.asset(
                                              getARandomAvatar()),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                SvgPicture.asset('assets/plus.svg'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTagsSection(
      BuildContext context, CreateItemViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tags:",
          style: GoogleFonts.dmSans(
            color: Colors.grey,
            fontSize: 12.5.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        GestureDetector(
          onTap: () => showTagsBottomSheet(context, viewModel),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12.0.h),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.withOpacity(.8),
                  width: .55.w,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 30,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: viewModel.selectedTags
                          .map((tag) => Text(
                                tag +
                                    (viewModel.selectedTags.last == tag
                                        ? ''
                                        : ', '),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                SvgPicture.asset('assets/plus.svg'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showAvatarBottomSheet(
      BuildContext context, CreateItemViewModel viewModel) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => AvatarBottomSheet(viewModel: viewModel),
    );
  }

  void showStaffsBottomSheet(
      BuildContext context, CreateItemViewModel viewModel) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => StaffsBottomSheet(
        viewModel: viewModel,
        staffs: staffs,
      ),
    );
  }

  void showTagsBottomSheet(
      BuildContext context, CreateItemViewModel viewModel) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => TagsBottomSheet(
        viewModel: viewModel,
        tags: tags,
      ),
    );
  }

  @override
  CreateItemViewModel viewModelBuilder(BuildContext context) =>
      CreateItemViewModel();
}
