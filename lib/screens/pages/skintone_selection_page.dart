import 'package:flutter/material.dart';
import 'package:matching_an_outfit/utlis/colors.dart';
import 'package:matching_an_outfit/widgets/text_widget.dart';

class SkintoneSelectionPage extends StatefulWidget {
  const SkintoneSelectionPage({super.key});

  @override
  State<SkintoneSelectionPage> createState() => _SkintoneSelectionPageState();
}

class _SkintoneSelectionPageState extends State<SkintoneSelectionPage> {
  List colors = [
    Colors.brown[100],
    Colors.brown[200],
    Colors.brown[300],
    Colors.brown[400],
    Colors.brown[500],
    Colors.brown[600],
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
                width: 250,
                decoration: BoxDecoration(
                  border: Border.all(color: primary),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: TextWidget(
                    text: 'Select your Skintone',
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
                itemCount: colors.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: ListTile(
                      tileColor: colors[index],
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
