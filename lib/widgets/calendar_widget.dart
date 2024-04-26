import 'package:easy_date_timeline/easy_date_timeline.dart';


import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:gadwelha/cubits/get_notes_using_calendar_cubit/get_notes_using_calendar_cubit.dart';


import 'package:intl/intl.dart';


class CalendarWidget extends StatelessWidget {

  const CalendarWidget({super.key});


  @override

  Widget build(BuildContext context) {

    final cubit = BlocProvider.of<GetNotesUsingCalendarCubit>(context);


    return Padding(

      padding: const EdgeInsets.only(bottom: 15),

      child: EasyDateTimeLine(

        initialDate: DateTime.now(),

        onDateChange: (selectedDate) {

          cubit.getNotes(date: selectedDate);


          print(

            DateFormat('EEE, h:mm a', 'ar').format(

              selectedDate,

            ),

          );


          print(selectedDate);

        },

        headerProps: const EasyHeaderProps(

          monthPickerType: MonthPickerType.switcher,

          dateFormatter: DateFormatter.fullDateDMY(),

        ),

        dayProps: const EasyDayProps(

          dayStructure: DayStructure.dayStrDayNum,

          activeDayStyle: DayStyle(

            decoration: BoxDecoration(

              borderRadius: BorderRadius.all(Radius.circular(8)),

              gradient: LinearGradient(

                begin: Alignment.topCenter,

                end: Alignment.bottomCenter,

                colors: [

                  Color(0xff3371FF),

                  Color(0xff8426D6),

                ],

              ),

            ),

          ),

        ),

      ),

    );

  }

}

