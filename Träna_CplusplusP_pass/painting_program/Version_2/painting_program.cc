#include <iostream>
#include <vector>
#include <string>

using namespace std;

struct Paint_Input_Type
{
  int row{}, column{};
  int width{};
  char color{};
};

using Paint_Data_Type = vector<Paint_Input_Type>;
using Painting_Type = vector<vector<char>>;

void patin(Paint_Input_Type const& paint,
	   Painting_Type & blank_canvas)
{
  int y_start{(paint.row -1) - paint.width };
  int x_start{(paint.column - 1) - paint.width };
  int y_end{(paint.row -1) + paint.width};
  int x_end{(paint.column -1) + paint.width};
  if (y_start < 0)
    {
      y_start = 0;
    }
  if (x_start < 0)
    {
      x_start = 0;
    }
  if (y_end > 19)
    {
      y_end = 19;
    }
  if (x_end > 19)
    {
      x_end = 19;
    }

  for (int y{y_start}; y <= y_end; ++y)
    {
      for (int x{x_start}; x <= x_end; ++x)
	{
	  blank_canvas.at(y).at(x) = paint.color;
	}
    }
}

void get_painting(Painting_Type & painting)
{
  Painting_Type blank_canvas(20 , vector<char>(20, '.'));
  Paint_Input_Type paint{};
  Paint_Data_Type paint_data{};
  char empty{};
  
  while (cin >> paint.row >> paint.column >> paint.width
	 and cin.get(empty) and cin.get(paint.color))
    {
      paint_data.push_back(paint);
    }
  
  for (int i{static_cast<int>(paint_data.size()) -1}; i >= 0; i--)
    {
      patin(paint_data.at(i), blank_canvas);
    }
  
  painting = blank_canvas;
}

void print_painting(Painting_Type const& painting)
{
  for (int y{}; y < 20; ++y)
    {
      for (int x{}; x < 20; ++x)
	{
	  cout <<  painting.at(y).at(x);
	}
      cout << '\n';
    }
  
  cout << flush;
}

int main()
{
  Painting_Type painting;

  cout << "Enter squares:" << endl;
  get_painting(painting);
  
  cout << "Painting:" << endl;
  print_painting(painting);

  return 0;
}
