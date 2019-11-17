#include <iostream>

int main()
{
  int x{0};
  int y{0};

  std::cout << "Enter an integer: ";
  std::cin >> x;

  std::cout << "Enter another integer: ";
  std::cin >> y;

  std::cout << x << " + " << y << " is " << (x + y) << '\n';
  std::cout << x << " - " << y << " is " << (x - y) << '\n';

  return 0;
}
