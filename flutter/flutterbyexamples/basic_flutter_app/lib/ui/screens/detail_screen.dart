import 'package:flutter/material.dart';

// model
import '../../model/dog_model.dart';

// shared
import '../shared/gradient.dart';

class DetailScreen extends StatefulWidget {
  final Dog dog;

  DetailScreen(this.dog);

  @override
  State<StatefulWidget> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final double dogAvatarSize = 150.0;
  double _sliderValue = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text('Meet ${widget.dog.name}!'),
        ),
        body: ListView(
          children: <Widget>[dogProfile, addYourRating],
        ));
  }

  Widget get dogImage {
    return Hero(
      tag: widget.dog,
      child: Container(
        width: dogAvatarSize,
        height: dogAvatarSize,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              const BoxShadow(
                  offset: Offset(1.0, 2.0),
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
                color: const Color(0x1F000000),
              ),
            ],
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(widget.dog.imageUrl),
            )),
      ),
    );
  }

  Widget get rating {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.star,
          size: 40.0,
        ),
        Text(
          ' ${widget.dog.rating} / 10',
          style: Theme.of(context).textTheme.display2,
        ),
      ],
    );
  }

  Widget get dogProfile {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32.0),
      decoration: BoxDecoration(
        gradient: CustomGradient.dogLinearGradient,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          dogImage,
          Text(
            '${widget.dog.name}',
            style: TextStyle(
              fontSize: 32.0,
            ),
          ),
          Text(
            widget.dog.location,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 16.0,
            ),
            child: Text(widget.dog.description),
          ),
          rating,
        ],
      ),
    );
  }

  Widget get addYourRating {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Slider(
                  activeColor: Colors.indigoAccent,
                  min: 0.0,
                  max: 10.0,
                  onChanged: (value) {
                    setState(() => _sliderValue = value);
                  },
                  value: _sliderValue,
                ),
              ),
              Container(
                width: 50.0,
                alignment: Alignment.center,
                child: Text(
                  '${_sliderValue.toInt()}',
                  style: Theme.of(context).textTheme.display1,
                ),
              )
            ],
          ),
        ),
        submitRatingButton
      ],
    );
  }

  Widget get submitRatingButton {
    return RaisedButton(
      onPressed: updateRating,
      child: Text('Submit'),
      color: Colors.indigoAccent,
    );
  }

  Future<Null> _ratingErrorDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error!'),
          content: Text('They are good dogs!'),
          actions: <Widget>[
            FlatButton(
              child: Text('Try again'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      }
    );
  }

  updateRating() {
    if (_sliderValue < 10) {
      _ratingErrorDialog();
    } else {
      setState(() => widget.dog.rating = _sliderValue.toInt());
    }
  }
}
