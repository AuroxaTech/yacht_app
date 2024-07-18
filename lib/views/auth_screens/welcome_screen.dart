import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yacht_app/constants/constants_widgets.dart';
import 'package:yacht_app/constants/image_constants.dart';
import 'package:yacht_app/views/auth_screens/login_screen.dart';
import 'package:yacht_app/widgets/custom_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
       children: [
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration:  BoxDecoration(
                color: Colors.grey.withOpacity(0.2)
              ),
              child: Image.asset(backImage, width: double.infinity,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.low,
                colorBlendMode: BlendMode.darken,
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),
         Expanded(
           child: Container(
             width: double.infinity,
             decoration: BoxDecoration(
               color: Colors.white,
               boxShadow: [
                 BoxShadow(
                   color: Colors.white.withOpacity(0.7),
                   offset: const Offset(0, -200), // Top shadow
                   blurRadius: 10.0,
                   spreadRadius: 10,
                 ),

                 const BoxShadow(
                   color: Colors.white,
                   offset: Offset(0, -10), // Top shadow
                   blurRadius: 22.0,
                   spreadRadius: 22,
                 ),
               ],
             ),
             child: Padding(
               padding: const EdgeInsets.only(left: 18, right: 18, top: 1),
               child: Column(
                   children: [
                    customText(
                      text: "The no.1 yacht booking platform",
                      fontWeight: FontWeight.w600,
                      fontSize: 32
                    ),
                   const SizedBox(height: 20),
                   CustomButton(
                       width: double.infinity,
                       text: "Get Started",
                      onTap: (){
                         Get.to(() => const LoginScreen());
                      },
                   ),

                 ],
               ),
             ),
           ),
         ),

        ],
      ),
    );
  }
}
