import 'dart:developer';

import 'package:cv_app_task2/cv_model.dart';
import 'package:flutter/material.dart';

class EditingView extends StatefulWidget {
  final Cv cv;

  const EditingView({super.key, required this.cv});

  @override
  _EditingViewState createState() => _EditingViewState();
}

class _EditingViewState extends State<EditingView> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController slackUsernameController = TextEditingController();
  TextEditingController githubHandleController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fullNameController.text = widget.cv.fullName;
    slackUsernameController.text = widget.cv.slackUsername;
    githubHandleController.text = widget.cv.githubHandle;
    bioController.text = widget.cv.myBio;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit CV"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        color: Colors.white60,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: fullNameController,
                decoration: const InputDecoration(labelText: "Full Name"),
              ),
              TextField(
                controller: slackUsernameController,
                decoration: const InputDecoration(labelText: "Slack Username"),
              ),
              TextField(
                controller: githubHandleController,
                decoration: const InputDecoration(labelText: "GitHub Handle"),
              ),
              TextField(
                controller: bioController,
                decoration: const InputDecoration(labelText: "Bio"),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    final updatedFullName = fullNameController.text;
                    final updatedSlackUsername = slackUsernameController.text;
                    final updatedGitHubHandle = githubHandleController.text;
                    final updatedBio = bioController.text;

                    // Pass the updated text values back to the calling screen
                    final updatedCv = Cv(
                      fullName: updatedFullName,
                      slackUsername: updatedSlackUsername,
                      githubHandle: updatedGitHubHandle,
                      myBio: updatedBio,
                    );

                    Navigator.pop(
                      context,
                      updatedCv,
                    );

                    log('save button has been press');
                  },
                  child: const Text(
                    'Save Changes',
                    style: TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
