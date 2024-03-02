import 'dart:io';

import 'package:flutter/material.dart';
import 'package:matching_an_outfit/utlis/colors.dart';

class ResultPage extends StatefulWidget {
  String image;

  ResultPage({
    super.key,
    required this.image,
  });

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List types = [
    'Casual',
    'Classic',
    'Streetwear',
    'Retro',
    'Sporty',
    'Minimalist',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        child: const Icon(
          Icons.refresh,
          color: Colors.white,
        ),
        onPressed: () {},
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
              child: Image.file(
                File(widget.image),
                height: 500,
                width: 500,
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
