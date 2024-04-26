import 'package:flutter/material.dart';
import 'package:gadwelha/Services/play_sound.dart';
import 'package:gadwelha/models/note_model.dart';
import 'package:gadwelha/pages/count_down.dart';
import 'package:gadwelha/widgets/icon_button_widget.dart';

class StartCountDown extends StatefulWidget {
  StartCountDown({super.key, required this.note, required this.scheduledTime});
  final NoteModel note;

  final DateTime scheduledTime;

  @override
  State<StartCountDown> createState() => _StartCountDownState();
}

class _StartCountDownState extends State<StartCountDown> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StartCountDown'),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        children: [
          Row(
            children: [
              // IconButtonWidget(icon: Icon(Icons.queue_music), onPressed: () {}),
              // Column(
              //   children: [
              IconButtonWidget(
                  icon: Icon(Icons.cloud_rounded),
                  onPressed: () {
                    PlaySound.play_sound(soundSource: 'audio/rain.mp3');
                  }),
              IconButtonWidget(
                  icon: Icon(Icons.pause_outlined),
                  onPressed: () async {
                    PlaySound.stop_sound(soundSource: 'audio/rain.mp3');
                  })
              // ],
              // ),
            ],
          ),
          CountDown(
            note: widget.note,
            scheduledTime: widget.scheduledTime,
          ),
        ],
      ),
    );
  }
}
