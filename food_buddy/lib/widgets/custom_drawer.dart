import 'package:flutter/material.dart';
import 'package:food_buddy/widgets/inventory.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('Mckenzie Lionel Joseph Prince'),
            accountEmail: Text('mckenzie@unc.edu'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Text('ML', style: TextStyle(fontSize: 40)),
            ),
          ),
          ListTile(
              leading: const Icon(Icons.inventory),
              title: const Text('Inventory'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Inventory(),
                  ),
                );
              }),
          const ListTile(
            leading: Icon(Icons.list),
            title: Text('Recipes'),
          ),
          // ListTile(
          //   leading: Icon(Icons.settings),
          //   title: Text('Settings'),
          // ),
          const ListTile(
            leading: Icon(Icons.help),
            title: Text('Help'),
          ),
          const ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Log Out'),
          ),
          const Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Food Buddy v1.0'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
