import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matching_an_outfit/screens/pages/result_screen.dart';
import 'package:matching_an_outfit/utlis/colors.dart';
import 'package:matching_an_outfit/widgets/button_widget.dart';
import 'package:matching_an_outfit/widgets/text_widget.dart';
import 'package:path/path.dart' as path;

class FashionSelectionPage extends StatefulWidget {
  const FashionSelectionPage({super.key});

  @override
  State<FashionSelectionPage> createState() => _FashionSelectionPageState();
}

class _FashionSelectionPageState extends State<FashionSelectionPage> {
  List types = [
    'Casual',
    'Classic',
    'Streetwear',
    'Sporty',
    'Minimalist',
  ];

  late String fileName = '';

  late File imageFile;

  late String imageURL = '';

  Future<void> uploadPicture(String inputSource) async {
    final picker = ImagePicker();
    XFile pickedImage;

    pickedImage = (await picker.pickImage(
        source:
            inputSource == 'camera' ? ImageSource.camera : ImageSource.gallery,
        maxWidth: 1920))!;

    fileName = path.basename(pickedImage.path);
    imageFile = File(pickedImage.path);

    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => const Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: AlertDialog(
              title: Row(
            children: [
              CircularProgressIndicator(
                color: Colors.black,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                'Loading . . .',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'QRegular'),
              ),
            ],
          )),
        ),
      );

      // await firebase_storage.FirebaseStorage.instance
      //     .ref('Users/$fileName')
      //     .putFile(imageFile);
      // imageURL = await firebase_storage.FirebaseStorage.instance
      //     .ref('Users/$fileName')
      //     .getDownloadURL();

      // await FirebaseFirestore.instance
      //     .collection('Users')
      //     .doc(FirebaseAuth.instance.currentUser!.uid)
      //     .update({'profilePicture': imageURL});

      Navigator.of(context).pop();

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ResultPage(
                image: imageFile.path,
              )));
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: primary,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 45,
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: primary),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: TextWidget(
                    text: 'Select your type of Fashion',
                    fontSize: 18,
                    color: primary,
                    fontFamily: 'Bold',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: types.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: ButtonWidget(
                      radius: 100,
                      color: primary,
                      label: types[index],
                      onPressed: () {
                        uploadPicture('camera');
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
