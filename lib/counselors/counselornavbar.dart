
import 'package:appoiter/counselors/counselorappointmentspage.dart';
import 'package:appoiter/counselors/counselorprofilepage.dart';
import 'package:appoiter/counselors/counselornotificationpage.dart';
import 'package:appoiter/counselors/counselorhomepage.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CounselorNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;
  final String email;

  CounselorNavBar({
    required this.selectedIndex,
    required this.onTabChange,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = screenWidth < 600 ? 20.0 : 24.0;
    final textSize = iconSize - 7;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1)),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: GNav(
            gap: screenWidth < 600 ? 5 : 8,
            color: Colors.grey,
            activeColor: Colors.white,
            iconSize: iconSize,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6), // Adjust vertical padding here
            duration: Duration(milliseconds: 800),
            tabBackgroundColor: Color(0xFF255B78),
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
                textStyle: TextStyle(fontSize: textSize, color: Colors.white), // Corrected: Set text color using textStyle property
                onPressed: () {
                  onTabChange(0);
                  navigateToPage(context, 0, email);
                },

              ),
              GButton(
                icon: Icons.people,
                text: 'Appointment',
                textStyle: TextStyle(fontSize: textSize, color: Colors.white), // Corrected: Set text color using textStyle property
                onPressed: () {
                  onTabChange(1);
                  navigateToPage(context, 1, email);
                },

              ),
              GButton(
                icon: Icons.campaign_rounded,
                text: 'Notice',
                textStyle: TextStyle(fontSize: textSize, color: Colors.white), // Corrected: Set text color using textStyle property
                onPressed: () {
                  onTabChange(2);
                  navigateToPage(context, 2, email);
                },

              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
                textStyle: TextStyle(fontSize: textSize, color: Colors.white), // Corrected: Set text color using textStyle property
                onPressed: () {
                  onTabChange(3);
                  navigateToPage(context, 3, email);
                },

              ),
            ],
            selectedIndex: selectedIndex,
          ),
        ),
      ),
    );
  }
  static void navigateToPage(BuildContext context, int index, String email) {
    // Handle navigation to different pages based on the index here
    switch (index) {
      case 0:
      // Navigate to the home page
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => CounselorHomePage(email: email)));
        break;
      case 1:
      // Navigate to the Counselor Details page
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => CounselorAppointmentsPage(email: email)));
        break;
      case 2:
      // Navigate to the Counselor Notification page
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => CounselorNotificationPage(email: email)));
        break;
      case 3:
      // Navigate to the Counselor Profile page
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => CounselorProfilePage(email: email)));
        break;
    }
  }

}