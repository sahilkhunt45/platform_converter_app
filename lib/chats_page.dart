import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'globals.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Global.allcontacts.length,
      itemBuilder: (context, i) => ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage("${Global.allcontacts[i]['images']}"),
        ),
        title: Text("${Global.allcontacts[i]['name']}"),
        subtitle: Text("${Global.allcontacts[i]['des']}"),
        trailing: Text("${Global.allcontacts[i]['time']}"),
        onTap: () {
          showModalBottomSheet(
              isDismissible: false,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              context: context,
              builder: (context) {
                return Column(
                  children: [
                    const SizedBox(height: 40),
                    CircleAvatar(
                      backgroundImage:
                          AssetImage("${Global.allcontacts[i]['images']}"),
                      radius: 70,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "${Global.allcontacts[i]['name']}",
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "+91 ${Global.allcontacts[i]['no']}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xff54759e),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () async {
                          Uri url = Uri.parse(
                              "sms:+91 ${Global.allcontacts[i]['no']}");

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
                        child: const Text("Send Message"),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xff54759e),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Cancel"),
                      ),
                    ),
                  ],
                );
              });
        },
      ),
    );
  }
}
