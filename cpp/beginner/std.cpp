#include <iostream>

void doNothing(const int &x)
{
}

int main()
{
  int width_3{6};
  int width_4{};
  int exp_1{2 + 3};
  int exp_2{width_4};

  // error appear in uniform initialization
  //int error_width_1{4.5};

  // uninitialized variable
  int unitialized_var;
  doNothing(unitialized_var);
  std::cout << unitialized_var << '\n';

  std::cout << "width_3 = " << width_3 << '\n'
            << "width_4 = " << width_4 << '\n'
            << "exp_1 = " << exp_1 << '\n'
            << "exp_2 = " << exp_2 << '\n';

  // Below code for cin-cout testing
  // std::cout << "Now input..." << '\n';
  // std::cin >> width_4;
  // std::cout << "You typed: " << width_4 << '\n';

  return 0;
}
