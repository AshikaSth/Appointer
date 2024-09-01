import 'package:appoiter/organization/orgnotificationpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreateNotice extends StatefulWidget {
  final String email;

  CreateNotice({required this.email});

  @override
  _CreateNoticeState createState() => _CreateNoticeState();
}

class _CreateNoticeState extends State<CreateNotice> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // Store the preview data
  String? previewTitle;
  String? previewDescription;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Notice'),
        backgroundColor: Color(0xFF255B78),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 5,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Form is valid, update preview data
                    setState(() {
                      previewTitle = _titleController.text;
                      previewDescription = _descriptionController.text;
                    });
                    // Navigate to the preview page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PreviewPage(
                          email: widget.email,
                          title: previewTitle,
                          description: previewDescription,
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF255B78),
                ),
                child: Text('Preview'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class PreviewPage extends StatefulWidget {
  final String email;
  final String? title;
  final String? description;

  PreviewPage({
    required this.email,
    required this.title,
    required this.description,
  });

  @override
  _PreviewPageState createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  String? organizationName; // Store the organization name

  @override
  void initState() {
    super.initState();
    // Load organization name when the page is created
    loadOrganizationName();
  }

  Future<void> loadOrganizationName() async {
    // Access the Firestore collection for organizations and fetch the organization name
    try {
      final DocumentSnapshot organizationDoc = await FirebaseFirestore.instance.collection('organizations').doc(widget.email).get();
      if (organizationDoc.exists) {
        // Retrieve the organization name
        final Map<String, dynamic> organizationData = organizationDoc.data() as Map<String, dynamic>;
        organizationName = organizationData['name']; // Replace 'name' with the actual field name
        setState(() {}); // Update the widget to reflect the loaded data
      }
    } catch (e) {
      // Handle any potential errors
      print("Error loading organization name: $e");
    }
  }
  Future<void> saveDataToOrganization() async {
    try {
      final CollectionReference orgCollection = FirebaseFirestore.instance.collection('organizations');
      final DocumentReference orgDocRef = orgCollection.doc(widget.email);

      final timestamp = DateTime.now();

      final Map<String, dynamic> noticeData = {
        'title': widget.title,
        'description': widget.description,
        'timestamp': timestamp.toUtc(), // Convert the timestamp to UTC
      };

      await orgDocRef.update({
        'notices': FieldValue.arrayUnion([noticeData]),
      });

      print("Saving notice to organization...");
      print("Title: ${widget.title}, Description: ${widget.description}");
      print("Timestamp: $timestamp"); // Print the timestamp

      // Show a success message or navigate back
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Notice saved to organization'),
      ));


    } catch (e) {
  // Handle any potential errors
  print("Error saving notice: $e");
  }
}



@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preview'),
        backgroundColor: Color(0xFF255B78),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              organizationName ?? 'Loading...', // Display 'Loading...' while data is being loaded
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text('${widget.title}', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Description: ${widget.description}'),
            ElevatedButton(
              onPressed: () {
                // Call the method to save the data to the organization
                saveDataToOrganization();
                // Navigate to OrgNotificationPage after saving
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrgNotificationPage(email: widget.email),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF255B78),
              ),
              child: Text('Save'),
            ),

          ],
        ),
      ),
    );
  }
}
