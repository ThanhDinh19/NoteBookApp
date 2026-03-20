import 'dart:convert';

class NoteItem {
  final String id;
  final String title;
  final String content;
  final DateTime createdAt;
  final int colorValue;

  NoteItem({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.colorValue,
  });

  NoteItem copyWith({
    String? id,
    String? title,
    String? content,
    DateTime? createdAt,
    int? colorValue,
  }) {
    return NoteItem(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      colorValue: colorValue ?? this.colorValue,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'createdAt': createdAt.toIso8601String(),
      'colorValue': colorValue,
    };
  }

  factory NoteItem.fromMap(Map<String, dynamic> map) {
    return NoteItem(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      createdAt: DateTime.tryParse(map['createdAt'] ?? '') ?? DateTime.now(),
      colorValue: map['colorValue'] ?? 0xFFFFFFFF,
    );
  }

  String toJson() => jsonEncode(toMap());

  factory NoteItem.fromJson(String source) {
    return NoteItem.fromMap(jsonDecode(source));
  }
}