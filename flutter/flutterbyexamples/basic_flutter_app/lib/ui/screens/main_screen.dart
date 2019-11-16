import 'package:flutter/material.dart';

// model
import '../../model/dog_model.dart';

// shared
import '../shared/gradient.dart';

// widget
import '../widgets/dog_list.dart';

// screen
import '../screens/add_new_dog_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Dog> initialDogs = [
    Dog('Debra', 'Wisconsin', 'A very brave dog'),
    Dog('Ian', 'Texas', 'A cowboy dog'),
    Dog('Loki', 'Washington', 'A very lavish dog'),
    Dog('CJ', 'Groove Street', 'A gangster dog'),
    Dog('Kim Si', 'Korea', 'A very K-Pop dog'),
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
          backgroundColor: Colors.black87,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: _showAddNewDogForm,
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: CustomGradient.dogLinearGradient,
          ),
          child: DogList(initialDogs),
        ));
  }

  Future _showAddNewDogForm() async {
    Dog newDog =
        await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return AddNewDogScreen();
    }));

    if (newDog != null) {
      initialDogs.add(newDog);
    }
  }
}
