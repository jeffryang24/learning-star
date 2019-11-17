#include <iostream>

int readNumber()
{
  int number{0};
  std::cout << "Input a number: ";
  std::cin >> number;

  return number;
}

void writeAnswer(int answer)
{
  std::cout << "Your answer is: " << answer << '\n';
}
