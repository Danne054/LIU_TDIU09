#include <vector>
#include <iostream>
#include <iomanip>
#include <string>
#include <cctype>
#include <algorithm>

using namespace std;

using Times_Type = vector<double>;

struct Runner_Type
{
  string firstname;
  string lastname;
  string club;
  Times_Type times;
};

using Runners = vector<Runner_Type>;

void sort(Runners & runner_arr)
{
  Times_Type Vector_Fastest;
  Runners temp_vector;

  for (size_t i{}; i < runner_arr.size(); ++i)
  {
    sort(begin(runner_arr.at(i).times), end(runner_arr.at(i).times));

    
    Vector_Fastest.push_back(runner_arr.at(i).times.at(0));
  }

  sort(begin(Vector_Fastest), end(Vector_Fastest));
  Vector_Fastest.erase(unique(Vector_Fastest.begin(), Vector_Fastest.end()), Vector_Fastest.end());
  
  for (size_t z{}; z < Vector_Fastest.size(); ++z)
  {
    for (size_t i{}; i < runner_arr.size(); ++i)
    {
      if (runner_arr.at(i).times.at(0) == Vector_Fastest.at(z))
      {
        temp_vector.push_back(runner_arr.at(i));
      }
    }
  }
  runner_arr = temp_vector;
  temp_vector.clear();
}

void cin_runner_names(Runners & runner_arr)
{
  bool exit;

  Runner_Type tmprunner;

  do
    {
      cin >> tmprunner.firstname;
      exit = (tmprunner.firstname == "KLAR");
      
      if (!exit)
      {
        cin >> tmprunner.lastname;
        getline(cin, tmprunner.club);
        runner_arr.push_back(tmprunner);
      }
    }
  while (!exit);
}

void cin_runner_times(Runners & runner_arr)
{
  bool exit;
  double tmp;
  
  for (size_t i{}; i < runner_arr.size(); ++i)
  {
    cout << "Tider " << runner_arr.at(i).firstname << ": " << flush;

    do
    {
      cin >> tmp;
      exit = (tmp == -1.00);

      if (!exit)
        {
          runner_arr.at(i).times.push_back(tmp);
        }
    }
    while(!exit);
  }
  
}

void header()
{
  cout << setw(9) << "Efternamn"
       << setw(11) << "Förnamn"
       << setw(23) <<  "Klubb: Tider" << '\n'
       << "==========================================" 
       << fixed << setprecision(2) << endl;
}

void cout_runner_arr(Runners & runner_arr)
{
  for (size_t i{}; i < runner_arr.size(); ++i)
  {
    cout << setw(9) << runner_arr.at(i).lastname 
          << setw(10) << runner_arr.at(i).firstname 
          << setw(16) << runner_arr.at(i).club << ':' << flush;

    for (size_t z{}; z < runner_arr.at(i).times.size(); ++z)
    {
      cout << ' ' << runner_arr.at(i).times.at(z) << flush;
    }
    cout << '\n';
  }
}

int main()
{
  Runners runner_arr;
  string firstname;
  string lastname;
  string club;
  
  cout << "Mata in deltagare:" << endl;

  cin_runner_names(runner_arr);
  cin_runner_times(runner_arr);

  sort(runner_arr);

  header();
  cout_runner_arr(runner_arr);
}
