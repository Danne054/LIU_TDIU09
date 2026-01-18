#include<iostream>
#include<iomanip>
#include<cctype>
#include<vector>
#include<string>
#include<algorithm>

using namespace std;

struct Decoration_Type
{
  char symbol;
  int row, column;
};

using Decoration_List_Type = vector<Decoration_Type>;
using Tree_Type = vector<string>;

void read(Tree_Type & tree)
{
  string User_input_row;
  
  do
  {
    cin >> User_input_row;
    if (User_input_row != "DONE")
    {
      tree.push_back(User_input_row);
    }
  } while (User_input_row != "DONE");
  
}

void decoration_placer(Tree_Type & tree,
                      Decoration_Type const& decorate)
{
  for (size_t y{static_cast<size_t> (decorate.column -1)}; y < tree.size(); ++y)
  {
    if (tree.at(y).at(decorate.row -1) == '*')
    {
      tree.at(y).at(decorate.row -1) = decorate.symbol;
      break;
    }
  }
}

void decorate(Tree_Type & tree)
{
  Decoration_Type decorate;

  do
  {
    cin >> decorate.symbol;
    if (decorate.symbol != 'D')
      {
        cin >> decorate.column >> decorate.row;
        decoration_placer(tree, decorate);
      }
  } while (decorate.symbol != 'D'); 
}

void print(Tree_Type const& tree)
{
  for(size_t i{}; i < tree.size();  ++i)
  {
    cout << tree.at(i) << '\n';
  }

  cout << flush;
}

int main()
{
  Tree_Type tree;

  cout << "Enter tree:" << endl;
  read(tree);

  cout << "Enter decorations:" << endl;
  decorate(tree);

  cout << "Resulting tree:" << endl;
  print(tree);
  
  return 0;
}