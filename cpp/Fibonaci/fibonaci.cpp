#include "fibonaci.hpp"
#include <vector>
#include <iostream>

using namespace std;

void Fibonaci::create_series(void) {
  data.push_back(0);
  data.push_back(1);

  for (int i = 2; i < size; i++) {
    data.push_back(data[i - 2] + data[i - 1]);
  }
}

void Fibonaci::get_data(void) {
  for (long i : data) {
    cout << i << endl;
  }
}

Fibonaci::Fibonaci(int size) {
  this->size = size;
}
