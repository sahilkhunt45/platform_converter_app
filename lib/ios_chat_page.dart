import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'globals.dart';

class IosChatPage extends StatefulWidget {
  const IosChatPage({Key? key}) : super(key: key);

  @override
  State<IosChatPage> createState() => _IosChatPageState();
}

class _IosChatPageState extends State<IosChatPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Global.allcontacts.length,
      itemBuilder: (context, i) => GestureDetector(
        onTap: () {
          showCupertinoModalPopup(
              context: context,
              builder: (context) => CupertinoActionSheet(
                    title: CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage(
                        Global.allcontacts[i]['images'],
                      ),
                    ),
                    message: Column(
                      children: [
                        Text(
                          "${Global.allcontacts[i]['name']}",
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("${Global.allcontacts[i]['des']}"),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                    actions: [
                      CupertinoActionSheetAction(
                        onPressed: () async {
                          Uri url =
                              Uri.parse("sms:${Global.allcontacts[i]['no']}");

                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Can't be launched..."),
                                backgroundColor: Colors.redAccent,
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          }
                        },
                        child: Text("Send Message"),
                      ),
                      CupertinoActionSheetAction(
                        isDestructiveAction: true,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Dismiss"),
                      ),
                    ],
                  ));
        },
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          // margin: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 5,
              ),
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                  Global.allcontacts[i]['images'],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text("${Global.allcontacts[i]['name']}"),
                  const SizedBox(
                    height: 9,
                  ),
                  Text(
                    "${Global.allcontacts[i]['des']}",
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              const Spacer(
                flex: 2,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${Global.allcontacts[i]['time']}",
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
