import 'package:fan_app/ui/widget/navbar.dart';
import 'package:fan_app/utils/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  late final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  bool isLoggined = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBar(
        onPress: () => Get.offAndToNamed("/login"),
        icon: isLoggined ? Icons.people : Icons.login_rounded,
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2090, 3, 14),
            focusedDay: DateTime.now(),
            headerStyle: const HeaderStyle(
              titleCentered: true,
              titleTextStyle: TextStyle(
                color: MainColors.primary,
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            calendarStyle: const CalendarStyle(
              todayDecoration: BoxDecoration(
                color: MainColors.primary,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: MainColors.primary,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
