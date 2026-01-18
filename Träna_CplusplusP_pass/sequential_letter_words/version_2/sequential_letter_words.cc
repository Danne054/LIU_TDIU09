#include<iostream>
#include<string>
#include<vector>
#include<cctype>

using namespace std;

using Word_List_Type = vector<string>;

void read_words(Word_List_Type & words)
{
  string word_input{};
  bool done{};
  
  do
    {
      cin >> word_input; 
      
      done = (word_input == "DONE");
      
      if (!done)
	{
	  words.push_back(word_input);
	}
    }
  while (!done);

  // for (size_t i{}; i < words.size(); ++i)
  //   {
  //     cout << words.at(i) << '\t' << flush;
  //   }
}

bool look_for_sequential_letters(string const& word)
  {
    string alphabet = "abcdefghijklmnopqrstuvwxyz";
    char previos_letter{};
    
    for (size_t i{}; i < word.size(); ++i)
      {
	if (tolower(word.at(i)) != 'a')
	  {
	    for (size_t j{}; j < alphabet.size(); ++j)
	      {
		if (tolower(word.at(i)) == alphabet.at(j) and
		    previos_letter == alphabet.at(j -1))
		  {
		    return true;
		  }
	      }
	  }
	
	previos_letter = tolower(word.at(i));
      }
    
    return false;
  }

void find_words_with_sequential_letters(Word_List_Type const& words,
					Word_List_Type & sequential_words)
{
  for (size_t i{}; i < words.size(); ++i)
    {
      if (look_for_sequential_letters(words.at(i)))
	{
	  sequential_words.push_back(words.at(i));
	}
    }
}

void print(Word_List_Type const& sequential_words)
{
  for (size_t i{}; i < sequential_words.size(); ++i)
    {
      cout << sequential_words.at(i) << '\n';
    }

  cout << flush;
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
