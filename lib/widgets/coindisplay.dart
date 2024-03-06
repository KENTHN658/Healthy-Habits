import 'package:flutter/material.dart';
import 'package:mobiletest3/provider/coin_display_provider.dart';
import 'package:provider/provider.dart';

class CoinDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final coin = Provider.of<CoinDisplayProvider>(context);
    return CircleAvatar(
      backgroundColor: Colors.black,
      child: Text(
        '${coin.scorePoints}',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
