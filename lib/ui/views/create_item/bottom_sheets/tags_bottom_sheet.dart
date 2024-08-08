import 'package:doit/ui/views/create_item/create_item_viewmodel.dart';
import 'package:flutter/material.dart';

class TagsBottomSheet extends StatefulWidget {
  final CreateItemViewModel viewModel;
  final List<String> tags;

  const TagsBottomSheet({required this.viewModel, required this.tags});

  @override
  TagsBottomSheetState createState() => TagsBottomSheetState();
}

class TagsBottomSheetState extends State<TagsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Select Tags",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.tags.length,
              itemBuilder: (context, index) {
                String tag = widget.tags[index];
                return InkWell(
                  onTap: () {
                    setState(() {
                      if (widget.viewModel.selectedTags.contains(tag)) {
                        widget.viewModel.removeTag(tag);
                      } else {
                        widget.viewModel.addTag(tag);
                      }
                      widget.viewModel.notifyListeners();
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      children: [
                        Text(tag),
                        const Spacer(),
                        if (widget.viewModel.selectedTags.contains(tag))
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
}
