import 'dart:convert';

class Note {
  String note;
  DateTime createdAt;

  Note({
    required this.note,
    required this.createdAt,
  });

  factory Note.fromJson(String value) {
    final data = json.decode(value);
    return Note(
      note: data['note'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(data['createdAt']),
    );
  }

  String toJson() {
    return json.encode({
      'note': note,
      'createdAt': createdAt.millisecondsSinceEpoch,
    });
  }
}
