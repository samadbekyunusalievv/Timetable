class LessonEntity {
  String? lessons;
  String? teacher;
  String? classroom;

  LessonEntity({
    this.lessons,
    this.teacher,
    this.classroom,
  });

  LessonEntity.fromJson(Map<String, dynamic> json) {
    lessons = json['lessons'] ?? "";
    teacher = json['teacher'] ?? "";
    classroom = json['classroom'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['lessons'] = lessons;
    data['teacher'] = teacher;
    data['classroom'] = classroom;
    return data;
  }
}
