import 'package:hive/hive.dart';

part 'schedule_model.g.dart';

@HiveType(typeId: 1)
class ScheduleModel extends HiveObject{
  @HiveField(0)
  final DateTime dateTime;
  @HiveField(1)
  final String text;
  @HiveField(2)
  final int id;
  ScheduleModel({
    required this.dateTime,
    required this.text,
    required this.id,
  });
}
