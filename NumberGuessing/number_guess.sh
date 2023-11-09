#!/bin/bash
NUMBER=$[RANDOM%1000+1]
PSQL="psql --username=freecodecamp --dbname=number_guess -t --tuples-only -c"


echo "Enter your username:"
read USERNAME
USERNAME_EXISTS=$($PSQL "SELECT * FROM number_guess WHERE username = '$USERNAME'")
if [[ -z $USERNAME_EXISTS ]]
then
echo "Welcome, $USERNAME! It looks like this is your first time here."
  echo "Guess the secret number between 1 and 1000:"
  COUNTER=1
  while [[ $GUESS != $NUMBER ]]
  do
    read GUESS
    if [[ $GUESS =~ ^[0-9]+$ ]]
    then
      if [[ $GUESS == $NUMBER ]]
      then
        echo "You guessed it in $COUNTER tries. The secret number was $NUMBER. Nice job!"
        break
      else
        if [[ $GUESS -gt $NUMBER ]]
        then
          echo "It's lower than that, guess again:"
          COUNTER=$[$COUNTER +1]
        else
          echo "It's higher than that, guess again:"
          COUNTER=$[$COUNTER +1]
        fi
      fi
    else
      echo "That is not an integer, guess again:"
    fi
  done
  RECORD_ADD=$($PSQL "INSERT INTO number_guess VALUES ('$USERNAME', 1, $COUNTER);")
else
  USERNAME_NEW=$($PSQL "SELECT username FROM number_guess WHERE username='$USERNAME';")
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM number_guess WHERE username='$USERNAME';")
  BEST_GAME=$($PSQL "SELECT best_game FROM number_guess WHERE username='$USERNAME';")
  USERNAME_FORM=$(echo $USERNAME_NEW | sed 's/ //g')
  GAMES_PLAYED_FORM=$(echo $GAMES_PLAYED | sed 's/ //g')
  BEST_GAME_FORM=$(echo $BEST_GAME | sed 's/ //g')
  echo "Welcome back, $USERNAME_FORM! You have played $GAMES_PLAYED_FORM games, and your best game took $BEST_GAME_FORM guesses."
  echo "Guess the secret number between 1 and 1000:"
  COUNTER=1
  while [[ $GUESS != $NUMBER ]]
  do
    read GUESS
    if [[ $GUESS =~ ^[0-9]+$ ]]
    then
      if [[ $GUESS == $NUMBER ]]
      then
        echo "You guessed it in $COUNTER tries. The secret number was $NUMBER. Nice job!"
        break
      else
        if [[ $GUESS -gt $NUMBER ]]
        then
          echo "It's lower than that, guess again:"
          COUNTER=$[$COUNTER +1]
        else
          echo "It's higher than that, guess again:"
          COUNTER=$[$COUNTER +1]
        fi
      fi
    else
      echo "That is not an integer, guess again:"
    fi
  done
  GAMES_PLAYED_NEW=$[$GAMES_PLAYED_FORM+1]
   if [[ $COUNTER -lt $BEST_GAME_FORM ]]
    then
      RECORD_ADD=$($PSQL "UPDATE number_guess SET games_played=$GAMES_PLAYED_NEW, best_game=$COUNTER WHERE username='$USERNAME';")
    else
      RECORD_ADD=$($PSQL "UPDATE number_guess SET games_played=$GAMES_PLAYED_NEW WHERE username='$USERNAME';")
    fi
fi

