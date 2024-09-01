// // // // import 'package:flutter/material.dart';
// // // // import 'counselornavbar.dart'; // Import the OrgNavBar widget
// // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // //
// // // // class CounselorNotificationPage extends StatefulWidget {
// // // //   final String email;
// // // //
// // // //   CounselorNotificationPage({required this.email});
// // // //
// // // //   @override
// // // //   State<CounselorNotificationPage> createState() => _CounselorNotificationPageState();
// // // // }
// // // //
// // // // class _CounselorNotificationPageState extends State<CounselorNotificationPage> {
// // // //   int _selectedIndex = 2; // Set the selected index to 2
// // // //
// // // //   void _handleTabChange(int index) {
// // // //     // Use the same logic for tab change as defined in CounselorNavBar
// // // //     setState(() {
// // // //       _selectedIndex = index;
// // // //     });
// // // //     CounselorNavBar.navigateToPage(context, index, widget.email);
// // // //   }
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text('Counselor Notifications'),
// // // //       ),
// // // //       body: Column(
// // // //         children: [
// // // //           Expanded(
// // // //             child: Center(
// // // //               child: Column(
// // // //                 mainAxisAlignment: MainAxisAlignment.center,
// // // //                 children: <Widget>[
// // // //                   // Add a table to display notices
// // // //                   NoticesTable(email: widget.email),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //           ),
// // // //           CounselorNavBar(
// // // //             selectedIndex: _selectedIndex,
// // // //             onTabChange: _handleTabChange,
// // // //             email: widget.email,
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // // // class NoticesTable extends StatelessWidget {
// // // //   final String email;
// // // //
// // // //   NoticesTable({required this.email});
// // // //
// // // //   Widget _buildNoticeContainer(String title, String description, DateTime timestamp) {
// // // //     return Container(
// // // //       width: 376,
// // // //       height: 139,
// // // //       margin: EdgeInsets.only(bottom: 15),
// // // //       decoration: BoxDecoration(
// // // //         color: Colors.white,
// // // //         borderRadius: BorderRadius.circular(17),
// // // //         border: Border.all(width: 1),
// // // //       ),
// // // //       child: Padding(
// // // //         padding: const EdgeInsets.all(16.0),
// // // //         child: Column(
// // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // //           children: [
// // // //             Text(
// // // //               '$title',
// // // //               style: TextStyle(fontWeight: FontWeight.bold),
// // // //             ),
// // // //             SizedBox(height: 8),
// // // //             Text('$description'),
// // // //             SizedBox(height: 8),
// // // //             Text('${timestamp.toString()}'),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
// // // //       stream: FirebaseFirestore.instance.collection('Counselors').doc(email).snapshots(),
// // // //       builder: (context, CounselorSnapshot) {
// // // //         if (CounselorSnapshot.connectionState == ConnectionState.waiting) {
// // // //           return CircularProgressIndicator();
// // // //         }
// // // //         if (CounselorSnapshot.hasError) {
// // // //           print("Firestore error: ${CounselorSnapshot.error}");
// // // //           return Text('Error: ${CounselorSnapshot.error}');
// // // //         }
// // // //
// // // //         final CounselorData = CounselorSnapshot.data?.data();
// // // //
// // // //         if (CounselorData == null || !CounselorData.containsKey('favorites') || (CounselorData['favorites'] as List).isEmpty) {
// // // //           print("No favorite organizations available.");
// // // //           return Text('No favorite organizations available.');
// // // //         }
// // // //
// // // //         List<dynamic> favoriteOrgs = CounselorData['favorites'] as List<dynamic>;
// // // //
// // // //         return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
// // // //           stream: FirebaseFirestore.instance.collection('organizations').doc(email).snapshots(),
// // // //           builder: (context, orgSnapshot) {
// // // //             if (orgSnapshot.connectionState == ConnectionState.waiting) {
// // // //               return CircularProgressIndicator();
// // // //             }
// // // //             if (orgSnapshot.hasError) {
// // // //               print("Firestore error: ${orgSnapshot.error}");
// // // //               return Text('Error: ${orgSnapshot.error}');
// // // //             }
// // // //
// // // //             final orgData = orgSnapshot.data?.data();
// // // //
// // // //             if (orgData == null || !orgData.containsKey('notices')) {
// // // //               print("No notices available.");
// // // //               return Text('No notices available.');
// // // //             }
// // // //
// // // //             List<dynamic>? notices = orgData['notices'] as List<dynamic>?;
// // // //
// // // //             if (notices == null || notices.isEmpty) {
// // // //               print("No notices available.");
// // // //               return Text('No notices available.');
// // // //             }
// // // //
// // // //             // Filter notices for favorite organizations
// // // //             notices = notices.where((notice) => favoriteOrgs.contains(notice['organizationId'])).toList();
// // // //
// // // //             // Sort notices by timestamp in descending order
// // // //             notices.sort((a, b) => (b['timestamp'] as Timestamp).compareTo(a['timestamp'] as Timestamp));
// // // //
// // // //             return SingleChildScrollView(
// // // //               child: Column(
// // // //                 children: notices.map<Widget>((notice) {
// // // //                   final title = notice['title'];
// // // //                   final description = notice['description'];
// // // //                   final timestamp = (notice['timestamp'] as Timestamp).toDate();
// // // //                   return _buildNoticeContainer(title, description, timestamp);
// // // //                 }).toList(),
// // // //               ),
// // // //             );
// // // //           },
// // // //         );
// // // //
// // // //       },
// // // //     );
// // // //   }
// // // // }
// // //
// import 'package:appoiter/counselors/displaynotificationonlypage.dart';
// import 'package:appoiter/counselors/displaynotificationpage.dart';
// import 'package:flutter/material.dart';
// import 'counselornavbar.dart'; // Import the OrgNavBar widget
// import 'package:cloud_firestore/cloud_firestore.dart';
// class CounselorNotificationPage extends StatefulWidget {
//   final String email;
//
//   CounselorNotificationPage({required this.email});
//
//   @override
//   State<CounselorNotificationPage> createState() => _CounselorNotificationPageState();
// }
//
// class _CounselorNotificationPageState extends State<CounselorNotificationPage> {
//   int _selectedIndex = 2; // Set the selected index to 2
//
//   void _handleTabChange(int index) {
//     // Use the same logic for tab change as defined in CounselorNavBar
//     setState(() {
//       _selectedIndex = index;
//     });
//     CounselorNavBar.navigateToPage(context, index, widget.email);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF255B78), // Make app bar transparent
//         title: Text(
//           'Notifications',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   // Add a table to display notices
//                   NoticesTable(email: widget.email),
//                 ],
//               ),
//             ),
//           ),
//           CounselorNavBar(
//             selectedIndex: _selectedIndex,
//             onTabChange: _handleTabChange,
//             email: widget.email,
//           ),
//         ],
//       ),
//     );
//   }
// }
// class NoticesTable extends StatefulWidget {
//   final String email;
//
//   NoticesTable({required this.email});
//
//   @override
//   State<NoticesTable> createState() => _NoticesTableState();
// }
//
// class _NoticesTableState extends State<NoticesTable> {
//   late List<bool> isTappedList; // Maintain a list to track tapped state for each notice
//   late Stream<List<Map<String, dynamic>>?> _noticesStream;
//
//   @override
//   void initState() {
//     super.initState();
//     isTappedList = List.filled(10, false); // Initialize with the number of notices
//     _noticesStream = FirebaseFirestore.instance
//         .collection('counselors')
//         .doc(widget.email)
//         .snapshots()
//         .asyncMap<List<Map<String, dynamic>>?>((snapshot) async {
//       if (!snapshot.exists || !snapshot.data()!.containsKey('orgemail')) {
//         return null;
//       }
//       final orgEmail = snapshot.data()!['orgemail'];
//       if (orgEmail == null || orgEmail.isEmpty) {
//         return null;
//       }
//       final orgSnapshot = await FirebaseFirestore.instance
//           .collection('organizations')
//           .doc(orgEmail)
//           .get();
//       if (!orgSnapshot.exists || !orgSnapshot.data()!.containsKey('notices')) {
//         return null;
//       }
//       return (orgSnapshot.data()!['notices'] as List<dynamic>?)
//           ?.cast<Map<String, dynamic>>();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<List<Map<String, dynamic>>?>(
//       stream: _noticesStream,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         }
//         if (snapshot.hasError || !snapshot.hasData || snapshot.data == null) {
//           return Text('Error fetching notices');
//         }
//
//         final notices = snapshot.data!;
//         if (notices.isEmpty) {
//           return Text('No notices available.');
//         }
//
//         return Column(
//           children: [
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.8, // Adjust the height as needed
//               child: ListView.builder(
//                 padding:  const EdgeInsets.all(16.0),
//                 itemCount: notices.length,
//                 itemBuilder: (context, index) {
//                   final notice = notices[index];
//                   final title = notice['title'];
//                   final description = notice['description'];
//                   final timestamp =
//                   (notice['timestamp'] as Timestamp).toDate();
//                   final counseloremail = notice['counseloremail'];
//
//                   return GestureDetector(
//                     onTap: () {
//                     if (notice.containsKey('appointmentDocID')) {
//                       // Navigate to a page for notices with appointmentDocID
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => DisplayNotificationPage(
//                             email: widget.email,
//                             title: title,
//                             description: description,
//                             timestamp: timestamp,
//                             orgEmail: widget.email,
//                             notice: notice,
//                           ),
//                         ),
//                       );
//                     } else {
//                       // Navigate to a page for notices without appointmentDocID
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => DisplayNotificationOnlyPage(
//                             email: widget.email,
//                             title: title,
//                             description: description,
//                             timestamp: timestamp,
//                           ),
//                         ),
//                       );
//                     }
//                   },
//                     child: Container(
//                       width: 376,
//                       margin: EdgeInsets.only(bottom: 15),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(17),
//                         border: Border.all(width: 1),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               '$title',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               '${description.length > 15 ? '${description.substring(0, 15)}...' : description}',
//                             ),
//                             SizedBox(height: 8),
//                             Text('Timestamp: ${timestamp.toString()}'),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
// // import 'package:flutter/material.dart';
// // import 'counselornavbar.dart'; // Import the UserNavBar widget
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'displaynotificationpage.dart'; // Assuming this import is correct
// // import 'displaynotificationonlypage.dart';
// //
// // class CounselorNotificationPage extends StatefulWidget {
// //   final String email;
// //
// //   CounselorNotificationPage({required this.email});
// //
// //   @override
// //   State<CounselorNotificationPage> createState() => _CounselorNotificationPageState();
// // }
// //
// // class _CounselorNotificationPageState extends State<CounselorNotificationPage> {
// //   int _selectedIndex = 2; // Set the selected index to 2
// //
// //   void _handleTabChange(int index) {
// //     // Use the same logic for tab change as defined in UserNavBar
// //     setState(() {
// //       _selectedIndex = index;
// //     });
// //     CounselorNavBar.navigateToPage(context, index, widget.email);
// //   }
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     print('Current Counselor ID: ${widget.email}');
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Color(0xFF255B78), // Make app bar transparent
// //         title: Text(
// //           'Notifications',
// //         ),
// //       ),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: SingleChildScrollView(
// //               child: Column(
// //                 children: [
// //                   Center(
// //                     child: Column(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: <Widget>[
// //                         // Add a table to display notices
// //                         NoticesTable(email: widget.email),
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //           CounselorNavBar(
// //             selectedIndex: _selectedIndex,
// //             onTabChange: _handleTabChange,
// //             email: widget.email,
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // class NoticesTable extends StatefulWidget {
// //   final String email;
// //
// //   NoticesTable({required this.email});
// //
// //   @override
// //   State<NoticesTable> createState() => _NoticesTableState();
// // }
// //
// // class _NoticesTableState extends State<NoticesTable> {
// //   late List<bool> isTappedList; // Maintain a list to track tapped state for each notice
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     isTappedList = List.filled(10, false); // Initialize with the number of notices
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return StreamBuilder<QuerySnapshot>(
// //       stream: FirebaseFirestore.instance.collection('organizations').snapshots(),
// //       builder: (context, organizationsSnapshot) {
// //         if (organizationsSnapshot.connectionState == ConnectionState.waiting) {
// //           return CircularProgressIndicator();
// //         }
// //         if (organizationsSnapshot.hasError) {
// //           print("Firestore error: ${organizationsSnapshot.error}");
// //           return Text('Error: ${organizationsSnapshot.error}');
// //         }
// //
// //         final organizations = organizationsSnapshot.data?.docs;
// //
// //         if (organizations == null || organizations.isEmpty) {
// //           return Text('No organizations available.');
// //         }
// //
// //         return Column(
// //           children: organizations.map<Widget>((orgDoc) {
// //             final orgId = orgDoc.id;
// //
// //             return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
// //               stream: FirebaseFirestore.instance.collection('organizations').doc(orgId).snapshots(),
// //               builder: (context, orgSnapshot) {
// //                 if (orgSnapshot.connectionState == ConnectionState.waiting) {
// //                   return CircularProgressIndicator();
// //                 }
// //                 if (orgSnapshot.hasError) {
// //                   print("Firestore error: ${orgSnapshot.error}");
// //                   return Text('Error: ${orgSnapshot.error}');
// //                 }
// //
// //                 final orgData = orgSnapshot.data?.data();
// //
// //                 if (orgData == null || !orgData.containsKey('notices')) {
// //                   return SizedBox.shrink(); // Return an empty SizedBox instead of displaying "No notices available"
// //                 }
// //
// //                 List<dynamic>? notices = orgData['notices'];
// //
// //                 if (notices == null || notices.isEmpty) {
// //                   return SizedBox.shrink(); // Return an empty SizedBox instead of displaying "No notices available"
// //                 }
// //
// //                 List<dynamic> filteredNotices = notices.where((notice) {
// //                   if (notice.containsKey('appointmentDocID')) {
// //                     // Check if either 'counseloremail' or 'newcounseloremail' matches the counselor's email
// //                     return (notice['counseloremail'] == widget.email || notice['newCounselorEmail'] == widget.email);
// //                   }
// //                   return false;
// //                 }).toList();
// //
// //                 if (filteredNotices.isEmpty) {
// //                   return SizedBox.shrink(); // Return an empty SizedBox instead of displaying "No notices available"
// //                 }
// //
// //                 return Column(
// //                   children: _buildNotices(filteredNotices, orgData['name'] ?? 'Unknown Organization', orgId),
// //                 );
// //               },
// //             );
// //           }).toList(),
// //         );
// //       },
// //     );
// //   }
// //
// //   List<Widget> _buildNotices(List<dynamic> notices, String organizationName, String orgId) {
// //     // Sort the notices based on their timestamp
// //     notices.sort((a, b) => (b['timestamp'] as Timestamp).compareTo(a['timestamp'] as Timestamp));
// //
// //     return notices.map<Widget>((notice) {
// //       final title = notice['title'];
// //       final description = notice['description'];
// //       final timestamp = (notice['timestamp'] as Timestamp).toDate();
// //       final userEmail = notice['useremail'] ?? ''; // Ensure useremail is not null
// //
// //       return GestureDetector(
// //         onTap: () {
// //           if (notice is Map<String, dynamic> && notice.containsKey('appointmentDocID')) {
// //             Navigator.push(
// //               context,
// //               MaterialPageRoute(
// //                 builder: (context) => DisplayNotificationPage(
// //                   email: widget.email,
// //                   title: title,
// //                   description: description,
// //                   timestamp: timestamp,
// //                   orgEmail: orgId,
// //                   notice: notice,
// //                 ),
// //               ),
// //             );
// //           } else {
// //             // Not handling this case for counselors
// //           }
// //         },
// //         child: Container(
// //           width: 376,
// //           margin: EdgeInsets.only(bottom: 15),
// //           decoration: BoxDecoration(
// //             borderRadius: BorderRadius.circular(17),
// //             border: Border.all(width: 1, color: Colors.grey),
// //           ),
// //           child: Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(
// //                   '$organizationName',
// //                   style: TextStyle(fontWeight: FontWeight.bold),
// //                 ),
// //                 SizedBox(height: 8),
// //                 Text(
// //                   '$title',
// //                   style: TextStyle(fontWeight: FontWeight.bold),
// //                 ),
// //                 SizedBox(height: 8),
// //                 Text(
// //                   ' ${description.length > 30 ? '${description.substring(0, 30)}...' : description}',
// //                 ),
// //                 SizedBox(height: 8),
// //                 Text('Timestamp: ${timestamp.toString()}'),
// //               ],
// //             ),
// //           ),
// //         ),
// //       );
// //     }).toList();
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'counselornavbar.dart'; // Import the UserNavBar widget
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'displaynotificationpage.dart'; // Assuming this import is correct
// import 'displaynotificationonlypage.dart';
//
// class CounselorNotificationPage extends StatefulWidget {
//   final String email;
//
//   CounselorNotificationPage({required this.email});
//
//   @override
//   State<CounselorNotificationPage> createState() => _CounselorNotificationPageState();
// }
//
// class _CounselorNotificationPageState extends State<CounselorNotificationPage> {
//   int _selectedIndex = 2; // Set the selected index to 2
//
//   void _handleTabChange(int index) {
//     // Use the same logic for tab change as defined in UserNavBar
//     setState(() {
//       _selectedIndex = index;
//     });
//     CounselorNavBar.navigateToPage(context, index, widget.email);
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     print('Current Counselor ID: ${widget.email}');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF255B78), // Make app bar transparent
//         title: Text(
//           'Notifications',
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         // Add a table to display notices
//                         NoticesTable(email: widget.email),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           CounselorNavBar(
//             selectedIndex: _selectedIndex,
//             onTabChange: _handleTabChange,
//             email: widget.email,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class NoticesTable extends StatefulWidget {
//   final String email;
//
//   NoticesTable({required this.email});
//
//   @override
//   State<NoticesTable> createState() => _NoticesTableState();
// }
//
// class _NoticesTableState extends State<NoticesTable> {
//   late List<bool> isTappedList; // Maintain a list to track tapped state for each notice
//
//   @override
//   void initState() {
//     super.initState();
//     isTappedList = List.filled(10, false); // Initialize with the number of notices
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('organizations').snapshots(),
//       builder: (context, organizationsSnapshot) {
//         if (organizationsSnapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         }
//         if (organizationsSnapshot.hasError) {
//           print("Firestore error: ${organizationsSnapshot.error}");
//           return Text('Error: ${organizationsSnapshot.error}');
//         }
//
//         final organizations = organizationsSnapshot.data?.docs;
//
//         if (organizations == null || organizations.isEmpty) {
//           return Text('No organizations available.');
//         }
//
//         return Column(
//           children: organizations.map<Widget>((orgDoc) {
//             final orgId = orgDoc.id;
//
//             return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//               stream: FirebaseFirestore.instance.collection('organizations').doc(orgId).snapshots(),
//               builder: (context, orgSnapshot) {
//                 if (orgSnapshot.connectionState == ConnectionState.waiting) {
//                   return CircularProgressIndicator();
//                 }
//                 if (orgSnapshot.hasError) {
//                   print("Firestore error: ${orgSnapshot.error}");
//                   return Text('Error: ${orgSnapshot.error}');
//                 }
//
//                 final orgData = orgSnapshot.data?.data();
//
//                 if (orgData == null || !orgData.containsKey('notices')) {
//                   return SizedBox.shrink(); // Return an empty SizedBox instead of displaying "No notices available"
//                 }
//
//                 List<dynamic>? notices = orgData['notices'];
//
//                 if (notices == null || notices.isEmpty) {
//                   return SizedBox.shrink(); // Return an empty SizedBox instead of displaying "No notices available"
//                 }
//
//                 List<dynamic> filteredNotices = notices.where((notice) {
//                   if (notice.containsKey('appointmentDocID')) {
//                     // Check if either 'counseloremail' or 'newcounseloremail' matches the counselor's email
//                     return (notice['counseloremail'] == widget.email || notice['newCounselorEmail'] == widget.email);
//                   }
//                   return false;
//                 }).toList();
//
//                 if (filteredNotices.isEmpty) {
//                   return SizedBox.shrink(); // Return an empty SizedBox instead of displaying "No notices available"
//                 }
//
//                 return Column(
//                   children: _buildNotices(filteredNotices, orgData['name'] ?? 'Unknown Organization', orgId),
//                 );
//               },
//             );
//           }).toList(),
//         );
//       },
//     );
//   }
//
//   List<Widget> _buildOrgNotices(List<dynamic> notices, String organizationName, String counselorEmail) {
//     // Filter the notices that contain the appointmentDocID field and match the counselor's email
//     List<dynamic> filteredNoticesWithAppointment = notices.where((notice) {
//       if (notice.containsKey('appointmentDocID')) {
//         return (notice['counseloremail'] == counselorEmail || notice['newCounselorEmail'] == counselorEmail);
//       }
//       return false;
//     }).toList();
//
//     // Filter the notices to include only those that do not have the appointmentDocID field
//     List<dynamic> filteredNoticesWithoutAppointment = notices.where((notice) => !notice.containsKey('appointmentDocID')).toList();
//
//     // Combine the filtered notices
//     List<dynamic> combinedNotices = [...filteredNoticesWithAppointment, ...filteredNoticesWithoutAppointment];
//
//     // Sort the combined notices based on their timestamps
//     combinedNotices.sort((a, b) => (b['timestamp'] as Timestamp).compareTo(a['timestamp'] as Timestamp));
//
//     return combinedNotices.map<Widget>((notice) {
//       final title = notice['title'];
//       final description = notice['description'];
//       final timestamp = (notice['timestamp'] as Timestamp).toDate();
//
//       return Container(
//         width: 376,
//         margin: EdgeInsets.only(bottom: 15),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(17),
//           border: Border.all(width: 1, color: Colors.grey),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 '$organizationName',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 8),
//               Text(
//                 '$title',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 8),
//               Text(
//                 ' ${description.length > 30 ? '${description.substring(0, 30)}...' : description}',
//               ),
//               SizedBox(height: 8),
//               Text('Timestamp: ${timestamp.toString()}'),
//             ],
//           ),
//         ),
//       );
//     }).toList();
//   }
// }
// import 'package:appoiter/counselors/displaynotificationonlypage.dart';
// import 'package:appoiter/counselors/displaynotificationpage.dart';
// import 'package:flutter/material.dart';
// import 'counselornavbar.dart'; // Import the OrgNavBar widget
// import 'package:cloud_firestore/cloud_firestore.dart';
// class CounselorNotificationPage extends StatefulWidget {
//   final String email;
//
//   CounselorNotificationPage({required this.email});
//
//   @override
//   State<CounselorNotificationPage> createState() => _CounselorNotificationPageState();
// }
//
// class _CounselorNotificationPageState extends State<CounselorNotificationPage> {
//   int _selectedIndex = 2; // Set the selected index to 2
//
//   void _handleTabChange(int index) {
//     // Use the same logic for tab change as defined in CounselorNavBar
//     setState(() {
//       _selectedIndex = index;
//     });
//     CounselorNavBar.navigateToPage(context, index, widget.email);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF255B78), // Make app bar transparent
//         title: Text(
//           'Notifications',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   // Add a table to display notices
//                   NoticesTable(email: widget.email),
//                 ],
//               ),
//             ),
//           ),
//           CounselorNavBar(
//             selectedIndex: _selectedIndex,
//             onTabChange: _handleTabChange,
//             email: widget.email,
//           ),
//         ],
//       ),
//     );
//   }
// }
// class NoticesTable extends StatefulWidget {
//   final String email;
//
//   NoticesTable({required this.email});
//
//   @override
//   State<NoticesTable> createState() => _NoticesTableState();
// }
//
// class _NoticesTableState extends State<NoticesTable> {
//   late List<bool> isTappedList; // Maintain a list to track tapped state for each notice
//   late Stream<List<Map<String, dynamic>>?> _noticesStream;
//
//   @override
//   void initState() {
//     super.initState();
//     isTappedList = List.filled(10, false); // Initialize with the number of notices
//     _noticesStream = FirebaseFirestore.instance
//         .collection('counselors')
//         .doc(widget.email)
//         .snapshots()
//         .asyncMap<List<Map<String, dynamic>>?>((snapshot) async {
//       if (!snapshot.exists || !snapshot.data()!.containsKey('orgemail')) {
//         return null;
//       }
//       final orgEmail = snapshot.data()!['orgemail'];
//       if (orgEmail == null || orgEmail.isEmpty) {
//         return null;
//       }
//       final orgSnapshot = await FirebaseFirestore.instance
//           .collection('organizations')
//           .doc(orgEmail)
//           .get();
//       final orgName = orgSnapshot.data()!['name']; // Retrieve org name
//       if (!orgSnapshot.exists || !orgSnapshot.data()!.containsKey('notices')) {
//         return null;
//       }
//       return (orgSnapshot.data()!['notices'] as List<dynamic>?)
//           ?.cast<Map<String, dynamic>>();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<List<Map<String, dynamic>>?>(
//       stream: _noticesStream,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         }
//         if (snapshot.hasError || !snapshot.hasData || snapshot.data == null) {
//           return Text('Error fetching notices');
//         }
//
//         final notices = snapshot.data!;
//         if (notices.isEmpty) {
//           return Text('No notices available.');
//         }
//
//         return Column(
//           children: [
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.8, // Adjust the height as needed
//               child: ListView.builder(
//                 padding:  const EdgeInsets.all(16.0),
//                 itemCount: notices.length,
//                 itemBuilder: (context, index) {
//                   final notice = notices[index];
//                   final title = notice['title'];
//                   final description = notice['description'];
//                   final timestamp =
//                   (notice['timestamp'] as Timestamp).toDate();
//                   final counseloremail = notice['counseloremail'];
//
//                   return GestureDetector(
//                     onTap: () {
//                       if (notice.containsKey('appointmentDocID')) {
//                         // Navigate to a page for notices with appointmentDocID
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => DisplayNotificationPage(
//                               email: widget.email,
//                               title: title,
//                               description: description,
//                               timestamp: timestamp,
//                               orgEmail: widget.email,
//                               notice: notice,
//                             ),
//                           ),
//                         );
//                       } else {
//                         // Navigate to a page for notices without appointmentDocID
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => DisplayNotificationOnlyPage(
//                               email: widget.email,
//                               orgname: orgname, // Pass orgname parameter
//                               title: title,
//                               description: description,
//                               timestamp: timestamp,
//                             ),
//                           ),
//                         );
//                       }
//                     },
//                     child: Container(
//                       width: 376,
//                       margin: EdgeInsets.only(bottom: 15),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(17),
//                         border: Border.all(width: 1),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               '$title',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               '${description.length > 15 ? '${description.substring(0, 15)}...' : description}',
//                             ),
//                             SizedBox(height: 8),
//                             Text('Timestamp: ${timestamp.toString()}'),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
import 'package:appoiter/counselors/displaynotificationonlypage.dart';
import 'package:appoiter/counselors/displaynotificationpage.dart';
import 'package:flutter/material.dart';
import 'counselornavbar.dart'; // Import the OrgNavBar widget
import 'package:cloud_firestore/cloud_firestore.dart';
class CounselorNotificationPage extends StatefulWidget {
  final String email;

  CounselorNotificationPage({required this.email});

  @override
  State<CounselorNotificationPage> createState() => _CounselorNotificationPageState();
}

class _CounselorNotificationPageState extends State<CounselorNotificationPage> {
  int _selectedIndex = 2; // Set the selected index to 2

  void _handleTabChange(int index) {
    // Use the same logic for tab change as defined in CounselorNavBar
    setState(() {
      _selectedIndex = index;
    });
    CounselorNavBar.navigateToPage(context, index, widget.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF255B78), // Make app bar transparent
        title: Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Add a table to display notices
                  NoticesTable(email: widget.email),
                ],
              ),
            ),
          ),
          CounselorNavBar(
            selectedIndex: _selectedIndex,
            onTabChange: _handleTabChange,
            email: widget.email,
          ),
        ],
      ),
    );
  }
}
class NoticesTable extends StatefulWidget {
  final String email;

