import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gadwelha/Services/play_sound.dart';
import 'package:gadwelha/cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:gadwelha/constanc.dart';
import 'package:gadwelha/generated/l10n.dart';
import 'package:gadwelha/models/note_model.dart';
import 'package:gadwelha/widgets/elevated_button_widget.dart';
import 'package:intl/intl.dart';

import '../pages/start_count_down.dart';

class NoteWidget extends StatefulWidget {
  const NoteWidget({
    super.key,
    required this.note,
    required this.onPressedDelete,
  });
  final NoteModel note;
  final VoidCallback onPressedDelete;

  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  List<Timer> countdownTimers = [];
  String timerTextAr = '';
  String timerTextEn = '';
  late Timer countdownTimer;
  bool showButtons = false;
  bool taskDone = false;

  // void startCountdown() async {
  //   final countdownTimer =
  //       Timer.periodic(const Duration(minutes: 1), (timer) async {
  //     final Duration difference = widget.note.dateTime
  //         .add(Duration(days: 1))
  //         .difference(DateTime.now());
  //     if (difference.isNegative) {
  //       timer.cancel();
  //     } else {
  //       if (timer.m) {

  //       } else {

  //       }
  //       setState(() {});
  //     }
  //   });

  //   countdownTimers.add(countdownTimer); // Add the new timer to the list
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // final Duration difference = widget.note.dateTime.difference(DateTime.now());
    print(widget.note.dateTime.minute);
    return Container(
      // color: Colors.blue,
      width: width - 50,
      child: InkWell(
        onLongPress: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext cx) {
              return SizedBox(
                height: height / 4,
                child: Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(child: Text(S.of(context).alertDialogTitle)),
                          SizedBox(
                            height: 30,
                          ),
                          ElevatedButtonWidget(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              text: S.of(context).alertDialogOptionTow),
                          ElevatedButtonWidget(
                              onPressed: () {
                                widget.note.delete();
                                BlocProvider.of<AddNotesCubit>(context)
                                    .getNotes();
                                Navigator.pop(context);
                              },
                              text: S.of(context).alertDialogOptionOne)
                        ]),
                  ),
                ),
              );
            },
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Card(
                color: Constanc.kColorGray,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(19),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth: width - 150,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.note.text,
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      widget.note.description,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      DateFormat('EEE, h:mm a', 'ar').format(
                                        widget.note.dateTime,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Checkbox(
                            value: taskDone,
                            onChanged: (newValue) async {
                              setState(() {
                                taskDone = newValue!;
                              });
                              if (newValue == true) {
                                PlaySound.play_sound(
                                  soundSource: 'audio/success.mp3',
                                );

                                widget.note.delete();
                                EasyLoading.showSuccess('success');
                                BlocProvider.of<AddNotesCubit>(context)
                                    .getNotes();
                              } else {
                                BlocProvider.of<AddNotesCubit>(context)
                                    .getNotes();
                              }
                              print(newValue);
                            },
                          ),
                          // SizedBox(
                          //   height: 80,
                          //   width: 80,
                          //   child: LiquidCircularProgressIndicator(
                          //     value: max(
                          //       0.0,
                          //       min(
                          //         difference.inMinutes / widget.note.difference,
                          //         1.0,
                          //       ),
                          //     ),
                          //     valueColor: difference.isNegative
                          //         ? AlwaysStoppedAnimation(Colors.black)
                          //         : AlwaysStoppedAnimation(
                          //             Constanc.kColor,
                          //           ),
                          //     direction: Axis.vertical,
                          //     center: difference.isNegative
                          //         ? new Text(
                          //             'الموعد إنتهي',
                          //             style: TextStyle(
                          //               fontSize: 9,
                          //             ),
                          //           )
                          //         : new Text(
                          //             ' ${difference.inMinutes} دقيقة',
                          //             style: TextStyle(
                          //               fontSize: 9,
                          //             ),
                          //           ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButtonWidget(
                              onPressed: () {
                                if (widget.note.dateTime
                                    .isBefore(DateTime.now())) {
                                  EasyLoading.showToast(
                                      S.of(context).timeIsOver);
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => StartCountDown(
                                        note: widget.note,
                                        scheduledTime: widget.note.dateTime,
                                      ),
                                    ),
                                  );
                                }
                              },
                              text: S.of(context).startCountDowen,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
