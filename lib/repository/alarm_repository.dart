import 'dart:async';
import 'dart:math';

import 'package:alarm_app_updated/main.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlarmRepository{
  // Store alarm data in shared preferences
  Future<void> storeAlarmData(int hr,int min,String period,int alarmTaskId)async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setInt("Hours", hr);
    prefs.setInt("Minutes", min);
    prefs.setString("Period", period);
    prefs.setInt("alarmTaskId", alarmTaskId);
  }
  // get alarm data from shared preferences
   Stream<(int?,int?,String?)> getAlarmData()async*{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    var alarmData=(prefs.getInt("Hours"),prefs.getInt("Minutes"),prefs.getString("Period"));
    yield alarmData;

  }
  // Retrieve the stored alarm task ID
  Future<int?> getExistingTaskId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("alarmTaskId");
  }
  // Sets the Alarm
  void setAlarm(int selectedHour,int selectedMinute,String selectedPeriod)async{
    try {
      final now = DateTime.now();
      int hour = selectedHour;
      if (selectedPeriod == "PM" && hour != 12) hour += 12;
      if (selectedPeriod == "AM" && hour == 12) hour = 0;
      DateTime alarmTime = DateTime(
        now.year, now.month, now.day, hour, selectedMinute,);
      if (alarmTime.isBefore(now)) {
        alarmTime = alarmTime.add(
            const Duration(days: 1)); // Move to the next day if time has passed
      }
      // Cancel any existing alarm before scheduling a new one.
      int? oldTaskId = await getExistingTaskId();
      if (oldTaskId != null) {
        await AndroidAlarmManager.cancel(oldTaskId);
        Fluttertoast.showToast(msg: "Cancelled existing alarm (task ID: $oldTaskId)");
      }
      int taskId = Random(5679).nextInt(5879);
      Duration delay = alarmTime.difference(DateTime.now());
      // Schedule the alarm
      await AndroidAlarmManager.oneShot(
          delay,
          taskId,
          triggerAlarmNotification,
          exact: false, // Helps efficient battery usage
          wakeup: true, // Ensure Device is only wakes up when alarm is required
          rescheduleOnReboot: true, // Ensures alarm persists after reboot
        );
      await storeAlarmData(hour, selectedMinute, selectedPeriod,taskId);
      Fluttertoast.showToast(msg: "Alarm has been set to $alarmTime",toastLength: Toast.LENGTH_LONG);
    }
    catch (e){
        Fluttertoast.showToast(msg: e.toString());
    }

  }
  static Future<void> clearAlarmData()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setInt("Hours", 0);
    prefs.setInt("Minutes", 0);
    prefs.remove("alarmTaskId");
  }
  // Entry Point
  @pragma('vm:entry-point')
  static Future<void> triggerAlarmNotification() async {
    try {
      const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
        'alarm_channel', // Unique ID
        'Alarm Notification',
        importance: Importance.high,
        priority: Priority.high,
        fullScreenIntent: true,
        sound: RawResourceAndroidNotificationSound('alarm_sound'),
        playSound: true,
      );

      const NotificationDetails notificationDetails = NotificationDetails(
          android: androidDetails);

      await flutterLocalNotificationsPlugin.show(
        0,
        "Alarm",
        "Alarm Time",
        notificationDetails,
      );
        await clearAlarmData();

    }
    catch (e){
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}