#include<iostream>
#include<vector>
#include<string>

using namespace std;

using  Word_List_Type = vector<string>;

void read(Word_List_Type & words)
{
  string user_input;
    
  while (cin >> user_input)
    {
      words.push_back(user_input);
    }
  
  cin.ignore(1000, '\n');
}

bool matching_word(string const& word_from_list,
                      string const& search_phrase)
{
  for (size_t i{}; i < word_from_list.size(); ++i) 
    {
      if (search_phrase.at(i) != '.' and
	  word_from_list.at(i) != search_phrase.at(i))
	{
	  return false;
	}
    }
  
  return true;
}

void print_matching(Word_List_Type const& words,
		    string const& search_phrase)
{
 for (size_t i{}; i < words.size(); ++i) 
   {
     if (words.at(i).size() == search_phrase.size()
	 and matching_word(words.at(i), search_phrase))
       {
	 cout << words.at(i) << '\n';
       }
   }
 
 cout << flush;
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
