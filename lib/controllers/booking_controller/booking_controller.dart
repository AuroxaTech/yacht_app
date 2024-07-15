import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  var currentPage = 0.obs;
  var selectedIndex = 0.obs;

  final PageController pageController = PageController();
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey3 = GlobalKey<FormState>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  var numOfPersons = 4.obs;
  var numOfDrinks = 1.obs;
  var numOfFood = 4.obs;
  var numOfFood2 = 4.obs;

  var selectedLocation = 'Pakistan'.obs;
  var locations = ['Pakistan', 'Turkey', 'Indonesia', 'Malaysia'].obs;

  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();
  DateTime kToday = DateTime.now();

  void updatePage(int index) {
    currentPage.value = index;
  }

  void incrementNumOfPersons() => numOfPersons.value++;
  void decrementNumOfPersons() => numOfPersons.value--;

  void incrementNumOfDrinks() => numOfDrinks.value++;
  void decrementNumOfDrinks() => numOfDrinks.value--;

  void incrementNumOfFood() => numOfFood.value++;
  void decrementNumOfFood() => numOfFood.value--;

  void incrementNumOfFood2() => numOfFood2.value++;
  void decrementNumOfFood2() => numOfFood2.value--;

  void nextPage() {
    if (selectedIndex.value < 2) {
      selectedIndex.value++;
    }
  }

  void previousPage() {
    if (selectedIndex.value > 0) {
      selectedIndex.value--;
    }
  }

  void validateForm1() {
    if (formKey1.currentState!.validate()) {
      nextPage();
    }
  }


  void validateForm2() {
    if (formKey2.currentState!.validate()) {
      nextPage();
    }
  }

  void validateForm3() {
    if (formKey3.currentState!.validate()) {
      nextPage();
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
