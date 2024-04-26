import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gadwelha/Services/notifcations.dart';
import 'package:gadwelha/widgets/back_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../generated/l10n.dart';

class AutoSchedule extends StatefulWidget {
  const AutoSchedule({super.key});
  @override
  State<AutoSchedule> createState() => _AutoScheduleState();
}

class _AutoScheduleState extends State<AutoSchedule> {
  Future<bool?> geteyeSafetyAlert() async {
    final prefs = await SharedPreferences.getInstance();
    if (await prefs.getBool('eyeSafetyAlert') != null) {
      return await prefs.getBool('eyeSafetyAlert');
    } else {
      await prefs.setBool('eyeSafetyAlert', false);
      return await prefs.getBool('eyeSafetyAlert');
    }
  }

  Future<bool?> getbackVertebraeSafetyAlerts() async {
    final prefs = await SharedPreferences.getInstance();
    if (await prefs.getBool('backVertebraeSafetyAlerts') != null) {
      return await prefs.getBool('backVertebraeSafetyAlerts');
    } else {
      await prefs.setBool('backVertebraeSafetyAlerts', false);
      return await prefs.getBool('backVertebraeSafetyAlerts');
    }
  }

  Future<void> cancelNotifaction({required String channelKeysName}) async {
    final prefs = await SharedPreferences.getInstance();
    if (channelKeysName == 'eyeSafetyAlert') {
      await prefs.setBool('eyeSafetyAlert', false);
      await NotificationService.cancelNotification(
        channelKeysName: channelKeysName,
      );
    } else if (channelKeysName == 'backVertebraeSafetyAlerts') {
      await prefs.setBool('backVertebraeSafetyAlerts', false);
      await NotificationService.cancelNotification(
        channelKeysName: channelKeysName,
      );
    }
    setState(() {});
  }

  bool? isRepet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ButtonBack(
          context: context,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        children: [
          Card(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 5,
                  ),
                  child: FutureBuilder<bool?>(
                    future: geteyeSafetyAlert(),
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            CheckboxListTile(
                              title: Text(S.of(context).eyeSafetyAlert),
                              subtitle: Text(
                                S.of(context).eyeSafetyAlertDescription,
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                              value: snapshot.data,
                              onChanged: (bool? newValue) async {
                                if (newValue == true) {
                                  final prefs =
                                      await SharedPreferences.getInstance();
                                  await prefs.setBool(
                                      'eyeSafetyAlert', newValue!);
                                  await NotificationService
                                      .showScheduleNotification(
                                    title: S.of(context).notifcationHead,
                                    body:
                                        S.of(context).eyeSafetyAlertNotifcation,
                                    chanelKay: 'eyeSafetyAlert',
                                    scheduled: true,
                                    repeats: true,
                                    interval: 20,
                                  );
                                  setState(() {});
                                } else {
                                  await cancelNotifaction(
                                    channelKeysName: 'eyeSafetyAlert',
                                  );
                                }
                              },
                              controlAffinity: ListTileControlAffinity
                                  .leading, //  <-- leading Checkbox
                            ),
                          ],
                        );
                      } else {
                        return const CircularProgressIndicator.adaptive();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 5,
              ),
              child: FutureBuilder(
                future: getbackVertebraeSafetyAlerts(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    return CheckboxListTile(
                      title: Text(S.of(context).backVertebraeSafetyAlerts),
                      subtitle: Text(
                        S.of(context).backVertebraeSafetyAlertsDescription,
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      value: snapshot.data,
                      onChanged: (bool? newValue) async {
                        if (newValue == true) {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setBool(
                              'backVertebraeSafetyAlerts', newValue!);
                          await NotificationService.showScheduleNotification(
                            title: S.of(context).notifcationHead,
                            body: S.of(context).backVertebraeSafetyAlertsNotifcation,
                            chanelKay: 'backVertebraeSafetyAlerts',
                            scheduled: true,
                            repeats: true,
                            interval: 50,
                          );
                          setState(() {});
                        } else {
                          await cancelNotifaction(
                            channelKeysName: 'backVertebraeSafetyAlerts',
                          );
                        }
                      },
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
                    );
                  } else {
                    return const CircularProgressIndicator.adaptive();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
