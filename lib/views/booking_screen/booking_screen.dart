import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yacht_app/constants/image_constants.dart';
import '../../constants/color_constants.dart';
import '../../constants/constants_widgets.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen>
    with SingleTickerProviderStateMixin {
  final BookingController controller = Get.put(BookingController());
  final PageController _pageController = PageController();

  int _currentPage = 0;
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  int _numOfPersons = 4;
  int _numOfDrinks = 1;
  int _numOfFood = 4;
  int _numOfFood2 = 4;

  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();
  DateTime kToday = DateTime.now();
  @override
  void dispose() {
    _pageController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
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
                child:  Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              if (_currentPage > 0) {
                                _pageController.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              } else {
                                Navigator.pop(context);
                              }
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                        Border.all(color: Colors.grey, width: 0.4)),
                                padding: const EdgeInsets.only(
                                    left: 15, top: 10, bottom: 10, right: 15),
                                child: Center(child: SvgPicture.asset(backSvg))),
                          ),
                          customText(
                              text: "Booking",
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.grey, width: 0.4)),
                              padding: const EdgeInsets.only(
                                  left: 10, top: 7, bottom: 7, right: 10),
                              child: Center(child: SvgPicture.asset(moreSvg))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Container(
                height: height * 0.65,
                width: width * 0.9,
                color: Colors.white,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return IntrinsicHeight(
                      child:  PageView(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                            controller.currentPage.value = index;
                          });
                        },
                        children: [
                          _buildMyDetailsPage(),
                          _buildMyDetailsPage2(),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: height * 0.7,
                width: width * 0.9,
                color: Colors.white,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return IntrinsicHeight(
                      child: _buildOrderSummaryPage()
                    );
                  },
                ),
              )
                      ],
                    ),
            ),
          )),
      );
  }

  Widget _buildMyDetailsPage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey1,
        child: ListView(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      if (_currentPage > 0) {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30,
                    )),
                customText(
                    text: 'My Details',
                    fontSize: 20,
                    fontWeight: FontWeight.w600)
              ],
            ),
            _buildTabIndicators(controller.currentPage.value),
            Row(
              children: [
                customText(
                    text: "Full Name ",
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
                customText(
                    text: "*",
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.red),
              ],
            ),
            const SizedBox(height: 8),
            CustomTextField(
                controller: _fullNameController,
                hintText: "Enter Here",
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return 'Please enter your full name';
                //   }
                //   return null;
                // },
                borderSide:
                    const BorderSide(color: Colors.black12, width: 1.5)),
            const SizedBox(height: 16),
            Row(
              children: [
                customText(
                    text: "Email Adress ",
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
                customText(
                    text: "*",
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.red),
              ],
            ),
            SizedBox(height: 8),
            CustomTextField(
              borderSide: const BorderSide(color: Colors.black12, width: 1.5),
              controller: _emailController,
              hintText: "Enter Here",
              // validator: (value) {
              //   if (value!.isEmpty) {
              //     return 'Please enter your email address';
              //   }
              //   return null;
              // },
            ),
            SizedBox(height: 16),
            Row(
              children: [
                customText(
                    text: "Phone No",
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
                customText(
                    text: "*",
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.red),
              ],
            ),
            SizedBox(height: 8),
            CustomTextField(
              hintText: "Enter Here",
              borderSide: const BorderSide(color: Colors.black12, width: 1.5),
              controller: _phoneController,
              // validator: (value) {
              //   if (value!.isEmpty) {
              //     return 'Please enter your phone number';
              //   }
              //   return null;
              // },
            ),
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    customText(
                        text: "No. Of Persons",
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                    customText(
                        text: "*",
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.red),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  width: 350,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (_numOfPersons > 1) _numOfPersons--;
                          });
                        },
                      ),
                      Text('$_numOfPersons', style: TextStyle(fontSize: 16)),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            _numOfPersons++;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            CustomButton(
              onTap: () {
                if (_formKey1.currentState!.validate()) {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              text: 'Next',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMyDetailsPage2() {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey2,
          child: ListView(children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      if (_currentPage > 0) {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30,
                    )),
                customText(
                    text: 'Yacht Preferences',
                    fontSize: 20,
                    fontWeight: FontWeight.w600)
              ],
            ),
            _buildTabIndicators(controller.currentPage.value),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    customText(
                        text: "Add Drinks :",
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  width: 350,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (_numOfDrinks > 1) _numOfDrinks--;
                          });
                        },
                      ),
                      Text('$_numOfDrinks', style: TextStyle(fontSize: 16)),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            _numOfDrinks++;
                          });
                        },
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
                    fontSize: 18),
                SizedBox(height: 10),
                Container(
                  width: 350,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (_numOfFood > 1) _numOfFood--;
                          });
                        },
                      ),
                      Text('$_numOfFood', style: TextStyle(fontSize: 16)),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            _numOfFood++;
                          });
                        },
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
                        fontSize: 18),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  width: 350,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (_numOfFood2 > 1) _numOfFood2--;
                          });
                        },
                      ),
                      Text('$_numOfFood2', style: TextStyle(fontSize: 16)),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            _numOfFood2++;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            YachtDetailsCard(),
            SizedBox(height: 32),
            CustomButton(
              onTap: () {
                if (_formKey2.currentState!.validate()) {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              text: 'Next',
            ),
          ]),
        ));
  }
}

