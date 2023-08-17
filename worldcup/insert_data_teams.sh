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

  fi

done
