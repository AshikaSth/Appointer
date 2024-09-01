import 'package:appoiter/organization/counselordetailspage.dart';
import 'package:appoiter/organization/orgprofilepage.dart';
import 'package:appoiter/organization/orgnotificationpage.dart';
import 'package:appoiter/organization/orghomepage.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class OrgNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;
  final String email;

  OrgNavBar({
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
            activeColor: Colors.black,
            iconSize: iconSize,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6), // Adjust vertical padding here
            duration: Duration(milliseconds: 800),
            tabBackgroundColor: Colors.white,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
                onPressed: () {
                  onTabChange(0);
                  navigateToPage(context, 0, email);
                },
                textStyle: TextStyle(fontSize: textSize),
              ),
              GButton(
                icon: Icons.people,
                text: 'Counselor',
                onPressed: () {
                  onTabChange(1);
                  navigateToPage(context, 1, email);
                },
                textStyle: TextStyle(fontSize: textSize),
              ),
              GButton(
                icon: Icons.campaign_rounded,
                text: 'Notice',
                onPressed: () {
                  onTabChange(2);
                  navigateToPage(context, 2, email);
                },
                textStyle: TextStyle(fontSize: textSize),
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
                onPressed: () {
                  onTabChange(3);
                  navigateToPage(context, 3, email);
                },
                textStyle: TextStyle(fontSize: textSize),
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
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => OrgHomePage(email: email)));
        break;
      case 1:
      // Navigate to the Counselor Details page
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => CounselorDetailsPage(email: email)));
        break;
      case 2:
      // Navigate to the Org Notification page
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => OrgNotificationPage(email: email)));
        break;
      case 3:
      // Navigate to the Org Profile page
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => OrgProfilePage(email: email)));
        break;
    }
  }
}