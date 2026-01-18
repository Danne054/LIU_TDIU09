#include <iostream>
#include <string>

using namespace std;
int main()
{
  int a{} ,b{};

  cout << "enter two integers for mod" << endl;
  while (cin >> a >> b)
    {
      cout << "the reslut off "
	   << a << '%' << b << " is: " << a%b << endl;
      
      cin.ignore(1000, '\n');
    }
    
}
