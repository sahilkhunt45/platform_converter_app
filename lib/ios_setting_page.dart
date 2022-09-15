import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IosSettingPage extends StatefulWidget {
  const IosSettingPage({Key? key}) : super(key: key);

  @override
  State<IosSettingPage> createState() => _IosSettingPageState();
}

class _IosSettingPageState extends State<IosSettingPage> {
  TextStyle textStyle = const TextStyle(
    color: Color(0xff54759e),
    fontSize: 17,
  );
  String time = "";
  String date = "";
  String period = "";
  DateTime currentDate = DateTime.now();
  DateTime? selectedDate = DateTime.now();
  TimeOfDay currentTime = TimeOfDay.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Column(
        children: [
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Date", style: textStyle),
              Text(
                "${currentDate.day}/${currentDate.month}/${currentDate.year}",
                style: textStyle,
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50,
            child: SizedBox.expand(
              child: CupertinoButton.filled(
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 220,
                        color: Colors.white,
                        child: CupertinoDatePicker(
                          initialDateTime: currentDate,
                          mode: CupertinoDatePickerMode.date,
                          onDateTimeChanged: (dateTime) {
                            setState(() {
                              currentDate = dateTime;
                            });
                          },
                        ),
                      );
                    },
                  );
                },
                child: const Text('Change Date'),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Time", style: textStyle),
              Text("${currentDate.hour}:${currentDate.minute} $period",
                  style: textStyle),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50,
            child: SizedBox.expand(
              child: CupertinoButton.filled(
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 220,
                        color: Colors.white,
                        child: CupertinoDatePicker(
                          initialDateTime: currentDate,
                          mode: CupertinoDatePickerMode.time,
                          use24hFormat: false,
                          onDateTimeChanged: (dateTime) {
                            setState(() {
                              currentDate = dateTime;
                              if (currentDate.hour > 11) {
                                period = "PM";
                              } else {
                                period = "AM";
                              }
                            });
                          },
                        ),
                      );
                    },
                  );
                },
                child: const Text('Change Time'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
