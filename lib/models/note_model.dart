import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  final DateTime dateTime;
  @HiveField(1)
  final int difference;
  @HiveField(2)
  final String text;
  @HiveField(3)
  final String description;

  NoteModel({
    required this.dateTime,
    required this.difference,
    required this.text,
    required this.description,
  });
}
