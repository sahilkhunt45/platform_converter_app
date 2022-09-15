import 'package:flutter/material.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.only(left: 10, top: 30),
              width: double.infinity,
              color: const Color(0xff54759e),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: 20),
                  CircleAvatar(
                    radius: 35,
                    child: FlutterLogo(),
                  ),
                  Spacer(),
                  Text(
                    "Sahil Khunt",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "+91 9082329121",
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 12,
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(
                    Icons.group_outlined,
                    color: Colors.grey,
                  ),
                  title: Text("New Group"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.person_outline,
                    color: Colors.grey,
                  ),
                  title: Text("New Contact"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.call,
                    color: Colors.grey,
                  ),
                  title: Text("Calls"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.bookmark,
                    color: Colors.grey,
                  ),
                  title: Text("Saved Massages"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.grey,
                  ),
                  title: Text("Settings"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
