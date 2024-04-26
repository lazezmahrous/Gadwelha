import 'package:easy_date_timeline/easy_date_timeline.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';

import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:gadwelha/cubits/add_notes_cubit/add_notes_cubit.dart';

import 'package:gadwelha/generated/l10n.dart';

import 'package:gadwelha/pages/auto_schedule.dart';

import 'package:gadwelha/pages/setting.dart';

import 'package:gadwelha/widgets/bottom_sheet.dart';

import 'package:gadwelha/widgets/calendar_widget.dart';

import 'package:gadwelha/widgets/elevated_button_widget.dart';

import 'package:gadwelha/widgets/icon_button_widget.dart';

import 'package:gadwelha/widgets/loading_circular.dart';

import 'package:gadwelha/widgets/note_widget.dart';

import 'package:gadwelha/widgets/show_notes_widget.dart';

import 'package:gadwelha/widgets/text_field.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int dateSecound;

  late DateTime dataTime;

  final TextEditingController headMessageText = TextEditingController();

  final TextEditingController bodyMessageText = TextEditingController();

  final GlobalKey<FormState> formKay = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final ScrollController _scrollController = ScrollController();

  int _currentPage = 1;

  int _pageSize = 10; // Adjust based on your desired number of notes per page

  bool? taskVisibility = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    headMessageText.clear();

    bodyMessageText.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    final cubit = BlocProvider.of<AddNotesCubit>(context);

    return RefreshIndicator(
      onRefresh: cubit.getNotes,
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          actions: [
            IconButtonWidget(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const Setting();
                    },
                  ));
                },
                icon: const Icon(Icons.settings)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: IconButtonWidget(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const AutoSchedule();
                    },
                  ));
                },
                icon: const Icon(Icons.notifications_active_sharp),
              ),
            ),
          ],
          title: Image.asset(
            'assets/icon/app_icon.png',
            width: 80,
          ),
        ),
        body: Form(
          key: formKay,
          child: ListView(
            controller: _scrollController,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            children: [
              // show calendar start

              CalendarWidget(),

              // show calendar start

              // Add Notes Start >

              InkWell(
                onTap: () {
                  taskVisibility = !taskVisibility!;

                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'إضافة مهمة',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      IconButtonWidget(
                        icon: taskVisibility!
                            ? Icon(Icons.arrow_drop_down)
                            : Icon(Icons.add),
                        onPressed: () {
                          taskVisibility = !taskVisibility!;

                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
              ),

              Visibility(
                visible: taskVisibility!,
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: TextFieldWidget(
                                textController: headMessageText,
                                hintText: S.of(context).addNoteLable,
                                maxLength: 400,
                                onTap: (data) {
                                  headMessageText.text = data!;

                                  print(data);

                                  return null;
                                },
                                validator: (data) {
                                  if (data!.isEmpty) {
                                    return S.of(context).addNoteEror;
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: TextFieldWidget(
                                textController: bodyMessageText,
                                hintText: S.of(context).messageLable,
                                maxLength: 400,
                                maxLines: 3,
                                onChanged: (String data) {
                                  bodyMessageText.text = data;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButtonWidget(
                                      onPressed: () {
                                        if (formKay.currentState!.validate()) {
                                          formKay.currentState!.save();

                                          showModalBottomSheet(
                                            context: context,
                                            isScrollControlled: true,
                                            builder: (context) {
                                              return SizedBox(
                                                height: height * 0.4,
                                                child: BottomSheetWidget(
                                                  headMessageText:
                                                      headMessageText
                                                          .value.text,
                                                  bodyMessageText:
                                                      bodyMessageText.value.text
                                                              .isEmpty
                                                          ? ' '
                                                          : bodyMessageText
                                                              .value.text,
                                                ),
                                              );
                                            },
                                          );
                                        } else {}
                                      },
                                      text: S.of(context).addNoteButton,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),

              // Add Notes End >

              // Get Notes Start >

              ShowNotesWidget(),

              // Get Notes end >
            ],
          ),
        ),
      ),
    );
  }
}
