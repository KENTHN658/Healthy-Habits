import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({
    required this.navigationShell,
    super.key,
  });
  final StatefulNavigationShell navigationShell;

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int selectedIndex = 1;

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            semanticLabel: 'menu',
          ),
          onPressed: () {
            print('Menu button');
          },
        ),
        title: Center(child: const Text('SHRINE')),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: widget.navigationShell,
      ),
      // floatingActionButton: FloatingActionButton(
      //     onPressed: () {
      //       context.push(context.namedLocation('Player'));
      //     },
      //     backgroundColor: Colors.deepPurpleAccent,
      //     child: const Icon(Icons.home_rounded)),
      bottomNavigationBar: SlidingClippedNavBar(
        backgroundColor: Colors.white,
        onButtonPressed: (index) {
          setState(() {
            selectedIndex = index;
          });
          _goBranch(selectedIndex);
        },
        iconSize: 30,
        activeColor: Colors.black,
        selectedIndex: selectedIndex,
        barItems: [
          BarItem(
            icon: Icons.directions_walk,
            title: 'Walk',
          ),
          BarItem(
            icon: Icons.home_rounded,
            title: 'Home',
          ),
          BarItem(
            icon: Icons.view_in_ar_rounded,
            title: 'AR',
          ),

        ],
      ),
    );
  }
}
