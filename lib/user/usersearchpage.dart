// // import 'package:flutter/material.dart';
// // import 'usernavbar.dart'; // Import the UserNavBar widget
// //
// // class UserSearchPage extends StatefulWidget {
// //   final String email;
// //
// //   UserSearchPage({required this.email});
// //
// //   @override
// //   State<UserSearchPage> createState() => _UserSearchPageState();
// // }
// //
// // class _UserSearchPageState extends State<UserSearchPage> {
// //   int _selectedIndex = 1;
// //
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
// //         title: Text('User Search'),
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
// //           UserNavBar(
// //             selectedIndex: _selectedIndex,
// //             onTabChange: _handleTabChange,
// //             email: widget.email,
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// // import 'package:flutter/material.dart';
// // import 'usernavbar.dart'; // Import the UserNavBar widget
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'organizationdetailspage.dart';
// //
// // class UserSearchPage extends StatefulWidget {
// //   final String email;
// //
// //   UserSearchPage({required this.email});
// //
// //   @override
// //   State<UserSearchPage> createState() => _UserSearchPageState();
// // }
// //
// // class _UserSearchPageState extends State<UserSearchPage> {
// //   int _selectedIndex = 1;
// //   final TextEditingController _searchController = TextEditingController();
// //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// //   bool _isOrganizationFound = true;
// //   List<Map<String, dynamic>> _filteredOrganizations = [];
// //   List<Map<String, dynamic>> organizationsData = [];
// //
// //
// //   void _handleTabChange(int index) {
// //     // Use the same logic for tab change as defined in UserNavBar
// //     setState(() {
// //       _selectedIndex = index;
// //     });
// //     UserNavBar.navigateToPage(context, index, widget.email);
// //   }
// //   // void _handleSearch(String query) {
// //   //   _filteredOrganizations = [];
// //   //   for (var index = 0; index < organizationsData.length; index++) {
// //   //     var organizationData = organizationsData[index];
// //   //     String orgName = organizationData['organization_name'] ?? '';
// //   //
// //   //       if (orgName.toLowerCase().contains(query.toLowerCase())) {
// //   //         _filteredOrganizations.add(organizationData);
// //   //         _isOrganizationFound = true;
// //   //       }
// //   //     }
// //   //   if (_filteredOrganizations.isEmpty) {
// //   //     _isOrganizationFound = false;
// //   //   }
// //   // }
// //   void _handleSearch(String query) {
// //     _filteredOrganizations = [];
// //     _isOrganizationFound = false; // Reset the flag before searching
// //
// //     for (var index = 0; index < organizationsData.length; index++) {
// //       var organizationData = organizationsData[index];
// //       String orgName = organizationData['organization_name'] ?? '';
// //
// //       if (orgName.toLowerCase().contains(query.toLowerCase())) {
// //         _filteredOrganizations.add(organizationData);
// //         _isOrganizationFound = true; // Set the flag only if a match is found
// //       }
// //     }
// //
// //     print("Query: $query, Found: $_isOrganizationFound");
// //
// //     // Keep this block to reset _isOrganizationFound if no match is found
// //     if (_filteredOrganizations.isEmpty) {
// //       _isOrganizationFound = false;
// //     }
// //
// //     print("After Filtering: Found: $_isOrganizationFound");
// //   }
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('User Search'),
// //       ),
// //       body: Column(
// //         children: [
// //           Center(
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: <Widget>[
// //                 Container(
// //                   width: 367,
// //                   height: 63,
// //                   child: Stack(
// //                     children: [
// //                       Align(
// //                         alignment: Alignment.centerLeft,
// //                         child: Icon(
// //                           Icons.search,
// //                           color: Colors.black,
// //                         ),
// //                       ),
// //                       Align(
// //                         alignment: Alignment.center,
// //                         child: TextField(
// //                           controller: _searchController,
// //                           onChanged: (query) {
// //                             setState(() {
// //                               _handleSearch(query);
// //                             });
// //                           },
// //                           decoration: InputDecoration(
// //                             hintText: '    Search...',
// //                             hintStyle: TextStyle(
// //                               color: Colors.black,
// //                               fontSize: 16,
// //                             ),
// //                             border: InputBorder.none,
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           Expanded(
// //             child: _isOrganizationFound
// //                 ? ListView.builder(
// //               itemCount: _filteredOrganizations.length,
// //               itemBuilder: (context, index) {
// //                 var orgData = _filteredOrganizations[index];
// //                 return ListTile(
// //                   title: Text(orgData['organization_name'] ?? ''),
// //                   onTap: () {
// //
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(
// //                           builder: (context) => OrganizationDetailsPage(orgData),
// //                         ),
// //                       );
// //                   },
// //                 );
// //               },
// //             )
// //                 : Center(child: Text('Organization not found.')),
// //           ),
// //           UserNavBar(
// //             selectedIndex: _selectedIndex,
// //             onTabChange: _handleTabChange,
// //             email: widget.email,
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:appoiter/user/organizationdetailspage.dart';
// import 'package:flutter/material.dart';
// import 'usernavbar.dart'; // Import the UserNavBar widget
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class UserSearchPage extends StatefulWidget {
//   final String email;
//
//   UserSearchPage({required this.email});
//
//   @override
//   State<UserSearchPage> createState() => _UserSearchPageState();
// }
//
// class _UserSearchPageState extends State<UserSearchPage> {
//   int _selectedIndex = 1;
//   final TextEditingController _searchController = TextEditingController();
//   List<String> _organizations = [];
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
//         title: Text('User Search'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: TextField(
//               controller: _searchController,
//               onChanged: (String? query) {
//                 if (query != null) {
//                   searchOrganizations(query);
//                 }
//               },
//               decoration: InputDecoration(
//                 labelText: 'Search for Organizations',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           Expanded(
//             child: FutureBuilder<List<String>>(
//               future: getAllOrganizationNames(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Container(
//                     padding: EdgeInsets.all(16.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         LinearProgressIndicator(
//                           valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
//                           backgroundColor: Colors.grey,
//                         ),
//                         SizedBox(height: 16.0),
//                         Text(
//                           'Loading organizations...',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       ],
//                     ),
//                   );
//                 } else if (snapshot.hasError) {
//                   return Text('Error: ${snapshot.error}');
//                 } else {
//                   List<String>? organizationNames = snapshot.data;
//
//                   return SingleChildScrollView(
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: organizationNames?.length ?? 0,
//                       itemBuilder: (context, index) {
//                         String organizationName = organizationNames?[index] ?? '';
//
//                         return ListTile(
//                           title: Text(organizationName),
//                           onTap: () {
//                             // Navigate to OrganizationDetailsPage with email and organizationName
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => OrganizationDetailsPage(
//                                   email: widget.email,
//                                   organizationName: organizationName,
//                                 ),
//                               ),
//                             );
//                           },
//                         );
//                       },
//                     ),
//                   );
//                 }
//               },
//             ),
//           ),
//
//           UserNavBar(
//             selectedIndex: _selectedIndex,
//             onTabChange: _handleTabChange,
//             email: widget.email,
//           ),
//         ],
//       ),
//     );
//   }
//
//   void searchOrganizations(String query) {
//     // Query Firestore to get organizations based on the search query
//     FirebaseFirestore.instance
//         .collection('organizations')
//         .where('name', isGreaterThanOrEqualTo: query)
//         .where('name', isLessThan: query + 'z')
//         .get()
//         .then((QuerySnapshot querySnapshot) {
//       List<String> results = [];
//       querySnapshot.docs.forEach((doc) {
//         results.add(doc['name']);
//       });
//
//       setState(() {
//         _organizations = results;
//       });
//     });
//   }
// }
//
// Future<List<String>> getAllOrganizationNames() async {
//   QuerySnapshot querySnapshot =
//   await FirebaseFirestore.instance.collection('organizations').get();
//
//   List<String> organizationNames = [];
//
//   querySnapshot.docs.forEach((doc) {
//     organizationNames.add(doc['name']);
//   });
//
//   return organizationNames;
// }
import 'package:appoiter/user/organizationdetailspage.dart';
import 'package:flutter/material.dart';
import 'usernavbar.dart'; // Import the UserNavBar widget
import 'package:cloud_firestore/cloud_firestore.dart';

class UserSearchPage extends StatefulWidget {
  final String email;

  UserSearchPage({required this.email});

  @override
  State<UserSearchPage> createState() => _UserSearchPageState();
}

class _UserSearchPageState extends State<UserSearchPage> {
  int _selectedIndex = 1;
  final TextEditingController _searchController = TextEditingController();
  List<String> _organizations = [];

  void _handleTabChange(int index) {
    // Use the same logic for tab change as defined in UserNavBar
    setState(() {
      _selectedIndex = index;
    });
    UserNavBar.navigateToPage(context, index, widget.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Color(0xFF255B78), // Make app bar transparent
        elevation: 0, // Remove shadow
        automaticallyImplyLeading: true, // Let the AppBar handle the back button automatically

        title: Text(
          'Search',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Padding(
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
          Expanded(
            child: FutureBuilder<List<String>>(
              future: getAllOrganizationNames(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LoadingWidget(); // Widget for the loading state
                } else if (snapshot.hasError) {
                  return ErrorWidget(error: snapshot.error); // Widget for the error state
                } else {
                  List<String>? organizationNames = snapshot.data;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: organizationNames?.length ?? 0,
                    itemBuilder: (context, index) {
                      String organizationName = organizationNames?[index] ?? '';

                      return ListTile(
                        title: Text(organizationName),
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