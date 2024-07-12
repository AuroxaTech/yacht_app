import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yacht_app/constants/color_constants.dart';
import 'package:yacht_app/constants/constants_widgets.dart';
import 'package:yacht_app/constants/image_constants.dart';
import 'package:yacht_app/widgets/custom_button.dart';

class YachtDetailScreen extends StatefulWidget {
  const YachtDetailScreen({super.key});

  @override
  State<YachtDetailScreen> createState() => _YachtDetailScreenState();
}

class _YachtDetailScreenState extends State<YachtDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 350,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(yachtDetail),
                fit: BoxFit.cover
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Get.back();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                            ),

                            padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10, right: 15),

                            child : Center(child: SvgPicture.asset(backSvg))
                          ),
                        ),
                        customText(
                          text: "Detail",
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),

                            padding: const EdgeInsets.only(left: 10, top: 7, bottom: 7, right: 10),

                            child : Center(child: SvgPicture.asset(moreSvg))
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: borderColor)
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            SvgPicture.asset(wifiSvg),
                            const SizedBox(width: 10,),
                            customText(
                              text: "Free Wifi",
                            )
                          ],
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: borderColor)
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            SvgPicture.asset(coffeeSvg),
                            const SizedBox(width: 10,),
                            customText(
                              text: "Free Breakfast",
                            )
                          ],
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: borderColor)
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            SvgPicture.asset(starSvg),
                            const SizedBox(width: 10,),
                            customText(
                              text: "5.0",
                            )
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customText(
                        text: "Yacht Name here",
                        color: blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      Row(
                        children: [
                          customText(
                              text: "\$149",
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),

                          customText(
                              text: " /per hour",
                              fontSize: 13
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      customText(
                        text: "24 ft.",
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 5,
                        height: 5,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      customText(
                        text: "8 Guests",
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 5,
                        height: 5,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      customText(
                        text: "3 cabin",
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  customText(
                    text: "Description",
                    color: blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),

                    const SizedBox(
                      height: 10,
                    ),
                    customText(
                    text: "Aston Hotel, Alice Springs NT 0870, Australia is a modern hotel. elegant 5 star hotel overlooking the sea. perfect for a romantic, charming Read More. . .",
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  customText(
                    text: "Preview",
                    color: blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(image: AssetImage(yachtDetail), fit: BoxFit.fill)
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(image: AssetImage(yachtDetail), fit: BoxFit.fill)
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(image: AssetImage(yachtDetail), fit: BoxFit.fill)
                          ),
                        ),
                      ),

                    ],
                  ),

                  const SizedBox(
                    height: 50,
                  ),
                  const CustomButton(
                    text: "Check Availability",
                    width: double.infinity,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
