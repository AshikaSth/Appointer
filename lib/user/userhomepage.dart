// // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // import 'usernavbar.dart'; // Import the UserNavBar widget
// // // // // // // //
// // // // // // // // class UserHomePage extends StatefulWidget {
// // // // // // // //   final String email;
// // // // // // // //
// // // // // // // //   UserHomePage({required this.email});
// // // // // // // //
// // // // // // // //   @override
// // // // // // // //   State<UserHomePage> createState() => _UserHomePageState();
// // // // // // // // }
// // // // // // // //
// // // // // // // // class _UserHomePageState extends State<UserHomePage> {
// // // // // // // //   int _selectedIndex = 0;
// // // // // // // //
// // // // // // // //
// // // // // // // //   void _handleTabChange(int index) {
// // // // // // // //     // Use the same logic for tab change as defined in UserNavBar
// // // // // // // //     setState(() {
// // // // // // // //       _selectedIndex = index;
// // // // // // // //     });
// // // // // // // //     UserNavBar.navigateToPage(context, index, widget.email);
// // // // // // // //   }
// // // // // // // //
// // // // // // // //   @override
// // // // // // // //   Widget build(BuildContext context) {
// // // // // // // //     return Scaffold(
// // // // // // // //       appBar: AppBar(
// // // // // // // //         title: Text('User Home Page'),
// // // // // // // //       ),
// // // // // // // //       body: Column(
// // // // // // // //         children: [
// // // // // // // //           Expanded(
// // // // // // // //             child: Center(
// // // // // // // //               child: Column(
// // // // // // // //                 mainAxisAlignment: MainAxisAlignment.center,
// // // // // // // //                 children: <Widget>[
// // // // // // // //                   Text(
// // // // // // // //                     'Email: ${widget.email}',
// // // // // // // //                     style: TextStyle(fontSize: 20),
// // // // // // // //                   ),
// // // // // // // //                   // Add other content specific to the Organization's home page here
// // // // // // // //                 ],
// // // // // // // //               ),
// // // // // // // //             ),
// // // // // // // //           ),
// // // // // // // //           UserNavBar(
// // // // // // // //             selectedIndex: _selectedIndex,
// // // // // // // //             onTabChange: _handleTabChange,
// // // // // // // //             email: widget.email,
// // // // // // // //           ),
// // // // // // // //         ],
// // // // // // // //       ),
// // // // // // // //     );
// // // // // // // //   }
// // // // // // // // }
// // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // // import 'package:flutter/material.dart';
// // // // // // // import 'usernavbar.dart';
// // // // // // // import 'package:appoiter/user/appointmentdetailspage.dart'; // Import your AppointmentDetailsPage
// // // // // // //
// // // // // // // class UserHomePage extends StatefulWidget {
// // // // // // //   final String email;
// // // // // // //
// // // // // // //   UserHomePage({required this.email});
// // // // // // //
// // // // // // //   @override
// // // // // // //   State<UserHomePage> createState() => _UserHomePageState();
// // // // // // // }
// // // // // // //
// // // // // // // class _UserHomePageState extends State<UserHomePage> {
// // // // // // //   int _selectedIndex = 0;
// // // // // // //
// // // // // // //   void _handleTabChange(int index) {
// // // // // // //     setState(() {
// // // // // // //       _selectedIndex = index;
// // // // // // //     });
// // // // // // //     UserNavBar.navigateToPage(context, index, widget.email);
// // // // // // //   }
// // // // // // //
// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return Scaffold(
// // // // // // //       appBar: AppBar(
// // // // // // //         title: Text('User Home Page'),
// // // // // // //       ),
// // // // // // //       body: Column(
// // // // // // //         children: [
// // // // // // //           Container(
// // // // // // //             height: MediaQuery.of(context).size.height * 0.4,
// // // // // // //             child: StreamBuilder(
// // // // // // //               stream: FirebaseFirestore.instance
// // // // // // //                   .collection('users')
// // // // // // //                   .doc(widget.email)
// // // // // // //                   .collection('formanswers')
// // // // // // //                   .snapshots(),
// // // // // // //               builder: (context, snapshot) {
// // // // // // //                 if (!snapshot.hasData) {
// // // // // // //                   return CircularProgressIndicator();
// // // // // // //                 }
// // // // // // //                 var documents = snapshot.data!.docs;
// // // // // // //
// // // // // // //                 return ListView.builder(
// // // // // // //                   itemCount: documents.length,
// // // // // // //                   itemBuilder: (context, index) {
// // // // // // //                     var document = documents[index];
// // // // // // //                     return TextButton(
// // // // // // //                       onPressed: () {
// // // // // // //                         // Navigate to AppointmentDetailsPage and pass necessary data
// // // // // // //                         Navigator.push(
// // // // // // //                           context,
// // // // // // //                           MaterialPageRoute(
// // // // // // //                             builder: (context) => AppointmentDetailsPage(
// // // // // // //                               documentId: document.id,
// // // // // // //                               formAnswers: document.data() as Map<String, dynamic>,
// // // // // // //                             ),
// // // // // // //                           ),
// // // // // // //                         );
// // // // // // //                       },
// // // // // // //                       child: Column(
// // // // // // //                         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //                         children: [
// // // // // // //                           Text('Document ID: ${document.id}'),
// // // // // // //                           // Add more lines based on your document structure
// // // // // // //                           // Example: Text('Field 1: ${data['field1']}'),
// // // // // // //                         ],
// // // // // // //                       ),
// // // // // // //                     );
// // // // // // //                   },
// // // // // // //                 );
// // // // // // //               },
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           Expanded(
// // // // // // //             child: Center(
// // // // // // //               child: Column(
// // // // // // //                 mainAxisAlignment: MainAxisAlignment.center,
// // // // // // //                 children: <Widget>[
// // // // // // //                   Text(
// // // // // // //                     'Email: ${widget.email}',
// // // // // // //                     style: TextStyle(fontSize: 20),
// // // // // // //                   ),
// // // // // // //                   // Add other content specific to the Organization's home page here
// // // // // // //                 ],
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           UserNavBar(
// // // // // // //             selectedIndex: _selectedIndex,
// // // // // // //             onTabChange: _handleTabChange,
// // // // // // //             email: widget.email,
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }
// // // // // // // import 'package:flutter/material.dart';
// // // // // // // import 'usernavbar.dart';
// // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // // import 'package:appoiter/user/appointmentdetailspage.dart';
// // // // // // // import 'package:card_swiper/card_swiper.dart';
// // // // // // //
// // // // // // // class UserHomePage extends StatefulWidget {
// // // // // // //   final String email;
// // // // // // //
// // // // // // //   UserHomePage({required this.email});
// // // // // // //
// // // // // // //   @override
// // // // // // //   State<UserHomePage> createState() => _UserHomePageState();
// // // // // // // }
// // // // // // //
// // // // // // // class _UserHomePageState extends State<UserHomePage> {
// // // // // // //   int _selectedIndex = 0;
// // // // // // //
// // // // // // //   void _handleTabChange(int index) {
// // // // // // //     setState(() {
// // // // // // //       _selectedIndex = index;
// // // // // // //     });
// // // // // // //     UserNavBar.navigateToPage(context, index, widget.email);
// // // // // // //   }
// // // // // // //
// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return Scaffold(
// // // // // // //       appBar: AppBar(
// // // // // // //         title: Text('User Home Page'),
// // // // // // //       ),
// // // // // // //       body: Column(
// // // // // // //         children: [
// // // // // // //           Container(
// // // // // // //             height: MediaQuery.of(context).size.height * 0.4,
// // // // // // //             child: StreamBuilder(
// // // // // // //               stream: FirebaseFirestore.instance
// // // // // // //                   .collection('users')
// // // // // // //                   .doc(widget.email)
// // // // // // //                   .collection('formanswers')
// // // // // // //                   .snapshots(),
// // // // // // //               builder: (context, snapshot) {
// // // // // // //                 if (!snapshot.hasData) {
// // // // // // //                   return CircularProgressIndicator();
// // // // // // //                 }
// // // // // // //
// // // // // // //                 var documents = snapshot.data!.docs;
// // // // // // //
// // // // // // //                 return Swiper(
// // // // // // //                   itemBuilder: (BuildContext context, int index) {
// // // // // // //                     var document = documents[index];
// // // // // // //                     return Card(
// // // // // // //                       // Customize the appearance of the card as needed
// // // // // // //                       child: ListTile(
// // // // // // //                         title: Text('Document ID: ${document.id}'),
// // // // // // //                         subtitle: Text('Organization: ${document['organizationName']}'),
// // // // // // //                         onTap: () {
// // // // // // //                           // Navigate to AppointmentDetailsPage and pass necessary data
// // // // // // //                           Navigator.push(
// // // // // // //                             context,
// // // // // // //                             MaterialPageRoute(
// // // // // // //                               builder: (context) => AppointmentDetailsPage(
// // // // // // //                                 documentId: document.id,
// // // // // // //                                 formAnswers: document.data() as Map<String, dynamic>,
// // // // // // //                               ),
// // // // // // //                             ),
// // // // // // //                           );
// // // // // // //                         },
// // // // // // //                       ),
// // // // // // //                     );
// // // // // // //                   },
// // // // // // //                   itemCount: documents.length,
// // // // // // //                   viewportFraction: 0.8,
// // // // // // //                   scale: 0.9,
// // // // // // //                   pagination: SwiperPagination(),
// // // // // // //                   control: SwiperControl(),
// // // // // // //                 );
// // // // // // //               },
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           Expanded(
// // // // // // //             child: Center(
// // // // // // //               child: Column(
// // // // // // //                 mainAxisAlignment: MainAxisAlignment.center,
// // // // // // //                 children: <Widget>[
// // // // // // //                   Text(
// // // // // // //                     'Email: ${widget.email}',
// // // // // // //                     style: TextStyle(fontSize: 20),
// // // // // // //                   ),
// // // // // // //                   // Add other content specific to the Organization's home page here
// // // // // // //                 ],
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           UserNavBar(
// // // // // // //             selectedIndex: _selectedIndex,
// // // // // // //             onTabChange: _handleTabChange,
// // // // // // //             email: widget.email,
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // //
// // // // // // // import 'package:flutter/material.dart';
// // // // // // // import 'usernavbar.dart';
// // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // // import 'package:appoiter/user/appointmentdetailspage.dart';
// // // // // // // import 'package:card_swiper/card_swiper.dart';
// // // // // // //
// // // // // // // class UserHomePage extends StatefulWidget {
// // // // // // //   final String email;
// // // // // // //
// // // // // // //   UserHomePage({required this.email});
// // // // // // //
// // // // // // //   @override
// // // // // // //   State<UserHomePage> createState() => _UserHomePageState();
// // // // // // // }
// // // // // // //
// // // // // // // class _UserHomePageState extends State<UserHomePage> {
// // // // // // //   int _selectedIndex = 0;
// // // // // // //
// // // // // // //   void _handleTabChange(int index) {
// // // // // // //     setState(() {
// // // // // // //       _selectedIndex = index;
// // // // // // //     });
// // // // // // //     UserNavBar.navigateToPage(context, index, widget.email);
// // // // // // //   }
// // // // // // //
// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return Scaffold(
// // // // // // //       appBar: AppBar(
// // // // // // //         title: Text('User Home Page'),
// // // // // // //       ),
// // // // // // //       body: Column(
// // // // // // //         children: [
// // // // // // //           Container(
// // // // // // //             height: MediaQuery.of(context).size.height * 0.4,
// // // // // // //             child: StreamBuilder(
// // // // // // //               stream: FirebaseFirestore.instance
// // // // // // //                   .collection('users')
// // // // // // //                   .doc(widget.email)
// // // // // // //                   .collection('formanswers')
// // // // // // //                   .snapshots(),
// // // // // // //               builder: (context, snapshot) {
// // // // // // //                 if (!snapshot.hasData) {
// // // // // // //                   return CircularProgressIndicator();
// // // // // // //                 }
// // // // // // //
// // // // // // //                 var documents = snapshot.data!.docs;
// // // // // // //
// // // // // // //                 return Swiper(
// // // // // // //                   itemBuilder: (BuildContext context, int index) {
// // // // // // //                     var document = documents[index];
// // // // // // //                     return Card(
// // // // // // //                       // Customize the appearance of the card as needed
// // // // // // //                       child: ListTile(
// // // // // // //                         title: Text('Document ID: ${document.id}'),
// // // // // // //                         subtitle: FutureBuilder<String>(
// // // // // // //                           future: getOrganizationName(document.id),
// // // // // // //                           builder: (context, snapshot) {
// // // // // // //                             if (snapshot.connectionState == ConnectionState.waiting) {
// // // // // // //                               return CircularProgressIndicator();
// // // // // // //                             } else {
// // // // // // //                               return Text('Organization: ${snapshot.data}');
// // // // // // //                             }
// // // // // // //                           },
// // // // // // //                         ),
// // // // // // //                         onTap: () {
// // // // // // //                           // Navigate to AppointmentDetailsPage and pass necessary data
// // // // // // //                           Navigator.push(
// // // // // // //                             context,
// // // // // // //                             MaterialPageRoute(
// // // // // // //                               builder: (context) => AppointmentDetailsPage(
// // // // // // //                                 documentId: document.id,
// // // // // // //                                 formAnswers: document.data() as Map<String, dynamic>,
// // // // // // //                               ),
// // // // // // //                             ),
// // // // // // //                           );
// // // // // // //                         },
// // // // // // //                       ),
// // // // // // //                     );
// // // // // // //                   },
// // // // // // //                   itemCount: documents.length,
// // // // // // //                   viewportFraction: 0.8,
// // // // // // //                   scale: 0.9,
// // // // // // //                   pagination: SwiperPagination(),
// // // // // // //                   control: SwiperControl(),
// // // // // // //                 );
// // // // // // //               },
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           Expanded(
// // // // // // //             child: Center(
// // // // // // //               child: Column(
// // // // // // //                 mainAxisAlignment: MainAxisAlignment.center,
// // // // // // //                 children: <Widget>[
// // // // // // //                   Text(
// // // // // // //                     'Email: ${widget.email}',
// // // // // // //                     style: TextStyle(fontSize: 20),
// // // // // // //                   ),
// // // // // // //                   // Add other content specific to the Organization's home page here
// // // // // // //                 ],
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           UserNavBar(
// // // // // // //             selectedIndex: _selectedIndex,
// // // // // // //             onTabChange: _handleTabChange,
// // // // // // //             email: widget.email,
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //       floatingActionButton: Padding(
// // // // // // //         padding: EdgeInsets.only(top: 200.0),
// // // // // // //         child: FloatingActionButton(
// // // // // // //           onPressed: () {
// // // // // // //             // Navigate to the AppointmentHistoryPage and pass the user's email
// // // // // // //             Navigator.push(
// // // // // // //               context,
// // // // // // //               MaterialPageRoute(
// // // // // // //                 builder: (context) => AppointmentHistoryPage(email: widget.email),
// // // // // // //               ),
// // // // // // //             );
// // // // // // //           },
// // // // // // //           child: Icon(Icons.history),
// // // // // // //           tooltip: 'History',
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // //
// // // // // // //
// // // // // // //   Future<String> getOrganizationName(String documentId) async {
// // // // // // //     try {
// // // // // // //       DocumentSnapshot organizationSnapshot = await FirebaseFirestore.instance
// // // // // // //           .collection('organizations')
// // // // // // //           .doc(documentId)
// // // // // // //           .get();
// // // // // // //
// // // // // // //       if (organizationSnapshot.exists) {
// // // // // // //         return organizationSnapshot['name'];
// // // // // // //       } else {
// // // // // // //         return 'Organization not found';
// // // // // // //       }
// // // // // // //     } catch (e) {
// // // // // // //       return 'Error: $e';
// // // // // // //     }
// // // // // // //   }
// // // // // // // }
// // // // // // //
// // // // // // // class AppointmentHistoryPage extends StatelessWidget {
// // // // // // //   final String email;
// // // // // // //
// // // // // // //   AppointmentHistoryPage({required this.email});
// // // // // // //
// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return Scaffold(
// // // // // // //       appBar: AppBar(
// // // // // // //         title: Text('Appointment History'),
// // // // // // //       ),
// // // // // // //       body: StreamBuilder(
// // // // // // //         stream: FirebaseFirestore.instance
// // // // // // //             .collection('appointments')
// // // // // // //             .where('useremail', isEqualTo: email)
// // // // // // //             .snapshots(),
// // // // // // //         builder: (context, snapshot) {
// // // // // // //           if (!snapshot.hasData) {
// // // // // // //             return CircularProgressIndicator();
// // // // // // //           }
// // // // // // //
// // // // // // //           var documents = snapshot.data!.docs;
// // // // // // //
// // // // // // //           if (documents.isEmpty) {
// // // // // // //             return Center(
// // // // // // //               child: Text('No appointment history found.'),
// // // // // // //             );
// // // // // // //           }
// // // // // // //
// // // // // // //           return ListView.builder(
// // // // // // //             itemCount: documents.length,
// // // // // // //             itemBuilder: (context, index) {
// // // // // // //               var document = documents[index];
// // // // // // //               return ListTile(
// // // // // // //                 title: Text('Appointment ID: ${document.id}'),
// // // // // // //                 subtitle: Text('Date: ${document['date']}, Time: ${document['time']}'),
// // // // // // //                 // Add more details as needed
// // // // // // //               );
// // // // // // //             },
// // // // // // //           );
// // // // // // //         },
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }
// // // // // // import 'package:appoiter/user/userappointmentspage.dart';
// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'usernavbar.dart';
// // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // import 'package:appoiter/user/appointmentdetailspage.dart';
// // // // // // import 'package:card_swiper/card_swiper.dart';
// // // // // //
// // // // // // class UserHomePage extends StatefulWidget {
// // // // // //   final String email;
// // // // // //
// // // // // //   UserHomePage({required this.email});
// // // // // //
// // // // // //   @override
// // // // // //   State<UserHomePage> createState() => _UserHomePageState();
// // // // // // }
// // // // // //
// // // // // // class _UserHomePageState extends State<UserHomePage> {
// // // // // //   int _selectedIndex = 0;
// // // // // //
// // // // // //   void _handleTabChange(int index) {
// // // // // //     setState(() {
// // // // // //       _selectedIndex = index;
// // // // // //     });
// // // // // //     UserNavBar.navigateToPage(context, index, widget.email);
// // // // // //   }
// // // // // //
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Scaffold(
// // // // // //       appBar: AppBar(
// // // // // //         title: Text('User Home Page'),
// // // // // //       ),
// // // // // //       body: Stack(
// // // // // //         children: [
// // // // // //           Column(
// // // // // //             children: [
// // // // // //               Container(
// // // // // //                 height: MediaQuery.of(context).size.height * 0.4,
// // // // // //                 child: StreamBuilder(
// // // // // //                   // ... existing code for StreamBuilder
// // // // // //                   stream: FirebaseFirestore.instance
// // // // // //                       .collection('users')
// // // // // //                       .doc(widget.email)
// // // // // //                       .collection('formanswers')
// // // // // //                       .snapshots(),
// // // // // //                   builder: (context, snapshot) {
// // // // // //                     if (!snapshot.hasData) {
// // // // // //                       return CircularProgressIndicator();
// // // // // //                     }
// // // // // //
// // // // // //                     var documents = snapshot.data!.docs;
// // // // // //
// // // // // //                     return Swiper(
// // // // // //                       itemBuilder: (BuildContext context, int index) {
// // // // // //                         return Card(
// // // // // //                           child: ListTile(
// // // // // //                             title: Text('Card $index'),  // Replace this with your desired generic content
// // // // // //                           ),
// // // // // //                         );
// // // // // //                       },
// // // // // //                       itemCount: documents.length,
// // // // // //                       viewportFraction: 0.8,
// // // // // //                       scale: 0.9,
// // // // // //                       pagination: SwiperPagination(),
// // // // // //                       control: SwiperControl(),
// // // // // //                     );
// // // // // //                   },
// // // // // //                 ),
// // // // // //               ),
// // // // // //               Expanded(
// // // // // //                 child: Center(
// // // // // //                   child: Column(
// // // // // //                     mainAxisAlignment: MainAxisAlignment.center,
// // // // // //                     children: <Widget>[
// // // // // //                       Text(
// // // // // //                         'Email: ${widget.email}',
// // // // // //                         style: TextStyle(fontSize: 20),
// // // // // //                       ),
// // // // // //                       // Add other content specific to the Organization's home page here
// // // // // //                     ],
// // // // // //                   ),
// // // // // //                 ),
// // // // // //               ),
// // // // // //               UserNavBar(
// // // // // //                 selectedIndex: _selectedIndex,
// // // // // //                 onTabChange: _handleTabChange,
// // // // // //                 email: widget.email,
// // // // // //               ),
// // // // // //             ],
// // // // // //           ),
// // // // // //           Positioned(
// // // // // //             top: 160.0, // Adjust this value to the desired position
// // // // // //             right: 16.0,
// // // // // //             child: FloatingActionButton(
// // // // // //               onPressed: () {
// // // // // //                 // Navigate to the AppointmentHistoryPage and pass the user's email
// // // // // //                 Navigator.push(
// // // // // //                   context,
// // // // // //                   MaterialPageRoute(
// // // // // //                     builder: (context) => UserAppointmentsPage(userEmail: widget.email),
// // // // // //                   ),
// // // // // //                 );
// // // // // //               },
// // // // // //               child: Icon(Icons.history),
// // // // // //               tooltip: 'History',
// // // // // //             ),
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // //
// // // // // //   Future<String> getOrganizationName(String documentId) async {
// // // // // //     try {
// // // // // //       DocumentSnapshot organizationSnapshot = await FirebaseFirestore.instance
// // // // // //           .collection('organizations')
// // // // // //           .doc(documentId)
// // // // // //           .get();
// // // // // //
// // // // // //       if (organizationSnapshot.exists) {
// // // // // //         return organizationSnapshot['name'];
// // // // // //       } else {
// // // // // //         return 'Organization not found';
// // // // // //       }
// // // // // //     } catch (e) {
// // // // // //       return 'Error: $e';
// // // // // //     }
// // // // // //   }
// // // // // // }
// // // // // import 'package:appoiter/user/userappointmentspage.dart';
// // // // // import 'package:flutter/material.dart';
// // // // // import 'usernavbar.dart';
// // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // import 'package:appoiter/user/appointmentdetailspage.dart';
// // // // // import 'package:card_swiper/card_swiper.dart';
// // // // // class UserHomePage extends StatefulWidget {
// // // // //   final String email;
// // // // //
// // // // //   UserHomePage({required this.email});
// // // // //
// // // // //   @override
// // // // //   State<UserHomePage> createState() => _UserHomePageState();
// // // // // }
// // // // //
// // // // // class _UserHomePageState extends State<UserHomePage> {
// // // // //   int _selectedIndex = 0;
// // // // //   void _handleTabChange(int index) {
// // // // //     // Use the same logic for tab change as defined in UserNavBar
// // // // //     setState(() {
// // // // //       _selectedIndex = index;
// // // // //     });
// // // // //     UserNavBar.navigateToPage(context, index, widget.email);
// // // // //   }
// // // // //
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       appBar: AppBar(
// // // // //         title: Text('User Home Page'),
// // // // //       ),
// // // // //       body: Stack(
// // // // //         children: [
// // // // //           Column(
// // // // //             children: [
// // // // //               Container(
// // // // //                 height: MediaQuery.of(context).size.height * 0.4,
// // // // //                 child: StreamBuilder(
// // // // //                   stream: FirebaseFirestore.instance
// // // // //                       .collection('appointments')
// // // // //                       .where('useremail', isEqualTo: widget.email)
// // // // //                       .snapshots(),
// // // // //                   builder: (context, snapshot) {
// // // // //                     if (!snapshot.hasData) {
// // // // //                       return CircularProgressIndicator();
// // // // //                     }
// // // // //
// // // // //                     var appointments = snapshot.data!.docs;
// // // // //
// // // // //                     return Swiper(
// // // // //                       itemBuilder: (BuildContext context, int index) {
// // // // //                         var appointment = appointments[index];
// // // // //                         return Card(
// // // // //                           child: ListTile(
// // // // //                             title: Text('Appointment ID: ${appointment.id}'),
// // // // //                             subtitle: Column(
// // // // //                               crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                               children: [
// // // // //                                 Text('User Email: ${appointment['useremail']}'),
// // // // //                                 Text('Organization Email: ${appointment['orgemail']}'),
// // // // //                                 Text('Counselor Email: ${appointment['counseloremail']}'),
// // // // //                                 // Add more details as needed
// // // // //                               ],
// // // // //                             ),
// // // // //                           ),
// // // // //                         );
// // // // //                       },
// // // // //                       itemCount: appointments.length,
// // // // //                       viewportFraction: 0.8,
// // // // //                       scale: 0.9,
// // // // //                       pagination: SwiperPagination(),
// // // // //                       control: SwiperControl(),
// // // // //                     );
// // // // //                   },
// // // // //                 ),
// // // // //               ),
// // // // //               Expanded(
// // // // //                 child: Center(
// // // // //                   child: Column(
// // // // //                     mainAxisAlignment: MainAxisAlignment.center,
// // // // //                     children: <Widget>[
// // // // //                       Text(
// // // // //                         'Email: ${widget.email}',
// // // // //                         style: TextStyle(fontSize: 20),
// // // // //                       ),
// // // // //                       // Add other content specific to the Organization's home page here
// // // // //                     ],
// // // // //                   ),
// // // // //                 ),
// // // // //               ),
// // // // //               // UserNavBar widget code goes here
// // // // //             ],
// // // // //           ),
// // // // //           Positioned(
// // // // //             top: 160.0, // Adjust this value to the desired position
// // // // //             right: 16.0,
// // // // //             child: FloatingActionButton(
// // // // //               onPressed: () {
// // // // //                 // Navigate to the UserAppointmentsPage and pass the user's email
// // // // //                 Navigator.push(
// // // // //                   context,
// // // // //                   MaterialPageRoute(
// // // // //                     builder: (context) => UserAppointmentsPage(userEmail: widget.email),
// // // // //                   ),
// // // // //                 );
// // // // //               },
// // // // //               child: Icon(Icons.history),
// // // // //               tooltip: 'History',
// // // // //             ),
// // // // //             // UserNavBar widget code goes here
// // // // //             UserNavBar(),
// // // // //
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }
// // // // import 'package:appoiter/user/userappointmentspage.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'usernavbar.dart';
// // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // import 'package:appoiter/user/appointmentdetailspage.dart';
// // // // import 'package:card_swiper/card_swiper.dart';
// // // //
// // // // class UserHomePage extends StatefulWidget {
// // // //   final String email;
// // // //
// // // //   UserHomePage({required this.email});
// // // //
// // // //   @override
// // // //   State<UserHomePage> createState() => _UserHomePageState();
// // // // }
// // // //
// // // // class _UserHomePageState extends State<UserHomePage> {
// // // //   int _selectedIndex = 0;
// // // //
// // // //   void _handleTabChange(int index) {
// // // //     // Use the same logic for tab change as defined in UserNavBar
// // // //     setState(() {
// // // //       _selectedIndex = index;
// // // //     });
// // // //     UserNavBar.navigateToPage(context, index, widget.email);
// // // //   }
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text('User Home Page'),
// // // //       ),
// // // //       body: Stack(
// // // //         children: [
// // // //           Column(
// // // //             children: [
// // // //               Container(
// // // //                 height: MediaQuery.of(context).size.height * 0.4,
// // // //                 child: StreamBuilder(
// // // //                   stream: FirebaseFirestore.instance
// // // //                       .collection('appointments')
// // // //                       .where('useremail', isEqualTo: widget.email)
// // // //                       .snapshots(),
// // // //                   builder: (context, snapshot) {
// // // //                     if (!snapshot.hasData) {
// // // //                       return CircularProgressIndicator();
// // // //                     }
// // // //
// // // //                     var appointments = snapshot.data!.docs;
// // // //
// // // //                     return Swiper(
// // // //                       itemBuilder: (BuildContext context, int index) {
// // // //                         var appointment = appointments[index];
// // // //                         return Card(
// // // //                           child: ListTile(
// // // //                             title: Text('Appointment ID: ${appointment.id}'),
// // // //                             subtitle: Column(
// // // //                               crossAxisAlignment: CrossAxisAlignment.start,
// // // //                               children: [
// // // //                                 Text('User Email: ${appointment['useremail']}'),
// // // //                                 Text('Organization Email: ${appointment['orgemail']}'),
// // // //                                 Text('Counselor Email: ${appointment['counseloremail']}'),
// // // //                                 // Add more details as needed
// // // //                               ],
// // // //                             ),
// // // //                           ),
// // // //                         );
// // // //                       },
// // // //                       itemCount: appointments.length,
// // // //                       viewportFraction: 0.8,
// // // //                       scale: 0.9,
// // // //                       pagination: SwiperPagination(),
// // // //                       control: SwiperControl(),
// // // //                     );
// // // //                   },
// // // //                 ),
// // // //               ),
// // // //               Expanded(
// // // //                 child: Center(
// // // //                   child: Column(
// // // //                     mainAxisAlignment: MainAxisAlignment.center,
// // // //                     children: <Widget>[
// // // //                       Text(
// // // //                         'Email: ${widget.email}',
// // // //                         style: TextStyle(fontSize: 20),
// // // //                       ),
// // // //                       // Add other content specific to the Organization's home page here
// // // //                     ],
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //               // UserNavBar widget code goes here
// // // //               UserNavBar(
// // // //                 selectedIndex: _selectedIndex,
// // // //                 onTabChange: _handleTabChange,
// // // //                 email: widget.email,
// // // //               ),
// // // //             ],
// // // //           ),
// // // //           Positioned(
// // // //             top: 160.0, // Adjust this value to the desired position
// // // //             right: 16.0,
// // // //             child: FloatingActionButton(
// // // //               onPressed: () {
// // // //                 // Navigate to the UserAppointmentsPage and pass the user's email
// // // //                 Navigator.push(
// // // //                   context,
// // // //                   MaterialPageRoute(
// // // //                     builder: (context) => UserAppointmentsPage(userEmail: widget.email),
// // // //                   ),
// // // //                 );
// // // //               },
// // // //               child: Icon(Icons.history),
// // // //               tooltip: 'History',
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // // // import 'package:appoiter/user/userappointmentspage.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'usernavbar.dart';
// // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // import 'package:appoiter/user/appointmentdetailspage.dart';
// // // // import 'package:card_swiper/card_swiper.dart';
// // // //
// // // // class UserHomePage extends StatefulWidget {
// // // //   final String email;
// // // //
// // // //   UserHomePage({required this.email});
// // // //
// // // //   @override
// // // //   State<UserHomePage> createState() => _UserHomePageState();
// // // // }
// // // //
// // // // class _UserHomePageState extends State<UserHomePage> {
// // // //   int _selectedIndex = 0;
// // // //
// // // //   void _handleTabChange(int index) {
// // // //     // Use the same logic for tab change as defined in UserNavBar
// // // //     setState(() {
// // // //       _selectedIndex = index;
// // // //     });
// // // //     UserNavBar.navigateToPage(context, index, widget.email);
// // // //   }
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text('User Home Page'),
// // // //       ),
// // // //       body: Stack(
// // // //         children: [
// // // //           Column(
// // // //             children: [
// // // //               Container(
// // // //                 height: MediaQuery.of(context).size.height * 0.4,
// // // //                 child: StreamBuilder(
// // // //                   stream: FirebaseFirestore.instance
// // // //                       .collection('appointments')
// // // //                       .where('useremail', isEqualTo: widget.email)
// // // //                       .snapshots(),
// // // //                   builder: (context, snapshot) {
// // // //                     if (!snapshot.hasData) {
// // // //                       return CircularProgressIndicator();
// // // //                     }
// // // //
// // // //                     var appointments = snapshot.data!.docs;
// // // //
// // // //                     if (appointments.isEmpty) {
// // // //                       // Display "No Scheduled Appointments" when there are no appointments
// // // //                       return Center(
// // // //                         child: Text('No Scheduled Appointments'),
// // // //                       );
// // // //                     }
// // // //
// // // //                     // Display only one card for one appointment
// // // //                     var appointment = appointments[0];
// // // //
// // // //                     return Card(
// // // //                       child: ListTile(
// // // //                         title: Text('Appointment ID: ${appointment.id}'),
// // // //                         subtitle: Column(
// // // //                           crossAxisAlignment: CrossAxisAlignment.start,
// // // //                           children: [
// // // //                             Text('User Email: ${appointment['useremail']}'),
// // // //                             Text('Organization Email: ${appointment['orgemail']}'),
// // // //                             Text('Counselor Email: ${appointment['counseloremail']}'),
// // // //                             // Add more details as needed
// // // //                           ],
// // // //                         ),
// // // //                       ),
// // // //                     );
// // // //                   },
// // // //                 ),
// // // //               ),
// // // //               Expanded(
// // // //                 child: Center(
// // // //                   child: Column(
// // // //                     mainAxisAlignment: MainAxisAlignment.center,
// // // //                     children: <Widget>[
// // // //                       Text(
// // // //                         'Email: ${widget.email}',
// // // //                         style: TextStyle(fontSize: 20),
// // // //                       ),
// // // //                       // Add other content specific to the Organization's home page here
// // // //                     ],
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //               // UserNavBar widget code goes here
// // // //               UserNavBar(
// // // //                 selectedIndex: _selectedIndex,
// // // //                 onTabChange: _handleTabChange,
// // // //                 email: widget.email,
// // // //               ),
// // // //             ],
// // // //           ),
// // // //           Positioned(
// // // //             top: 160.0, // Adjust this value to the desired position
// // // //             right: 16.0,
// // // //             child: FloatingActionButton(
// // // //               onPressed: () {
// // // //                 // Navigate to the UserAppointmentsPage and pass the user's email
// // // //                 Navigator.push(
// // // //                   context,
// // // //                   MaterialPageRoute(
// // // //                     builder: (context) => UserAppointmentsPage(userEmail: widget.email),
// // // //                   ),
// // // //                 );
// // // //               },
// // // //               child: Icon(Icons.history),
// // // //               tooltip: 'History',
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // // import 'package:flutter/material.dart';
// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:appoiter/user/userappointmentspage.dart'; // Import the UserAppointmentsPage
// // // import 'package:card_swiper/card_swiper.dart';
// // //
// // // class UserHomePage extends StatefulWidget {
// // //   final String email;
// // //
// // //   UserHomePage({required this.email});
// // //
// // //   @override
// // //   State<UserHomePage> createState() => _UserHomePageState();
// // // }
// // //
// // // class _UserHomePageState extends State<UserHomePage> {
// // //   int _selectedIndex = 0;
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('User Home Page'),
// // //       ),
// // //       body: Stack(
// // //         children: [
// // //           Column(
// // //             children: [
// // //               Container(
// // //                 height: MediaQuery.of(context).size.height * 0.4,
// // //                 child: StreamBuilder(
// // //                   stream: FirebaseFirestore.instance
// // //                       .collection('appointments')
// // //                       .where('useremail', isEqualTo: widget.email)
// // //                       .snapshots(),
// // //                   builder: (context, snapshot) {
// // //                     if (!snapshot.hasData) {
// // //                       return CircularProgressIndicator();
// // //                     }
// // //
// // //                     var appointments = snapshot.data!.docs;
// // //
// // //                     return Swiper(
// // //                       itemBuilder: (BuildContext context, int index) {
// // //                         var appointment = appointments[index];
// // //
// // //                         return Card(
// // //                           child: ListTile(
// // //                             title: Text('Organization Email: ${appointment['orgemail']}'),
// // //                             subtitle: Column(
// // //                               crossAxisAlignment: CrossAxisAlignment.start,
// // //                               children: [
// // //                                 Text('Counselor Email: ${appointment['counseloremail']}'),
// // //                                 // Add more details as needed
// // //                               ],
// // //                             ),
// // //                           ),
// // //                         );
// // //                       },
// // //                       itemCount: appointments.length,
// // //                       viewportFraction: 0.8,
// // //                       scale: 0.9,
// // //                       pagination: SwiperPagination(),
// // //                       control: SwiperControl(),
// // //                     );
// // //                   },
// // //                 ),
// // //               ),
// // //               Expanded(
// // //                 child: Center(
// // //                   child: Column(
// // //                     mainAxisAlignment: MainAxisAlignment.center,
// // //                     children: <Widget>[
// // //                       Text(
// // //                         'Email: ${widget.email}',
// // //                         style: TextStyle(fontSize: 20),
// // //                       ),
// // //                       // Add other content specific to the Organization's home page here
// // //                     ],
// // //                   ),
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //           Positioned(
// // //             top: 160.0, // Adjust this value to the desired position
// // //             right: 16.0,
// // //             child: FloatingActionButton(
// // //               onPressed: () {
// // //                 // Navigate to the UserAppointmentsPage and pass the user's email
// // //                 Navigator.push(
// // //                   context,
// // //                   MaterialPageRoute(
// // //                     builder: (context) => UserAppointmentsPage(userEmail: widget.email),
// // //                   ),
// // //                 );
// // //               },
// // //               child: Icon(Icons.history),
// // //               tooltip: 'History',
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:appoiter/user/userappointmentspage.dart'; // Import the UserAppointmentsPage
// // import 'package:card_swiper/card_swiper.dart';
// // import 'usernavbar.dart'; // Import the UserNavBar widget
// //
// // class UserHomePage extends StatefulWidget {
// //   final String email;
// //
// //   UserHomePage({required this.email});
// //
// //   @override
// //   State<UserHomePage> createState() => _UserHomePageState();
// // }
// //
// // class _UserHomePageState extends State<UserHomePage> {
// //   int _selectedIndex = 0;
// //
// //   void _handleTabChange(int index) {
// //     // Use the same logic for tab change as defined in UserNavBar
// //     setState(() {
// //       _selectedIndex = index;
// //     });
// //     UserNavBar.navigateToPage(context, index, widget.email);
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Color(0xFF255B78), // Make app bar transparent
// //         elevation: 0, // Remove shadow
// //         automaticallyImplyLeading: false, // Remove back button
// //         // leading: IconButton(
// //         //   icon: Icon(Icons.arrow_back, color: Colors.white), // Set back button color
// //         //   onPressed: () {
// //         //     Navigator.of(context).pop(); // Go back when back button is pressed
// //         //   },
// //         // ),
// //         title: Text(
// //           'Home',
// //           style: TextStyle(color: Colors.white),
// //         ),
// //       ),
// //       body: Stack(
// //         children: [
// //           Column(
// //             crossAxisAlignment: CrossAxisAlignment.end,
// //             children: [
// //               Padding(
// //                 padding: const EdgeInsets.all(8.0),
// //                 child: Container(
// //                   padding: EdgeInsets.all(10),
// //                   decoration: BoxDecoration(
// //                     color: Colors.white, // Updated color
// //                     borderRadius: BorderRadius.circular(10),
// //                   ),
// //                   child: Row(
// //                     mainAxisSize: MainAxisSize.min,
// //                     children: [
// //                       Icon(Icons.history, color: Color(0xFF255B78)), // Add Icon before text
// //                       SizedBox(width: 5), // Add some spacing between the icon and text
// //                       Text(
// //                         'Appointment History',
// //                         style: TextStyle(fontSize: 12, color: Color(0xFF255B78), decoration: TextDecoration.underline),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //               //SizedBox(height: 0), // Add spacing between Appointment History and Swiper cards
// //               Expanded(
// //                 child: Container(
// //                   height: MediaQuery.of(context).size.height * 0.2,
// //                   child: StreamBuilder(
// //                     stream: FirebaseFirestore.instance
// //                         .collection('appointments')
// //                         .where('useremail', isEqualTo: widget.email)
// //                         .snapshots(),
// //                     builder: (context, snapshot) {
// //                       if (!snapshot.hasData) {
// //                         // return CircularProgressIndicator();
// //                       }
// //
// //                       var appointments = snapshot.data!.docs;
// //
// //                       return Swiper(
// //                         itemBuilder: (BuildContext context, int index) {
// //                           var appointment = appointments[index];
// //
// //                           return FutureBuilder(
// //                             future: FirebaseFirestore.instance
// //                                 .collection('organizations')
// //                                 .doc(appointment['orgemail'])
// //                                 .get(),
// //                             builder: (context, orgSnapshot) {
// //                               if (orgSnapshot.connectionState == ConnectionState.waiting) {
// //                                 return CircularProgressIndicator();
// //                               }
// //
// //                               if (!orgSnapshot.hasData) {
// //                                 return Center(
// //                                   child: Text('No organization data received.'),
// //                                 );
// //                               }
// //
// //                               var orgName = orgSnapshot.data!['name'];
// //                               var orgAddress = orgSnapshot.data!['address'];
// //                               var orgPhoneNumber = orgSnapshot.data!['contact'];
// //
// //                               return FutureBuilder(
// //                                 future: FirebaseFirestore.instance
// //                                     .collection('counselors')
// //                                     .doc(appointment['counseloremail'])
// //                                     .get(),
// //                                 builder: (context, counselorSnapshot) {
// //                                   if (counselorSnapshot.connectionState == ConnectionState.waiting) {
// //                                     return CircularProgressIndicator();
// //                                   }
// //
// //                                   if (!counselorSnapshot.hasData) {
// //                                     return Center(
// //                                       child: Text('No counselor data received.'),
// //                                     );
// //                                   }
// //
// //                                   var counselorName = counselorSnapshot.data!['name'];
// //                                   var counselorPhone = counselorSnapshot.data!['phone'];
// //
// //                                   return Card(
// //                                     child: ListTile(
// //                                       title: Text('$orgName'),
// //                                       subtitle: Column(
// //                                         crossAxisAlignment: CrossAxisAlignment.start,
// //                                         children: [
// //                                           Text('Address: $orgAddress'),
// //                                           Text('Phone Number: $orgPhoneNumber'),
// //                                           Text('Counselor Name: $counselorName'),
// //                                           Text('Counselor Phone: $counselorPhone'),
// //                                           // Add more details as needed
// //                                         ],
// //                                       ),
// //                                     ),
// //                                   );
// //                                 },
// //                               );
// //                             },
// //                           );
// //                         },
// //                         itemCount: appointments.length,
// //                         viewportFraction: 0.9, // Adjust the fraction as needed, lower value makes cards smaller
// //                         scale: 0.9, // Adjust scale to control the card size
// //                         pagination: SwiperPagination(),
// //                         control: SwiperControl(),
// //                       );
// //
// //                     },
// //                   ),
// //                 ),
// //               ),
// //
// //             ],
// //           ),
// //
// //           Positioned(
// //             bottom: 0, // Align the widget to the bottom
// //             left: 0,
// //             right: 0,
// //             child: UserNavBar(
// //               selectedIndex: _selectedIndex,
// //               onTabChange: _handleTabChange,
// //               email: widget.email,
// //             ),
// //           ),
// //         ],
// //       ),
// //
// //
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:appoiter/user/userappointmentspage.dart'; // Import the UserAppointmentsPage
// import 'package:card_swiper/card_swiper.dart';
// import 'usernavbar.dart'; // Import the UserNavBar widget
//
// class UserHomePage extends StatefulWidget {
//   final String email;
//
//   UserHomePage({required this.email});
//
//   @override
//   State<UserHomePage> createState() => _UserHomePageState();
// }
//
// class _UserHomePageState extends State<UserHomePage> {
//   int _selectedIndex = 0;
//
//   void _handleTabChange(int index) {
//     // Use the same logic for tab change as defined in UserNavBar
//     setState(() {
//       _selectedIndex = index;
//     });
//     UserNavBar.navigateToPage(context, index, widget.email);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor:  Color(0xFF255B78), // Make app bar transparent
//         //elevation: 0, // Remove shadow
//        // automaticallyImplyLeading: false, // Remove back button
//         title: Text(
//           'Home',
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Container(
//               height: MediaQuery.of(context).size.height * 0.3, // Set the height of the Swiper cards
//               child: StreamBuilder(
//                 stream: FirebaseFirestore.instance
//                     .collection('appointments')
//                     .where('useremail', isEqualTo: widget.email)
//                     .snapshots(),
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) {
//                     // return CircularProgressIndicator();
//                   }
//
//                   var appointments = snapshot.data!.docs;
//
//                   return Swiper(
//                     itemBuilder: (BuildContext context, int index) {
//                       var appointment = appointments[index];
//                       var appointmentDocID = appointment.id; // Get the document ID
//
//                       return FutureBuilder(
//                         future: FirebaseFirestore.instance
//                             .collection('organizations')
//                             .doc(appointment['orgemail'])
//                             .get(),
//                         builder: (context, orgSnapshot) {
//                           if (orgSnapshot.connectionState == ConnectionState.waiting) {
//                             return CircularProgressIndicator();
//                           }
//
//                           if (!orgSnapshot.hasData) {
//                             return Center(
//                               child: Text('No organization data received.'),
//                             );
//                           }
//
//                           var orgName = orgSnapshot.data!['name'];
//                           var orgAddress = orgSnapshot.data!['address'];
//                           var orgPhoneNumber = orgSnapshot.data!['contact'];
//
//                           return FutureBuilder(
//                             future: FirebaseFirestore.instance
//                                 .collection('counselors')
//                                 .doc(appointment['counseloremail'])
//                                 .get(),
//                             builder: (context, counselorSnapshot) {
//                               if (counselorSnapshot.connectionState == ConnectionState.waiting) {
//                                 //return CircularProgressIndicator();
//                               }
//
//                               if (!counselorSnapshot.hasData) {
//                                 return Center(
//                                   child: Text('No counselor data received.'),
//                                 );
//                               }
//
//                               var counselorName = counselorSnapshot.data!['name'];
//                               var counselorPhone = counselorSnapshot.data!['phone'];
//
//                               return ClipRRect(
//                                 borderRadius: BorderRadius.circular(10), // Set the border radius to make edges rounded
//                                 child: Card(
//                                   child: InkWell(
//                                     onTap: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) => AppointmentDetails(
//                                             orgName: orgName,
//                                             counselorName: counselorName,
//                                             appointmentDocID: appointmentDocID,
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                     child: ListTile(
//                                       title: Text('$orgName'),
//                                       subtitle: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Text('Address: $orgAddress'),
//                                           Text('Phone Number: $orgPhoneNumber'),
//                                           Text('Counselor Name: $counselorName'),
//                                           Text('Counselor Phone: $counselorPhone'),
//                                           //Text('Appointment ID: $appointmentDocID'), // Display the document ID
//                                           // Add more details as needed
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               );
//
//                             },
//                           );
//                         },
//                       );
//                     },
//                     itemCount: appointments.length,
//                     viewportFraction: 0.9,
//                     scale: 0.9,
//                     pagination: SwiperPagination(),
//                     control: SwiperControl(),
//                   );
//
//
//                 },
//               ),
//             ),
//           ),
//           SizedBox(height: 8), // Add some spacing between Swiper cards and email display
//           Container(
//             height: MediaQuery.of(context).size.height * 0.5, // Set the height of the email display
//             child: Center(
//               child: Text(
//                 widget.email,
//                 style: TextStyle(fontSize: 20),
//               ),
//             ),
//           ),
//             UserNavBar(
//               selectedIndex: _selectedIndex,
//               onTabChange: _handleTabChange,
//               email: widget.email,
//             ),
//         ],
//       ),
//     );
//   }
// }
import 'package:appoiter/user/appointmentdetails.dart';
import 'package:appoiter/user/organizationdetailspage.dart';
import 'package:appoiter/user/userfavorites.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appoiter/user/userappointmentspage.dart'; // Import the UserAppointmentsPage
import 'package:card_swiper/card_swiper.dart';
import 'usernavbar.dart'; // Import the UserNavBar widget

class UserHomePage extends StatefulWidget {
  final String email;

  UserHomePage({required this.email});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  int _selectedIndex = 0;

  List<String> _organizations = [];

  void _handleTabChange(int index) {
    // Use the same logic for tab change as defined in UserNavBar
    setState(() {
      _selectedIndex = index;
    });
    UserNavBar.navigateToPage(context, index, widget.email);
  }

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF255B78), // Make app bar transparent
        title: Text(
          'Home',
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2, // Set the height of the Swiper cards
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('appointments')
                    .where('useremail', isEqualTo: widget.email)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    // return CircularProgressIndicator();
                  }

                  var appointments = snapshot.data!.docs;

                  return Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      var appointment = appointments[index];
                      var appointmentDocID = appointment.id; // Get the document ID

                      return FutureBuilder(
                        future: FirebaseFirestore.instance
                            .collection('organizations')
                            .doc(appointment['orgemail'])
                            .get(),
                        builder: (context, orgSnapshot) {
                          if (orgSnapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          }

                          if (!orgSnapshot.hasData) {
                            return Center(
                              child: Text('No organization data received.'),
                            );
                          }

                          var orgName = orgSnapshot.data!['name'];
                          var orgAddress = orgSnapshot.data!['address'];
                          var orgPhoneNumber = orgSnapshot.data!['contact'];

                          return FutureBuilder(
                            future: FirebaseFirestore.instance
                                .collection('counselors')
                                .doc(appointment['counseloremail'])
                                .get(),
                            builder: (context, counselorSnapshot) {
                              if (counselorSnapshot.connectionState == ConnectionState.waiting) {
                                //return CircularProgressIndicator();
                              }

                              if (!counselorSnapshot.hasData) {
                                return Center(
                                  child: Text('No counselor data received.'),
                                );
                              }

                              var counselorName = counselorSnapshot.data!['name'];
                              var counselorPhone = counselorSnapshot.data!['phone'];

                              var appointmentDate = appointment['appointmentDate'];
                              var formattedDate = "${appointmentDate.toDate().day}/${appointmentDate.toDate().month}/${appointmentDate.toDate().year}";

                              return ClipRRect(
                                borderRadius: BorderRadius.circular(17),
                                child: Card(
                                  color: Color(0xFAFAFAFA),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AppointmentDetails(
                                            orgName: orgName,
                                            counselorName: counselorName,
                                            appointmentDocID: appointmentDocID,
                                          ),
                                        ),
                                      );
                                    },
                                    child: ListTile(
                                      title: Text('Your Appointments', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Text(
                                                'Institution: ',
                                                style: TextStyle(color: Colors.black, fontSize: 12),
                                              ),
                                              Text(
                                                '$orgName',
                                                style: TextStyle(color: Colors.black, fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5,),
                                          Row(
                                            children: [
                                              Text(
                                                'Address: ',
                                                style: TextStyle(color: Colors.black, fontSize: 12),
                                              ),
                                              Text(
                                                '$orgAddress',
                                                style: TextStyle(color: Colors.black, fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5,),
                                          Row(
                                            children: [
                                              Text(
                                                'Phone Number: ',
                                                style: TextStyle(color: Colors.black, fontSize: 12),
                                              ),
                                              Text(
                                                '$orgPhoneNumber',
                                                style: TextStyle(color: Colors.black, fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5,),

                                          Row(
                                            children: [
                                              Text(
                                                'Counselor Name: ',
                                                style: TextStyle(color: Colors.black, fontSize: 12),
                                              ),
                                              Text(
                                                '$counselorName',
                                                style: TextStyle(color: Colors.black, fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5,),

                                          Row(
                                            children: [
                                              Text(
                                                'Counselor Phone: ',
                                                style: TextStyle(color: Colors.black, fontSize: 12),
                                              ),
                                              Text(
                                                '$counselorPhone',
                                                style: TextStyle(color: Colors.black,fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5,),

                                          Row(
                                            children: [
                                              Text(
                                                'Date: ',
                                                style: TextStyle(color: Colors.black, fontSize: 12),
                                              ),
                                              Text(
                                                '$formattedDate',
                                                style: TextStyle(color: Colors.black,fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          //Text('Appointment ID: $appointmentDocID'), // Display the document ID
                                          // Add more details as needed
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },

                    itemCount: appointments.length,
                    viewportFraction: 0.9,
                    scale: 0.9,
                    pagination: SwiperPagination(),
                    control: SwiperControl(),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 8),
          // TextButton.icon(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => UserFavorites(email: widget.email)),
          //     );
          //   },
          //   icon: Icon(Icons.favorite),
          //   label: Text(
          //     'Favourites: ${data?['favorites']?.length ?? 0}', // Assuming 'favorites' is an array of emails in your data
          //     style: TextStyle(fontSize: 16),
          //   ),
          // ),


          SizedBox(height: 8), // Add some spacing between Swiper cards and email display
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (String? query) {
                      if (query != null) {
                        searchOrganizations(query);
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Search for Organizations',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance.collection('users').doc(widget.email).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(); // Display a loading indicator while waiting for data
                  }

                  if (!snapshot.hasData || snapshot.data == null) {
                    return Text('User data not found.'); // Return a message if user data is not available
                  }

                  var userData = snapshot.data!.data();
                  int favoritesCount = userData?['favorites']?.length ?? 0; // Access the 'favorites' field and get its length

                  return TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserFavorites(email: widget.email)),
                      );
                    },
                    icon: Icon(Icons.favorite),
                    label: Text(
                      '$favoritesCount',
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                },
              ),
            ],
          ),

          Expanded(
            child: FutureBuilder<List<String>>(
              future: getAllOrganizationNames(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Widget for the loading state
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}'); // Widget for the error state
                } else {
                  List<String>? organizationNames = snapshot.data;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: organizationNames?.length ?? 0,
                    itemBuilder: (context, index) {
                      String organizationName = organizationNames?[index] ?? '';

                      return ListTile(
                        title: Text(
                          organizationName,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrganizationDetailsPage(
                                email: widget.email,
                                organizationName: organizationName,

                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
          UserNavBar(
            selectedIndex: _selectedIndex,
            onTabChange: _handleTabChange,
            email: widget.email,
          ),
        ],
      ),
    );
  }
  void searchOrganizations(String query) {
    // Query Firestore to get organizations based on the search query
    FirebaseFirestore.instance
        .collection('organizations')
        .where('name', isGreaterThanOrEqualTo: query)
        .where('name', isLessThan: query + 'z')
        .get()
        .then((QuerySnapshot querySnapshot) {
      List<String> results = [];
      querySnapshot.docs.forEach((doc) {
        results.add(doc['name']);
      });

      setState(() {
        _organizations = results;
      });
    });
  }


Future<List<String>> getAllOrganizationNames() async {
  QuerySnapshot querySnapshot =
  await FirebaseFirestore.instance.collection('organizations').get();

  List<String> organizationNames = [];

  querySnapshot.docs.forEach((doc) {
    organizationNames.add(doc['name']);
  });

  return organizationNames;
}
}
class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            backgroundColor: Colors.grey,
          ),
          SizedBox(height: 16.0),
          Text(
            'Loading organizations...',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class ErrorWidget extends StatelessWidget {
  final dynamic error;

  ErrorWidget({required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Error: $error'),
    );
  }
}

