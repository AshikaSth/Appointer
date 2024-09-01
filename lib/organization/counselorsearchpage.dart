import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'counselorpage.dart';

class CounselorSearchPage extends StatefulWidget {
  final String email;

  CounselorSearchPage({required this.email});

  @override
  State<CounselorSearchPage> createState() => _CounselorSearchPageState();
}

class _CounselorSearchPageState extends State<CounselorSearchPage> {
  int _selectedIndex = 1;
  final TextEditingController _searchController = TextEditingController();
  List<String> _counselors = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counselor Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: (String? query) {
                if (query != null && query.length > 0) {
                  searchCounselors(query);
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
              future: getAllCounselorNames(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LoadingWidget();
                } else if (snapshot.hasError) {
                  return ErrorWidget(error: snapshot.error);
                } else {
                  List<String>? counselorNames = snapshot.data;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: counselorNames?.length ?? 0,
                    itemBuilder: (context, index) {
                      String counselorName = counselorNames?[index] ?? '';

                      return ListTile(
                        title: Text(counselorName),
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
    );
  }

  void searchCounselors(String query) {
    FirebaseFirestore.instance
        .collection('organizations')
        .where('counselorField', isEqualTo: query) // Update 'counselorField' as per your Firestore field name
        .get()
        .then((QuerySnapshot querySnapshot) {
      List<String> counselorIds = [];
      querySnapshot.docs.forEach((doc) {
        counselorIds.add(doc.id);
      });

      retrieveCounselorNames(counselorIds);
    });
  }

  Future<void> retrieveCounselorNames(List<String> counselorIds) async {
    List<String> counselorNames = [];

    for (String counselorId in counselorIds) {
      DocumentSnapshot counselorSnapshot = await FirebaseFirestore.instance
          .collection('counselors')
          .doc(counselorId)
          .get();

      if (counselorSnapshot.exists) {
        Map<String, dynamic>? counselorData =
        counselorSnapshot.data() as Map<String, dynamic>?;

        if (counselorData != null && counselorData.containsKey('name')) {
          String? counselorName = counselorData['name'];
          if (counselorName != null) {
            counselorNames.add(counselorName);
          }
        }
      }
    }

    setState(() {
      _counselors = counselorNames;
    });
  }



  Future<List<String>> getAllCounselorNames() async {
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('organizations').get();

    List<String> counselorNames = [];

    querySnapshot.docs.forEach((doc) {
      List<dynamic> counselors = doc['counselors'];
      counselorNames.addAll(counselors
          .whereType<String>()
          .map((counselor) => counselor.toString()));
    });

    return counselorNames;
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
            'Loading counselors...',
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
