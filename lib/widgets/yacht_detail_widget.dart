import 'package:flutter/material.dart';

import '../constants/color_constants.dart';
import '../constants/constants_widgets.dart';
import '../constants/image_constants.dart';

class YachtDetailsCard extends StatelessWidget {
  final String? image;
  const YachtDetailsCard({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Get.to(const DetailPage());
      },
      child: Container(
        width: double.infinity,
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
                        height: 80,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(
                    text: "Yacht Name here",
                    color: blackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      customText(
                        text: "\$399.64  ",
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffBEA355),
                      ),

                      customText(text: "/Per Hour", fontSize: 15, fontWeight: FontWeight.w700),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}