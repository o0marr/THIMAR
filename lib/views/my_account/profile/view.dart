import 'dart:io';

import 'package:Thimar_amit/core/design/app_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: image!= null
                  ? FileImage(File(image!.path)) as ImageProvider
                  : NetworkImage(
                      "https://media.licdn.com/dms/image/C5603AQEySmuHB1EwKQ/profile-displayphoto-shrink_800_800/0/1516263018272?e=2147483647&v=beta&t=C3s-TRyWgxxoFnUPJ1C-8fKDWwE948wKvG3Oy5H1RFY"),
            ),
            IconButton(
              icon: Icon(Icons.camera_alt_outlined,color: Theme.of(context).primaryColor),
              onPressed: () async {
                image =
                await ImagePicker().pickImage(source: ImageSource.camera);
                setState(() {});
              },
            ),
            IconButton(
              icon: Icon(Icons.image_outlined,color: Theme.of(context).primaryColor,),
              onPressed: () async {
                image =
                await ImagePicker().pickImage(source: ImageSource.gallery);
                setState(() {});
              },
            ),
            SizedBox(
              height: 24,
            ),
            TextFormField(),
          ],
        ),
      ),
    );
  }
}
