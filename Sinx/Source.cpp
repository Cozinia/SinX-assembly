#include <iostream>

using namespace std;

double raiseToPower(int x, int y)
{ // y represents the power of x
    double num = 1;
    for (int i = 0; i < y; i++) {
        num = num * x;
    }
    return num;
}

int factorial(int x) {
    int c = 1;
    for (int i = 1; i <= x; i++)
    {
        c = c * i;
    }
    return c;
}

float sin(int x)
{
    double result = 0;
    result = x - (raiseToPower(x, 3) / factorial(3)) + (raiseToPower(x, 5) / factorial(5)) - (raiseToPower(x, 7) / factorial(7)) + (raiseToPower(x, 9) / factorial(9));
    return result;
}

int main()
{
    int x;
    cout << "x = ";
    cin >> x;
   float res = sin(x);
   cout << res;
    return 0;
}
