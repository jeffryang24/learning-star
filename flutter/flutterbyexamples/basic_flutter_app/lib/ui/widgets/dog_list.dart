import 'package:flutter/material.dart';

// Model
import '../../model/dog_model.dart';

// Card
import './dog_card.dart';

class DogList extends StatelessWidget {
  List<Dog> doggos;

  DogList(this.doggos);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(BuildContext context) {
    return ListView.builder(
      itemCount: doggos.length,
      itemBuilder: (context, int index) {
        return DogCard(
          dog: doggos[index],
        );
      },
    );
  }
}