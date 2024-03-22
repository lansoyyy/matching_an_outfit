import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:matching_an_outfit/utlis/colors.dart';
import 'package:matching_an_outfit/utlis/data.dart';
import 'package:matching_an_outfit/widgets/text_widget.dart';
import 'package:matching_an_outfit/widgets/toast_widget.dart';
import 'package:screenshot/screenshot.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ResultPage extends StatefulWidget {
  String image;
  String type;

  ResultPage({super.key, required this.image, required this.type});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  Random random = Random();

  bool hasSelected = false;
  int typeTop = 0;
  List imgTop = [];
  int typeBot = 0;
  List imgBot = [];
  int randomTop = 0;
  int randomBottom = 0;
  String top = '';

  String bottom = '';

  String toplink = '';

  String bottomlink = '';

  ScreenshotController screenshotController = ScreenshotController();

  double fontSize = 14;

  void downloadImage() async {
    try {
      // Capture the widget as an image using the screenshotController
      Uint8List? bytes = await screenshotController.capture();

      if (bytes != null) {
        // Save the image to the gallery or storage
        final result = await ImageGallerySaver.saveImage(bytes);

        if (result['isSuccess']) {
          showToast("Image saved to gallery!");
          print("Image saved to gallery!");
        } else {
          showToast("Failed to save image: ${result['errorMessage']}");
          print("Failed to save image: ${result['errorMessage']}");
        }
      } else {
        print("Failed to capture the widget as an image.");
      }
    } catch (e) {
      print("Error saving image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!hasSelected) {
      typeTop = widget.type == 'Casual'
          ? casualTop.length
          : widget.type == 'Streetwear'
              ? streetTop.length
              : widget.type == 'Sporty'
                  ? sportyTop.length
                  : minimalistTop.length;
      imgTop = widget.type == 'Casual'
          ? casualTop
          : widget.type == 'Streetwear'
              ? streetTop
              : widget.type == 'Sporty'
                  ? sportyTop
                  : minimalistTop;

      typeBot = widget.type == 'Casual'
          ? casualBottom.length
          : widget.type == 'Streetwear'
              ? streetBottom.length
              : widget.type == 'Sporty'
                  ? sportyBottom.length
                  : minimalistBottom.length;
      imgBot = widget.type == 'Casual'
          ? casualBottom
          : widget.type == 'Streetwear'
              ? streetBottom
              : widget.type == 'Sporty'
                  ? sportyBottom
                  : minimalistBottom;
      randomTop = random.nextInt(widget.type == 'Casual'
          ? 4
          : widget.type == 'Streetwear'
              ? 3
              : widget.type == 'Sporty'
                  ? 2
                  : 4);
      randomBottom = random.nextInt(widget.type == 'Casual'
          ? 4
          : widget.type == 'Streetwear'
              ? 3
              : widget.type == 'Sporty'
                  ? 4
                  : 4);

      top = widget.type == 'Casual'
          ? casualTop[randomTop]
          : widget.type == 'Streetwear'
              ? streetTop[randomTop]
              : widget.type == 'Sporty'
                  ? sportyTop[randomTop]
                  : minimalistTop[randomTop];

      bottom = widget.type == 'Casual'
          ? casualBottom[randomBottom]
          : widget.type == 'Streetwear'
              ? streetBottom[randomBottom]
              : widget.type == 'Sporty'
                  ? sportyBottom[randomBottom]
                  : minimalistBottom[randomBottom];

      toplink = widget.type == 'Casual'
          ? casualTopLink[randomTop + 1]
          : widget.type == 'Streetwear'
              ? streetTopLink[randomTop + 1]
              : widget.type == 'Sporty'
                  ? sportyTopLink[randomTop + 1]
                  : minimalistTopLink[randomTop + 1];

      bottomlink = widget.type == 'Casual'
          ? casualBottomLink[randomBottom + 1]
          : widget.type == 'Streetwear'
              ? streetBottomLink[randomBottom + 1]
              : widget.type == 'Sporty'
                  ? sportyBottomLink[randomBottom + 1]
                  : minimalistBottomLink[randomBottom + 1];
    }
    return Scaffold(
      backgroundColor: background,
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            width: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                backgroundColor: primary,
                child: const Icon(
                  Icons.link,
                  color: Colors.white,
                ),
                onPressed: () async {
                  await launchUrlString(toplink);
                },
              ),
              TextWidget(
                text: 'Top',
                fontSize: 18,
                fontFamily: 'Bold',
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                backgroundColor: primary,
                child: const Icon(
                  Icons.link,
                  color: Colors.white,
                ),
                onPressed: () async {
                  await launchUrlString(bottomlink);
                },
              ),
              TextWidget(
                text: 'Bottom',
                fontSize: 18,
                fontFamily: 'Bold',
              ),
            ],
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                backgroundColor: primary,
                child: const Icon(
                  Icons.save,
                  color: Colors.white,
                ),
                onPressed: () async {
                  downloadImage();
                },
              ),
              TextWidget(
                text: 'Save',
                fontSize: 18,
                fontFamily: 'Bold',
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          FloatingActionButton(
            backgroundColor: primary,
            child: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {});
            },
          ),
        ],
      ),
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
            Expanded(
              child: Screenshot(
                controller: screenshotController,
                child: Stack(
                  children: [
                    Image.file(
                      File(widget.image),
                      height: 500,
                      width: 500,
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 110,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Center(
                              child: Container(
                            width: 110,
                            height: 115,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(top), fit: BoxFit.fill)),
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Center(
                              child: Container(
                            width: 80,
                            height: 125,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(bottom),
                                    fit: BoxFit.fill)),
                          )),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  top,
                                  width: 80,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      bottom,
                                    ),
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
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
