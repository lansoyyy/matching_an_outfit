import 'package:flutter/material.dart';
import 'package:matching_an_outfit/screens/pages/body_selection_page.dart';
import 'package:matching_an_outfit/utlis/colors.dart';
import 'package:matching_an_outfit/widgets/button_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 275,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
                image: DecorationImage(
                    image: AssetImage('assets/images/model.jpg'))),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.male,
                color: primary,
                size: 48,
              ),
              Icon(
                Icons.female,
                color: primary,
                size: 48,
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonWidget(
                color: primary,
                radius: 100,
                width: 150,
                label: 'Male',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BodySelectionPage(
                            type: 'Male',
                          )));
                },
              ),
              ButtonWidget(
                color: primary,
                radius: 100,
                width: 150,
                label: 'Female',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BodySelectionPage(
                            type: 'Female',
                          )));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
