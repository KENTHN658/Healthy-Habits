import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class ARView extends StatefulWidget {
  const ARView({super.key});

  @override
  State<ARView> createState() => _ARViewState();
}

class _ARViewState extends State<ARView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.visibility_rounded,
              color: Colors.indigoAccent,
              size: 100,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "AR",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 12,
            ),

            MaterialButton(
              color: Colors.indigoAccent,
              onPressed: () {
                context.goNamed("subSetting");
              },
              child: const Text(
                "Navigate To Sub AR View",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
