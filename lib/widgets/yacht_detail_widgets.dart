
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yacht_app/controllers/booking_controller/booking_controller.dart';
import 'package:yacht_app/widgets/custom_button.dart';
import 'package:yacht_app/widgets/yacht_detail_widget.dart';

import '../constants/color_constants.dart';
import '../constants/constants_widgets.dart';
import '../constants/image_constants.dart';
import 'custom_text_field.dart';

Widget buildMyDetailsPage(BookingController controller) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Form(
      key: controller.formKey1,
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: controller.previousPage,
                  icon: SvgPicture.asset(backArrow)
              ),
              const SizedBox(
                width: 8,
              ),
              customText(
                text: 'My Details',
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          Obx(() => _buildTabIndicators(controller.selectedIndex.value)),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              customText(
                text: "Full Name ",
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              customText(
                text: "*",
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.red,
              ),
            ],
          ),
          const SizedBox(height: 8),
          CustomTextField(
            controller: controller.fullNameController,
            hintText: "Enter Here",
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              customText(
                text: "Email Address ",
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              customText(
                text: "*",
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.red,
              ),
            ],
          ),
          const SizedBox(height: 8),
          CustomTextField(
            controller: controller.emailController,
            hintText: "Enter Here",
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              customText(
                text: "Phone No",
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              customText(
                text: "*",
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.red,
              ),
            ],
          ),
          const SizedBox(height: 8),
          CustomTextField(
            hintText: "Enter Here",
            controller: controller.phoneController,
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  customText(
                    text: "No. Of Persons",
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  customText(
                    text: "*",
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.red,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                width: 350,
                height: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xffF4F4F4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: controller.decrementNumOfPersons,
                    ),
                    Obx(() => Text('${controller.numOfPersons}', style: const TextStyle(fontSize: 16))),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: controller.incrementNumOfPersons,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          CustomButton(
            width: double.infinity,
            onTap: controller.validateForm1,
            text: 'Next',
          ),
        ],
      ),
    ),
  );
}

Widget _buildTabIndicators(int currentPage) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(3, (index) {
      return Expanded(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10.0),
          height: 8,
          decoration: BoxDecoration(
            color: currentPage >= index ? primaryColor : primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      );
    }),
  );
}

Widget buildMyDetailsPage2(BookingController controller) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Form(
      key: controller.formKey2,
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: controller.previousPage,
                  icon: SvgPicture.asset(backArrow)
              ),
              const SizedBox(
                width: 8,
              ),
              customText(
                text: 'Yacht Preferences',
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          Obx(() => _buildTabIndicators(controller.selectedIndex.value)),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  customText(
                    text: "Add Drinks :",
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                width: 350,
                height: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xffF4F4F4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: controller.decrementNumOfDrinks,
                    ),
                    Obx(() => Text('${controller.numOfDrinks}', style: const TextStyle(fontSize: 16))),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: controller.incrementNumOfDrinks,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText(
                text: "Add Food :",
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
              const SizedBox(height: 10),
              Container(
                width: 350,
                height: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xffF4F4F4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: controller.decrementNumOfFood,
                    ),
                    Obx(() => Text('${controller.numOfFood}', style: const TextStyle(fontSize: 16))),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: controller.incrementNumOfFood,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  customText(
                    text: "Add Food :",
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                width: 350,
                height: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xffF4F4F4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: controller.decrementNumOfFood2,
                    ),
                    Obx(() => Text('${controller.numOfFood2}', style: const TextStyle(fontSize: 16))),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: controller.incrementNumOfFood2,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          const YachtDetailsCard(),
          const SizedBox(height: 32),
          CustomButton(
            width: double.infinity,
            onTap: controller.validateForm2,
            text: 'Next',
          ),
        ],
      ),
    ),
  );
}

Widget buildMyDetailsPage3(BookingController controller) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Form(
      key: controller.formKey3,
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: controller.previousPage,
                icon: SvgPicture.asset(backArrow)
              ),
              const SizedBox(
                width: 8,
              ),
              customText(
                text: 'Payment & Billing',
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          Obx(() => _buildTabIndicators(controller.selectedIndex.value)),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                width: 60,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color(0xff172B85),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Image.asset(
                  "assets/png/visa.png",
                  scale: 1.5,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 60,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color(0xffF8F8F8),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Image.asset(
                  "assets/png/mastercard.png",
                  scale: 1.5,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 60,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color(0xffF8F8F8),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Image.asset(
                  "assets/png/americanexpress.png",
                  scale: 1.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              customText(
                text: "Card Number ",
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              customText(
                text: "*",
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.red,
              ),
            ],
          ),
          const SizedBox(height: 8),
          CustomTextField(),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        customText(
                          text: "MM/YY ",
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        customText(
                          text: "*",
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.red,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(),
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        customText(
                          text: "CVV ",
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        customText(
                          text: "*",
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.red,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(),
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        customText(
                          text: "Zip ",
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        customText(
                          text: "*",
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.red,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              customText(
                text: "Country ",
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              customText(
                text: "*",
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.red,
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            child: InputDecorator(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: borderColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: borderColor,
                    ),
                  ),
                contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              ),

              child: DropdownButtonHideUnderline(
                child: Obx(
                      () => DropdownButton<String>(
                        dropdownColor: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    value: controller.selectedLocation.value,
                    isDense: true,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    menuMaxHeight: 380,
                    items: controller.locations.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      controller.selectedLocation.value = newValue!;
                    },
                  ),

                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          CustomButton(
            width: double.infinity,
            onTap: controller.validateForm3,
            text: 'Next',
          ),
        ],
      ),
    ),
  );
}