#include <iostream>

#define PRINT_ME
#define PRINT_YOU
#define FOO 9

void foo()
{
#define MY_NAME "Alex"
}

int main()
{
#ifdef PRINT_ME
  std::cout << "Print Me" << '\n';
#endif

#ifndef PRINT_YOU
  std::cout << "Print You" << '\n';
#endif

#ifndef PRINT_THEM
  std::cout << "Print Them" << '\n';
#endif

#if 0
  std::cout << "Don't compile this line" << '\n';
#endif

#ifdef FOO
  std::cout << "Foo is " << FOO << '\n';
#endif

  std::cout << "My name is: " << MY_NAME << '\n';
}
