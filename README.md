# Anagram Finder

We will be working on a fun application that will detect Anagrams.
An anagram is a word formed by rearranging the letters of another word,
e.g. dog is an anagram for god.

To detect anagrams we will need a dictionary of words and the word itself.
The application will then go through the dictionary and return only those
words that are anagrams.

For this application we will not worry if the words are not valid English. e.g odg
is an anagram for dog.

### Note:
In this exerices we will try something different. I have already written the descriptions
for the tests and set them to 'skip'. The objective is to write a failing test from the
description, get them to pass and then move onto the next test. Refactoring Tests or Code
will only be allowed when tests are passing (Green).

Take a look at the [test file](https://github.com/orlandorubydojo/anagram_finder/blob/master/test/anagram_finder_test.rb) for the test examples.

# Sample Implementation

```ruby
anagram_finder = AnagramFinder.new(word: 'dog', dictionary: ['god','goose', 'sod'])
anagram.word # => 'dog'
anagram.dictionary #=> ['god','goose', 'sod']
anagram.detect #=> ['god']

# If a dictionary is not given
anagram_finder = AnagramFinder.new(word: 'dog')
anagram_finder.detect #=> 'No Anagrams were detected for dog'

# If there are no anagrams
anagram_finder = AnagramFinder.new(word: 'dog', dictionary: ['ruby','javascript', 'swift'])
anagram_finder.detect #=> 'No Anagrams were detected for dog'

# If there are identicals
anagram_finder = AnagramFinder.new(word: 'dog', dictionary: ['dog', 'Dog'])
anagram_finder.detect #=> 'No Anagrams were detected for dog'

```
