import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/bachelor.dart';
import '../providers/bachelor_list_provider.dart';
import 'finder_header_title.dart';

class BachelorDetail extends StatefulWidget {
  const BachelorDetail({super.key, required this.id});
  final int id;

  @override
  State<StatefulWidget> createState() => _BachelorDetail();
}

class _BachelorDetail extends State<BachelorDetail> {
  bool _isLiked = false;
  bool _isDisliked = false;
  late BachelorListProvider _bachelorListProvider;
  late Bachelor _bachelor;

  void _setLikeBachelor() {
    setState(() {
      _isLiked = !_isLiked;
      if (_isLiked) {
        _isDisliked = true;
        _setDislikeBachelor();

        _bachelorListProvider.addLiked(_bachelor);

        final snackBar = SnackBar(
          content: const Text('Bachelor added to liked list'),
          action: SnackBarAction(
            label: 'cancel',
            onPressed: _setLikeBachelor,
          ),
          duration: const Duration(milliseconds: 500),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        _bachelorListProvider.removeOneLiked(_bachelor);
      }
    });
  }

  void _setDislikeBachelor() {
    setState(() {
      _isDisliked = !_isDisliked;
      if (_isDisliked) {
        _isLiked = true;
        _setLikeBachelor();

        _bachelorListProvider.hide(_bachelor);
        _bachelorListProvider.getFilteredBachelors;

        final snackBar = SnackBar(
          content: const Text('Bachelor removed from list'),
          action: SnackBarAction(
            label: 'cancel',
            onPressed: _setDislikeBachelor,
          ),
          duration: const Duration(milliseconds: 500),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        _bachelorListProvider.show(_bachelor);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _bachelorListProvider = context.watch<BachelorListProvider>();
    _bachelor = _bachelorListProvider.getBachelorById(widget.id);
    _isLiked = _bachelorListProvider.getLikedBachelors.contains(_bachelor);
    _isDisliked = _bachelor.hide;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const FinderHeaderTitle(),
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
