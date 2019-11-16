import 'dart:html';

void main() {
  final ButtonElement btnGuess =querySelector('#btnGuess');
  final InputElement txtGuess =querySelector('#txtGuess');

  btnGuess.onClick
    .take(4)
    .where((event) => txtGuess.value == 'banana')
    .listen(
      (event) => window.alert('You got it!!'),
      onDone: () => window.alert('No, bad guesses...')
    );
}