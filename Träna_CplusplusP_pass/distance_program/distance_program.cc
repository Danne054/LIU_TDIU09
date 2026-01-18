#include <iostream>
#include <vector>
#include <iomanip>
#include <string>
#include <cctype>
#include <cmath>

using namespace std;

using Map_Type = vector<vector<char>>;

void get(Map_Type & map)
{
  char char_input;
  int i{};
  
  map.push_back(vector<char>());
  while(cin.get(char_input))
    {
      if (char_input == '\n')
	{
	  map.push_back(vector<char>()); //lägg till ny rad efter radslut
	  ++i;
	}

      else
	{
	  map[i].push_back({char_input});
	}
    }
  
  cout << '\n';
  //map.erase(map.begin() + i); //ta bort sista onödiga raden 

  cin.ignore(1000, '\n');
}

void print_distances(Map_Type const& map,
		     int const x_point,
		     int const y_point)
{
  int x_1, y_1;
  double distance, x_sqare, y_sqare;

  for (size_t y{}; y < map.size(); ++y)
    {
      for (size_t x{}; x < map.at(y).size(); ++x)
	{
	  if (map.at(y).at(x) == '*')
	    {
	      x_1 = static_cast<int>(x);
	      y_1 = static_cast<int>(y);
	      x_sqare = pow(static_cast<double>(x_point - x_1 - 1) , 2); 
	      y_sqare = pow(static_cast<double>(y_point - y_1 - 1) , 2);
	      distance = sqrt(x_sqare + y_sqare);
	      
	      cout << fixed << setprecision(1) << '(' << distance << ')';
	    }
	}
      
      cout << endl;
    }
}

//map[y].size()

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
