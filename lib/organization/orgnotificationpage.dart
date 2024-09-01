import 'package:appoiter/organization/displaynotificationonlypage.dart';
import 'package:appoiter/organization/displaynotificationpage.dart';
import 'package:flutter/material.dart';
import 'orgnavbar.dart'; // Import the OrgNavBar widget
import 'createnotice.dart'; // Import the CreateNotice page
import 'package:cloud_firestore/cloud_firestore.dart';

class OrgNotificationPage extends StatefulWidget {
  final String email;

  OrgNotificationPage({required this.email});

  @override
  State<OrgNotificationPage> createState() => _OrgNotificationPageState();
}

class _OrgNotificationPageState extends State<OrgNotificationPage> {
  int _selectedIndex = 2; // Set the selected index to 2

  void _handleTabChange(int index) {
    // Use the same logic for tab change as defined in OrgNavBar
    setState(() {
      _selectedIndex = index;
    });
    OrgNavBar.navigateToPage(context, index, widget.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF255B78),
        // Make app bar transparent
        elevation: 0,
        // Remove shadow
        automaticallyImplyLeading: true,
        // Let the AppBar handle the back button automatically
        title: Text(
          'Notice',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
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
          Positioned(
            bottom: 20, // Move the button up by 100 pixels from the bottom
            right: 20, // Adjust the position 50 pixels from the right
            child: FloatingActionButton(
              onPressed: () {
                // Navigate to the CreateNoticePage when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateNotice(email: widget.email),
                  ),
                );
              },
              child: Image.asset(
                'assets/addnotice.png',
                height: 40,
              ),
              backgroundColor: Color(0xFF255B78), // Set the background color
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
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('organizations').doc(widget.email).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          print("Firestore error: ${snapshot.error}");
          return Text('Error: ${snapshot.error}');
        }

        final userData = snapshot.data?.data();

        if (userData == null || !userData.containsKey('notices')) {
          print("No notices available.");
          return Text('No notices available.');
        }

        List<Map<String, dynamic>>? notices = (userData['notices'] as List<dynamic>?)?.cast<Map<String, dynamic>>();

        if (notices == null || notices.isEmpty) {
          print("No notices available.");
          return Text('No notices available.');
        }

        notices = notices.reversed.toList(); // Reverse the order of notices to display the latest on top

        final orgname = userData['name']; // Assuming 'name' is the field for organization name in the Firestore document

        return Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8, // Adjust the height as needed

              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16), // Add horizontal padding
                itemCount: notices.length,
                itemBuilder: (context, index) {
                  final notice = notices![index];
                  final title = notice['title'];
                  final description = notice['description'];
                  final timestamp = (notice['timestamp'] as Timestamp).toDate();
                  final counseloremail = notice['counseloremail']; // Extract counseloremail from the notice

                  return GestureDetector(
                    onTap: () {
                      if (notice.containsKey('appointmentDocID')) {
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
                              orgname: orgname, // Pass orgname parameter
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
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '${description.length > 30 ? '${description.substring(0, 30)}...' : description}',
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(height: 8),
                            Text( '${timestamp.toString()}',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 11,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
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
