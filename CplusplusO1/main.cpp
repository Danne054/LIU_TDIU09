#include <iostream>
#include <iomanip>
#include <string>
#include <cmath>
#include <cctype>
using namespace std;

int main()
{
  //varibler del1
  int age;
  double shoe_size;
  char c;
  string lastName;
  
  //varibler del2
  int start_value, end_value;
  bool less_then_abs_zero, less_then_start_value;
  int celcius;
  string uppg3;

  //varibler del3
  int digits{0};
  int letters{0};
  int whitespace{0};

  //varibler del4
  string inString;
  string longest;
  string shortest;
  int ord{0};
  int word_count{0};
  
  //del1
  cout << "Del 1: In- och utmatning" <<  '\n'
       << "Mata in din ålder och skostorlek: " << flush;
  cin  >> age >> shoe_size;
  cin.ignore(1000, '\n');
  
  cout << "Mata in första bokstaven i ditt namn: " << flush;
  cin  >> c;
  cin.ignore(1000, '\n');
  
  cout << "Mata in ditt efternamn: " << flush;
  getline(cin, lastName);
  
  cout << "Hej " << c << ". " << lastName << "!" <<'\n'
       << "Din ålder:" << setw(10) << age << '\n'
       << "Din skostorlek:" << setw(5)
       << fixed << setprecision(1) << shoe_size << '\n' << endl;

  //del2
  cout << "Del 2: Temperaturtabell" << endl;
  
  do 
    {
      cout << "Ange startvärde: " << flush;
      cin  >> start_value;
      cin.ignore(1000, '\n');
      
      less_then_abs_zero = start_value < -273.15;
      if (less_then_abs_zero)
	{
	  cout << "Felaktigt startvärde!" << endl;
	}
    }
  while (less_then_abs_zero);

  do
    {
      cout << "Ange slutvärde: " << flush;
      cin  >> end_value;
      cin.ignore(1000, '\n');

      less_then_start_value = start_value > end_value;
      if (less_then_start_value)
	{
	  cout << "Felaktigt slutvärde!" << endl;
	}
    }
  while (less_then_start_value);
  
  cout << fixed << setprecision(2)
       << "Celsius   Kelvin    Fahrenheit   Reaumur" << '\n'
       <<"----------------------------------------" << endl;
  
  for (int i {}; i < ((end_value - start_value) + 1 ); ++i)
    {
      celcius = start_value + i;
      cout << setw(7) << celcius
	   << setw(9) << static_cast<double>(celcius) + 273.15
	   << setw(14) << static_cast<double>(celcius) * 1.8 + 32.0
	   << setw(10) << static_cast<double>(celcius) * 0.8 << endl;
    }

  cout << endl;

  //del3
  cout << "Del 3: Teckenhantering" << endl;
  
  for (int i {}; i < 10; ++i)
    {
      cin.get(c);
      
      if (isdigit(c))
	{
	  digits++;
	}
      else if (isalpha(c))
	{
	  letters++;
	}
      else if (isspace(c))
	{
	  whitespace++;
	}
    }
  
  cin.ignore(1000, '\n');
  
  cout << "Mata in utfyllnadstecken: " << flush;
  cin.get(c);
  cin.ignore(1000, '\n');
  cout << "Alfabetiska tecken:" << setfill(c) << setw(3) << letters << '\n'
       << "Siffertecken:" << setfill(c) << setw(9) << digits << '\n'
       << "Vita tecken:" << setfill(c) << setw(10) << whitespace
       << '\n' << endl;

  //del4
  cout << "Del 4: Ordhantering" << endl;

  while (cin >> inString)
    {
      word_count += inString.length();
      ord++;
      
      if (inString.length() < shortest.length() or ord == 1)
	{
	  shortest = inString;
	}

      if (inString.length() > longest.length())
	{
	  longest = inString;
	}
    }
  
  if (inString == "")
    {
      cout << "Inga ord matades in." << endl;
    }
  else
    {
      cout << "Texten innehöll " << ord << " ord." << '\n'
	   << "Kortaste ordet: " << '"' << shortest << '"'
	   << " (" << shortest.length() << " tecken)." << '\n'
	   << "Längsta ordet: " << '"' << longest << '"'
	   << " (" << longest.length() << " tecken)." << '\n'
           <<"Medelordlängd: " << fixed << setprecision(1)
	   << (static_cast<double>(word_count) / static_cast<double>(ord)) << " tecken." << endl;
    }

  return 0;
}
