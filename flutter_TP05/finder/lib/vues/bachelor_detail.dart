import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/bachelor.dart';
import '../structures/bachelor_list.dart';

class BachelorDetail extends StatefulWidget {
  const BachelorDetail({super.key, required this.id});
  final int id;

  @override
  State<StatefulWidget> createState() => _BachelorDetail();
}

class _BachelorDetail extends State<BachelorDetail> {
  bool _isLiked = false;
  late BachelorList _bachelorList;
  late Bachelor _bachelor;

  void _setLikeBachelor() {
    setState(() {
      _isLiked = !_isLiked;
      if (_isLiked) {
        _bachelorList.addLiked(_bachelor);

        final snackBar = SnackBar(
          content: const Text('Bachelor ajouté(e) à vos favoris'),
          action: SnackBarAction(
            label: 'annuler',
            onPressed: _setLikeBachelor,
          ),
          duration: const Duration(seconds: 1),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        _bachelorList.removeOneLiked(_bachelor);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _bachelorList = context.watch<BachelorList>();
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
                  GestureDetector(
                    onDoubleTap: _setLikeBachelor,
                    child: Image.asset(
                      _bachelor.avatar,
                      height: 200,
                      width: 200,
                    ),
                  ),
                  Positioned.fill(
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: Opacity(
                              opacity: _isLiked ? 1 : 0.7,
                              child: Icon(Icons.favorite,
                                  size: 30,
                                  color: _isLiked
                                      ? Colors.red
                                      : const Color.fromARGB(
                                          255, 220, 207, 161)))))
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
