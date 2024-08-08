import 'package:doit/ui/views/create_item/create_item_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StaffsBottomSheet extends StatefulWidget {
  final CreateItemViewModel viewModel;
  final List<String> staffs;

  const StaffsBottomSheet({required this.viewModel, required this.staffs});

  @override
  StaffsBottomSheetState createState() => StaffsBottomSheetState();
}

class StaffsBottomSheetState extends State<StaffsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Select Staffs",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: ListView.builder(
              itemCount: widget.staffs.length,
              itemBuilder: (context, index) {
                String staff = widget.staffs[index];
                return InkWell(
                  onTap: () {
                    setState(() {
                      if (widget.viewModel.selectedStaffs.contains(staff)) {
                        widget.viewModel.removeStaff(staff);
                      } else {
                        widget.viewModel.addStaffs(staff);
                      }
                      widget.viewModel.notifyListeners();
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          child: CircleAvatar(
                            radius: 18.8,
                            backgroundColor:
                                const Color.fromARGB(255, 255, 99, 21),
                            child: Center(
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: const Color(0xffFCF4F0),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: SvgPicture.asset(
                                      getARandomAvatar(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onTap: () => _showAvatarBottomSheet(context),
                        ),
                        const SizedBox(width: 18),
                        Text(staff),
                        const Spacer(),
                        if (widget.viewModel.selectedStaffs.contains(staff))
                          const Icon(Icons.check, color: Colors.green),
                      ],
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

  void _showAvatarBottomSheet(BuildContext context) {
    // Implement the avatar bottom sheet
  }
}
