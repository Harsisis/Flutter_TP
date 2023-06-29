import 'package:flutter/cupertino.dart';

import '../models/bachelor.dart';

class BachelorList extends ChangeNotifier {
  final List<Bachelor> _likedBachelorsList = [];
  late List<Bachelor> _bachelorsList = [];

  BachelorList(List<Bachelor> bachelors) {
    _bachelorsList = bachelors;
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
    return _bachelorsList;
  }

  Bachelor getBachelorById(int id) {
    return _bachelorsList.firstWhere((bach) => bach.id == id);
  }
}
