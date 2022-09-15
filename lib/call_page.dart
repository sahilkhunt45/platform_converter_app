import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'globals.dart';

class CallPage extends StatefulWidget {
  const CallPage({Key? key}) : super(key: key);

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Global.allcontacts.length,
      itemBuilder: (context, i) => ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage("${Global.allcontacts[i]['images']}"),
          radius: 30,
        ),
        title: Text("${Global.allcontacts[i]['name']}"),
        subtitle: Text(
            "${Global.allcontacts[i]['date']},${Global.allcontacts[i]['time']}"),
        trailing: IconButton(
          color: Colors.green,
          icon: Icon(Icons.call),
          onPressed: () async {
            Uri url = Uri.parse("tel:+91 ${Global.allcontacts[i]['no']}");

            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("can't be luanched..."),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
