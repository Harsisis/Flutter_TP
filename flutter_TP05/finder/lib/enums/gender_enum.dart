enum GenderEnum {
  female(gender: "woman"),
  male(gender: "man");

  const GenderEnum({
    required this.gender,
  });

  final String gender;

  static GenderEnum getById(int id) {
    for (GenderEnum elem in GenderEnum.values) {
      if (elem.index == id) {
        return elem;
      }
    }
    return GenderEnum.male;
  }
}
