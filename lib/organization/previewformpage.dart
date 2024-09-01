// PreviewFormPage.dart

import 'package:flutter/material.dart';

class PreviewFormPage extends StatelessWidget {
  // final String formName;
  final List<String> formFields;
  final List<String> formFieldsAnswerTypes;

  PreviewFormPage({
    // required this.formName,
    required this.formFields,
    required this.formFieldsAnswerTypes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preview Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Text(
            //   'Form Name: $formName',
            //   style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            // ),
            SizedBox(height: 16.0),
            for (int i = 0; i < formFields.length; i++)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Field ${i + 1}: ${formFields[i]}',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Answer Type: ${formFieldsAnswerTypes[i]}',
                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
