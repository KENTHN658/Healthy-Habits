// import 'package:flutter/material.dart';
//
// class MYApp extends StatefulWidget {
//
//   @override
//   State<MYApp> createState() => _NavbarState();
// }
//
// class _NavbarState extends State<Navbar> {
//   int index = 0;
//   final screens = [
//     const Center(child: Text("1")),
//     const Center(child: Text("2")),
//     const Center(child: Text("3")),
//     const Center(child: Text("4")),
//     const Center(child: Text("5")),
//   ];
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     body: screens[index],
//         bottomNavigationBar: NavigationBarTheme(
//           data: NavigationBarThemeData(
//             indicatorColor: Colors.deepPurple.shade200,
//             labelTextStyle: MaterialStateProperty.all(
//               const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//             ),
//           ),
//           child: NavigationBar(
//               height: 60,
//               backgroundColor: Colors.black26,
//               selectedIndex: index,
//               onDestinationSelected: (index) =>
//                   (setState(() => this.index = index)),
//               destinations: const [
//                 NavigationDestination(
//                   icon: Icon(Icons.directions_walk),
//                   label: 'Walk',
//                 ),
//                 NavigationDestination(
//                   icon: Icon(Icons.view_in_ar_rounded),
//                   label: 'VR',
//                 ),
//                 NavigationDestination(
//                   icon: Icon(Icons.home_rounded),
//                   label: 'Home',
//                 ),
//                 NavigationDestination(
//                   icon: Icon(Icons.nights_stay_sharp),
//                   label: 'Sleep',
//                 ),
//                 NavigationDestination(
//                   icon: Icon(Icons.water_drop_rounded),
//                   label: 'Water',
//                 ),
//               ]),
//         ),
//       );
// }
