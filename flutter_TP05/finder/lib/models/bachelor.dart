import 'package:finder/enums/gender_enum.dart';

class Bachelor {
  int id;
  String firstname;
  String lastname;
  GenderEnum gender;
  String avatar;
  List<GenderEnum>? searchFor;
  String? job;
  String? description;

  Bachelor(
      {required this.id,
      required this.firstname,
      required this.lastname,
      required this.gender,
      required this.avatar,
      this.searchFor = const [],
      this.job = "",
      this.description = ""});

  @override
  String toString() {
    return "${gender.gender} : $firstname $lastname | \tavatar: $avatar | job: $job | description: $description";
  }
}
