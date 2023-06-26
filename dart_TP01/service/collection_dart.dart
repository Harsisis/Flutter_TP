import '../entity/planet.dart';
import '../entity/solar_system_element.dart';
import '../enums/kind_enum.dart';

List<String> setPlanets() {
  List<String> planets = <String>[];
  planets.add("Terre");
  planets.add("Mars");
  planets.add("Mercure");
  planets.add("Saturne");
  planets.add("Vénus");
  planets.add("Neptune");
  planets.add("Uranus");
  planets.add("Jupiter");

  return planets;
}

void showUnAlphabeticalPlanets(List<String> planets) {
  planets.sort();
  planets = new List.from(planets.reversed);

  planets.forEach((element) {
    print(element);
  });
}

void setToUpperCase(List<String> planets) {
  for (var i = 0; i < planets.length; i++) {
    planets[i] = planets[i].toUpperCase();
  }
}

void showFirstLetter(List<String> planets) {
  int count = 0;
  while (count < planets.length) {
    print(planets[count].substring(0, 1));
    count++;
  }
}

void showIndexedPlanets(List<String> planets) {
  int count = 0;
  do {
    print("${count + 1} - ${planets[count]}");
    count++;
  } while (count < planets.length);
}

void printOnlyPlanetsWithVoyelle(List<String> planets) {
  int count = 0;
  while (count < planets.length) {
    if (RegExp(r"^[aeiouy]", caseSensitive: false)
        .hasMatch(planets[count].substring(0, 1))) {
      print(planets[count]);
    }
    count++;
  }
}

List<Planet> setPlanetTypeList() {
  List<Planet> planets = <Planet>[];

  planets.add(new Planet("Mercure", 91.69));
  planets.add(new Planet("Saturne", 1275));
  planets.add(new Planet("Neptune", 4351.40));
  planets.add(new Planet("Jupiter", 628.73));
  planets.add(new Planet("Mars", 78.34));
  planets.add(new Planet("Venus", 41.40));
  planets.add(new Planet("Uranus", 2723.95));

  return planets;
}

void showPlanetsListByDescendingDistanceFromEarth(List<Planet> planets) {
  planets.sort((a, b) => a.distanceFromEarth.compareTo(b.distanceFromEarth));
  planets.forEach((element) {
    print("${element.name} - ${element.distanceFromEarth}");
  });
}

Map<String, String> getApolloMap() {
  Map<String, String> apolloMap = new Map<String, String>();
  apolloMap["07_1969"] = "Apollo 11";
  apolloMap["11_1969"] = "Apollo 12";
  apolloMap["02_1971"] = "Apollo 14";
  apolloMap["07_1971"] = "Apollo 15";
  apolloMap["04_1972"] = "Apollo 16";
  apolloMap["12_1972"] = "Apollo 17";
  return apolloMap;
}

List<SolarSystemElement> getSolarSystem() {
  List<SolarSystemElement> solarSystem = <SolarSystemElement>[];
  solarSystem.add(new SolarSystemElement("sun", KindEnum.star));
  solarSystem.add(new SolarSystemElement("earth", KindEnum.planet));
  solarSystem.add(new SolarSystemElement("moon", KindEnum.satellite));
  solarSystem.add(new SolarSystemElement("pluton", KindEnum.satellite));
  return solarSystem;
}
