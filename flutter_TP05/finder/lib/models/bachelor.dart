import 'package:finder/enums/gender_enum.dart';

class Bachelor {
  String firstname;
  String lastname;
  GenderEnum gender;
  String avatar;
  List<GenderEnum>? searchFor;
  String? job;
  String? description;

  Bachelor(
      {required this.firstname,
      required this.lastname,
      required this.gender,
      required this.avatar,
      this.searchFor = const [],
      this.job = "",
      this.description = ""});
}
