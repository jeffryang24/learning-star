#ifndef FIBONACI_HPP_INCLUDED
#define FIBONACI_HPP_INCLUDED

#include <vector>

using namespace std;

class Fibonaci {
private:
    int size;
    vector<long> data;
public:
    Fibonaci(int);
    void create_series(void);
    void get_data(void);
};

#endif // FIBONACI_HPP_INCLUDED
