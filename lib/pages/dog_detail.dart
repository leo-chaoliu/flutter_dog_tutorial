import 'package:flutter/material.dart';
import 'package:dog_tutorial/model/dog.dart';

class DogDetailPage extends StatefulWidget {
  final Dog dog;

  DogDetailPage(this.dog);

  @override
  _DogDetailPageState createState() => _DogDetailPageState();
}

class _DogDetailPageState extends State<DogDetailPage> {
  double dogAvatarSize = 150.0;

  Widget get dogImage {
    return new Hero(
      tag: widget.dog,
      child: Container(
        height: dogAvatarSize,
        width: dogAvatarSize,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            const BoxShadow(
                // just like CSS:
                // it takes the same 4 properties
                offset: const Offset(1.0, 2.0),
                blurRadius: 2.0,
                spreadRadius: -1.0,
                color: const Color(0x33000000)),
            const BoxShadow(
                offset: const Offset(2.0, 1.0),
                blurRadius: 3.0,
                spreadRadius: 0.0,
                color: const Color(0x24000000)),
            const BoxShadow(
                offset: const Offset(3.0, 1.0),
                blurRadius: 4.0,
                spreadRadius: 2.0,
                color: const Color(0x1F000000)),
          ],
          image: new DecorationImage(
            fit: BoxFit.cover,
            image: new NetworkImage(widget.dog.imageUrl),
          ),
        ),
      ),
    );
  }

  // The rating section
  // That says ★ 10/10
  Widget get rating {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(
          Icons.star,
          size: 40.0,
        ),
        new Text('${widget.dog.rating} / 10',
            style: Theme.of(context).textTheme.display2),
      ],
    );
  }

  // The widget that displays the image, rating and dog info
  Widget get dogProfile {
    return new Container(
      padding: new EdgeInsets.symmetric(vertical: 32.0),
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.indigo[800],
            Colors.indigo[700],
            Colors.indigo[600],
            Colors.indigo[400],
          ],
        ),
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          dogImage,
          new Text(
            widget.dog.name + '  🎾 ',
            style: new TextStyle(fontSize: 32.0),
          ),
          new Text(
            widget.dog.location,
            style: new TextStyle(fontSize: 20.0),
          ),
          new Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: new Text(widget.dog.description),
          ),
          rating
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black87,
      appBar: new AppBar(
        backgroundColor: Colors.black87,
        title: new Text('Meet ${widget.dog.name}'),
      ),
      body: dogProfile,
    );
  }
}
