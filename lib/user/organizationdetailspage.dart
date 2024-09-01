import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appoiter/appointmentform.dart';

class OrganizationDetailsPage extends StatefulWidget {
  final String email;
  final String organizationName;

  OrganizationDetailsPage({
    required this.email,
    required this.organizationName,
  });

  @override
  _OrganizationDetailsPageState createState() =>
      _OrganizationDetailsPageState();
}

class _OrganizationDetailsPageState extends State<OrganizationDetailsPage> {
  bool isFavorite = false;
  late String organizationId = ''; // Initialize with an empty string
  late List<Map<String, dynamic>> counselorList = [];
  late List<String> counselorDocumentIds = []; // Declare it here
  int counselorsCount = 0; // Declare and initialize counselorsCount

  @override
  void initState() {
    super.initState();
    getOrganizationId();
    //checkFavoriteStatus();
  }

  Future<void> getOrganizationId() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('organizations')
        .where('name', isEqualTo: widget.organizationName)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      setState(() {
        organizationId = querySnapshot.docs.first.id;
        // Call fetchCounselors only when organizationId is not empty
        if (organizationId.isNotEmpty) {
          fetchCounselors();
          checkFavoriteStatus();
        } else {
          print('Organization ID is empty!');
        }
      });
    } else {
      print('Organization ID not found!');
    }
  }

  Future<void> checkFavoriteStatus() async {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.email)
        .get();

    Map<String, dynamic>? userData =
    userDoc.data() as Map<String, dynamic>?;

    // Check if the user document exists and contains the 'favorites' field
    if (userData != null && userData.containsKey('favorites')) {
      // Extract the 'favorites' field from userData
      List<dynamic>? favorites = userData['favorites'];

      // Check if the 'favorites' field is not null and contains organizationId
      if (favorites != null && favorites.contains(organizationId)) {
        setState(() {
          isFavorite = true;
        });
        print('Organization is marked as a favorite!');
      }
    } else {
      print('User document or favorites field not found!');
    }
  }

  Future<void> fetchCounselors() async {
    try {
      if (organizationId.isNotEmpty) {
        QuerySnapshot orgSnapshot = await FirebaseFirestore.instance
            .collection('organizations')
            .where('name', isEqualTo: widget.organizationName)
            .get();

        if (orgSnapshot.docs.isNotEmpty) {
          String orgDocumentId = orgSnapshot.docs.first.id;

          QuerySnapshot counselorsSnapshot = await FirebaseFirestore.instance
              .collection('counselors')
              .where('orgemail', isEqualTo: orgDocumentId)
              .get();

          setState(() {
            counselorList = counselorsSnapshot.docs
                .map<Map<String, dynamic>>((doc) => doc.data() as Map<String, dynamic>)
                .toList();
            counselorDocumentIds =
                counselorsSnapshot.docs.map((doc) => doc.id).toList();
            counselorsCount = counselorList.length; // Update counselorsCount
          });
        } else {
          print('Organization not found!');
        }
      } else {
        print('Organization ID is empty. Cannot fetch counselors.');
      }
    } catch (e) {
      print('Error fetching counselors: $e');
    }
  }

  Future<Map<String, dynamic>?> fetchOrganizationDetails(
      String organizationId) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('organizations')
        .doc(organizationId)
        .get();

    if (snapshot.exists) {
      return snapshot.data();
    } else {
      print('Organization details not found!');
      return null;
    }
  }

  Future<void> toggleFavoriteStatus() async {
    CollectionReference users =
    FirebaseFirestore.instance.collection('users');
    CollectionReference organizations =
    FirebaseFirestore.instance.collection('organizations');

    setState(() {
      isFavorite = !isFavorite;
    });

    if (isFavorite) {
      // Update user's document with organization ID in the favorites array
      await users.doc(widget.email).update({
        'favorites': FieldValue.arrayUnion([organizationId]),
      });

      // Update organization's document with user email in the users array
      await organizations.doc(organizationId).update({
        'users': FieldValue.arrayUnion([widget.email]),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Added to favorites!'),
        ),
      );
    } else {
      // Remove organization ID from the user's favorites array
      await users.doc(widget.email).update({
        'favorites': FieldValue.arrayRemove([organizationId]),
      });

      // Remove user email from the organization's users array
      await organizations.doc(organizationId).update({
        'users': FieldValue.arrayRemove([widget.email]),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Removed from favorites!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF255B78),
        title: Text(
          'Organization Details',
        ),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.white,
            ),
            onPressed: () {
              toggleFavoriteStatus();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppointmentForm(
                        email: widget.email,
                        orgemail: organizationId,
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFF255B78),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add, color: Colors.white),
                      SizedBox(width: 5),
                      Text(
                        'Create Appointment',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                future: FirebaseFirestore.instance
                    .collection('organizations')
                    .doc(organizationId)
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (!snapshot.hasData || snapshot.data == null) {
                    return Text('Users details not found.');
                  }

                  final data = snapshot.data!.data();

                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/building.png',
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: 50.0),
                        Center(
                          child: Text(
                            'Institution Information',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                        ),

                        SizedBox(height: 16.0),
                        ProfileInfoRow(
                          label: 'Name',
                          value: data?['name'] ?? '',
                        ),
                        ProfileInfoRow(
                          label: 'Email',
                          value: organizationId,
                        ),
                        ProfileInfoRow(
                          label: 'Contact',
                          value: data?['contact'] ?? '',
                        ),
                        ProfileInfoRow(
                          label: 'Opening Time',
                          value: data?['openingTime'] ?? '',
                        ),
                        ProfileInfoRow(
                          label: 'Closing Time',
                          value: data?['closingTime'] ?? '',
                        ),
                        ProfileInfoRow(
                          label: 'No. of Counselors',
                          value: counselorsCount.toString(),
                        ),
                        // Add the Center and ElevatedButton here
                        Center(
                          child: ElevatedButton(
                            onPressed: () async {
                              List<String> counselorNames = [];

                              // Fetch counselor names
                              for (String counselorId
                              in counselorDocumentIds) {
                                DocumentSnapshot<Map<String, dynamic>>
                                counselorDoc =
                                await FirebaseFirestore.instance
                                    .collection('counselors')
                                    .doc(counselorId)
                                    .get();

                                if (counselorDoc.exists) {
                                  // Assuming the counselor document has a 'name' field
                                  String counselorName = counselorDoc
                                      .data()?['name'] ??
                                      ''; // Ensure 'data' is not null
                                  counselorNames.add(counselorName);
                                }
                              }

                              // Show dialog with counselor names
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Counselors'),
                                    content: SizedBox(
                                      width: double.maxFinite,
                                      height: 300, // Set a fixed height or use Expanded to avoid overflow
                                      child: ListView.builder(
                                        itemCount: counselorNames.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              // Handle the tap on the counselor name
                                              print(
                                                  'Tapped on ${counselorNames[index]}');
                                            },
                                            child: ListTile(
                                              title: Text(
                                                  counselorNames[index]),
                                              // You can add more content here if needed
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Close'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(
                                Color(0xFF255B78),
                              ),
                            ),
                            child: Text(
                              'View Counselors',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class ProfileInfoRow extends StatelessWidget {
  final String label;
  final String value;

  ProfileInfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 27.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14.0,
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontFamily: 'OpenSansSemibold',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

