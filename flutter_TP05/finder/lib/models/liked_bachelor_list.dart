import 'package:flutter/cupertino.dart';

import 'bachelor.dart';

class LikedBachelorList extends ChangeNotifier {
  final List<Bachelor> _likedBachelors = [];

  void add(Bachelor bachelor) {
    _likedBachelors.add(bachelor);
    notifyListeners();
  }

  void removeAll() {
    _likedBachelors.clear();
    notifyListeners();
  }

  void removeOne(Bachelor bachelor) {
    _likedBachelors.removeWhere((bach) =>
        bach.firstname == bachelor.firstname &&
        bach.lastname == bachelor.lastname);
    notifyListeners();
  }
}
