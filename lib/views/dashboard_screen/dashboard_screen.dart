import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:yacht_app/views/dashboard_screen/yacht_detail_screen.dart';
import 'package:yacht_app/widgets/custom_text_field.dart';

import '../../constants/color_constants.dart';
import '../../constants/constants_widgets.dart';
import '../../constants/image_constants.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            Container(
              width: double.infinity,
        
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(homebg), fit: BoxFit.fill),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Image.asset(loginTop, color: Colors.white,),
                    SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      hintText: "Search yachts",
                      borderRadius: BorderRadius.circular(50),
                      prefixConstraints: BoxConstraints(
                        minWidth: 10,
                        minHeight: 10
                      ),
                      prefix: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 10),
                        child: SvgPicture.asset(searchSvg),
                      ),
        
        
                    )
                  ],
                ),
              ),
            ),
        
            Column(
              children: [
                
                Container(
                  margin: EdgeInsets.all(15),
                  width: double.infinity,
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: borderColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: _buildSegment('Yachts', 0)),
                      const SizedBox(width: 10,),
                      Expanded(child: _buildSegment('Experiences', 1)),
                    ],
                  ),
                ),
        
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10, top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customText(
                        text: "Near Location",
                        color: blackColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      customText(
                          text: "See All",
                          fontSize: 18,
                          decorationColor: blackColor,
                          fontWeight: FontWeight.w600,
                          color: primaryColor
                      ),
                    ],
                  ),
                ),
        
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      DestinationCard(),
                      DestinationCard(),
                      DestinationCard(),
                    ],
                  ),
                ),
        
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customText(
                        text: "Popular hotel",
                        color: blackColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      customText(
                          text: "See All",
                          fontSize: 18,
                          decorationColor: blackColor,
                          fontWeight: FontWeight.w600,
                          color: primaryColor
                      ),
                    ],
                  ),
                ),
        
                PopularHotel(),
        
              ],
            ),
        
          ],
        ),
      ),
    );
  }

  int selectedIndex = 0;

  Widget _buildSegment(String text, int index) {
    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
        decoration: BoxDecoration(
          color: selectedIndex == index ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: selectedIndex == index ? blackColor : blackColor,
              fontWeight: FontWeight.bold,
              fontFamily: "MontserratRegular",
            ),
          ),
        ),
      ),
    );
  }
}

class PopularHotel extends StatelessWidget {
  final String? image;
  const PopularHotel({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //Get.to(const DetailPage());
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        image ?? yachtDetail, // Replace with your image URL
                        height: 120,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 14,
                    right: 14,
                    child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Center(child: Icon(Icons.favorite_border, color: Colors.black, size: 20,))),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20,right: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(
                    text: "Yacht Name here",
                    color: blackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      customText(
                        text: "24 ft.",
                        color: blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      customText(
                        text: "8 Guests",
                        color: blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      customText(
                        text: "3 cabin",
                        color: blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      customText(
                          text: "\$149",
                          fontWeight: FontWeight.bold
                      ),

                      customText(
                          text: "/per hour",
                          fontSize: 12
                      )
                    ],
                  )
                ],
              ),
            ),



          ],
        ),
      ),
    );
  }
}

class DestinationCard extends StatelessWidget {
  final String? image;
  const DestinationCard({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(const YachtDetailScreen());
      },
      child: Container(
        width: 280,
        margin: const EdgeInsets.only(left: 15, top: 10 , bottom: 10, right: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        image ?? yacht, // Replace with your image URL
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 14,
                    right: 14,
                    child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white,
                        child: Center(child: Icon(Icons.favorite_border, color: Colors.black))),
                  ),
                   Positioned(
                    bottom: 14,
                    right: 14,
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                        child: Row(
                          children: [
                            customText(
                              text: "\$149",
                              fontWeight: FontWeight.bold
                            ),

                            customText(
                                text: "/per hour",
                              fontSize: 12
                                )
                          ],
                        )),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            text: "24 ft.",
                            color: blackColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          customText(
                            text: "8 Guests",
                            color: blackColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          customText(
                            text: "3 cabin",
                            color: blackColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ],
                      ),
                    ],
                  ),
                  // const Row(
                  //   children: [
                  //     Icon(Icons.star, color: Colors.red, size: 24),
                  //     Text('4.8', style: TextStyle(color: Colors.black, fontSize: 16)),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}