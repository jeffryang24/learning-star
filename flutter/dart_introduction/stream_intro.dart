import 'dart:async';

class Cake {}

class Order {
  String type;

  Order(this.type);
}

void main() {
  final controller = StreamController();

  final order = Order('chocolate');

  final baker = StreamTransformer.fromHandlers(handleData: (cakeType, sink) {
    if (cakeType == 'chocolate') {
      sink.add(Cake());
    } else {
      sink.addError('I can\'t bake that type');
    }
  });

  controller.sink.add(order);

  controller.stream.map((order) => order.type).transform(baker).listen(
      (cake) => print('Here\'s your ${cake}'),
      onError: (error) => print(error));
}
