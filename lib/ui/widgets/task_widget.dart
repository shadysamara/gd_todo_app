import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:todo_ui/models/task.dart';
import 'package:todo_ui/providers/database_provider.dart';
import 'package:todo_ui/providers/todo_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class TaskWidget extends StatelessWidget {
  Task task;

  TaskWidget(this.task);
  launchNormalUrl(String url) {
    launch(url);
  }

  launchCall(String mobileNumber) async {
    if (await canLaunch(mobileNumber)) {
      launch(mobileNumber);
    }
  }

  sendSMS(String mobileNumber) {
    launch(mobileNumber);
  }

  sendEmail(String emailAddress) {
    launch(emailAddress);
  }

  openWhatsappChat(String mobileNumber) {
    launch(mobileNumber);
  }

  openInstegramPage(String pageTitle) {
    launch(pageTitle);
  }

  void shareTask() {
    Share.share(task.title +
        ' ' +
        (task.isComplete ? 'is complete' : 'is not complete yet'));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: CheckboxListTile(
            value: task.isComplete,
            onChanged: (value) {
              Provider.of<DatabaseProvider>(context, listen: false)
                  .updateTask(task);
            },
            secondary: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () async {
                    // shareTask();
                    // launchNormalUrl('https://pub.dev/packages/url_launcher');
                    // launchCall('tel:+1 555 010 999');
                    // sendSMS('sms:5550101234');
                    // sendEmail(
                    //     'mailto:ali@gmail.com?subject=this is subject from shady &body=hello ali how are you');
                    // openWhatsappChat('https://wa.me/+972599015201');
                    // openInstegramPage(
                    //     'instagram://media?id=1346423547953773636_401375631');
                    XFile file = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    Provider.of<DatabaseProvider>(context, listen: false)
                        .deleteTask(task);
                  },
                ),
              ],
            ),
            title: Text(task.title),
          ),
        ));
  }
}
