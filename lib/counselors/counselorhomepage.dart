// import 'package:flutter/material.dart';
// import 'counselornavbar.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class CounselorHomePage extends StatefulWidget {
//   final String email;
//
//   CounselorHomePage({required this.email});
//
//   @override
//   State<CounselorHomePage> createState() => _CounselorHomePageState();
// }
//
// class _CounselorHomePageState extends State<CounselorHomePage> {
//   int _selectedIndex = 0;
//
//   void _handleTabChange(int index) {
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
//         title: Text('Counselor Home Page'),
//       ),
//       body: Column(
//         children: [
//           Container(),
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
import 'package:appoiter/counselors/counselorappointmentspage.dart';
import 'package:appoiter/counselors/takecounseldata.dart';
import 'package:flutter/material.dart';
import 'counselornavbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:card_swiper/card_swiper.dart';

class CounselorHomePage extends StatefulWidget {
  final String email;

  CounselorHomePage({required this.email});

  @override
  State<CounselorHomePage> createState() => _CounselorHomePageState();
}

class _CounselorHomePageState extends State<CounselorHomePage> {
  int _selectedIndex = 0;
  int appointmentCount = 0;

  void _handleTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
    CounselorNavBar.navigateToPage(context, index, widget.email);
  }

  @override
  void initState() {
    super.initState();
    // Listen to changes in the Firestore collection to update the appointment count
    FirebaseFirestore.instance
        .collection('appointments')
        .where('counseloremail', isEqualTo: widget.email)
        .snapshots()
        .listen((QuerySnapshot snapshot) {
      setState(() {
        appointmentCount = snapshot.docs.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Color(0xFF255B78), // Make app bar transparent
        elevation: 0, // Remove shadow
        automaticallyImplyLeading: false, // Remove back button
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
      ),
      // appBar: AppBar(
      //   title: Text('Counselor Home Page'),
      // ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.27,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('appointments')
                      .where('counseloremail', isEqualTo: widget.email)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      // Return a loading indicator if data is not yet available
                      //return CircularProgressIndicator();
                    }

                    var appointments = snapshot.data!.docs;

                    // Check if there are no appointments
                    if (appointments.isEmpty) {
                      // Display a message indicating no appointments
                      return Center(
                        child: Text("You have booked no appointments."),
                      );
                    }

                    // If appointments are available, display them in a swiper
                    return Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        var appointment = appointments[index];
                        var appointmentDate = appointment['appointmentDate'];
                        var formattedDate = "${appointmentDate.toDate().day}/${appointmentDate.toDate().month}/${appointmentDate.toDate().year}";

                        return Card(
                          child: ListView.builder(
                            itemCount: appointments.length,
                            itemBuilder: (context, index) {
                              var appointment = appointments[index];
                              var appointmentDocID = appointment.id; // Assuming appointment document id is used for appointmentDocID
                              var formattedDate = "${appointmentDate.toDate().day}/${appointmentDate.toDate().month}/${appointmentDate.toDate().year}";
                              return Material(
                                borderRadius: BorderRadius.zero,
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TakeCounselDataPage(
                                          appointmentDocID: appointmentDocID,
                                          counseloremail: widget.email,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Card(
                                    elevation: 0.0, // Set the elevation to 0.0 to remove the shadow
                                    child: ListTile(
                                      title: Text(
                                        '\nYour Appointments',
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Text(
                                                ' Name: ',
                                                style: TextStyle(color: Colors.black, fontSize: 12),
                                              ),
                                              Text(
                                                '${appointment['name']}',
                                                style: TextStyle(color: Colors.black, fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5,),
                                          Row(
                                            children: [
                                              Text(
                                                ' Phone number: ',
                                                style: TextStyle(color: Colors.black, fontSize: 12),
                                              ),
                                              Text(
                                                '${appointment['phoneNumber']}',
                                                style: TextStyle(color: Colors.black, fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5,),
                                          Row(
                                            children: [
                                              Text(
                                                ' Address: ',
                                                style: TextStyle(color: Colors.black, fontSize: 12),
                                              ),
                                              Text(
                                                '${appointment['address']}',
                                                style: TextStyle(color: Colors.black, fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5,),
                                          Row(
                                            children: [
                                              Text(
                                                ' Date: ',
                                                style: TextStyle(color: Colors.black, fontSize: 12),
                                              ),
                                              Text(
                                                '$formattedDate',
                                                style: TextStyle(color: Colors.black, fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5,),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );

                            },
                          ),

                          // child: ListTile(
                          //   title: Text(
                          //     '\n Name: ${appointment['name']}',
                          //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          //   ),
                          //   subtitle: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       SizedBox(height: 10),
                          //       Row(
                          //         children: [
                          //           Text(
                          //             ' Phone number: ',
                          //             style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 12),
                          //           ),
                          //           Text(
                          //             '${appointment['phoneNumber']}',
                          //             style: TextStyle(color: Colors.black, fontSize: 12),
                          //           ),
                          //         ],
                          //       ),
                          //       Row(
                          //         children: [
                          //           Text(
                          //             ' Address: ',
                          //             style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 12),
                          //           ),
                          //           Text(
                          //             '${appointment['address']}',
                          //             style: TextStyle(color: Colors.black, fontSize: 12),
                          //           ),
                          //         ],
                          //       ),
                          //       Row(
                          //         children: [
                          //           Text(
                          //             ' Date: ',
                          //             style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 12),
                          //           ),
                          //           Text(
                          //             '$formattedDate',
                          //             style: TextStyle(color: Colors.black, fontSize: 12),
                          //           ),
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        );
                      },
                      itemCount: appointments.length,
                      viewportFraction: 0.8,
                      scale: 0.9,
                      pagination: SwiperPagination(),
                      control: SwiperControl(),
                    );
                  },
                ),
              ),

              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Appointment Count: $appointmentCount', // Display the appointment count
                        style: TextStyle(fontSize: 20),
                      ),
                      // Add other content specific to the Counselor's home page here
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: CounselorNavBar(
        selectedIndex: _selectedIndex,
        onTabChange: _handleTabChange,
        email: widget.email,
      ),
    );
  }
}



// import 'package:appoiter/counselors/counselorappointmentspage.dart';
// import 'package:appoiter/counselors/takecounseldata.dart';
// import 'package:flutter/material.dart';
// import 'counselornavbar.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:card_swiper/card_swiper.dart';
// class CounselorHomePage extends StatefulWidget {
//   final String email;
//
//   CounselorHomePage({required this.email});
//
//   @override
//   State<CounselorHomePage> createState() => _CounselorHomePageState();
// }
//
// class _CounselorHomePageState extends State<CounselorHomePage> {
//   int _selectedIndex = 0;
//   int appointmentCount = 0;
//
//   void _handleTabChange(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//     CounselorNavBar.navigateToPage(context, index, widget.email);
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     // Listen to changes in the Firestore collection to update the appointment count
//     FirebaseFirestore.instance
//         .collection('appointments')
//         .where('counseloremail', isEqualTo: widget.email)
//         .snapshots()
//         .listen((QuerySnapshot snapshot) {
//       setState(() {
//         appointmentCount = snapshot.docs.length;
//       });
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
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder(
//               stream: FirebaseFirestore.instance
//                   .collection('appointments')
//                   .where('counseloremail', isEqualTo: widget.email)
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//
//                 var appointments = snapshot.data!.docs;
//
//                 if (appointments.isEmpty) {
//                   return Center(
//                     child: Text("You have no appointments."),
//                   );
//                 }
//
//                 return Swiper(
//                   itemBuilder: (BuildContext context, int index) {
//                     var appointment = appointments[index];
//                     var appointmentDate = appointment['appointmentDate'];
//                     var formattedDate =
//                         "${appointmentDate.toDate().day}/${appointmentDate.toDate().month}/${appointmentDate.toDate().year}";
//
//                     return Card(
//                       child: Column(
//                         children: [
//                           ProfileInfoRow(label: 'Name', value: appointment['name']),
//                           ProfileInfoRow(label: 'Phone number', value: appointment['phoneNumber']),
//                           ProfileInfoRow(label: 'Email', value: appointment['useremail']),
//                           ProfileInfoRow(label: 'Address', value: appointment['address']),
//                           ProfileInfoRow(label: 'Date', value: formattedDate),
//                           // Add more ProfileInfoRow widgets as needed for other appointment details
//                         ],
//                       ),
//                     );
//                   },
//                   itemCount: appointments.length,
//                   viewportFraction: 0.8,
//                   scale: 0.9,
//                   pagination: SwiperPagination(),
//                   control: SwiperControl(),
//                 );
//               },
//             ),
//           ),
//           SizedBox(
//             height: 50,
//             child: Center(
//               child: Text(
//                 'Appointment Count: $appointmentCount',
//                 style: TextStyle(fontSize: 20),
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: CounselorNavBar(
//         selectedIndex: _selectedIndex,
//         onTabChange: _handleTabChange,
//         email: widget.email,
//       ),
//     );
//   }
// }
//
// class ProfileInfoRow extends StatelessWidget {
//   final String label;
//   final String value;
//
//   ProfileInfoRow({required this.label, required this.value});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 27.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               color: Colors.grey[600],
//               fontSize: 14.0,
//             ),
//           ),
//           SizedBox(width: 10.0),
//           Expanded(
//             child: Text(
//               value,
//               textAlign: TextAlign.end,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 14.0,
//                 fontFamily: 'OpenSansSemibold',
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }