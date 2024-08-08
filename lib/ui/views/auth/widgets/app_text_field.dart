import 'package:doit/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatelessWidget {
  final String? label;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? hintText;
  final TextInputFormatter? formatter;
  final Function(String)? onChanged;
  final Function()? onTap;
  final int? maxLength;
  final Widget? suffixIcon;
  final Color? borderColor;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final bool shouldReadOnly;
  final bool enabled;
  final int? minLines;
  final bool isSingleBorder;

  const AppTextField({
    Key? key,
    this.label,
    this.keyboardType,
    this.obscureText = false,
    this.hintText,
    this.formatter,
    this.onChanged,
    this.onTap,
    this.maxLength,
    this.suffixIcon,
    this.borderColor,
    this.textEditingController,
    this.validator,
    this.shouldReadOnly = false,
    this.enabled = true,
    this.minLines,
    this.isSingleBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          maxLines: minLines,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          onTap: onTap,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          maxLength: obscureText ? null : maxLength,
          controller: textEditingController,
          cursorColor: kcPrimaryColor,
          keyboardType: keyboardType,
          readOnly: shouldReadOnly,
          obscureText: obscureText,
          onChanged: onChanged,
          validator: validator,
          inputFormatters: [
            formatter ?? FilteringTextInputFormatter.singleLineFormatter,
          ],
          style: TextStyle(
            fontSize: 14.sp,
            color: kcBackgroundColor,
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            counterText: "",
            hintText: "",
            hintStyle: GoogleFonts.dmSans(
              color: minLines != 1
                  ? Colors.transparent
                  : kcBackgroundColor.withOpacity(.65),
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            label: Text(
              hintText.toString(),
              style: GoogleFonts.dmSans(
                color: minLines == 4
                    ? Colors.transparent
                    : kcBackgroundColor.withOpacity(.5),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            labelStyle: GoogleFonts.dmSans(
              color: kcBackgroundColor.withOpacity(.5),
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            filled: true,
            fillColor: isSingleBorder
                ? Colors.transparent
                : Colors.grey.withOpacity(.03),
            contentPadding: EdgeInsets.symmetric(
              vertical: 16.h,
              horizontal: isSingleBorder ? 0.h : 18.w,
            ),
            errorStyle: const TextStyle(fontSize: 12),
            suffixIcon: suffixIcon,
            focusedBorder: isSingleBorder
                ? UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: kcPrimaryColor,
                      width: 1.1.w,
                    ),
                    borderRadius: BorderRadius.all(
                        Radius.circular(isSingleBorder ? 0.r : 8.r)),
                  )
                : OutlineInputBorder(
                    borderSide: BorderSide(
                      color: kcPrimaryColor,
                      width: 1.1.w,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  ),
            enabledBorder: isSingleBorder
                ? UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(.8),
                      width: .55.w,
                    ),
                    borderRadius: BorderRadius.all(
                        Radius.circular(isSingleBorder ? 0.r : 8.r)),
                  )
                : OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(.8),
                      width: .55.w,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  ),
            focusedErrorBorder: isSingleBorder
                ? UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: .55.w,
                    ),
                    borderRadius: BorderRadius.all(
                        Radius.circular(isSingleBorder ? 0.r : 8.r)),
                  )
                : OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: .55.w,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  ),
            errorBorder: isSingleBorder
                ? UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: .55.w,
                    ),
                    borderRadius: BorderRadius.all(
                        Radius.circular(isSingleBorder ? 0.r : 8.r)),
                  )
                : OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: .55.w,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  ),
          ),
        ),
      ],
    );
  }
}
