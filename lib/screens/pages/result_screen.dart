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

  bool hasSelected = false;
  int typeTop = 0;
  List imgTop = [];
  int typeBot = 0;
  List imgBot = [];
  int randomTop = 0;
  int randomBottom = 0;
  String top = '';

  String bottom = '';

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
    }
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
                          height: 115,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(bottom), fit: BoxFit.fill)),
                        )),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: SizedBox(
                      height: 300,
                      child: SingleChildScrollView(
                        child: Builder(builder: (context) {
                          return Column(
                            children: [
                              for (int i = 0; i < typeTop; i++)
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        hasSelected = true;
                                        top = imgTop[i];
                                      });
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          imgTop[i],
                                          width: 80,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                            ],
                          );
                        }),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: SizedBox(
                        height: 300,
                        width: 350,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Builder(builder: (context) {
                            return Row(
                              children: [
                                for (int i = 0; i < typeBot; i++)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          hasSelected = true;
                                          bottom = imgBot[i];
                                        });
                                      },
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                imgBot[i],
                                              ),
                                            )),
                                      ),
                                    ),
                                  )
                              ],
                            );
                          }),
                        ),
                      ),
                    ),
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
