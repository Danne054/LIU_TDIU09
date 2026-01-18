#include <iostream>
#include <string>
#include <vector>

using namespace std;

using Overhead_Map_Type = vector<string>;

void read_overhead_map(Overhead_Map_Type & map)
{
  string input_map_row;
    
  while (cin >> input_map_row)
    {
      map.push_back(input_map_row);
    }
  
  cin.ignore(1000, '\n');
}

int count_mailboxes(Overhead_Map_Type const& map,
		     int const& y,
		     int const& x)
{
  int y_start{y - 2}, x_start{x - 2};
  int y_end{y + 2}, x_end{};
  int columns{static_cast<int>(map.size()) -1};
  int row{};
  
  if (y_start < 0)
    {
      y_start = 0;
    }
  if (x_start < 0)
    {
      x_start = 0;
    }
  if (y_end > columns)
    {
      y_end = columns;
    }
	
  for (int y{y_start}; y <= y_end; ++y)
    {
      row = static_cast<int>(map.at(y).size()) -1;
      x_end = x + 2;
      
      if (x_end > row)
	{
	  x_end = row;
	}

      for (int x{x_start}; x <= x_end; ++x)
	{
	  if (map.at(y).at(x) == 'M')
	    {
	      return 1;
	    }
	}
    }

  return 0;
}

int count_houses_with_mailboxes(Overhead_Map_Type const& map)
{
  int mailbox_cnt{};
  
  for (int y{}; y < static_cast<int>(map.size()); ++y)
    {
     for (int x{}; x < static_cast<int>(map.at(y).size()); ++x)
	{
	  if (map.at(y).at(x) == 'H')
	    {
	      mailbox_cnt += count_mailboxes(map, y, x);
	    }
	}
    }
  
  return mailbox_cnt;
}

int main()
{
  Overhead_Map_Type map;
  
  read_overhead_map(map);
  cout << "Number of houses with at least one mailbox: "
       << count_houses_with_mailboxes(map) << "." << endl;
  
  return 0;
}
