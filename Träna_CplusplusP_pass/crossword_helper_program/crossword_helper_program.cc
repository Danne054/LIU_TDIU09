#include <vector>
#include <iostream>
#include <string>
#include <cctype>
#include <algorithm>

using namespace std;

using Word_List_Type =  vector<string>;

void get_word_list(Word_List_Type & word_list)
{
  string user_input{};
  bool end_input{};
  
  do
    {
      cin >> user_input;
      end_input = (user_input == "DONE");
      if (!end_input)
	{
	  word_list.push_back(user_input);
	}
    }
  while (!end_input);
}

bool matching_characters(string const& crossword,
			 string const& word_in_list)
{
  bool matching_chars{true};
  for (size_t i{}; i < crossword.size(); ++i)
    {
      if (crossword.at(i) != '*' and
	  word_in_list.at(i) == crossword.at(i))
	{
	 matching_chars = true;
	}
      else if (crossword.at(i) != '*')
	{
	  return false;
	  break;
	}
    }
	  
  return matching_chars;
}

Word_List_Type find_possible_words(string const& crossword,
				   Word_List_Type const& word_list)
{
  Word_List_Type possible_words{};
  
  for (size_t i{}; i < word_list.size(); ++i)
    {
      if (word_list.at(i).size() == crossword.size()
	  and matching_characters(crossword, word_list.at(i)))
	{
	  possible_words.push_back(word_list.at(i));
	}
    }
  
  return possible_words;
}

void print_words(Word_List_Type const& possible_words)
{
  for (size_t i{}; i < possible_words.size(); ++i)
    {
      cout << possible_words.at(i) << '\n';
    }

  cout << flush;
}

int main()
{
  Word_List_Type word_list;
  Word_List_Type possible_words;
  string crossword;
  
  cout << "Enter word list:" << endl;
  get_word_list(word_list);

  cout << "Enter crosswords:" << endl;
  while(cin >> crossword)
  {
    possible_words = find_possible_words(crossword, word_list);
    
    cout << "Possible words for " << crossword << endl;
    print_words(possible_words);
  }
  return 0;
}
