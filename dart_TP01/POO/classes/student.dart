import 'lesson.dart';

class Student {
  String _firstname = "";
  String _lastname = "";
  List<Lesson> _lessons = <Lesson>[];

  void set firstname(String firstname) {
    this._firstname = firstname;
  }

  String get firstname {
    return this._firstname;
  }

  void set lastname(String lastname) {
    this._lastname = lastname;
  }

  String get lastname {
    return this._lastname;
  }

  void set lessons(List<Lesson> lessons) {
    this._lessons = lessons;
  }

  void addLesson(Lesson lesson) {
    if (this._lessons == null) {
      this._lessons = <Lesson>[];
    }
    this._lessons.add(lesson);
  }

  List<Lesson> get lessons {
    return this._lessons;
  }
}
