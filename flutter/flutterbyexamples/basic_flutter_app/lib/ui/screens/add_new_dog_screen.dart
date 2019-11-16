import 'package:flutter/material.dart';

// model
import '../../model/dog_model.dart';

class AddNewDogScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddNewDogScreenState();
}

class _AddNewDogScreenState extends State<AddNewDogScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Add New Dog'),
      ),
      body: Container(
        color: Colors.black54,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 32.0,
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Pup\'s Name'),
                  controller: nameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Pup\'s Location'),
                  controller: locationController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Pup\'s Description'),
                  controller: descriptionController,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Builder(
                    builder: (context) {
                      return RaisedButton(
                        onPressed: () => _submitPup(context),
                        color: Colors.indigoAccent,
                        child: Text('Submit'),
                      );
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void _submitPup(BuildContext context) {
    if (nameController.text.isEmpty) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text('Pup needs name!'),
        )
      );
    } else {
      Dog newDog = Dog(nameController.text, locationController.text,
          descriptionController.text);
      Navigator.of(context).pop(newDog);
    }
  }
}
