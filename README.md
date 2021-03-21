BASIC RUBY PROJECT

PROJECT 8 : Hangman

Files are a great way to save and reload a game, so we’ll give it a shot here by building Hangman.

Assignment

You will be building a simple command line Hangman game where one player plays against the computer, but a bit more advanced. If you’re unfamiliar with how Hangman works, see Wikipedia.

    Download the 5desk.txt dictionary file from http://scrapmaker.com/.
    When a new game is started, your script should load in the dictionary and randomly select a word between 5 and 12 characters long for the secret word.
    You don’t need to draw an actual stick figure (though you can if you want to!), but do display some sort of count so the player knows how many more incorrect guesses he/she has before the game ends. You should also display which correct letters have already been chosen (and their position in the word, e.g. _ r o g r a _ _ i n g) and which incorrect letters have already been chosen.
    Every turn, allow the player to make a guess of a letter. It should be case insensitive. Update the display to reflect whether the letter was correct or incorrect. If out of guesses, the player should lose.
    Now implement the functionality where, at the start of any turn, instead of making a guess the player should also have the option to save the game. Remember what you learned about serializing objects… you can serialize your game class too!
    When the program first loads, add in an option that allows you to open one of your saved games, which should jump you exactly back to where you were when you saved. Play on!

---
Learned about serialization. Used JSON to save and load files.

Improvement : When user input, there is no check as to whether it is onlt a letter or a string or a special character.  