import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yacht_app/constants/color_constants.dart';
import 'package:yacht_app/widgets/custom_text_field.dart';

import '../../constants/constants_widgets.dart';
import '../../constants/image_constants.dart';
import '../../widgets/custom_button.dart';
import '../bottom_bar/main_bottom_bar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  dynamic obsecure;
  @override
  void initState() {
    super.initState();
    obsecure = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),

                Center(child: Image.asset(loginTop)),

                const SizedBox(
                  height: 10,
                ),

                Center(
                  child: customText(
                      text: "Sign Up",
                      fontWeight: FontWeight.w600,
                      fontSize: 32
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                Row(
                  children: [
                    customText(
                        text: "Name ",
                        fontWeight: FontWeight.w600,
                        fontSize: 16
                    ),
                    customText(
                        text: "*",
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.red
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  prefixConstraints: const BoxConstraints(
                      minWidth: 50,
                      minHeight: 20
                  ),
                  prefix: SvgPicture.asset(mailSvg),
                  hintText: "Name",
                ),

                const SizedBox(
                  height: 20,
                ),
              Row(
                  children: [
                    customText(
                        text: "Email ",
                        fontWeight: FontWeight.w600,
                        fontSize: 16
                    ),
                    customText(
                        text: "*",
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.red
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  prefixConstraints: const BoxConstraints(
                      minWidth: 50,
                      minHeight: 20
                  ),
                  prefix: SvgPicture.asset(mailSvg),
                  hintText: "Email",
                ),

                const SizedBox(
                  height: 20,
                ),

                Row(
                  children: [
                    customText(
                        text: "Password ",
                        fontWeight: FontWeight.w600,
                        fontSize: 16
                    ),
                    customText(
                        text: "*",
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.red
                    ),
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),

                CustomTextField(
                  isObscureText: obsecure,
                  prefixConstraints: const BoxConstraints(
                      minWidth: 50,
                      minHeight: 20
                  ),
                  prefix: SvgPicture.asset(lockSvg),
                  hintText: "Password",
                  suffixIcon: IconButton(
                    icon: obsecure
                        ? const Icon(
                      Icons.visibility_off_outlined,
                      color: Colors.black,
                    )
                        : const Icon(
                      Icons.visibility_outlined,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        obsecure = !obsecure;
                      });
                    },
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                CustomButton(
                  width: double.infinity,
                  text: "Sign Up",
                  onTap: (){
                    Get.offAll(() => const MainBottomBar());
                    //Get.to(() => LoginScreen());
                  },
                ),

                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customText(
                        text: "Already have an account? ",
                        color: blackColor,
                        fontSize: 15
                    ), GestureDetector(
                      onTap: (){
                        Get.back();
                        //  Get.to(() => SignUpScreen());
                      },
                      child: customText(
                          text: "Login",
                          color: CupertinoColors.activeBlue,
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                      ),
                    ),

                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Expanded(child: Divider(thickness: 0.5,)),
                    customText(
                        text: "  OR  ",
                        color: blackColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 15
                    ),
                    const Expanded(child: Divider(thickness: 0.5,)),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                const RowCustomButton(
                  width: double.infinity,
                  text: "Sign in with Google",
                  image: google,
                  btnTextColor: blackColor,
                  fontSize: 16,
                ),

                const SizedBox(
                  height: 15,
                ),

                const RowCustomButton(
                  width: double.infinity,
                  text: "Sign in with Facebook",
                  image: facebook,
                  btnTextColor: blackColor,
                  fontSize: 16,
                ),
                const SizedBox(
                  height: 15,
                ),

                const RowCustomButton(
                  width: double.infinity,
                  text: "Continue with Apple",
                  image: apple,
                  btnTextColor: blackColor,
                  fontSize: 16,
                ),
                const SizedBox(
                  height: 30,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
