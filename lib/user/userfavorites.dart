import 'package:appoiter/user/organizationdetailspage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserFavorites extends StatefulWidget {
  final String email;

  UserFavorites({required this.email});

  @override
  _UserFavoritesState createState() => _UserFavoritesState();
}

class _UserFavoritesState extends State<UserFavorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Organizations'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('users').doc(widget.email).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator(); // Loading indicator
          }

          Map<String, dynamic>? userData = (snapshot.data?.data() as Map<String, dynamic>?);

          List<String>? favorites = userData?['favorites']?.cast<String>();

          if (favorites == null || favorites.isEmpty) {
            return Center(
              child: Text('You have no favorite organizations.'),
            );
          }

          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              return FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance.collection('organizations').doc(favorites[index]).get(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return SizedBox.shrink(); // Return an empty widget while loading
                  }

                  Map<String, dynamic>? orgData = (snapshot.data?.data() as Map<String, dynamic>?);

                  if (orgData == null) {
                    return SizedBox.shrink(); // Return an empty widget if organization data is not available
                  }

                  String organizationName = orgData['name'] ?? '';

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrganizationDetailsPage(
                            email: widget.email, // Pass the user's email to the OrganizationDetailsPage
                            organizationName: organizationName, // Pass the organization name to the OrganizationDetailsPage
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        organizationName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          // You can customize the text style as needed
                        ),
                      ),
                      // Add more organization details as needed
                    ),
                  );
                },
              );
            },
          );

        },
      ),
    );
  }
}
