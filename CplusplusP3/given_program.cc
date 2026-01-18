#include <iostream>
#include <vector>
#include <cmath>

using namespace std;

struct Radio_Tower_Type
{
  int row{}, column{}; 
  int distance{};
};

using Radio_Tower_Map_Type = vector<vector<char>>;

void place_tower(Radio_Tower_Type const& radio_tower,
	         Radio_Tower_Map_Type  & empty_map)
{
  float distance{};
  int x2{}, y2{};
    
  for (int y{}; y < 10; ++y)
    {
      for (int x{}; x < 10; ++x)
	{
	  x2 = radio_tower.row -1;
	  y2 = radio_tower.column -1;
	  distance = sqrt(pow(static_cast<float>(x - x2), 2) +
			  pow(static_cast<float>(y - y2), 2));

	  if (distance <= radio_tower.distance)
	    {
	      empty_map.at(y).at(x) = '*';
	    }
	}
    }
}

void get(Radio_Tower_Map_Type & tower_map)
{
  bool done{};
  Radio_Tower_Type radio_tower{};
  Radio_Tower_Map_Type empty_map(10 , vector<char>(10, '.'));
  
  do
    {
      cin >> radio_tower.column >> radio_tower.row;
      done = (radio_tower.row == -1 and radio_tower.column == -1);

      if (!done)
	{
	  cin >> radio_tower.distance;
	
	  place_tower(radio_tower, empty_map);
	}
    }
  while(!done);
 
  cin.ignore(1000, '\n');

  tower_map = empty_map;
}

void put(Radio_Tower_Map_Type const& tower_map)
{ 
  for (int y{}; y < 10; ++y)
    {
      for (int x{}; x < 10; ++x)
	{
	  cout <<  tower_map.at(y).at(x);
	}
      cout << '\n';
    }
  cout << flush;
}

int main()
{
  Radio_Tower_Map_Type tower_map;
  
  cout << "Enter towers:" << endl;
  get(tower_map);

  cout << "Map:" << endl;
  put(tower_map);
  return 0;
}
