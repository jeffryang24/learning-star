#include <iostream>

int main()
{
  std::cout << "bool:\t\t" << sizeof(bool) << " bytes\n";
  std::cout << "char:\t\t" << sizeof(char) << " bytes\n";
  std::cout << "wchar_t:\t" << sizeof(wchar_t) << " bytes\n";
  std::cout << "char16_t:\t" << sizeof(char16_t) << " bytes\n"; // C++11 only
  std::cout << "char32_t:\t" << sizeof(char32_t) << " bytes\n"; // C++11 only
  std::cout << "short:\t\t" << sizeof(short) << " bytes\n";
  std::cout << "int:\t\t" << sizeof(int) << " bytes\n";
  std::cout << "long:\t\t" << sizeof(long) << " bytes\n";
  std::cout << "long long:\t" << sizeof(long long) << " bytes\n"; // C++11 only
  std::cout << "float:\t\t" << sizeof(float) << " bytes\n";
  std::cout << "double:\t\t" << sizeof(double) << " bytes\n";
  std::cout << "long double:\t" << sizeof(long double) << " bytes\n";

  unsigned short x = 65535;
  std::cout << "x was " << x << '\n';

  x = 65536; // 65536 is out of our range, so we get wrap-around
  std::cout << "x is now: " << x << '\n';

  x = 65537; // 65537 is out of our range, so we get wrap-around
  std::cout << "x is now: " << x << '\n';

  unsigned short y = 0; // smallest 2-byte unsigned value possible
  std::cout << "y was: " << y << std::endl;

  y = -1; // -1 is out of our range, so we get wrap-around
  std::cout << "y is now: " << y << std::endl;

  y = -2; // -2 is out of our range, so we get wrap-around
  std::cout << "y is now: " << y << std::endl;

  std::cout << "fast 8: " << sizeof(std::int_fast8_t) * 8 << " bits\n";
  std::cout << "fast 16: " << sizeof(std::int_fast16_t) * 8 << " bits\n";
  std::cout << "fast 32: " << sizeof(std::int_fast32_t) * 8 << " bits\n";

  std::cout << "least 8: " << sizeof(std::int_least8_t) * 8 << " bits\n";
  std::cout << "least 16: " << sizeof(std::int_least16_t) * 8 << " bits\n";
  std::cout << "least 32: " << sizeof(std::int_least32_t) * 8 << " bits\n";

  std::int8_t myint = 65;
  std::cout << myint << '\n';

  std::cout << sizeof(size_t) << '\n';

  return 0;
}
