import 'package:flutter/material.dart';
import 'package:matching_an_outfit/screens/pages/skintone_selection_page.dart';
import 'package:matching_an_outfit/utlis/colors.dart';
import 'package:matching_an_outfit/widgets/text_widget.dart';

class BodySelectionPage extends StatelessWidget {
  String type;

  BodySelectionPage({super.key, required this.type});

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
                    text: 'Select your Body Type',
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
              child: GridView.builder(
                itemCount: 3,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return type == 'Male'
                      ? GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const SkintoneSelectionPage()));
                          },
                          child:
                              Image.asset('assets/images/boy${index + 1}.png'))
                      : GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const SkintoneSelectionPage()));
                          },
                          child: Image.asset(
                              'assets/images/girl${index + 1}.png'));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
