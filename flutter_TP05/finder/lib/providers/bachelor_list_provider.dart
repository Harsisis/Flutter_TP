import 'package:flutter/cupertino.dart';

import '../enums/gender_enum.dart';
import '../models/bachelor.dart';

class BachelorListProvider extends ChangeNotifier {
  late List<Bachelor> _likedBachelorsList = [];
  late List<Bachelor> _bachelorsList = [];
  // ignore: unused_field
  late List<Bachelor> _filteredBachelorsList = [];

  BachelorListProvider(List<Bachelor> bachelors) {
    _bachelorsList = bachelors;
    _filteredBachelorsList = bachelors;
    _likedBachelorsList = <Bachelor>[bachelors[0], bachelors[2], bachelors[4]];
  }

  void addLiked(Bachelor bachelor) {
    _likedBachelorsList.add(bachelor);
    notifyListeners();
  }

  void removeAllLiked() {
    _likedBachelorsList.clear();
    notifyListeners();
  }

  void removeOneLiked(Bachelor bachelor) {
    _likedBachelorsList.removeWhere((bach) =>
        bach.firstname == bachelor.firstname &&
        bach.lastname == bachelor.lastname);
    notifyListeners();
  }

  List<Bachelor> get getLikedBachelors {
    return _likedBachelorsList;
  }

  void add(Bachelor bachelor) {
    _bachelorsList.add(bachelor);
    notifyListeners();
  }

  void removeAll() {
    _bachelorsList.clear();
    notifyListeners();
  }

  void removeOne(Bachelor bachelor) {
    _bachelorsList.removeWhere((bach) => bach.id == bachelor.id);
    notifyListeners();
  }

  List<Bachelor> get getBachelors {
    return _bachelorsList.where((bach) => bach.hide == false).toList();
  }

  List<Bachelor> get getFilteredBachelors {
    return filterBachelorList(GenderEnum.all, "");
  }

  List<Bachelor> filterBachelorList(GenderEnum gender, String name) {
    return _bachelorsList
        .where((bach) => bach.hide == false)
        .where((bach) => bach.gender == gender || gender == GenderEnum.all)
        .where(
            (bach) => bach.firstname.toLowerCase().contains(name.toLowerCase()))
        .toList();
  }

  Bachelor getBachelorById(int id) {
    return _bachelorsList.firstWhere((bach) => bach.id == id);
  }

  void hide(Bachelor bachelor) {
    _bachelorsList.firstWhere((bach) => bach.id == bachelor.id).hide = true;
    notifyListeners();
  }

  void show(Bachelor bachelor) {
    _bachelorsList.firstWhere((bach) => bach.id == bachelor.id).hide = false;
    notifyListeners();
  }

  void setFilteredBachelors(List<Bachelor> list) {
    _filteredBachelorsList = list;
  }
}
