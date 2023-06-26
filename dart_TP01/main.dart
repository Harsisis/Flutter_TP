import 'service/collection_dart.dart';
import 'entity/planet.dart';
import 'entity/solar_system_element.dart';
import 'service/lambda_dart.dart';
import 'service/number_dart.dart';
import 'service/string_dart.dart';

void main() {
  print("### String exercices ###");
// 1
  print("\n## 1");
  helloWorld();
// 2
  print("\n## 2");
  printBis("Hello World Bis");
// 3
  print("\n## 3");
  const String HELLO = "Hello";
  const String WORLD = "World";
  printInterpolation(HELLO, WORLD);
// 4
  print("\n## 4");
  printConcatenation(HELLO, WORLD);
// 5
  print("\n## 5");
  printFirstWord("Hello World !");
// 6
  print("\n## 6");
  const String HELLO_WORLD = "Hello World !";
  printStringLenght(HELLO_WORLD);
//7
  print("\n## 7");
  const String WELCOME = "Hello, World !";
  printReplaceLetters(WELCOME);
//8
  print("\n## 8");
  const WELCOME_WORLD = "Hello World";
  List<String> words = getListOfWords(WELCOME_WORLD);
  print(words.length);
//9
  print("\n## 9");
  String pwd = "";
  printCheckPassword(pwd);
  pwd = "notEmpty";
  printCheckPassword(pwd);
//10
  print("\n## 10");
  String mail = "notAMail";
  printCheckMail(mail);
  mail = "mail@mail.com";
  printCheckMail(mail);

  print("### Number exercices ###");
  print("\n## 1");
  int price1 = 10;
  double price2 = 5.5;
  printPrices(price1, price2);

  print("\n## 2");
  double sum = getSum(price1, price2);
  print(sum);

  print("\n## 3");
  print(sum.runtimeType);

  print("\n## 4");
  print(sum.round());

  print("\n## 5");
  const String STR_SEVEN = "7";
  int numSeven = toInteger(STR_SEVEN);
  print(numSeven.runtimeType);

  print("### Collections exercices ###");
  List<String> planets = setPlanets();
  print("\n## 1");
  showUnAlphabeticalPlanets(planets);

  print("\n## 2");
  setToUpperCase(planets);
  showUnAlphabeticalPlanets(planets);

  print("\n## 3");
  showFirstLetter(planets);

  print("\n## 4");
  showIndexedPlanets(planets);

  print("\n## 5");
  printOnlyPlanetsWithVoyelle(planets);

  print("\n## 6");
  planets.add("PLUTON");
  showUnAlphabeticalPlanets(planets);

  print("\n## 7");
  List<Planet> planetTypeList = setPlanetTypeList();
  showPlanetsListByDescendingDistanceFromEarth(planetTypeList);

  print("\n## 8");
  Map<String, String> map = getApolloMap();
  print(map);
  print("#");
  print(map["07_1971"]);
  print("#");
  print(map.keys);
  print("#");
  print(map.values);

  print("\n## 9");
  print(map["07_1969"]);
  map["07_1969"] = "Neil Armstrong + Buzz Aldrin";
  print(map["07_1969"]);

  print("\n## 10");
  List<SolarSystemElement> solarSystem = getSolarSystem();
  solarSystem.forEach((element) {
    print("${element.name} - ${element.kind.name}");
  });

  print("### lambda exercices ###");
  print("\n## 1");
  sayHello("Gauthier");

  print("\n## 2");
  print(somme(5, 6));
  print("\n## 3");
  print(sumMany([1, 2, 3, 4, 5, 6, 7, 8, 9]));
  print("\n## 4");
  sumAndPrint(5, 2, true);
  sumAndPrint(5, 7, false);
  print("\n## 5");
  sumAndFormat(4, 5, true);
  sumAndFormat(4, 5);
  print("\n## 6");
  print(reversedString("hello"));
  print("\n## 7");
  for (int i = 0; i < 17; i++) {
    print(fibonacci(i));
  }
}
