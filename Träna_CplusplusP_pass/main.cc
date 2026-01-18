#include <vector>
#include <iostream>
#include <iomanip>
#include <string>
#include <cctype>
#include <cmath>
//#include <algorithm>
using namespace std;

 //skapar två dimintionell vector
using Map_Type = vector<vector<char>>;

void get(Map_Type & map)
{
  char char_input;
  int i{0};

  cout << "Enter map:" << endl;
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
  
  map.erase(map.begin() + i); //ta bort sista onödiga raden 

  cin.ignore(1000, '\n');
}

void output_map_type(Map_Type const& map,
		     int & x_point,
		     int & y_point)
{
  //x_point = x_point -1;
  //y_point = y_point -1;
  int x_1, y_1;
  double distance;
  //cout << x - x_point << y - y_point << endl;
  for (size_t y{0}; y < map.size(); ++y)
    {
      for (size_t x{0}; x < map[y].size(); ++x)
	{
	  if (map[y][x] == '*')
	    {
	       x_1 = static_cast<int>(x);
	       y_1 = static_cast<int>(y);
	      
	      distance = sqrt( pow( static_cast<double>(x_point - x_1 - 1) , 2) + pow( static_cast<double>(y_point - y_1 - 1) , 2));
	      cout << fixed << setprecision(1) << '(' << distance << ')';
	     //cout << map[y][x];
	    }

	}
      cout << endl;
    }
}

int main()
{
  Map_Type map;
  int x_point{};
  int y_point{};
  
  cout << "Enter point (x and y): " << flush;
  
  cin >> x_point >> y_point;
  cin.ignore(1000, '\n');
  
  get(map);
  
  output_map_type(map, x_point, y_point);
}



  // for(int i=0; i<10; i++)
  //   {
      
  //     for(int j=0; j<20; j++)
  // 	{    
  // 	  map[i].push_back(j);    
  // 	}
  //   }

  //cout << map.at(x).at(y);
  //
