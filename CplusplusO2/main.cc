#include <iostream>
#include <iomanip>
#include <string>
#include <cmath>
//#include <cctype>
using namespace std;

//hanterar utmatning av meny text,
//samt inmatnig och felhantering(enbart för heltal) av menyval

int menu()
{
  int n;
  bool in_range;
  
  do
    {
      cout << "1. Beräkna N-fakultet."     << '\n'
	   << "2. Multiplicera en sträng." << '\n'
	   << "3. Byta värden på ett heltal och ett flyttal." << '\n'
	   << "4. Beräkna totala längden samt medellängden på två strängar." << '\n'
	   << "5. Avsluta programmet." << '\n'
	   << "Val: " << flush;
      
      cin >>  n;
      cin.ignore(1000, '\n');
      in_range = (n >= 1 and n <= 5);
      
      if (!in_range)
	{
	  cout << "Fel val!" << endl;
	}
    }
  while (!in_range);

  return n;
}

//underprogram som utför given uppgiftsbeskriving

int factorial(int const n)
{
  if (n == 0)
    {
      return 1;
    }
  else
    {
      return n*factorial(n-1);
    }
}

string operator*(string const& LHV,
		 int const RHV)
{
  string result;
  
  for (int i{}; i < RHV; ++i)
    {
      result += LHV;
    }
  return result;
}

void output(int & n,
	    double & f)
{
  int tmp{n};

  n = static_cast<int>(ceil(f));
  f = static_cast<double>(tmp);
}

void two_string_stats(string const& text_1,
		      string const& text_2,
		      int & total_length,
		      double & mean_length)
{
  total_length = (text_1 + text_2).length();
  mean_length = static_cast<double>(total_length)/2.0;
}

//underprogram som behandlar ledtext, inmatning för varje uppgift och
//hanterar utmatning av resultatet.
//Samt androppar det diverse underprogram som krävs för utförandet av uppgiften

void uppg1()
{
  int n;
  
  cout << "Mata in ett heltal: " << flush;
  cin >> n;
  cin.ignore(1000, '\n');

  cout << "Fakulteten av " << n << " är " <<  factorial(n) << endl;
}

void uppg2()
{
  int n;
  string text;
  
  cout << "Mata in en text och ett heltal: " << flush;
  cin >> text >> n;
  cin.ignore(1000, '\n');

  cout << "Den multiplicerade texten är " << text * n << endl;
}

void uppg3()
{
  int n;
  double f;
  
  cout << "Mata in ett heltal och ett flyttal: " << flush;
  cin >> n >> f;
  cin.ignore(1000, '\n');

  output(n, f); 
  cout << "Heltalets värde är nu " << n << '\n'
       << "Flyttalets värde är nu "
       << fixed << setprecision(1) << f << endl;
}

void uppg4()
{
  string text_1, text_2;
  int total_length;
  double mean_length;
  
  cout << "Mata in två ord: " << flush;
  cin >> text_1 >> text_2;
  cin.ignore(1000, '\n');

  two_string_stats(text_1, text_2, total_length, mean_length);
  cout << "Totallängd: " << total_length << '\n'
       << "Medellängd: "
       << fixed << setprecision(1) << mean_length << endl;
}

//anroppa korrekt underprogram beroänder på användarens val

void run(int const val)
{
  if (val == 1)
    {
      uppg1();
    }
  else if (val == 2)
    {
      uppg2();
    }
  else if (val == 3)
    {
      uppg3();
    }
  else if (val == 4)
    {
      uppg4();
    }
}

//huvudprogram, hanterar engångs utmatning av ledtext och en loop som
//anroppar underprogram:
//meny, körprogram och vid val = 5 hanterar den avslut av programmet

int main()
{
  int val;

  cout << "Välkommen till huvudmenyn!" << endl;
  
  do
    {
      val = menu();
      run(val);
    }
  while (val != 5);
  
  cout << "Ha en bra dag!" << endl;
  
  return 0;
}
