import 'package:flutter/cupertino.dart';

import 'bachelor.dart';

class BachelorList extends ChangeNotifier {
  late List<Bachelor> _bachelorsList = [];

  BachelorList(List<Bachelor> bachelors) {
    _bachelorsList = bachelors;
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
    _bachelorsList.removeWhere((bach) =>
        bach.firstname == bachelor.firstname &&
        bach.lastname == bachelor.lastname);
    notifyListeners();
  }
}
