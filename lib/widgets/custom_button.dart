import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constants/color_constants.dart';
import '../constants/constants_widgets.dart';

class CustomButton extends StatelessWidget {

  const CustomButton({super.key,
    this.onTap,
    this.width,
    this.margin,
    required this.text,
    this.height,
    this.fontSize,
    this.btnColor,
    this.borderColor,
    this.btnTextColor,
    this.isLoading = false,
    this.borderRadius,
    this.gradientColor
  });

  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final String? text;
  final double? fontSize;
  final bool? isLoading;
  final Color? btnColor;
  final Color? borderColor;
  final Color? btnTextColor;
  final BorderRadius? borderRadius;
  final Gradient? gradientColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap ?? () {
        if (kDebugMode) {
          print(btnColor);
        }
      },
      child: Container(
        width: width ?? size.width * 0.4,
        height: height ?? size.height * 0.062,
        decoration: BoxDecoration(
          color: btnColor ?? primaryColor,
          borderRadius: borderRadius ?? BorderRadius.circular(50),
          border: Border.all(color: borderColor ?? Colors.transparent),
        ),
        child: Center(
            child: isLoading == true ? const SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(color: Colors.white,)) :
            customText(
                text: text,
                color: btnTextColor??Colors.white,
                fontSize: fontSize ?? 16,
                fontWeight: FontWeight.w400
            ),
        ),
      ),
    );
  }
}


class RowCustomButton extends StatelessWidget {

  const RowCustomButton({super.key,
    this.onTap,
    this.width,
    this.margin,
    required this.text,
    this.image,
    this.height,
    this.fontSize,
    this.btnColor,
    this.borderColor,
    this.btnTextColor,
    this.isLoading = false,
    this.borderRadius,
    this.gradientColor
  });

  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final String? text;
  final String? image;
  final double? fontSize;
  final bool? isLoading;
  final Color? btnColor;
  final Color? borderColor;
  final Color? btnTextColor;
  final BorderRadius? borderRadius;
  final Gradient? gradientColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap ?? () {
        if (kDebugMode) {
          print(btnColor);
        }
      },
      child: Container(
        width: width ?? size.width * 0.4,
        height: height ?? size.height * 0.062,
        decoration: BoxDecoration(
          color: btnColor ?? rowButtonColor,
          borderRadius: borderRadius ?? BorderRadius.circular(50),
         // border: Border.all(color: borderColor ?? Color(0xffDFE1E7)),
        ),
        child: isLoading == true ? const SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(color: Colors.white,)) :
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Image.asset(image!),
              customText(
                  text: text,
                  color: btnTextColor??Colors.white,
                  fontSize: fontSize ?? 16,
                  fontWeight: FontWeight.w500
              ),
                SizedBox(
                  width: 30,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
