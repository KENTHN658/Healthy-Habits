import 'package:flutter/material.dart';
import 'package:mobiletest3/provider/coin_display_provider.dart';
import 'package:provider/provider.dart';

import '../provider/walk_provider.dart';

class CardWalk extends StatefulWidget {
  const CardWalk({Key? key}) : super(key: key);

  @override
  State<CardWalk> createState() => _CardWalkState();
}

class _CardWalkState extends State<CardWalk> {

  void _incrementCounter(CoinDisplayProvider coin) {
    setState(() {
      coin.incrementScorePoints(10);
    });
  }
  @override
  Widget build(BuildContext context) {
    final walkProvider = Provider.of<WalkProvider>(context);
    if ((int.parse(walkProvider.steps)) == 7000) {
      _incrementCounter;
    }
    return Card(
      elevation: 5,
        margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "การเดิน",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black), // Adjusted text color
                ),
                Icon(
                  Icons.more_vert,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "วันนี้",
                  style: TextStyle(fontSize: 16, color: Colors.black), // Adjusted text color
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '${walkProvider.steps} ก้าว' ,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black), // Adjusted text color
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "ระยะทาง",
                  style: TextStyle(fontSize: 16, color: Colors.black), // Adjusted text color
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "${(int.parse(walkProvider.steps) * 0.762 / 1000).toStringAsFixed(2)} กม.",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "แคลอรี่ที่เผาผลาญ",
                  style: TextStyle(fontSize: 16, color: Colors.black), // Adjusted text color
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "${(int.parse(walkProvider.steps) * 0.762 / 1000 *30).toStringAsFixed(2)} แคลอรี่",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "เป้าหมายการเดิน",
                  style: TextStyle(fontSize: 16, color: Colors.black), // Adjusted text color
                ),
                Text(
                  "7,000 ก้าว",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black), // Adjusted text color
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
