# Alarm App

A simple and battery-efficient alarm app built with Flutter. This app ensures that the alarm triggers at the selected time, whether the app is open or closed. It schedules alarms efficiently without draining the battery.

## Features

- **Alarm Scheduling:** Users can select the desired alarm time using Cupertino pickers.
- **Automatic Rescheduling:** If the selected time is earlier than the current time (considering AM/PM), the alarm is automatically scheduled for the next day.
- **Persistent Alarms:** The alarm triggers even if the app is closed.
- **Battery Efficiency:** Uses efficient background scheduling to avoid unnecessary battery drain.
- **Notifications & Sound:** When the alarm triggers, a notification is displayed, and a sound plays.
- **Single Active Alarm:** If a new alarm time is selected, the previous alarm is canceled, and the new alarm is scheduled.

## Technologies Used

- **Flutter** for UI and application logic
- **Cupertino Pickers** for time selection
- **Flutter Local Notifications** for displaying notifications when the alarm triggers

## Usage

1. Open the app.
2. Select an alarm time using the Cupertino time picker.
3. The alarm will be scheduled for the selected time.
4. If the selected time is in the past (relative to AM/PM), the alarm will automatically be scheduled for the next day.
5. When the alarm triggers, a notification appears, and a sound plays.
6. Selecting a new alarm time cancels the previous one and schedules a new alarm.