class DestinationCard extends StatelessWidget {
  final String? image;
  const DestinationCard({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Get.to(const DetailPage());
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                        child: Center(
                            child: Icon(
                          Icons.favorite_border,
                          color: Colors.black,
                          size: 20,
                        ))),
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
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(
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
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 5,
                        height: 5,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      customText(
                        text: "8 Guests",
                        color: blackColor,
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
                            shape: BoxShape.circle, color: Colors.black),
                      ),
                      const SizedBox(
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
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      customText(text: "\$149", fontWeight: FontWeight.bold),
                      customText(text: "/per hour", fontSize: 12)
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

class YachtDetailsCard extends StatelessWidget {
  final String? image;
  const YachtDetailsCard({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.sizeOf(context).width;
    // double height = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: () {
        //Get.to(const DetailPage());
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
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
                          text: "\$399.64",
                          fontWeight: FontWeight.bold,
                          color: Color(0xffBEA355)),
                      customText(text: "/per hour", fontSize: 12)
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
class BookingController extends GetxController {
  var currentPage = 0.obs;

  void nextPage() {
    if (currentPage < 2) {
      currentPage++;
    }
  }

  void previousPage() {
    if (currentPage > 0) {
      currentPage--;
    }
  }
}
Widget _buildTabIndicators(int currentPage) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(3, (index) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 16.0),
        width: 40,
        height: 8,
        decoration: BoxDecoration(
          color: currentPage >= index ? Colors.amber : Colors.grey[300],
          borderRadius: BorderRadius.circular(4.0),
        ),
      );
    }),
  );
}
Widget _buildOrderSummaryPage() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText(text:'Order Summary', fontSize: 22,fontWeight: FontWeight.w600),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customText(text: 'Yacht Ticket', fontSize: 18,fontWeight: FontWeight.w500),
            customText(text: '4.25',fontSize: 16),

          ],
        ),
        customText(text: '2x', fontSize: 16),

        const SizedBox(height: 8),
        Row(
          children: [
            CustomTextField(
              width: 205,
              borderSide: const BorderSide(color: Colors.black12, width: 1.5),
              hintText: 'Discount Code',
            ),
            SizedBox(width: 5,),
            CustomButton(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              width: 80,
              onTap: () {
                // Apply discount code
              }, text: 'Apply',
              fontSize: 13,
              btnColor: Colors.black,
              btnTextColor: Colors.white,

        ),

      ],
    ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                customText(text: 'Subtotal'),
                Icon(Icons.question_mark,size: 18,)
              ],
            ),
            customText(text: '\$4.25',fontWeight: FontWeight.w600),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                customText(text: 'Shipping'),
                Icon(Icons.question_mark,size: 18,)
              ],
            ),
            customText(text: '\$8.89',fontWeight: FontWeight.w600),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                customText(text: 'Estimated Taxes'),
                Icon(Icons.question_mark,size: 18,)
              ],
            ),
            customText(text: '\$0.40',fontWeight: FontWeight.w600),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                customText(text: 'Total',fontWeight: FontWeight.w700),
                Icon(Icons.question_mark,size: 18,)
              ],
            ),
            customText(text: '\$14.99',fontWeight: FontWeight.w600),
          ],
        ),
  ]));
}


