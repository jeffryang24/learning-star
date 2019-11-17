#include "fibonaci.hpp"
#include <iostream>
#include <string>

using namespace std;

int main(int argc, char* argv[]) {
  if (argc == 2) {
    int value = stoul(argv[1], nullptr, 10);
    static Fibonaci Fibo(value);
    Fibo.create_series();
    Fibo.get_data();
    return 0;
  } else {
    cout << "Please execute using this format fibonaci [value]!" << endl;
    return -1;
  }
}
