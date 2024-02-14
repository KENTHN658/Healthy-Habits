import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green.shade200,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.home,
                color: Colors.red,
                size: 100,
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Home",
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 12,
              ),
              CardExample(),
              MaterialButton(
                color: Colors.redAccent,
                onPressed: () {
                  Navigator.pushNamed(context, "subHome");
                },
                child: const Text(
                  "Navigate To Sub Home View",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class CardExample extends StatefulWidget {
  @override
  State<CardExample> createState() => _CardExampleState();
}

class _CardExampleState extends State<CardExample> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter = _counter + 250 ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.water_drop),
              title: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: '$_counter',
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
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('LISTEN'),
                  onPressed: () {_incrementCounter(); },
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


