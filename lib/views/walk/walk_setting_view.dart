import 'package:flutter/material.dart';

class SubWalkView extends StatefulWidget {
  const SubWalkView({super.key});

  @override
  State<SubWalkView> createState() => _SubWalkViewState();
}

class _SubWalkViewState extends State<SubWalkView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Text(
                index.toString(),
              ),
              title: Text("Walk no. $index"),
            ),
          );
        }),
      ),
    );
  }
}