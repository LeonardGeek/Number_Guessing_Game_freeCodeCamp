#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET_NUMBER=$(($RANDOM % 1000 + 1))

# get user name
echo Enter your username:
read USER_NAME

# get user_info
USER_INFO=$($PSQL "SELECT games_played, best_game FROM users WHERE user_name='$USER_NAME'")
if [[ -n $USER_INFO ]]
then
  GAMES_PLAYED=$( echo $USER_INFO | sed -r 's/([0-9]+).+/\1/' )
  BEST_GAME=$( echo $USER_INFO | sed -r 's/^[0-9]+\|([0-9]+)+/\1/' )
  echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
else
  echo "Welcome, $USER_NAME! It looks like this is your first time here."
  # insert new user
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(user_name) VALUES('$USER_NAME')")
fi

echo Guess the secret number between 1 and 1000:

NUMBER_OF_GUESSES=0
while :
do
  read GUESS_NUMBER
  if [[ $GUESS_NUMBER =~ ^[0-9]+$ ]]
  then
    if [[ $GUESS_NUMBER = $SECRET_NUMBER ]]
    then
      ((NUMBER_OF_GUESSES++))
      echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
      break
    elif [[ $GUESS_NUMBER < $SECRET_NUMBER ]]
    then
      ((NUMBER_OF_GUESSES++))
      echo "It's higher than that, guess again:"
      continue
    elif [[ $GUESS_NUMBER > $SECRET_NUMBER ]]
    then
      ((NUMBER_OF_GUESSES++))
      echo "It's lower than that, guess again:"
      continue
    fi
  else
    ((NUMBER_OF_GUESSES++))
    echo That is not an integer, guess again:
    continue
  fi
done

((GAMES_PLAYED++))

# update games_played
GAMES_PLAYED_RESULT=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED WHERE user_name='$USER_NAME'")

# update best_game
if [[ $GAMES_PLAYED == 1 ]]
then
  BEST_GAME_RESULT=$($PSQL "UPDATE users SET best_game=$NUMBER_OF_GUESSES WHERE user_name='$USER_NAME'")
else
  if [[ $NUMBER_OF_GUESSES < $BEST_GAME ]]
  then
    BEST_GAME_RESULT=$($PSQL "UPDATE users SET best_game=$NUMBER_OF_GUESSES WHERE user_name='$USER_NAME'")
  fi 
fi
