import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gadwelha/Services/notifcations.dart';
import 'package:gadwelha/cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:gadwelha/generated/l10n.dart';
import 'package:gadwelha/models/note_model.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({
    super.key,
    required this.headMessageText,
    required this.bodyMessageText,
  });

  final String headMessageText;
  final String bodyMessageText;
  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  // final TextEditingController messageText = TextEditingController();
  final GlobalKey<FormState> formKay = GlobalKey();
  late int dateSecound;
  DateTime? dataTime;
  bool isRepet = false;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AddNotesCubit>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: CheckboxListTile(
                title: Text(
                  S.of(context).repeatAlert,
                ),
                subtitle: Text(
                  S.of(context).repeatHint,
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
                value: isRepet,
                onChanged: (bool? newValue) {
                  setState(() {
                    isRepet = newValue!;
                    print(isRepet);
                  });
                },
                controlAffinity:
                    ListTileControlAffinity.leading, //  <-- leading Checkbox
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: SizedBox(
                height: 150,
                child: CupertinoDatePicker(
                  initialDateTime: DateTime.now(),
                  showDayOfWeek: true,
                  onDateTimeChanged: (DateTime dateTime) {
                    dataTime = dateTime;
                    final date = dataTime!.difference(DateTime.now());
                    dateSecound = date.inSeconds;
                    setState(() {});
                  },
                  mode: CupertinoDatePickerMode.dateAndTime,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      Navigator.pop(context);
                      if (dataTime != null) {
                        if (dataTime!.isAfter(DateTime.now())) {
                          cubit.addNote(
                            note: NoteModel(
                              dateTime: dataTime!,
                              difference: dataTime!
                                  .difference(DateTime.now())
                                  .inMinutes,
                              text: widget.headMessageText,
                              description: widget.bodyMessageText.isEmpty
                                  ? ''
                                  : widget.bodyMessageText,
                            ),
                          );
                          await NotificationService.showNotification(
                            title: widget.headMessageText,
                            body: widget.bodyMessageText.isEmpty
                                ? widget.headMessageText
                                : widget.bodyMessageText,
                            scheduled: true,
                            scheduledDate: dataTime,
                            interval: dateSecound,
                            repeats: isRepet,
                          );
                          cubit.getNotes();
                          EasyLoading.showSuccess(
                              S.of(context).schedulingSuccess);
                        } else {
                          EasyLoading.showError(S.of(context).timeIsOver);
                        }
                      } else {
                        EasyLoading.showError(S.of(context).addNoteEror);
                      }
                    },
                    icon: const Icon(
                      Icons.done,
                    ),
                    label: Text(
                      S.of(context).schedulingButton,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
