import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yacht_app/constants/color_constants.dart';
import 'package:yacht_app/views/auth_screens/sign_up_screen.dart';
import 'package:yacht_app/views/bottom_bar/main_bottom_bar.dart';
import 'package:yacht_app/widgets/custom_text_field.dart';

import '../../constants/constants_widgets.dart';
import '../../constants/image_constants.dart';
import '../../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
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
                  height: 30,
                ),

                Center(child: Image.asset(loginTop)),

                const SizedBox(
                  height: 20,
                ),

                Center(
                  child: customText(
                      text: "Login",
                      fontWeight: FontWeight.w600,
                      fontSize: 32
                  ),
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
                  height: 15,
                ),

                Align(
                  alignment: Alignment.bottomRight,
                  child: customText(
                      text: "Forgot Password?",
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: primaryColor
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                CustomButton(
                  width: double.infinity,
                  text: "Login",
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
                        text: "Don’t have an account? ",
                        color: blackColor,
                        fontSize: 15
                    ), GestureDetector(
                      onTap: (){
                        Get.to(() => SignUpScreen());
                      },
                      child: customText(
                          text: "Sign Up",
                          color: primaryColor,
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
