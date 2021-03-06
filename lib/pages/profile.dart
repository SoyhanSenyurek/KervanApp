import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kervan_app/widgets/images_w.dart';
import 'package:kervan_app/widgets/login_w.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String imageUrl;
  List<Asset> images = new List<Asset>();
  String _error = "No Error Dectected";
  List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return getProfile();
  }

  Widget getProfile() {
    bool login = false;
    if (login) {
      return loginscreen();
    } else {
      return accountscreen();
    }
  }

  Widget loginscreen() {
    return LoginWidget();
  }

  uploadImage() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile image;

    image = await _picker.getImage(source: ImageSource.gallery);
    var file = File(image.path);

    if (image != null) {
      var snapshot =
          await _storage.ref().child('folder/imageName').putFile(file);
      var downloadUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        imageUrl = downloadUrl;
      });
    }
  }

  Widget accountscreen() {
    return SingleChildScrollView(
        child: Column(
      children: [
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            "Kullanıcı Adı",
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Kullanıcı Adı'),
          ),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text("Facebook linki"),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Facebook linki'),
          ),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text("Twitter linki"),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Twitter linki'),
          ),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text("Instagram linki"),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Instagram linki'),
          ),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text("Twitch linki"),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Twitch linki'),
          ),
        ),
        SizedBox(height: 30),
        ImageWidget(imgList, true),
        SizedBox(height: 20.0),
        RaisedButton(
          child: Text("Resim Yükle"),
          color: Colors.lightBlue,
          onPressed: () {
            uploadImage();
          },
        ),
      ],
    ));
  }
}
