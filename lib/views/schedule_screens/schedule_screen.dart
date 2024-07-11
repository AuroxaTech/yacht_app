import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:yacht_app/constants/color_constants.dart';

import '../../constants/constants_widgets.dart';
import '../../constants/image_constants.dart';

const int kFirstYear = 2020;
const int kLastYear = 2030;

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {

  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();
  DateTime kToday = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.month;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Column(
        children: [
          Container(
            width: double.infinity,

            child: Column(
              children: [
              
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey, width: 0.4)
                          ),

                          padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10, right: 15),

                          child : Center(child: SvgPicture.asset(backSvg))
                      ),
                      customText(
                          text: "Detail",
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey, width: 0.4)
                          ),
                          padding: const EdgeInsets.only(left: 10, top: 7, bottom: 7, right: 10),
                          child : Center(child: SvgPicture.asset(moreSvg))
                      ),

                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 1.0,
                      ),
                    ],
                  ),
                  child: TableCalendar(
                    firstDay: DateTime.utc(kFirstYear),
                    lastDay: DateTime.utc(kLastYear),
                    focusedDay: focusedDay,
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.5),
                        shape: BoxShape.circle
                      ),
                      selectedDecoration:  const BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle
                      ),
                    ),
                    calendarFormat: calendarFormat,
                    selectedDayPredicate: (day) {
                      return isSameDay(selectedDay, day);
                    },
                    onDaySelected: (selectedDays, focusedDays) {
                      setState(() {
                        selectedDay = selectedDays;
                        focusedDay = focusedDays;
                      });
                      // Your existing code for onDaySelected
                    },
                    onFormatChanged: (format) {
                      if (calendarFormat != format) {
                       setState(() {
                         calendarFormat = format;
                       });
                      }
                    },
                    onPageChanged: (focusedDays) {
                     setState(() {
                       focusedDay = focusedDays;
                     });
                    },

                    calendarBuilders: const CalendarBuilders(

                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10, top: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      customText(
                        text: "My Schedule",
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

                const DestinationCard(),


              ],
            ),
          ),
        ],
      )),
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
                            shape: BoxShape.circle,
                            color: Colors.black
                        ),
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
                            shape: BoxShape.circle,
                            color: Colors.black
                        ),
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