#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
# Read from games.csv
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS

#read line by line
do
  #exclude first line
  if [[ $YEAR != "year" ]]
  then
    #insert data into teams
    #get team_id
    TEAM_ID=$($PSQL "select team_id from teams where name='$WINNER' ")
    #if not exist
    if [[ -z $TEAM_ID ]]
    then
      #insert into teams 
      INSERT_INTO_TEAMS_RESULT=$($PSQL "insert into teams(name) values('$WINNER')")
      if [[ $INSERT_INTO_TEAMS_RESULT == 'INSERT 0 1' ]]
      then
        echo Inserted $WINNER
      fi
    fi
    #get team_id
    TEAM_ID=$($PSQL "select team_id from teams where name='$OPPONENT' ")
    #if not exist
    if [[ -z $TEAM_ID ]]
    then
      #insert into teams 
      INSERT_INTO_TEAMS_RESULT=$($PSQL "insert into teams(name) values('$OPPONENT')")
      if [[ $INSERT_INTO_TEAMS_RESULT == 'INSERT 0 1' ]]
      then
        echo Inserted $OPPONENT
      fi
    fi

    #insert into games
    #get team_id
    WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER' ")
    OPPONENT_ID=$($PSQL "select team_id from teams where name='$OPPONENT' ")

    #if team_id not exist
    if [[ $WINNER_ID && $OPPONENT_ID  ]]
    then
      #echo exist $WINNER_ID $OPPONENT_ID
      #insert into games
      INSERT_INTO_GAMES_RESULT=$($PSQL "insert into games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) values('$YEAR','$ROUND','$WINNER_ID','$OPPONENT_ID','$WINNER_GOALS','$OPPONENT_GOALS') ")
    fi
  fi

done
