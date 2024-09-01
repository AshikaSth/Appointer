import 'package:flutter/material.dart';
import 'usernavbar.dart'; // Import the UserNavBar widget
import 'package:cloud_firestore/cloud_firestore.dart';
import 'displaynotificationpage.dart'; // Assuming this import is correct
import 'displaynotificationonlypage.dart';

class UserNotificationPage extends StatefulWidget {
  final String email;

  UserNotificationPage({required this.email});

  @override
  State<UserNotificationPage> createState() => _UserNotificationPageState();
}

class _UserNotificationPageState extends State<UserNotificationPage> {
  int _selectedIndex = 2; // Set the selected index to 2

  void _handleTabChange(int index) {
    // Use the same logic for tab change as defined in UserNavBar
    setState(() {
      _selectedIndex = index;
    });
    UserNavBar.navigateToPage(context, index, widget.email);
  }

  @override
  void initState() {
    super.initState();
    print('Current User ID: ${widget.email}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF255B78), // Make app bar transparent
        title: Text(
          'Notifications',
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // Add a table to display notices
                        NoticesTable(email: widget.email),
                      ],
                    ),
                  ),
                ],
              ),
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
}
class NoticesTable extends StatefulWidget {
  final String email;

  NoticesTable({required this.email});

  @override
  State<NoticesTable> createState() => _NoticesTableState();
}

class _NoticesTableState extends State<NoticesTable> {
  late List<bool> isTappedList; // Maintain a list to track tapped state for each notice

  @override
  void initState() {
    super.initState();
    isTappedList = List.filled(10, false); // Initialize with the number of notices
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('organizations').snapshots(),
      builder: (context, organizationsSnapshot) {
        if (organizationsSnapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (organizationsSnapshot.hasError) {
          print("Firestore error: ${organizationsSnapshot.error}");
          return Text('Error: ${organizationsSnapshot.error}');
        }

        final organizations = organizationsSnapshot.data?.docs;

        if (organizations == null || organizations.isEmpty) {
          return Text('No organizations available.');
        }

        return Column(
          children: organizations.map<Widget>((orgDoc) {
            final orgId = orgDoc.id;

            return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance.collection('organizations').doc(orgId).snapshots(),
              builder: (context, orgSnapshot) {
                if (orgSnapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (orgSnapshot.hasError) {
                  print("Firestore error: ${orgSnapshot.error}");
                  return Text('Error: ${orgSnapshot.error}');
                }

                final orgData = orgSnapshot.data?.data();

                if (orgData == null || !orgData.containsKey('notices')) {
                  return SizedBox.shrink(); // Return an empty SizedBox instead of displaying "No notices available"
                }

                List<dynamic>? notices = orgData['notices'];

                if (notices == null || notices.isEmpty) {
                  return SizedBox.shrink(); // Return an empty SizedBox instead of displaying "No notices available"
                }

                List<dynamic> filteredNotices = notices.where((notice) {
                  // Filter notices based on user's email
                  if (notice.containsKey('appointmentDocID')) {
                    return (notice['useremail'] == widget.email);
                  } else {
                    // Check if the user's email is in the users array
                    List<dynamic> users = orgData['users'];
                    if (users != null && users.contains(widget.email)) {
                      return true;
                    }
                  }
                  return false;
                }).toList();

                if (filteredNotices.isEmpty) {
                  return SizedBox.shrink(); // Return an empty SizedBox instead of displaying "No notices available"
                }

                return Column(
                  children: _buildNotices(filteredNotices, orgData['name'] ?? 'Unknown Organization', orgId),
                );
              },
            );
          }).toList(),
        );
      },
    );
  }

  List<Widget> _buildNotices(List<dynamic> notices, String organizationName, String orgId) {
    // Sort the notices based on their timestamp
    notices.sort((a, b) => (b['timestamp'] as Timestamp).compareTo(a['timestamp'] as Timestamp));

    return notices.map<Widget>((notice) {
      final title = notice['title'];
      final description = notice['description'];
      final timestamp = (notice['timestamp'] as Timestamp).toDate();
      final counseloremail = notice['counseloremail'] ?? ''; // Ensure counseloremail is not null

      return GestureDetector(
        onTap: () {
          if (notice is Map<String, dynamic> && notice.containsKey('appointmentDocID')) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DisplayNotificationPage(
                  email: widget.email,
                  title: title,
                  description: description,
                  timestamp: timestamp,
                  orgEmail: orgId,
                  notice: notice,
                  counseloremail: counseloremail,
                ),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DisplayNotificationOnlyPage(
                  email: widget.email,
                  title: title,
                  description: description,
                  timestamp: timestamp,
                  orgname: organizationName,
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
                  '$organizationName',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  '$title',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                SizedBox(height: 8),
                Text(
                  '${description.length > 30 ? '${description.substring(0, 30)}...' : description}',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: 8),
                Text(
                  '${timestamp.toString()}',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                    fontStyle: FontStyle.italic,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }).toList();
  }
}

