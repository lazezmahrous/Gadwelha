// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gadwelha/core/constant/app_images.dart';

import 'package:gadwelha/cubits/add_notes_cubit/add_notes_cubit.dart';

import 'package:gadwelha/cubits/get_notes_using_calendar_cubit/get_notes_using_calendar_cubit.dart';

import 'package:gadwelha/widgets/loading_circular.dart';

import 'package:gadwelha/widgets/note_widget.dart';

class ShowNotesWidget extends StatelessWidget {
  const ShowNotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AddNotesCubit>(context);
    return BlocBuilder<GetNotesUsingCalendarCubit, GetNotesUsingCalendarState>(
      builder: (context, calendarState) {
        if (calendarState is GetCalendarDateSuccess) {
          return BlocBuilder<AddNotesCubit, AddNotesState>(
            builder: (context, state) {
              if (state is AddNotesGetNotesSuccess) {
                if (state.notes
                    .where(
                        (note) => note.dateTime.day == calendarState.date.day)
                    .isEmpty) {
                  AppImages.stickers.shuffle();
                  return Column(
                    children: [
                      Text('لا مهام في هذا اليوم'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(AppImages.stickers.first),
                      ),
                    ],
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 5,
                    ),
                    child: CustomScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      slivers: [
                        SliverList.builder(
                          itemCount: state.notes
                              .where((note) =>
                                  note.dateTime.day == calendarState.date.day)
                              .length,
                          itemBuilder: (context, index) {
                            print('s hut upp ${state.notes[index]}');
                            print('${index}');
                            if (state.notes
                                .where((note) =>
                                    note.dateTime.day == calendarState.date.day)
                                .isEmpty) {
                              print('object');
                              return Column(
                                children: [
                                  Text('لا مهام في هذا اليوم'),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                        Image.asset(AppImages.stickers.first),
                                  ),
                                ],
                              );
                            } else {
                              return NoteWidget(
                                note: state.notes[index],
                                onPressedDelete: () async {
                                  state.notes[index].delete();
                                  cubit.getNotes();
                                  // await PlaySound.success();
                                },
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  );
                }
              } else if (state is AddNotesLoading ||
                  state is AddNotesGetNotesLoading) {
                return const LoadingCircular();
              } else if (state is AddNotesGetNotesError) {
                return Text(state.message);
              } else {
                return Column(
                  children: [
                    Text('لا مهام في هذا اليوم'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(AppImages.stickers.first),
                    ),
                  ],
                );
              }
            },
          );
        } else {
          AppImages.stickers.shuffle();
          return Column(
            children: [
              Text('لا مهام في هذا اليوم'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(AppImages.stickers.first),
              ),
            ],
          );
        }
      },
    );
  }
}
