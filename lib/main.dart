import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_convertor_app/ios_call_page.dart';
import 'package:platform_convertor_app/ios_chat_page.dart';
import 'package:platform_convertor_app/ios_setting_page.dart';
import 'package:platform_convertor_app/settings_page.dart';

import 'call_page.dart';
import 'chats_page.dart';
import 'components/my_drawer.dart';
import 'globals.dart';

void main() {
  runApp(
    const Android(),
  );
}

class Android extends StatefulWidget {
  const Android({Key? key}) : super(key: key);

  @override
  State<Android> createState() => _AndroidState();
}

class _AndroidState extends State<Android> with SingleTickerProviderStateMixin {
  late TabController tabController;
  int initialStepperIndex = 0;
  final GlobalKey<FormState> contactFormkey = GlobalKey<FormState>();
  final GlobalKey<FormState> contact2Formkey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  final ImagePicker _picker = ImagePicker();
  final List<Widget> ios_tabs = [
    const IosChatPage(),
    const IosCallPage(),
    const IosSettingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return (Global.IsIOSMode == false)
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Builder(builder: (BuildContext context) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: const Color(0xff54759e),
                  title: const Text(
                    "Platform Convertor",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  bottom: TabBar(
                    controller: tabController,
                    indicatorColor: Colors.white,
                    indicatorWeight: 5,
                    tabs: const [
                      Tab(text: "CHATS"),
                      Tab(text: "CALLS"),
                      Tab(text: "SETTINGS"),
                    ],
                  ),
                  actions: [
                    Switch(
                      inactiveThumbImage:
                          const AssetImage("assets/images/logo.png"),
                      value: Global.IsIOSMode,
                      onChanged: (val) {
                        setState(() {
                          Global.IsIOSMode = val;
                        });
                      },
                    )
                  ],
                ),
                drawer: const SideDrawer(),
                body: TabBarView(
                  controller: tabController,
                  children: const [
                    ChatPage(),
                    CallPage(),
                    SettingsPage(),
                  ],
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) => Dialog(
                        child: StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) {
                            return Stepper(
                              currentStep: initialStepperIndex,
                              controlsBuilder: (context, _) {
                                return (initialStepperIndex == 2)
                                    ? Row(
                                        children: [
                                          SizedBox(
                                            height: 40,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary:
                                                    const Color(0xff54759e),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                ),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  if (initialStepperIndex < 2) {
                                                    initialStepperIndex++;
                                                  }
                                                });
                                              },
                                              child: const Text("ADD"),
                                            ),
                                          ),
                                          const SizedBox(width: 40),
                                          SizedBox(
                                            height: 40,
                                            child: TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  if (initialStepperIndex > 0) {
                                                    initialStepperIndex--;
                                                  }
                                                });
                                              },
                                              child: const Text(
                                                "CANCEL",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          SizedBox(
                                            height: 40,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary:
                                                    const Color(0xff54759e),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                ),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  if (initialStepperIndex < 2) {
                                                    initialStepperIndex++;
                                                  }
                                                });
                                              },
                                              child: const Text("CONTINUE"),
                                            ),
                                          ),
                                          const SizedBox(width: 40),
                                          SizedBox(
                                            height: 40,
                                            child: TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  if (initialStepperIndex > 0) {
                                                    initialStepperIndex--;
                                                  }
                                                });
                                              },
                                              child: const Text(
                                                "CANCEL",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                              },
                              steps: <Step>[
                                Step(
                                  isActive: initialStepperIndex >= 0,
                                  state: initialStepperIndex >= 1
                                      ? StepState.complete
                                      : StepState.disabled,
                                  title: const Text(
                                    "PROFILE PHOTO",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Add profile photo",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Stack(
                                            alignment: Alignment.bottomRight,
                                            children: [
                                              CircleAvatar(
                                                radius: 50,
                                                backgroundColor:
                                                    Colors.grey.shade400,
                                                backgroundImage: (Global
                                                            .image !=
                                                        null)
                                                    ? FileImage(Global.image!)
                                                    : null,
                                                child: (Global.image != null)
                                                    ? const Text("")
                                                    : const Text(
                                                        "ADD",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                              ),
                                              FloatingActionButton(
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    barrierDismissible: true,
                                                    builder: (context) =>
                                                        AlertDialog(
                                                      title: const Text(
                                                          "Add Photo"),
                                                      actions: [
                                                        Column(
                                                          children: [
                                                            SizedBox(
                                                              height: 50,
                                                              child: TextButton(
                                                                onPressed:
                                                                    () async {
                                                                  XFile?
                                                                      pickedFile =
                                                                      await _picker.pickImage(
                                                                          source:
                                                                              ImageSource.camera);
                                                                  setState(() {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                    Global.image =
                                                                        File(pickedFile!
                                                                            .path);
                                                                  });
                                                                },
                                                                child:
                                                                    const Text(
                                                                  "Take your photo\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 50,
                                                              child: TextButton(
                                                                onPressed:
                                                                    () async {
                                                                  XFile?
                                                                      pickedFile =
                                                                      await _picker
                                                                          .pickImage(
                                                                    source: ImageSource
                                                                        .gallery,
                                                                  );
                                                                  setState(() {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                    Global.image =
                                                                        File(pickedFile!
                                                                            .path);
                                                                  });
                                                                },
                                                                child:
                                                                    const Text(
                                                                  "Chose Form Gallary\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 50,
                                                              child: TextButton(
                                                                onPressed:
                                                                    () async {
                                                                  setState(() {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                    Global.image =
                                                                        null;
                                                                  });
                                                                },
                                                                child: Row(
                                                                  children: const [
                                                                    Icon(Icons
                                                                        .delete),
                                                                    Text(
                                                                      "Delete Your Photo",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                                mini: true,
                                                child: const Icon(Icons.add),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 30),
                                    ],
                                  ),
                                ),
                                Step(
                                  isActive: initialStepperIndex >= 1,
                                  state: initialStepperIndex >= 2
                                      ? StepState.complete
                                      : StepState.disabled,
                                  title: const Text(
                                    "NAME",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  content: Form(
                                    key: contactFormkey,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Enter name",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        const SizedBox(height: 10),
                                        TextFormField(
                                          controller: nameController,
                                          validator: (val) {
                                            if (val!.isEmpty) {
                                              return "Enter your name first";
                                            }
                                            return null;
                                          },
                                          onSaved: (val) {
                                            setState(() {
                                              Global.name = val;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.blue),
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                            ),
                                            hintText: "Sahil Khunt",
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                ),
                                Step(
                                  isActive: initialStepperIndex >= 2,
                                  state: initialStepperIndex >= 3
                                      ? StepState.complete
                                      : StepState.disabled,
                                  title: const Text(
                                    "Description",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  content: Form(
                                    key: contact2Formkey,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Enter description",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        const SizedBox(height: 10),
                                        TextFormField(
                                          controller: descriptionController,
                                          validator: (val) {
                                            if (val!.isEmpty) {
                                              return "Enter your description first";
                                            }
                                            return null;
                                          },
                                          onSaved: (val) {
                                            setState(() {
                                              Global.des = val;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.blue),
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                            ),
                                            hintText: "Welcome To PCAPP",
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    );
                  },
                  child: const Icon(Icons.add),
                ),
              );
            }),
          )
        : CupertinoApp(
            debugShowCheckedModeBanner: false,
            home: CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                leading: Builder(
                  builder: (context) {
                    return GestureDetector(
                      child: const Icon(CupertinoIcons.text_append),
                      onTap: () {},
                    );
                  },
                ),
                middle: const Text("Platform Convertor"),
                trailing: CupertinoSwitch(
                  value: Global.IsIOSMode,
                  onChanged: (val) {
                    setState(() {
                      Global.IsIOSMode = val;
                    });
                  },
                ),
              ),
              child: CupertinoTabScaffold(
                  tabBar: CupertinoTabBar(
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.chat_bubble_2),
                          label: 'Chats'),
                      BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.phone), label: 'Calls'),
                      BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.settings),
                          label: 'Settings')
                    ],
                  ),
                  tabBuilder: (BuildContext context, index) {
                    return CupertinoTabView(
                      builder: (BuildContext context) {
                        return ios_tabs[index];
                      },
                    );
                  }),
            ),
          );
  }
}
