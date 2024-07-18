
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:yacht_app/constants/constants_widgets.dart';
import 'package:yacht_app/constants/image_constants.dart';
import 'package:yacht_app/views/schedule_screens/schedule_screen.dart';
import '../../constants/color_constants.dart';
import '../booking_screen/booking_screen.dart';
import '../booking_screen/new_booking_screen.dart';
import '../dashboard_screen/dashboard_screen.dart';
class MainBottomBar extends StatefulWidget {
  const MainBottomBar({Key? key}) : super(key: key);

  @override
  State<MainBottomBar> createState() => _MainBottomBarState();
}

class _MainBottomBarState extends State<MainBottomBar> {
  int selected = 0;
  PageController controller = PageController();

  // void _onTabTapped(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }

  var _currentIndex = 0;
  List<Widget> widgetList = [
    const DashboardScreen(),
    const ScheduleScreen(),
    NewBookingScreen(),
    const Center(child: Text("Hello")),
  ];
  void _showCloseDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title:customText(
            text: "Are you sure?",
            fontWeight: FontWeight.w500
          ),

          content: customText(
            text: "Do you want to exit the app?",

          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Future.delayed(const Duration(milliseconds: 500), () {
                  // Add a delay to let the dialog close smoothly
                  SystemNavigator.pop();
                });
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Exit'),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool value, va)async{
        _showCloseDialog(context);
      },
      child: Scaffold(

        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.3,
                blurRadius: 0.3
              )
            ]
          ),
          padding: const EdgeInsets.all(5),
          child: SalomonBottomBar(
            currentIndex: _currentIndex,
            itemPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            onTap: (i) => setState(() => _currentIndex = i),
            items: [
              /// Home

              SalomonBottomBarItem(
                icon: _currentIndex == 0 ?  SvgPicture.asset(home1Svg) : SvgPicture.asset(home2Svg),
                title: const Text("Home"),
                selectedColor: blackColor,
              ),

              /// Compose

              SalomonBottomBarItem(
                icon: _currentIndex == 1 ?  SvgPicture.asset(calendar1Svg) : SvgPicture.asset(calendar2Svg),
                title: const Text("Schedule"),
                selectedColor: blackColor,
              ),

              /// Settings
              SalomonBottomBarItem(
                icon: _currentIndex == 2 ?  SvgPicture.asset(bookMark1Svg) : SvgPicture.asset(bookMark1Svg),
                title: const Text("Booking"),
                selectedColor: blackColor,
              ),

              SalomonBottomBarItem(
                icon: Icon(Icons.person_outline, color:_currentIndex == 3 ? blackColor : Colors.grey,),
                title: const Text("Profile"),
                selectedColor: blackColor,
              ),

            ],
          ),
        ),
        body: widgetList[_currentIndex],
      ),
    );
  }

}