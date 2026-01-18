#include <iostream>
#include <fstream>
#include <string>

using namespace std;

bool is_between(int const value,
		int const min,
		int const max)
{
  return value >= min and value <= max;
}

string check_pixel(int     const   pixel_number,
		   int     const   rgb_level,
		   istream & from,
		   string const& format)
{
  int value;
  int loops{3};

  if (format == "P3a")
    {
      loops = 4;
    }

  for (int rgb_color{1}; rgb_color <= loops; ++rgb_color)
    {
      from >> value;
      if(from.eof())
	{
	  return "Too few pixel values.";
	}
      else if (not from)
	{
	  return "Pixel value number " + to_string(pixel_number) + " not an integer.";
	}
      else if(not is_between(value, 0, rgb_level))
	{
	  return "Pixel value outside range.";
	}
      else if (format == "P3a" and rgb_color%4 == 0 and
	       value != 0 and value != 1)
	{
	  return "Incorrect range for alpha channel.";
	}
    }
  return "OK";
}

string check_pixels(int     const   x,
		    int     const   y,
		    int     const   rgb_level,
		    istream & from,
		    string const& format)
{
  string pixel_result;

  for (int pixel_count{1}; pixel_count <= x * y ; ++pixel_count)
  {
    pixel_result = check_pixel(pixel_count, rgb_level, from, format);
    if (pixel_result != "OK")
    {
      return pixel_result;
    }
  }
  return "Image correct!";
}

bool is_correct_format(string const & format)
{
  return format == "P3" or format == "P3a";
}

string check_image(istream & from)
{
  string format;
  char c;
  int x, y;
  int rgb_level;

  from >> format;
  
  if (not is_correct_format(format))
  {
    return "Incorrect format.";
  }
  from.ignore(1000, '\n');

  
  from >> c;
  if (c != '#')
  {
    return "Comment line ill-formed.";
  }
  from.ignore(1000, '\n');

  from >> x >> y;
  if (x < 1 or y < 1)
  {
    return "Wrong dimensions.";
  }
  
  from >> rgb_level;
  if (not is_between(rgb_level, 1, 255))
  {
    return "RGB-level outside acceptable range.";
  }
  return check_pixels(x, y, rgb_level, from, format);
}

int main(int argc, char* argv[])
{
  ifstream ifs;
  ofstream ofs;
  string   arg;
  
  if (argc != 2)		
    {
      cout << "Incorrect number of command line arguments." << endl;
      return 0;
    }
  else
    {
      arg = argv[1];
    }
  if (!(arg == "cin"))
    {
      ifs.open(arg);
      cout << check_image(ifs) << endl;
    } 
  else 
    {
      cout << check_image(cin) << endl;
    }
  return 0;
}
