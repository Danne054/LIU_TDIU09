#include <iostream>
#include <vector>
#include <iomanip>
#include <string>
//#include <cctype>
#include<cmath>

using namespace std;

using Map_Type = vector<string>;

void get(Map_Type & map)
{
  string map_row{};
  
  while (getline(cin, map_row))
    {
      map.push_back(map_row);
    }
  cin.ignore(1000, '\n');
}

void print_distances(Map_Type const& map,
		     int      const& x,
		     int      const& y)
{
  float y_difference{}, x_difference{};
  float distance{};
    
  for (size_t y_2{}; y_2 < map.size(); ++y_2)
    {
      for (size_t x_2{}; x_2 < map.at(y_2).size(); ++x_2)
	{
	  if  (map.at(y_2).at(x_2) != '.')
	    {
	      x_difference = static_cast<double>(static_cast<int>(x_2) - (x -1));
	      y_difference = static_cast<double>(static_cast<int>(y_2) - (y -1));

	      distance =  sqrt( pow(x_difference, 2.0) + pow(y_difference, 2.0) );
	      cout << fixed << setprecision(1) << '(' << distance << ')';
	    }
	}
      cout << '\n';
    }
  cout << flush;
}

int main()
{
  Map_Type map;
  int x, y;

  cout << "Enter point (x and y): ";
  cin >> x >> y;
  cin.ignore(1000, '\n');
  
  cout << "Enter map:" << endl;
  get(map);

  cout << "Distances:" << endl;  
  print_distances(map, x, y);
  
  return 0;
}