  NoticesTable({required this.email});

  @override
  State<NoticesTable> createState() => _NoticesTableState();
}

class _NoticesTableState extends State<NoticesTable> {
  late List<bool> isTappedList; // Maintain a list to track tapped state for each notice
  late Stream<List<Map<String, dynamic>>?> _noticesStream;

  @override
  void initState() {
    super.initState();
    isTappedList = List.filled(10, false); // Initialize with the number of notices
    _noticesStream = FirebaseFirestore.instance
        .collection('counselors')
        .doc(widget.email)
        .snapshots()
        .asyncMap<List<Map<String, dynamic>>?>((snapshot) async {
      if (!snapshot.exists || !snapshot.data()!.containsKey('orgemail')) {
        return null;
      }
      final orgEmail = snapshot.data()!['orgemail'];
      if (orgEmail == null || orgEmail.isEmpty) {
        return null;
      }
      final orgSnapshot = await FirebaseFirestore.instance
          .collection('organizations')
          .doc(orgEmail)
          .get();
      final orgName = orgSnapshot.data()!['name']; // Retrieve org name
      if (!orgSnapshot.exists || !orgSnapshot.data()!.containsKey('notices')) {
        return null;
      }
      return (orgSnapshot.data()!['notices'] as List<dynamic>?)
          ?.cast<Map<String, dynamic>>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Map<String, dynamic>>?>(
      stream: _noticesStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError || !snapshot.hasData || snapshot.data == null) {
          return Text('Error fetching notices');
        }

        final notices = snapshot.data!;
        if (notices.isEmpty) {
          return Text('No notices available.');
        }

        return Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8, // Adjust the height as needed
              child: ListView.builder(
                padding:  const EdgeInsets.all(16.0),
                itemCount: notices.length,
                itemBuilder: (context, index) {
                  final notice = notices[index];
                  final title = notice['title'];
                  final description = notice['description'];
                  final timestamp =
                  (notice['timestamp'] as Timestamp).toDate();
                  final counseloremail = notice['counseloremail'];

                  return GestureDetector(
                    onTap: () {
                      if (notice.containsKey('appointmentDocID')) {
                        // Navigate to a page for notices with appointmentDocID
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DisplayNotificationPage(
                              email: widget.email,
                              title: title,
                              description: description,
                              timestamp: timestamp,
                              orgEmail: widget.email,
                              notice: notice,
                            ),
                          ),
                        );
                      } else {
                        // Navigate to a page for notices without appointmentDocID
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DisplayNotificationOnlyPage(
                              email: widget.email, // Pass orgname parameter
                              title: title,
                              description: description,
                              timestamp: timestamp,
                            ),
                          ),
                        );
                      }
                    },
                    child: Container(
                      width: 376,
                      margin: EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        color: Color(0xFAFAFAFA),
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$title',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '${description.length > 15 ? '${description.substring(0, 15)}...' : description}',
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '${timestamp.toString()}',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 11,
                                fontStyle: FontStyle.italic,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
