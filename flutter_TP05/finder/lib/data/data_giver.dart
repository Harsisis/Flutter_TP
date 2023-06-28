import 'dart:math';

import 'package:finder/enums/gender_enum.dart';
import 'package:finder/models/bachelor.dart';
import 'package:faker/faker.dart';

class DataGiver {
  final String imagePath = "./assets/images/";

  late List<Bachelor> bachelors;

  DataGiver() {
    bachelors = [];
    for (int i = 0; i < 30; i++) {
      Random random = Random();
      GenderEnum genderEnum = GenderEnum.getById(i % 2);

      List<GenderEnum> searchFor = [];
      if (random.nextBool()) {
        searchFor.add(GenderEnum.female);
      }
      if (random.nextBool()) {
        searchFor.add(GenderEnum.male);
      }

      bachelors.add(Bachelor(
          firstname: faker.person.firstName(),
          lastname: faker.person.lastName(),
          gender: genderEnum,
          avatar: "$imagePath${genderEnum.gender}-${random.nextInt(15) + 1}.png",
          job: faker.job.title(),
          description: faker.lorem.sentence(),
          searchFor: searchFor));
    }
  }
}
