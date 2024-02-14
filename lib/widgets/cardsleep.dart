import 'package:flutter/material.dart';

class sleepCard extends StatefulWidget {
  const sleepCard({super.key});

  @override
  State<sleepCard> createState() => _sleepCardState();
}

class _sleepCardState extends State<sleepCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: [
                        WidgetSpan(
                          child: Icon(Icons.nights_stay_sharp),
                        ),
                        TextSpan(
                          text: '',
                          style: TextStyle(
                            color: Colors.black, // Change the color of _counter
                            fontWeight: FontWeight.bold, // Make _counter bold
                            fontSize: 25, // Increase the font size of _counter
                          ),
                        ),
                        TextSpan(
                          text: ' /2000 มิลลิลิตร',
                          style: TextStyle(
                            color: Colors.grey, // Color of "/2000 มิลลิลิตร"
                            fontSize: 15, // Font size of "/2000 มิลลิลิตร"
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    child: const Text('+ 250 มิลิลิตร'),
                    onPressed: () {
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(50.0)),
                      ),
                    ),
                  ),
                ],
              ),
              Column(),
            ],
          ),
        ),
      ),
    );
  }
}
