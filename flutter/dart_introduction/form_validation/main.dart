import 'dart:html';
import 'dart:async';

void main() {
  final InputElement txtEmail = querySelector('#txtEmail');
  final ParagraphElement errMsg = querySelector('#errMsg');

  final validator =
      StreamTransformer.fromHandlers(handleData: (inputValue, sink) {
    if (inputValue.contains('@')) {
      sink.add(inputValue);
    } else {
      sink.addError('Enter a valid email!');
    }
  });

  txtEmail.onInput
      .map((dynamic event) => event.target.value)
      .transform(validator)
      .listen((inputValue) => errMsg.innerHtml = 'Email is valid',
          onError: (error) => errMsg.innerHtml = error);
}
