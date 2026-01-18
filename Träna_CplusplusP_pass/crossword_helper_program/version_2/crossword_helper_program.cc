#include <iostream>
#include <string>
#include <vector>

using namespace std;

using Word_List_Type = vector<string>;

void get_word_list(Word_List_Type & word_list)
{
  bool done{};
  string user_input{};
  
  do
    {
      cin >> user_input;
      done = (user_input == "DONE");

      if (!done)
	{
	  word_list.push_back(user_input);
	}
    }
  while (!done);
  
  cin.ignore(1000, '\n');
}

bool is_a_possible_word(string const& crossword,
			string const& word_from_list)
{
  if (word_from_list.size() != crossword.size())
    {
      return false;
    }

  for (size_t i{}; i < word_from_list.size(); ++ i)
    {
      if (crossword.at(i) != '*' and
	  crossword.at(i) != word_from_list.at(i))
	{
	  return false;
	}
    }
  
  return true;
}

Word_List_Type find_possible_words(string         const& crossword,
				   Word_List_Type const& word_list)
{
  Word_List_Type possible_words{};
  
  for (size_t i{}; i < word_list.size(); ++ i)
    {
      if (is_a_possible_word(crossword, word_list.at(i)))
	{
	  possible_words.push_back(word_list.at(i));
	}
    }
  
  return possible_words;
}

void print_words(Word_List_Type const& possible_words)
{
  for (size_t i{}; i < possible_words.size(); ++ i)
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
