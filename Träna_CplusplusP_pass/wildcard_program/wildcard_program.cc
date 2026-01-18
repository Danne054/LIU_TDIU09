#include <vector>
#include <iostream>
#include <iomanip>
#include <string>
#include <cctype>
#include <algorithm>

using namespace std;

using Word_List_Type = vector<string>;

void read(Word_List_Type & words)
{
  string input_word;
  
  while (cin >> input_word)
    {
      words.push_back(input_word);
    }
  
  cin.ignore(1000, '\n');
}

string find_pattern(string const& pattern)
{
  string chars;
  
  for (size_t i = 0; i < pattern.size(); i++)
    {
      if (pattern[i] != '.')
	{
	  chars += pattern[i];
	}
    }
  return chars;
}

void print_matching(Word_List_Type const& words,
		    string const& search_phrase)
{
  string temp_string;
  string patern;
  string temp_pattern;
  
  patern = find_pattern(search_phrase);
  
  for (size_t i{}; i < words.size(); ++i)//index över vectoren 
    {
      temp_pattern = "";
      for (size_t j{}; j < search_phrase.size(); ++j)//index över vectorens sträng 
	{
	  temp_string = words.at(i);
	  
	  if (temp_string[j] == search_phrase[j] and temp_string[j] != '.')
	    {
	      temp_pattern += temp_string[j];
	    }
	}
      
      if (temp_pattern == patern and temp_string.size() == search_phrase.size())
	{
	  cout << temp_string << endl;	  
	}
    }
}

int main()
{
  Word_List_Type words;
  string search_phrase;

  cout << "Enter search phrase: ";
  cin >> search_phrase;
  cin.ignore(1000, '\n');
 
  cout << "Enter words: ";
  read(words);
  
  cout << "Matching words:" << endl;
  print_matching(words, search_phrase);
  
  return 0;
}
