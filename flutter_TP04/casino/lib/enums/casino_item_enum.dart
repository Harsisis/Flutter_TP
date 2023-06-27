enum CasinoItemEnum {
  bar(path: "assets/images/bar.png"),
  cerise(path: "assets/images/cerise.png"),
  cloche(path: "assets/images/cloche.png"),
  diamant(path: "assets/images/diamant.png"),
  ferACheval(path: "assets/images/fer-a-cheval.png"),
  pasteque(path: "assets/images/pasteque.png"),
  sept(path: "assets/images/sept.png");

  const CasinoItemEnum({
    required this.path,
  });

  final String path;

  static CasinoItemEnum? getByValue(int value) {
    for (CasinoItemEnum elem in CasinoItemEnum.values) {
      if (elem.index == value) {
        return elem;
      }
    }
    return null;
  }
}
