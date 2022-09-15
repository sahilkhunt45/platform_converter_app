// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextStyle textStyle = const TextStyle(
    color: Color(0xff54759e),
    fontSize: 17,
  );
  String time = "";
  String monthw = "";

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
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Date", style: textStyle),
              Text(
                "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                style: textStyle,
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 45,
            child: SizedBox.expand(
              child: ElevatedButton(
                onPressed: () async {
                  DateTime? res = await showDatePicker(
                    context: context,
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: ThemeData(
                          primarySwatch: Colors.grey,
                          splashColor: Colors.black,
                          textTheme: const TextTheme(
                            subtitle1: TextStyle(color: Colors.black),
                            button: TextStyle(color: Colors.black),
                          ),
                          colorScheme: const ColorScheme.light(
                            primary: Color(0xff54759e),
                          ),
                          dialogBackgroundColor: Colors.white,
                        ),
                        child: child ?? const Text(""),
                      );
                    },
                    initialDate: currentDate,
                    firstDate: DateTime(2010),
                    lastDate: DateTime(2050),
                    helpText: "Calendar",
                    selectableDayPredicate: (day) {
                      if (day.isAfter(DateTime.now()
                              .subtract(const Duration(days: 1))) &&
                          day.isBefore(
                              DateTime.now().add(const Duration(days: 10)))) {
                        return true;
                      }
                      return false;
                    },
                  );
                  setState(() {
                    selectedDate = res;
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  primary: const Color(0xff54759e),
                  enableFeedback: true,
                ),
                child: const Text("Change Date"),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Time", style: textStyle),
              Text(
                  "${selectedTime.hour}:${selectedTime.minute} ${selectedTime.period.name}",
                  style: textStyle),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 45,
            child: SizedBox.expand(
              child: ElevatedButton(
                onPressed: () async {
                  TimeOfDay? res = await showTimePicker(
                    context: context,
                    initialTime: currentTime,
                  );
                  setState(() {
                    time = res.toString();
                    selectedTime = res!;
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  primary: const Color(0xff54759e),
                  enableFeedback: true,
                ),
                child: const Text("Change Time"),
              ),
            ),
          ),
        ],
      ),
    );
  }
  //
  // String findMonth() {
  //   if (month == "1") {
  //     monthname = "Jan";
  //   } else if (month == "2") {
  //     monthname = "Feb";
  //   } else if (month == "3") {
  //     monthname = "Mar";
  //   } else if (month == "4") {
  //     monthname = "Apr";
  //   } else if (month == "5") {
  //     monthname = "May";
  //   } else if (month == "6") {
  //     monthname = "Jun";
  //   } else if (month == "7") {
  //     monthname = "Jul";
  //   } else if (month == "8") {
  //     monthname = "Aug";
  //   } else if (month == "9") {
  //     monthname = "Sep";
  //   } else if (month == "10") {
  //     monthname = "Oct";
  //   } else if (month == "11") {
  //     monthname = "Nov";
  //   } else if (month == "12") {
  //     monthname = "Dec";
  //   }
  //   return monthname;
  // }
}
