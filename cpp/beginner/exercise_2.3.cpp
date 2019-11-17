#include <iostream>

int doubleNumber(int x)
{
  return 2 * x;
}

int main()
{
  int userInput{0};
  std::cout << "Input number: ";
  std::cin >> userInput;

  std::cout << "doubleNumber: " << doubleNumber(userInput) << '\n';

  return 0;
}
