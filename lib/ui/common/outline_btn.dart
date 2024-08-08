import 'package:doit/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OutlineBtn extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color? textColor;
  final double? fontSize;
  final double? vertical;

  const OutlineBtn({
    super.key,
    required this.text,
    this.onPressed,
    this.textColor,
    this.fontSize = 12,
    this.vertical,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        style: ButtonStyle(
          padding: WidgetStateProperty.all(
            EdgeInsets.symmetric(vertical: vertical ?? 0.h),
          ),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r))),
          side: WidgetStateProperty.all(
              const BorderSide(width: 1.0, color: kcPrimaryColor)),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.workSans(
            fontSize: fontSize!.sp,
            fontWeight: FontWeight.w500,
            color: kcPrimaryColor,
            letterSpacing: -.2,
          ),
        ),
      ),
    );
  }
}
