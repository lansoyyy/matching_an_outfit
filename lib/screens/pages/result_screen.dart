import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:matching_an_outfit/utlis/colors.dart';
import 'package:matching_an_outfit/utlis/data.dart';

class ResultPage extends StatefulWidget {
  String image;
  String type;

  ResultPage({super.key, required this.image, required this.type});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    int randomTop = random.nextInt(widget.type == 'Casual'
        ? 6
        : widget.type == 'Streetwear'
            ? 5
            : widget.type == 'Sporty'
                ? 4
                : 6);
    int randomBottom = random.nextInt(widget.type == 'Casual'
        ? 6
        : widget.type == 'Streetwear'
            ? 5
            : widget.type == 'Sporty'
                ? 6
                : 6);

    String top = widget.type == 'Casual'
        ? casualTop[randomTop]
        : widget.type == 'Streetwear'
            ? streetTop[randomTop]
            : widget.type == 'Sporty'
                ? sportyTop[randomTop]
                : minimalistTop[randomTop];

    String bottom = widget.type == 'Casual'
        ? casualBottom[randomBottom]
        : widget.type == 'Streetwear'
            ? streetBottom[randomBottom]
            : widget.type == 'Sporty'
                ? sportyBottom[randomBottom]
                : minimalistBottom[randomBottom];
    return Scaffold(
      backgroundColor: background,
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        child: const Icon(
          Icons.refresh,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {});
        },
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
                          width: 118,
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
                          width: 60,
                          height: 120,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(bottom), fit: BoxFit.fill)),
                        )),
                      ),
                    ],
                  ),
                ],
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
