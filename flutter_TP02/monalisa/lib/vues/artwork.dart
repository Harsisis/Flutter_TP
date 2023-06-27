import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Artwork extends StatefulWidget {
  const Artwork({super.key});

  @override
  State<StatefulWidget> createState() => ArticleState();
}

class ArticleState extends State<Artwork> {
  bool _isFavorited = false;
  bool _showArticle = false;

  void _setFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
      if (_isFavorited) {
        final snackBar = SnackBar(
          content: const Text('Oeuvre ajoutée à vos favoris'),
          action: SnackBarAction(
            label: 'annuler',
            onPressed: _setFavorite,
          ),
          duration: const Duration(seconds: 1),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  void _setShowArticle() {
    setState(() {
      _showArticle = !_showArticle;
    });
  }

  void _sayHello() {
    Fluttertoast.showToast(
        msg: "Coucou !",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Artwork"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                GestureDetector(
                  onDoubleTap: _setFavorite,
                  child: Image.asset('assets/images/Mona_Lisa.jpg'),
                ),
                Positioned.fill(
                    child: Align(
                        alignment: Alignment.center,
                        child: Opacity(
                            opacity: _isFavorited ? 0.2 : 0.75,
                            child: Icon(Icons.favorite,
                                size: 100,
                                color:
                                    _isFavorited ? Colors.red : Colors.white))))
              ],
            ),
            const Text("Mona Lisa",
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 30,
                )),
            const Text("Léonard De Vinci",
                style: TextStyle(
                    color: Colors.brown,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.amber),
                    onPressed: _setShowArticle,
                    child: const Icon(
                      Icons.article,
                      size: 30,
                    )),
                TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.amber),
                    onPressed: _setFavorite,
                    child: Icon(
                      Icons.favorite,
                      size: 30,
                      color: _isFavorited ? Colors.red : Colors.brown,
                    )),
              ],
            ),
            Visibility(
              visible: _showArticle,
              child: const Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    "La Joconde, ou Portrait de Mona Lisa, est un tableau de l'artiste Léonard de Vinci, réalisé entre 1503 et 1506 ou entre 1513 et 15161,2, et peut-être jusqu'à 1517 (l'artiste étant mort le 2 mai 1519), qui représente un portrait mi-corps, probablement celui de la Florentine Lisa Gherardini, épouse de Francesco del Giocondo. Acquise par François Ier, cette peinture à l'huile sur panneau de bois de peuplier de 77 × 53 cm est exposée au musée du Louvre à Paris. La Joconde est l'un des rares tableaux attribués de façon certaine à Léonard de Vinci. La Joconde est devenue un tableau éminemment célèbre car, depuis sa réalisation, nombre d'artistes l'ont pris comme référence. À l'époque romantique, les artistes ont été fascinés par ce tableau et ont contribué à développer le mythe qui l'entoure, en faisant de ce tableau l’une des œuvres d'art les plus célèbres du monde, si ce n'est la plus célèbre : elle est en tout cas considérée comme l'une des représentations d'un visage féminin les plus célèbres au monde. Au xxie siècle, elle est devenue l'objet d'art le plus visité au monde, devant le diamant Hope, avec 20 000 visiteurs qui viennent l'admirer et la photographier quotidiennement.",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sayHello,
        tooltip: "Présentation de la Joconde",
        child: const Icon(Icons.add_box_sharp),
      ),
    );
  }
}
