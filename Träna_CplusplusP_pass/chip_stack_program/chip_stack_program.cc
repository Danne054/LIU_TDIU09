#include <vector>
#include <iostream>
#include <string>

using namespace std;

struct Chips_And_Amount
{
  int chips_amount{};
  string chips{};
};

using Chips_Input_List_Type = vector<Chips_And_Amount>;
using Chip_Stack_Type = vector<string>;
using Chips_Amount_Type = vector<int>;

void sort_chips(Chips_Input_List_Type & chips_input_list
		,Chip_Stack_Type & chip_stack
		,int chips_max_amount)
{
  for (int j{chips_max_amount};  j >= 0; j--)
    {
      for (int i{static_cast<int>(chips_input_list.size() -1)}; i >= 0; --i)
	{
	  if (j == chips_input_list.at(i).chips_amount and
	      chips_input_list.at(i).chips_amount > 0)
	    {
	      chip_stack.push_back(chips_input_list.at(i).chips);
	      --chips_input_list.at(i).chips_amount;
	    }
	}
    }
}

void read_chips(Chip_Stack_Type & chip_stack)
{
  int i{}, chips_max_amount{};
  char c;
  Chips_And_Amount chpis_data;
  Chips_Input_List_Type chips_input_list;
  
  do
    {
      ++i;
      cout << "Chip bag " << i << ": " << flush;
      cin >> chpis_data.chips_amount;

      if (chpis_data.chips_amount > chips_max_amount)
	{
	  chips_max_amount = chpis_data.chips_amount;
	}
      
      if (chpis_data.chips_amount != -1)
	{
	  cin.get(c);
	  getline(cin, chpis_data.chips);
	  
	  chips_input_list.push_back(chpis_data);
	}
    }
  while (chpis_data.chips_amount != -1);

  if (chips_input_list.size() > 0)
    {
      sort_chips(chips_input_list, chip_stack, chips_max_amount);
      chips_input_list.clear();
    }
}

void print_chips(Chip_Stack_Type const& chip_stack)
{
  int totalSize{static_cast<int>(chip_stack.size())};
  
  if (totalSize != 0)
    {
      for (int i{}; i < totalSize; ++i)
	{
	  cout << chip_stack.at(i) << endl;
	}
    }
}

void eat_chips(Chip_Stack_Type & chip_stack,
	       int const eat_chips)
{
  if (static_cast<int>(chip_stack.size()) - 1 > 0)
    {
      chip_stack.erase(chip_stack.begin(), chip_stack.begin() + eat_chips);
    }
}

// Huvudprogrammet nedan får inte ändras
int main()
{
  Chip_Stack_Type chip_stack;
  int nr;
  
  read_chips(chip_stack);
  print_chips(chip_stack);

  cout <<"Chips to eat: ";
  cin >> nr;
  
  eat_chips(chip_stack, nr);
  print_chips(chip_stack);
  
  return 0;
}
