#include <vector>
#include <iostream>
#include <iomanip>
#include <string>
#include <cctype>
#include <algorithm>
#include <cmath>
using namespace std;

struct Name_Gift_Type
{
  string name;
  string gift;
};
using Gift_Game_Type = vector<Name_Gift_Type>;

void get(Gift_Game_Type & gifts)
{
  string inString;
  Name_Gift_Type tmp;
  char c;

  while(cin >> tmp.name)
    {
      cin.get(c);
      getline(cin, tmp.gift);
      gifts.push_back(tmp);
    }
};

void print_result(Gift_Game_Type const& gifts,
		  int const& steps)
{
  for (size_t i{}; i < gifts.size(); ++i)
    {
      cout << gifts.at(i).name << flush;

      cout << " " << '"' << gifts.at((i+steps)%gifts.size()).gift << '"' << " from " << gifts.at((i+steps)%gifts.size()).name << endl;
    }
};



int main()
{
  int steps;
  Gift_Game_Type gifts;
  
  cout << "Enter steps: ";
  cin >> steps;
  cin.ignore(1000, '\n');

  cout << "Enter names and gifts:" << endl;
  get(gifts);

  cout << "Gift game result:" << endl;
  print_result(gifts, steps);
  
  return 0;
}
