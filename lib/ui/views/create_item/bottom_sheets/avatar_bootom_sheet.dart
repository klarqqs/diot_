import 'package:doit/ui/common/app_colors.dart';
import 'package:doit/ui/views/create_item/create_item_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AvatarBottomSheet extends StatefulWidget {
  final CreateItemViewModel viewModel;

  AvatarBottomSheet({required this.viewModel});

  @override
  AvatarBottomSheetState createState() => AvatarBottomSheetState();
}

class AvatarBottomSheetState extends State<AvatarBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 6;
    final double itemWidth = size.width / 3;

    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Select Avatar",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                style: ButtonStyle(
                  padding: WidgetStateProperty.all(
                    EdgeInsets.symmetric(vertical: 16.h),
                  ),
                  side: WidgetStateProperty.all(
                    BorderSide(
                      color: kcVeryLightGrey.withOpacity(.15),
                      width: 0,
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.all(
                      kcPrimaryColorDark.withOpacity(.1)),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  foregroundColor: WidgetStateProperty.all(Colors.transparent),
                ),
                onPressed: () => widget.viewModel.navigationService.back(),
                icon: const Text("X"),
              )
            ],
          ),
          const SizedBox(height: 32),
          Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: (itemWidth / itemHeight),
              ),
              itemCount: avatars.length,
              itemBuilder: (context, index) {
                String avatar = avatars[index];
                return Container(
                  decoration: BoxDecoration(
                    color: widget.viewModel.selectedAvatar == avatar
                        ? const Color(0xffFCF4F0)
                        : Colors.transparent,
                    border: Border.all(
                      color: widget.viewModel.selectedAvatar == avatar
                          ? const Color.fromARGB(255, 255, 99, 21)
                          : Colors.grey.withOpacity(.2),
                    ),
                    borderRadius: BorderRadius.circular(500),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(500),
                    onTap: () {
                      setState(() {
                        widget.viewModel.selectedAvatar = avatar;
                      });
                      widget.viewModel.notifyListeners();
                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 14.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(500),
                          child: SvgPicture.asset(
                            avatar,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Function to show the bottom sheet
