#include <iostream>
#include "io.h"

int main()
{
  int answer1{readNumber()};
  int answer2{readNumber()};
  writeAnswer(answer1 + answer2);

  return 0;
}
