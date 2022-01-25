import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_ui/ui/screens/test_camera/camera_provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile Page'),
        ),
        body: Consumer<CameraProvider>(
          builder: (contexr, provider, x) {
            return Center(
              child: InkWell(
                onTap: () {
                  provider.selectSource(context);
                },
                child: Container(
                  height: 300,
                  width: 300,
                  color: Colors.grey,
                  child: provider.file == null
                      ? Container()
                      : Image.file(
                          provider.file,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            );
          },
        ));
  }
}
