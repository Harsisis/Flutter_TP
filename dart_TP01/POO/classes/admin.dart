import 'User.dart';

class Admin extends User {
  int _grade = 1;

  Admin(super.firstName, super.lastName, super.email);

  void set grade(int grade) {
    this._grade = grade;
  }

  int get grade {
    return this._grade;
  }
}
