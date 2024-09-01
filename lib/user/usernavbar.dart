import 'package:appoiter/user/userappointmentspage.dart';
import 'package:appoiter/user/userhomepage.dart';
import 'package:appoiter/user/usernotificationpage.dart';
import 'package:appoiter/user/userprofilepage.dart';
import 'package:appoiter/user/userappointmentspage.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class UserNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;
  final String email;

  UserNavBar({
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
                onPressed: () {
                  onTabChange(0);
                  navigateToPage(context, 0, email);
                },
                textStyle: TextStyle(fontSize: textSize, color: Colors.white),
              ),
              GButton(
                icon: Icons.history,
                text: 'Appointments',
                onPressed: () {
                  onTabChange(1);
                  navigateToPage(context, 1, email);
                },
                textStyle: TextStyle(fontSize: textSize, color: Colors.white),
              ),
              GButton(
                icon: Icons.campaign_rounded,
                text: 'Notifications',
                onPressed: () {
                  onTabChange(2);
                  navigateToPage(context, 2, email);
                },
                textStyle: TextStyle(fontSize: textSize, color: Colors.white),
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
                onPressed: () {
                  onTabChange(3);
                  navigateToPage(context, 3, email);
                },
                textStyle: TextStyle(fontSize: textSize, color: Colors.white),
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
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => UserHomePage(email: email)));
        break;
      case 1:
      // Navigate to the Counselor Details page
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => UserAppointmentsPage(userEmail: email)));
        break;
      case 2:
      // Navigate to the Org Notification page
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => UserNotificationPage(email: email)));
        break;
      case 3:
      // Navigate to the Org Profile page
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => UserProfilePage(email: email)));
        break;
    }
  }
}