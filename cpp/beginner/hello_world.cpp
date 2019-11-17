#include <iostream>

int main()
{
  // copy initialization
  int width_1 = 5;

  // direct initialization
  int width_2(5);

  // brace/uniform initialization (c++ 11)
  int width_3{6};
  int width_4{};

  // error appear in uniform initialization
  //int error_width_1{4.5};

  std::cout << "Hello World!\n"
            << "width_1 = " << width_1 << '\n'
            << "width_2 = " << width_2 << '\n'
            << "width_3 = " << width_3 << '\n'
            << "width_4 = " << width_4 << '\n';
  std::cout << "Test Again" << '\n';

  return 0;
}
