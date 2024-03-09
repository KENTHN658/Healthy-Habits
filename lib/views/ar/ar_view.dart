import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_embed_unity/flutter_embed_unity.dart';

/// ARView is a StatefulWidget representing the augmented reality view.
///
/// This widget displays an icon, a title, and a button to navigate to a sub AR view.
/// Effective Dart: Usage has been followed in structuring this widget.
class ARView extends StatefulWidget {
  const ARView({super.key});

  @override
  State<ARView> createState() => _ARViewState();
}

class _ARViewState extends State<ARView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EmbedUnity(
        onMessageFromUnity: (String message) {
          // Receive message from Unity sent via SendToFlutter.cs
        },
      ),
    );
  }
}
