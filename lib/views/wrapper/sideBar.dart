import 'package:flutter/material.dart';
import 'package:mobiletest3/views/shopping/PurchaseHistoryPage.dart';
import 'package:mobiletest3/views/shopping/shopping.dart';

/// SideBar is a StatelessWidget representing the side navigation drawer.
///
/// This widget displays user account information, profile picture, and various options
/// such as shopping, purchase history, notifications, profile settings, and sign out.
/// Effective Dart: Usage has been followed in structuring this widget.
class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Thanaton Booncherd"),
            accountEmail: Text("Thanaton_b@cmu.ac.th"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(child: Image.asset('images/man.jpg')),
            ),
            decoration: BoxDecoration(
                color: Colors.pinkAccent,
                image: DecorationImage(
                    image: AssetImage('images/forest.jpg'), fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("Shopping"),
            onTap: () {
              // Navigate to the ShoppingPage when tapped
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ShoppingPage(),
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text("Purchase history"),
            onTap: () {
              // Navigate to the PurchaseHistoryPage when tapped
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PurchaseHistoryPage(),
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Notification"),
            onTap: ()=> print("Notification"),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Profile"),
            onTap: ()=> print("profile"),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Sign Out"),
            onTap: ()=> print("Logout tapped"),
          )
        ],
      ),
    );
  }
}
