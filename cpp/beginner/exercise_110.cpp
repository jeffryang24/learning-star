#include <iostream>

int main()
{
  int x{0};
  std::cout << "Enter an integer: ";
  std::cin >> x;
  std::cout << "Double that number is: " << (x * 2) << '\n';
  return 0;
}
