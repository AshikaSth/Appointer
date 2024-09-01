// // import 'package:flutter/material.dart';
// // import 'orgnavbar.dart'; // Import the OrgNavBar widget
// //
// // class CounselorDetailsPage extends StatefulWidget {
// //   final String email;
// //
// //   CounselorDetailsPage({required this.email});
// //
// //   @override
// //   State<CounselorDetailsPage> createState() => _CounselorDetailsPageState();
// // }
// //
// // class _CounselorDetailsPageState extends State<CounselorDetailsPage> {
// //   int _selectedIndex = 1;
// //
// //
// //   void _handleTabChange(int index) {
// //     // Use the same logic for tab change as defined in OrgNavBar
// //     setState(() {
// //       _selectedIndex = index;
// //     });
// //     OrgNavBar.navigateToPage(context, index, widget.email);
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Counselor Detail'),
// //       ),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: Center(
// //               child: Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: <Widget>[
// //                   Text(
// //                     'Email: ${widget.email}',
// //                     style: TextStyle(fontSize: 20),
// //                   ),
// //                   // Add other content specific to the Organization's home page here
// //                 ],
// //               ),
// //             ),
// //           ),
// //           OrgNavBar(
// //             selectedIndex: _selectedIndex,
// //             onTabChange: _handleTabChange,
// //             email: widget.email,
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'orgnavbar.dart'; // Import the OrgNavBar widget
// import 'addcounselor.dart'; // Import your AddCounselorPage widget
//
// class CounselorDetailsPage extends StatefulWidget {
//   final String email;
//
//   CounselorDetailsPage({required this.email});
//
//   @override
//   State<CounselorDetailsPage> createState() => _CounselorDetailsPageState();
// }
//
// class _CounselorDetailsPageState extends State<CounselorDetailsPage> {
//   int _selectedIndex = 1;
//
//   void _handleTabChange(int index) {
//     // Use the same logic for tab change as defined in OrgNavBar
//     setState(() {
//       _selectedIndex = index;
//     });
//     OrgNavBar.navigateToPage(context, index, widget.email);
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Counselor Detail'),
//       ),
//       body: Column(
//         children: [
//           // Container(
//           //   width: double.infinity,
//           //   height: MediaQuery.of(context).size.height * 0.15, // Adjust the percentage as needed
//           //   color: Colors.white, // Set the background color to white
//           //   child: Center(
//           //     child: Text(
//           //       '+',
//           //       style: TextStyle(
//           //         fontSize: 40, // Adjust the font size as needed
//           //       ),
//           //     ),
//           //   ),
//           // ),
//           Container(
//             width: double.infinity,
//             height: MediaQuery.of(context).size.height * 0.12, // Adjust the percentage as needed
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.white, // Set the background color to white
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(5.0), // Adjust the border radius as needed
//                 ),
//               ),
//               onPressed: () {
//                 // Handle the button press here
//                 Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddCounselorPage(email: widget.email)));
//               },
//               child: Text(
//                 '+',
//                 style: TextStyle(
//                   fontSize: 40, // Adjust the font size as needed
//                   color: Colors.black, // Text color
//                 ),
//               ),
//             ),
//           ),
//
//           Expanded(
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     'Email: ${widget.email}',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                   // Add other content specific to the Counselor's details here
//                 ],
//               ),
//             ),
//           ),
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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'counselorpage.dart';
import 'orgnavbar.dart'; // Import the OrgNavBar widget
import 'addcounselor.dart'; // Import your AddCounselorPage widget

class CounselorDetailsPage extends StatefulWidget {
  final String email;


  CounselorDetailsPage({required this.email});

  @override
  State<CounselorDetailsPage> createState() => _CounselorDetailsPageState();
}

class _CounselorDetailsPageState extends State<CounselorDetailsPage> {
  int _selectedIndex = 1;
  TextEditingController _searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF255B78), // Make app bar transparent
        title: Text(
          'Counselor Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.12,
            child:Padding(
              padding: EdgeInsets.symmetric(horizontal: 20), // Add horizontal padding
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddCounselorPage(email: widget.email)));
                },
                child: Center( // Wrap the Row with Center
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Align the content horizontally at the center
                    children: [
                      Icon(
                        Icons.person_add,
                        color: Color(0xFF255B78),
                      ),
                      SizedBox(width: 8), // Add spacing between the icon and text
                      Text(
                        'Add Counselors',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF255B78),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ),
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              // You'll need to define _searchController
              controller: _searchController,


              onChanged: (String? query) {
                if (query != null) {
                  searchCounselors(query, widget.email);
                }
              },
              decoration: InputDecoration(
                labelText: 'Search for Counselors',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<String>>(
              future: getAllCounselorNames(widget.email),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LoadingWidget(); // Widget for the loading state
                } else if (snapshot.hasError) {
                  return ErrorWidget(error: snapshot.error); // Widget for the error state
                } else {
                  List<String>? counselorNames = snapshot.data;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: counselorNames?.length ?? 0,
                    itemBuilder: (context, index) {
                      String counselorName = counselorNames?[index] ?? '';
                      return ListTile(
                        title: Text(
                          counselorName,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CounselorPage(
                                email: widget.email,
                                counselorName: counselorName,

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
        ],
      ),
      bottomNavigationBar: OrgNavBar(
        selectedIndex: _selectedIndex,
        onTabChange: _handleTabChange,
        email: widget.email,
      ),
    );
  }

  void _handleTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
    OrgNavBar.navigateToPage(context, index, widget.email);
  }
}

// Define your searchCounselors and getAllCounselorNames functions, along with LoadingWidget and ErrorWidget if not already defined
// Function to search counselors based on query and orgEmail
void searchCounselors(String query, String orgEmail) {
  FirebaseFirestore.instance
      .collection('counselors')
      .where('orgemail', isEqualTo: orgEmail)
      .where('name', isGreaterThanOrEqualTo: query)
      .where('name', isLessThan: query + 'z')
      .get()
      .then((QuerySnapshot querySnapshot) {
    List<String> results = [];
    querySnapshot.docs.forEach((doc) {
      results.add(doc['name']);
    });

    // Handle the results as needed
    // setState(() {
    //   _counselors = results;
    // });
  });
}

// Function to get all counselor names for a specific organization (orgEmail)
Future<List<String>> getAllCounselorNames(String orgEmail) async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('counselors')
      .where('orgemail', isEqualTo: orgEmail)
      .get();

  List<String> counselorNames = [];

  querySnapshot.docs.forEach((doc) {
    counselorNames.add(doc['name']);
  });

  return counselorNames;
}

// LoadingWidget for the loading state
class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

// ErrorWidget for the error state
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
