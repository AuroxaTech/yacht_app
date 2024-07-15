import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yacht_app/constants/image_constants.dart';
import '../../constants/color_constants.dart';
import '../../constants/constants_widgets.dart';
import '../../controllers/booking_controller/booking_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/yacht_detail_widget.dart';
import '../../widgets/yacht_detail_widgets.dart';

class NewBookingScreen extends StatelessWidget {
  final BookingController controller = Get.put(BookingController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                if (controller.selectedIndex.value > 0) {
                                  controller.previousPage();
                                } else {
                                  Get.back();
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey, width: 0.4),
                                ),
                                padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10, right: 15),
                                child: Center(child: SvgPicture.asset(backSvg)),
                              ),
                            ),
                            customText(
                              text: "Booking",
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey, width: 0.4),
                              ),
                              padding: const EdgeInsets.only(left: 10, top: 7, bottom: 7, right: 10),
                              child: Center(child: SvgPicture.asset(moreSvg)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.005),
                Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18),
                  child: Container(
                    color: Colors.white,
                    child: Obx(() {
                      switch (controller.selectedIndex.value) {
                        case 0:
                          return buildMyDetailsPage(controller);
                        case 1:
                          return buildMyDetailsPage2(controller);
                        case 2:
                          return buildMyDetailsPage3(controller);
                        default:
                          return buildMyDetailsPage(controller);
                      }
                    }),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18),
                  child: Container(
                    color: Colors.white,
                    child: _buildOrderSummaryPage(),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOrderSummaryPage() {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText(text:'Order Summary', fontSize: 22,fontWeight: FontWeight.w600),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customText(text: 'Yacht Ticket', fontSize: 18,fontWeight: FontWeight.w500),
                  customText(text: '\$4.25',fontSize: 16),
                ],
              ),

              customText(text: '2x', fontSize: 16),

              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      borderSide: const BorderSide(color: Colors.black12, width: 1.5),
                      hintText: 'Discount Code',
                    ),
                  ),

                  const SizedBox(width: 15,),

                  CustomButton(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    width: 100,
                    onTap: () {
                      // Apply discount code
                    }, text: 'Apply',
                    fontSize: 13,
                    btnColor: Colors.black,
                    btnTextColor: Colors.white,

                  ),

                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      customText(text: 'Subtotal'),
                      const SizedBox( width: 10,),
                      SvgPicture.asset(questionSvg),
                    ],
                  ),
                  customText(text: '\$4.25',fontWeight: FontWeight.w600, fontSize: 16),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      customText(text: 'Shipping'),
                      const SizedBox( width: 10,),
                      SvgPicture.asset(questionSvg),
                    ],
                  ),
                  customText(text: '\$8.89',fontWeight: FontWeight.w600, fontSize: 16),
                ],
              ),

              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      customText(text: 'Estimated Taxes'),
                      const SizedBox( width: 10,),
                      SvgPicture.asset(questionSvg),
                    ],
                  ),
                  customText(text: '\$0.40',fontWeight: FontWeight.w600, fontSize: 16),
                ],
              ),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customText(text: 'Total',fontWeight: FontWeight.w700, fontSize: 18),
                  customText(text: '\$14.99',fontWeight: FontWeight.w700, fontSize: 16),
                ],
              ),
              const SizedBox(height: 30),
             Obx(
                 ()=> controller.selectedIndex.value == 2 ? CustomButton(
                  width: double.infinity,
                  onTap: () {
                    // Apply discount code
                  }, text: 'Make Payment',
                  btnColor: Colors.black,
                  btnTextColor: Colors.white,

                ) : const SizedBox(),
             ),
            ]));
  }
}

