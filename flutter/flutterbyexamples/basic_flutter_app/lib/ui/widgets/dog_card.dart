import 'package:flutter/material.dart';

// util
import '../../utils/dog_image_util.dart';

// model
import '../../model/dog_model.dart';

// for testing only
import '../screens/detail_screen.dart';

class DogCard extends StatefulWidget {
  final Dog dog;

  DogCard({Key key, @required this.dog}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DogCardState();
}

class _DogCardState extends State<DogCard> {
  String renderUrl;

  @override
  void initState() {
    super.initState();
    setImageUrl();
  }

  void setImageUrl() async {
    widget.dog.imageUrl = await getDogImageUrl();

    setState(() {
      renderUrl = widget.dog.imageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: showDetailScreen,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Container(
            height: 115.0,
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 50.0,
                  child: dogCard,
                ),
                Positioned(
                  top: 7.5,
                  child: dogImage,
                ),
              ],
            ),
          ),
        ));
  }

  Widget get dogImage {
    Widget dogAvatar = Hero(
      tag: widget.dog,
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(renderUrl ??
                  'https://itefix.net/sites/default/files/not_available.png'),
            )),
      ),
    );

    Widget placeholder = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.black54,
                Colors.black,
                Colors.blueGrey[600],
              ])),
      alignment: Alignment.center,
      child: Text(
        'Dog',
        textAlign: TextAlign.center,
      ),
    );

    return AnimatedCrossFade(
      firstChild: placeholder,
      secondChild: dogAvatar,
      crossFadeState: renderUrl == null
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: Duration(milliseconds: 1000),
    );
  }

  Widget get dogCard {
    return Container(
      width: 350.0,
      height: 115.0,
      child: Card(
        color: Colors.black87,
        child: Padding(
          padding: EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            left: 64.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                widget.dog.name,
                style: Theme.of(context).textTheme.headline,
              ),
              Text(
                widget.dog.location,
                style: Theme.of(context).textTheme.subhead,
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.star),
                  Text(': ${widget.dog.rating} / 10'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  showDetailScreen() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return DetailScreen(widget.dog);
    }));
  }
}
