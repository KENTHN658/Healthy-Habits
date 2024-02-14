import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
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
              Icons.settings,
              color: Colors.indigoAccent,
              size: 100,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Settings",
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
                "Navigate To Sub Settings View",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
