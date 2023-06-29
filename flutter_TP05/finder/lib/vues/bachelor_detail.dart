import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/bachelor.dart';
import '../providers/bachelor_list_provider.dart';

class BachelorDetail extends StatefulWidget {
  const BachelorDetail({super.key, required this.id});
  final int id;

  @override
  State<StatefulWidget> createState() => _BachelorDetail();
}

class _BachelorDetail extends State<BachelorDetail> {
  bool _isLiked = false;
  bool _isDisliked = false;
  late BachelorListProvider _bachelorList;
  late Bachelor _bachelor;

  void _setLikeBachelor() {
    setState(() {
      _isLiked = !_isLiked;
      if (_isLiked) {
        _isDisliked = true;
        _setDislikeBachelor();

        _bachelorList.addLiked(_bachelor);

        final snackBar = SnackBar(
          content: const Text('Bachelor ajouté(e) à vos favoris'),
          action: SnackBarAction(
            label: 'annuler',
            onPressed: _setLikeBachelor,
          ),
          duration: const Duration(milliseconds: 500),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        _bachelorList.removeOneLiked(_bachelor);
      }
    });
  }

  void _setDislikeBachelor() {
    setState(() {
      _isDisliked = !_isDisliked;
      if (_isDisliked) {
        _isLiked = true;
        _setLikeBachelor();

        _bachelorList.hide(_bachelor);

        final snackBar = SnackBar(
          content: const Text('Bachelor suprimé(e) de la liste'),
          action: SnackBarAction(
            label: 'annuler',
            onPressed: _setDislikeBachelor,
          ),
          duration: const Duration(milliseconds: 500),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        _bachelorList.show(_bachelor);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _bachelorList = context.watch<BachelorListProvider>();
    _bachelor = _bachelorList.getBachelorById(widget.id);
    _isLiked = _bachelorList.getLikedBachelors.contains(_bachelor);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Finder"), Icon(Icons.favorite_border_rounded)],
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.fromLTRB(60, 20, 60, 20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onTertiary,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Image.asset(
                    _bachelor.avatar,
                    height: 200,
                    width: 200,
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Opacity(
                        opacity: _isDisliked ? 1 : 0.7,
                        child: GestureDetector(
                          onTap: _setDislikeBachelor,
                          child: Icon(
                            Icons.heart_broken,
                            size: 40,
                            color: _isDisliked
                                ? Colors.blue
                                : const Color.fromARGB(255, 220, 207, 161),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Opacity(
                        opacity: _isLiked ? 1 : 0.7,
                        child: GestureDetector(
                          onTap: _setLikeBachelor,
                          child: Icon(
                            Icons.favorite,
                            size: 40,
                            color: _isLiked
                                ? Colors.red
                                : const Color.fromARGB(255, 220, 207, 161),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "${_bachelor.firstname} ${_bachelor.lastname}",
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text("${_bachelor.job}"),
            Expanded(
              child: Text("${_bachelor.description}"),
            ),
          ],
        ),
      ),
    );
  }
}
