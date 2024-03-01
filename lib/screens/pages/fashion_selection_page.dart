import 'package:flutter/material.dart';
import 'package:matching_an_outfit/screens/pages/result_screen.dart';
import 'package:matching_an_outfit/utlis/colors.dart';
import 'package:matching_an_outfit/widgets/button_widget.dart';
import 'package:matching_an_outfit/widgets/text_widget.dart';

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
    'Retro',
    'Sporty',
    'Minimalist',
  ];
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
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ResultPage()));
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
