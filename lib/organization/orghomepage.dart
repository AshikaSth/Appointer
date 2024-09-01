//
// import 'package:appoiter/organization/orgnavbar.dart';
// import 'package:flutter/material.dart';
//
// class OrganizationHomePage extends StatefulWidget {
//   final String email;
//
//   OrganizationHomePage({required this.email});
//
//   @override
//   State<OrganizationHomePage> createState() => _OrganizationHomePageState();
// }
//
// class _OrganizationHomePageState extends State<OrganizationHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Organization Home Page'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Hello, ${widget.email}', // Access the 'email' property here
//               style: TextStyle(fontSize: 20),
//             ),
//             // Add other content or features specific to the organization homepage here
//           ],
//         ),
//       ),
//       bottomNavigationBar: OrgNavbar(),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
//
// class OrganizationHomePage extends StatefulWidget {
//   final String email;
//
//   OrganizationHomePage({required this.email});
//
//   @override
//   State<OrganizationHomePage> createState() => _OrganizationHomePageState();
// }
//
// class _OrganizationHomePageState extends State<OrganizationHomePage> {
//   int _selectedIndex = 0;
//   String greetingText = ''; // Initialize a variable for the greeting text
//
//   @override
//   void initState() {
//     super.initState();
//     greetingText = 'Hello, ${widget.email}'; // Set the greeting text in the initState method
//   }
//
//   List<Widget> _createPages() {
//     return [
//       Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               greetingText, // Use the greeting text here
//               style: TextStyle(fontSize: 20),
//             ),
//             Text('Your Home Page Content Here'),
//           ],
//         ),
//       ),
//       // ... The content for the other tabs.
//     ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Organization Home Page'),
//       ),
//       body: _createPages()[_selectedIndex], // Display content for the selected tab
//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
//           ],
//         ),
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
//             child: GNav(
//               gap: 8,
//               color: Colors.grey,
//               activeColor: Colors.blue,
//               iconSize: 24,
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//               duration: Duration(milliseconds: 800),
//               tabBackgroundColor: Colors.blue,
//               tabs: [
//                 GButton(
//                   icon: Icons.home,
//                   text: 'Home',
//                 ),
//                 GButton(
//                   icon: Icons.search,
//                   text: 'Search',
//                 ),
//                 GButton(
//                   icon: Icons.notifications,
//                   text: 'Notifications',
//                 ),
//                 GButton(
//                   icon: Icons.person,
//                   text: 'Profile',
//                 ),
//               ],
//               selectedIndex: _selectedIndex,
//               onTabChange: (index) {
//                 setState(() {
//                   _selectedIndex = index;
//                 });
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:appoiter/organization/createform.dart';
// import 'package:appoiter/organization/createformpage.dart';
// import 'package:flutter/material.dart';
// import 'orgnavbar.dart'; // Import the OrgNavBar widget
//
// class OrgHomePage extends StatefulWidget {
//   final String email;
//
//   OrgHomePage({required this.email});
//
//   @override
//   State<OrgHomePage> createState() => _OrgHomePageState();
// }
//
// class _OrgHomePageState extends State<OrgHomePage> {
//   int _selectedIndex = 0;
//
//
//   void _handleTabChange(int index) {
//     // Use the same logic for tab change as defined in OrgNavBar
//     setState(() {
//       _selectedIndex = index;
//     });
//     OrgNavBar.navigateToPage(context, index, widget.email);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Organization Home Page'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     'Email: ${widget.email}',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                   // Add other content specific to the Organization's home page here
//                 ],
//               ),
//             ),
//           ),
//           OrgNavBar(
//             selectedIndex: _selectedIndex,
//             onTabChange: _handleTabChange,
//             email: widget.email,
//           ),
//         ],
//       ),
//       floatingActionButton: Container(
//         margin: EdgeInsets.only(bottom: 45.0), // Add margin to move the button up
//         child: FloatingActionButton(
//           onPressed: () {
//             // Navigate to CreateNotice page
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => CreateFormPage(email: widget.email),
//               ),
//             );
//           },
//           child: Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }
//
// import 'package:appoiter/organization/createform.dart';
// import 'package:appoiter/organization/createformpage.dart';
// import 'package:flutter/material.dart';
// import 'orgnavbar.dart'; // Import the OrgNavBar widget
//
// class OrgHomePage extends StatefulWidget {
//   final String email;
//
//   OrgHomePage({required this.email});
//
//   @override
//   State<OrgHomePage> createState() => _OrgHomePageState();
// }
//
// class _OrgHomePageState extends State<OrgHomePage> {
//   int _selectedIndex = 0;
//
//   void _handleTabChange(int index) {
//     // Use the same logic for tab change as defined in OrgNavBar
//     setState(() {
//       _selectedIndex = index;
//     });
//     OrgNavBar.navigateToPage(context, index, widget.email);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Organization Home Page'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.more_vert),
//             onPressed: () {
//               // Add your options menu logic here
//               // For example, you can display a dialog or navigate to a settings page
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     'Email: ${widget.email}',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                   // Add other content specific to the Organization's home page here
//                 ],
//               ),
//             ),
//           ),
//           OrgNavBar(
//             selectedIndex: _selectedIndex,
//             onTabChange: _handleTabChange,
//             email: widget.email,
//           ),
//         ],
//       ),
//       floatingActionButton: Container(
//         margin: EdgeInsets.only(bottom: 45.0), // Add margin to move the button up
//         child: FloatingActionButton(
//           onPressed: () {
//             // Navigate to CreateNotice page
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => CreateFormPage(email: widget.email),
//               ),
//             );
//           },
//           child: Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }
// import 'package:appoiter/organization/createform.dart';
// import 'package:appoiter/organization/createformpage.dart';
// import 'package:flutter/material.dart';
// import 'orgnavbar.dart'; // Import the OrgNavBar widget
//
// class OrgHomePage extends StatefulWidget {
//   final String email;
//
//   OrgHomePage({required this.email});
//
//   @override
//   State<OrgHomePage> createState() => _OrgHomePageState();
// }
//
// class _OrgHomePageState extends State<OrgHomePage> {
//   int _selectedIndex = 0;
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   void _handleTabChange(int index) {
//     // Use the same logic for tab change as defined in OrgNavBar
//     setState(() {
//       _selectedIndex = index;
//     });
//     OrgNavBar.navigateToPage(context, index, widget.email);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         title: Text('Organization Home Page'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.menu),
//             onPressed: () {
//               // Open the drawer using the GlobalKey when the menu button is pressed
//               _scaffoldKey.currentState?.openEndDrawer();
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     'Email: ${widget.email}',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                   // Add other content specific to the Organization's home page here
//                 ],
//               ),
//             ),
//           ),
//           OrgNavBar(
//             selectedIndex: _selectedIndex,
//             onTabChange: _handleTabChange,
//             email: widget.email,
//           ),
//         ],
//       ),
//       endDrawer: Drawer(
//         // Add the content you want in the drawer
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Text(
//                 'MENU',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                 ),
//               ),
//             ),
//
//
//             ListTile(
//               title: Text('Settings'),
//               onTap: () {
//                 // Add functionality for the drawer item
//               },
//             ),
//
//
//             // Add more items as needed
//           ],
//         ),
//       ),
//       floatingActionButton: Container(
//         margin: EdgeInsets.only(bottom: 45.0), // Add margin to move the button up
//         child: FloatingActionButton(
//           onPressed: () {
//             // Navigate to CreateNotice page
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => CreateFormPage(email: widget.email),
//               ),
//             );
//           },
//           child: Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }
// import 'package:appoiter/organization/createform.dart';
// import 'package:appoiter/organization/createformpage.dart';
// import 'package:appoiter/organization/formpage.dart';
// import 'package:flutter/material.dart';
// import 'orgnavbar.dart'; // Import the OrgNavBar widget
//
// class OrgHomePage extends StatefulWidget {
//   final String email;
//
//   OrgHomePage({required this.email});
//
//   @override
//   State<OrgHomePage> createState() => _OrgHomePageState();
// }
//
// class _OrgHomePageState extends State<OrgHomePage> {
//   int _selectedIndex = 0;
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   void _handleTabChange(int index) {
//     // Use the same logic for tab change as defined in OrgNavBar
//     setState(() {
//       _selectedIndex = index;
//     });
//     OrgNavBar.navigateToPage(context, index, widget.email);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         title: Text('Organization Home Page'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.menu),
//             onPressed: () {
//               // Open the drawer using the GlobalKey when the menu button is pressed
//               _scaffoldKey.currentState?.openEndDrawer();
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Expanded(
//                   flex: 20, // Top container takes 20% of available space
//                   child: Container(
//                     padding: EdgeInsets.all(10.0),
//                     decoration: BoxDecoration(
//                       color: Colors.white, // Set the background color to black
//                     ),
//                     child: Text(
//                       'ASHIka',
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.black, // Set the text color to white
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 80, // Bottom container takes remaining 80% of available space
//                   child: Container(
//                     padding: EdgeInsets.all(10.0),
//                     decoration: BoxDecoration(
//                       color: Colors.black38, // Set the background color to pink
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(50), // Radius for top-left corner
//                         topRight: Radius.circular(50), // Radius for top-right corner
//                       ),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             ElevatedButton(
//                               onPressed: () {
//                                 // Navigate to CreateFormPage
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => CreateFormPage(email: widget.email),
//                                   ),
//                                 );
//                               },
//                               child: Text('Create Form'),
//                             ),
//
//                             ElevatedButton(
//                               onPressed: () {
//                                 // Navigate to CreateFormPage
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => FormPage(email: widget.email),
//                                   ),
//                                 ); // Add your onPressed logic here
//                               },
//                               child: Text('Form'),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 10), // Add spacing between rows
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             ElevatedButton(
//                               onPressed: () {
//                                 // Add your onPressed logic here
//                               },
//                               child: Text('Button 3'),
//                             ),
//                             ElevatedButton(
//                               onPressed: () {
//                                 // Add your onPressed logic here
//                               },
//                               child: Text('Button 4'),
//                             ),
//
//                           ],
//                         ),
//                         SizedBox(height: 10),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             ElevatedButton(
//                               onPressed: () {
//                                 // Add your onPressed logic here
//                               },
//                               child: Text('Button 3'),
//                             ),
//                             ElevatedButton(
//                               onPressed: () {
//                                 // Add your onPressed logic here
//                               },
//                               child: Text('Button 4'),
//                             ),
//
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//
//
//               ],
//             ),
//           ),
//
//           OrgNavBar(
//             selectedIndex: _selectedIndex,
//             onTabChange: _handleTabChange,
//             email: widget.email,
//           ),
//         ],
//       ),
//       endDrawer: Drawer(
//         // Add the content you want in the drawer
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Text(
//                 'MENU',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                 ),
//               ),
//             ),
//             ListTile(
//               title: Text('Settings'),
//               onTap: () {
//                 // Add functionality for the drawer item
//               },
//             ),
//             // Add more items as needed
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'orgnavbar.dart'; // Import the OrgNavBar widget
//
// class OrgHomePage extends StatefulWidget {
//   final String email;
//
//   OrgHomePage({required this.email});
//
//   @override
//   State<OrgHomePage> createState() => _OrgHomePageState();
// }
//
// class _OrgHomePageState extends State<OrgHomePage> {
//   int _selectedIndex = 0;
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   void _handleTabChange(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//     // Navigate to the selected page
//     // OrgNavBar.navigateToPage(context, index, widget.email);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF255B78), // Make app bar transparent
//         elevation: 0, // Remove shadow
//         automaticallyImplyLeading: false, // Remove back button
//         title: Text(
//           'Home',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: ListView(
//         children: [
//           HomePage(),
//         ],
//       ),
//       bottomNavigationBar: OrgNavBar(
//         selectedIndex: _selectedIndex,
//         onTabChange: _handleTabChange,
//         email: widget.email,
//       ),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Container(
//             padding: EdgeInsets.all(20),
//             color: Colors.white,
//             child: Text(
//               'Kantipur City College',
//               style: TextStyle(
//                 color: Color(0xFF255B78),
//                 fontSize: 25,
//                 fontFamily: 'Nunito Sans',
//                 fontWeight: FontWeight.w700,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           SizedBox(height: 80),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               _buildActionBox(
//                 title: 'Total Appointment',
//                 value: '1000',
//               ),
//               SizedBox(width: 10,),
//               _buildActionBox(
//                 title: 'Add Counselor',
//                 value: '+',
//               ),
//             ],
//           ),
//           SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               _buildActionBox(
//                 title: 'Remove Counselor',
//                 value: '-',
//               ),
//               SizedBox(width: 10,),
//               _buildActionBox(
//                 title: 'Add Notice',
//                 value: '+',
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildActionBox({required String title, required String value}) {
//     return Expanded(
//       child: Container(
//         padding: EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: Color(0xFF255B78),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 12,
//                 fontFamily: 'Inter',
//                 fontWeight: FontWeight.w400,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 10),
//             Text(
//               value,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 40,
//                 fontFamily: 'Nunito Sans',
//                 fontWeight: FontWeight.w700,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'orgnavbar.dart'; // Import the OrgNavBar widget
// import 'package:appoiter/organization/addcounselor.dart';
//
// class OrgHomePage extends StatefulWidget {
//   final String email;
//
//   OrgHomePage({required this.email});
//
//   @override
//   State<OrgHomePage> createState() => _OrgHomePageState();
// }
//
// class _OrgHomePageState extends State<OrgHomePage> {
//   int _selectedIndex = 0;
//
//   void _handleTabChange(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF255B78), // Make app bar transparent
//         elevation: 0, // Remove shadow
//         automaticallyImplyLeading: false, // Remove back button
//         title: Text(
//           'Home',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: ListView(
//         children: [
//           HomePage(email: widget.email), // Pass the email to the HomePage widget
//         ],
//       ),
//       bottomNavigationBar: OrgNavBar(
//         selectedIndex: _selectedIndex,
//         onTabChange: _handleTabChange,
//         email: widget.email,
//       ),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   final String email; // Add a field to store the passed email
//
//   const HomePage({Key? key, required this.email}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Container(
//             padding: EdgeInsets.all(20),
//             color: Colors.white,
//             child: Text(
//               'Kantipur City College',
//               style: TextStyle(
//                 color: Color(0xFF255B78),
//                 fontSize: 25,
//                 fontFamily: 'Nunito Sans',
//                 fontWeight: FontWeight.w700,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           SizedBox(height: 80),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               _buildActionBox(
//                 title: 'Total Counselors',
//                 stream: FirebaseFirestore.instance.collection('counselors').where('orgemail', isEqualTo: email).snapshots(),
//               ),
//               SizedBox(width: 10,),
//               _buildActionBox(
//                 title: 'Total Appointments',
//                 stream: FirebaseFirestore.instance.collection('appointments').where('orgemail', isEqualTo: email).snapshots(),
//               ),
//             ],
//           ),
//           SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               _buildActionBox(
//                 title: 'Add Counselor',
//                 context: context,
//               ),
//               // SizedBox(width: 10,),
//               // _buildActionBox(
//               //   title: 'Add Notice',
//               //   context: context,
//               // ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildActionBox({required String title, Stream<QuerySnapshot<Map<String, dynamic>>>? stream, BuildContext? context}) {
//     if (stream != null) {
//       return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//         stream: stream,
//         builder: (context, snapshot) {
//           int count = snapshot.data?.docs.length ?? 0; // Get the number of counselors
//
//           return Expanded(
//             child: GestureDetector(
//               onTap: () {
//                 // Add your onTap logic here
//               },
//               child: Container(
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color: Color(0xFF255B78),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       title,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 12,
//                         fontFamily: 'Inter',
//                         fontWeight: FontWeight.w400,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       '$count', // Display the count of counselors
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 40,
//                         fontFamily: 'Nunito Sans',
//                         fontWeight: FontWeight.w700,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       );
//     } else {
//       return Expanded(
//         child: GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context!,
//               MaterialPageRoute(builder: (_) => AddCounselorPage(email: email)),
//             );
//           },
//           child: Container(
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: Color(0xFF255B78),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 12,
//                     fontFamily: 'Inter',
//                     fontWeight: FontWeight.w400,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   '+',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 40,
//                     fontFamily: 'Nunito Sans',
//                     fontWeight: FontWeight.w700,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     }
//   }
// }

//
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'orgnavbar.dart'; // Import the OrgNavBar widget
// import 'package:appoiter/organization/addcounselor.dart';
// import 'package:appoiter/organization/createnotice.dart'; // Import the CreateNoticePage
//
// class OrgHomePage extends StatefulWidget {
//   final String email;
//
//   OrgHomePage({required this.email});
//
//   @override
//   State<OrgHomePage> createState() => _OrgHomePageState();
// }
//
// class _OrgHomePageState extends State<OrgHomePage> {
//   int _selectedIndex = 0;
//
//   void _handleTabChange(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF255B78), // Make app bar transparent
//         elevation: 0, // Remove shadow
//         automaticallyImplyLeading: false, // Remove back button
//         title: Text(
//           'Home',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: ListView(
//         children: [
//           HomePage(email: widget.email), // Pass the email to the HomePage widget
//         ],
//       ),
//       bottomNavigationBar: OrgNavBar(
//         selectedIndex: _selectedIndex,
//         onTabChange: _handleTabChange,
//         email: widget.email,
//       ),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   final String email; // Add a field to store the passed email
//
//   const HomePage({Key? key, required this.email}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           StreamBuilder<DocumentSnapshot>(
//             stream: FirebaseFirestore.instance.collection('organizations').doc(
//                 email).snapshots(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 //return CircularProgressIndicator(); // Show loading indicator while fetching data
//               }
//               if (!snapshot.hasData) {
//                 return Text('Organization not found');
//               }
//               var data = snapshot.data!.data() as Map<String,
//                   dynamic>; // Cast data to Map<String, dynamic>
//               if (data == null) {
//                 return Text('Organization data not found');
//               }
//               String orgName = data['name'] ?? '';
//               String orgAddress = data['address'] ?? '';
//               return Container(
//                 padding: EdgeInsets.all(20),
//                 color: Colors.white,
//                 child: Column(
//                   children: [
//                     Text(
//                       orgName,
//                       style: TextStyle(
//                         color: Color(0xFF255B78),
//                         fontSize: 25,
//                         fontFamily: 'Nunito Sans',
//                         fontWeight: FontWeight.w700,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       orgAddress,
//                       style: TextStyle(
//                         color: Color(0xFF255B78),
//                         fontSize: 16,
//                         fontFamily: 'Nunito Sans',
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//           SizedBox(height: 80),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               _buildActionBox(
//                 title: 'Total Counselors',
//                 stream: FirebaseFirestore.instance.collection('counselors')
//                     .where('orgemail', isEqualTo: email)
//                     .snapshots(),
//               ),
//               SizedBox(width: 10,),
//               _buildActionBox(
//                 title: 'Total Appointments',
//                 stream: FirebaseFirestore.instance.collection('appointments')
//                     .where('orgemail', isEqualTo: email)
//                     .snapshots(),
//
//               ),
//             ],
//           ),
//           SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               _buildActionBox(
//                 title: 'Add Counselor',
//                 icon: Icon(Icons.person_add), // Provide the Icon widget for the "Add Counselor" button
//                 context: context,
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (_) => AddCounselorPage(email: email)),
//                   );
//                 },
//               ),
//               SizedBox(width: 10,),
//               _buildActionBox(
//                 title: 'Add Notice',
//                 icon: Image.asset(
//                   'assets/addnotice.png',
//                   // Replace 'path_to_your_image_asset' with the actual path to your image asset
//                   width: 60,
//                   height: 60,
//                   color: Colors.white,
//                 ),
//                 context: context,
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (_) => CreateNotice(email: email)),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildActionBox({
//     required String title,
//     Widget? icon, // Make icon parameter optional
//     Stream<QuerySnapshot<Map<String, dynamic>>>? stream,
//     BuildContext? context,
//     VoidCallback? onTap,
//   }) {
//     if (stream != null) {
//       return Expanded(
//         child: GestureDetector(
//           onTap: onTap,
//           child: Container(
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: Color(0xFF255B78),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(height: 10),
//                 Text(
//                   title,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 12,
//                     fontFamily: 'Inter',
//                     fontWeight: FontWeight.w400,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 10),
//                 StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//                   stream: stream,
//                   builder: (context, snapshot) {
//                     int count = snapshot.data?.docs.length ??
//                         0; // Get the number of counselors
//                     return Text(
//                       '$count', // Display the count of counselors
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 40,
//                         fontFamily: 'Nunito Sans',
//                         fontWeight: FontWeight.w700,
//                       ),
//                       textAlign: TextAlign.center,
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     } else {
//       return  Expanded(
//         child: GestureDetector(
//           onTap: onTap,
//           child: Container(
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: Color(0xFF255B78),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   'assets/addnotice.png',
//                   // Replace 'path_to_your_image_asset' with the actual path to your image asset
//                   width: 60,
//                   height: 60,
//                   color: Colors.white,
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   title,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 12,
//                     fontFamily: 'Inter',
//                     fontWeight: FontWeight.w400,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 10),
//               ],
//             ),
//           ),
//         ),
//       );
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'orgnavbar.dart'; // Import the OrgNavBar widget
import 'package:appoiter/organization/addcounselor.dart';
import 'package:appoiter/organization/createnotice.dart'; // Import the CreateNoticePage

class OrgHomePage extends StatefulWidget {
  final String email;

  OrgHomePage({required this.email});

  @override
  State<OrgHomePage> createState() => _OrgHomePageState();
}

class _OrgHomePageState extends State<OrgHomePage> {
  int _selectedIndex = 0;

  void _handleTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF255B78), // Make app bar transparent
        automaticallyImplyLeading: false, // Remove back button
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          HomePage(email: widget.email), // Pass the email to the HomePage widget
        ],
      ),
      bottomNavigationBar: OrgNavBar(
        selectedIndex: _selectedIndex,
        onTabChange: _handleTabChange,
        email: widget.email,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final String email; // Add a field to store the passed email

  const HomePage({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance.collection('organizations').doc(
                email).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                //return CircularProgressIndicator(); // Show loading indicator while fetching data
              }
              if (!snapshot.hasData) {
                return Text('Organization not found');
              }
              var data = snapshot.data!.data() as Map<String,
                  dynamic>; // Cast data to Map<String, dynamic>
              if (data == null) {
                return Text('Organization data not found');
              }
              String orgName = data['name'] ?? '';
              String orgAddress = data['address'] ?? '';
              return Container(
                padding: EdgeInsets.all(20),
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      orgName,
                      style: TextStyle(
                        color: Color(0xFF255B78),
                        fontSize: 25,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      orgAddress,
                      style: TextStyle(
                        color: Color(0xFF255B78),
                        fontSize: 16,
                        fontFamily: 'Nunito Sans',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionBox(
                title: 'Total Counselors',
                stream: FirebaseFirestore.instance.collection('counselors')
                    .where('orgemail', isEqualTo: email)
                    .snapshots(),
              ),
              SizedBox(width: 10,),
              _buildActionBox(
                title: 'Total Appointments',
                stream: FirebaseFirestore.instance.collection('appointments')
                    .where('orgemail', isEqualTo: email)
                    .snapshots(),

              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionBox(
                title: 'Add Counselor',
                icon: Image.asset(
                  'assets/addperson.png',
                  // Replace 'path_to_your_image_asset' with the actual path to your image asset
                  width: 60,
                  height: 60,
                  color: Colors.white,
                ),// Provide the Icon widget for the "Add Counselor" button
                context: context,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => AddCounselorPage(email: email)),
                  );
                },
              ),
              SizedBox(width: 10,),
              _buildActionBox(
                title: 'Add Notice',
                icon: Image.asset(
                  'assets/addnotice.png',
                  // Replace 'path_to_your_image_asset' with the actual path to your image asset
                  width: 60,
                  height: 60,
                  color: Colors.white,
                ),
                context: context,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => CreateNotice(email: email)),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionBox({
    required String title,
    Widget? icon, // Make icon parameter optional
    Stream<QuerySnapshot<Map<String, dynamic>>>? stream,
    BuildContext? context,
    VoidCallback? onTap,
  }) {
    if (stream != null) {
      return Expanded(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFF255B78),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                icon ?? SizedBox(), // Display the provided icon or an empty SizedBox
                SizedBox(height: 10),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: stream,
                  builder: (context, snapshot) {
                    int count = snapshot.data?.docs.length ??
                        0; // Get the number of counselors
                    return Text(
                      '$count', // Display the count of counselors
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return  Expanded(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFF255B78),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon ?? SizedBox(), // Display the provided icon or an empty SizedBox
                SizedBox(height: 10),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      );
    }
  }
}
