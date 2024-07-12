import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/color_constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.width,
    this.margin,
    this.controller,
    this.focusNode,
    this.isObscureText = false,
    this.textInputAction = TextInputAction.next,
    this.maxLines,
    this.minLines,
    this.hintText,
    this.keyboaredtype,
    this.prefix,
    this.prefixConstraints,
    this.suffixIcon,
    this.suffixConstraints,
    this.validator,
    this.readOnly,
    this.labelText,
    this.maxLength,
    this.autofocus = false,
    this.inputFormatter,
    this.onChanged,
    this.onTap,
    this.textAlign,
    this.textAlignVertical,
    this.height,
    this.borderRadius,
    this.borderSide
  });

  final double? width;
  final double? height;
  final bool? readOnly;
  final EdgeInsetsGeometry? margin;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? isObscureText;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final String? hintText;
  final String? labelText;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffixIcon;
  final BoxConstraints? suffixConstraints;
  dynamic validator;
  final TextInputType? keyboaredtype;
  final bool autofocus;
  final List<TextInputFormatter>? inputFormatter;
  void Function(String)? onChanged;
  final TextAlign? textAlign;
  final VoidCallback? onTap;
  final TextAlignVertical? textAlignVertical;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: width,
      //  height: height ?? size.height * 0.07,
      margin: margin,
      child: TextFormField(
        enableSuggestions: true,
        smartDashesType: SmartDashesType.enabled,
        autocorrect: true,
        autofocus: autofocus,
        style:  const TextStyle(color: blackColor, fontWeight: FontWeight.w600, fontSize: 15, fontFamily: "MontserratRegular"),
        keyboardType: keyboaredtype ?? TextInputType.emailAddress,
        controller: controller,
        focusNode: focusNode,
        obscureText: isObscureText!,
        textInputAction: textInputAction,
        maxLines: maxLines ?? 1,
        minLines: minLines ??1,
        readOnly: readOnly ?? false,
        decoration: _buildDecoration(),
        validator: validator,
        maxLength: maxLength,
        onTap: onTap,
        inputFormatters: inputFormatter,
        onChanged: onChanged??(v){},
        textAlign: textAlign??TextAlign.start,
        textAlignVertical: textAlignVertical??TextAlignVertical.center,
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      labelText: labelText,
      hintStyle:  const TextStyle(color: blackColor, fontWeight: FontWeight.w400, fontSize: 15, fontFamily: "MontserratRegular"),
      labelStyle:  const TextStyle(color: blackColor, fontWeight: FontWeight.w400, fontSize: 15, fontFamily: "MontserratRegular"),
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
          // borderSide:  BorderSide(color: Colors.grey.shade300)),
          borderSide:  borderSide?? BorderSide(color: borderColor, width: 0.5)),
      focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
          borderSide: borderSide??  BorderSide(color: primaryColor)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
          borderSide: borderSide??  BorderSide(color: Colors.red)),
      errorBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
          borderSide: borderSide??  BorderSide(color: Colors.red)),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffixIcon,
      suffixIconConstraints: suffixConstraints,
      fillColor:Colors.white,
      filled: true,
      isDense: true,
    );
  }
}


