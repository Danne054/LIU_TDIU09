#include <vector>
#include <iostream>
#include <iomanip>
#include <string>
#include <cctype>
#include <algorithm>

using namespace std;

using Word_List_Type = vector<string>;

void read_words(Word_List_Type & words)
{
  string get_word;
  do
  {
    cin >> get_word;
    
    if (!(get_word == "DONE"))
    {
      words.push_back(get_word);
    }
  } while (!(get_word == "DONE"));

  cin.ignore(1000, '\n');
}

bool compare_with_alphabet(char const compare, 
                            char const previos_char)
{
  string alphabet{"abcdefghijklmnopqrstuvwxyz"};

  for (size_t i{}; i < alphabet.size(); ++i)
  {
    if (0 <= static_cast<int>(i) - 1)
    {
      if ((tolower(compare) ==  alphabet.at(i)) and 
        (alphabet.at(i - 1) == tolower(previos_char)))
      {
        return true;
      }
    }
  }

  return false;
}

void find_words_with_sequential_letters(Word_List_Type const& words,
                                        Word_List_Type & sequential_words)
{
  char previos_char{};

  for (size_t i{}; i < words.size(); ++i)
  {
    for (size_t j{}; j < words.at(i).size(); ++j)
    {
      if (compare_with_alphabet(words.at(i).at(j), previos_char)) 
      {
        sequential_words.push_back(words.at(i));
        break;
      }
      previos_char = words.at(i).at(j);
    }

    previos_char = '.';
  }
}

void print(Word_List_Type const& sequential_words)
{
  for (size_t i{}; i < sequential_words.size(); ++i)
  {
    cout << sequential_words.at(i)<< endl;
  }
}

int main()
{
  Word_List_Type words, sequential_words;
  
  cout << "Enter words:" << endl;
  read_words(words);

  find_words_with_sequential_letters(words, sequential_words);

  cout << "Words containing sequential letters:" << endl;
  print(sequential_words);
  
  cout << "End of program.";

  return 0;
}
