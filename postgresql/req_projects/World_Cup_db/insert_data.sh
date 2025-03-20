#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE games, teams")


cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
do
  # inserting teams in teams table  
  if [[ $WINNER != 'winner' && $OPPONENT != 'opponent' ]]
  then
    # Check if WINNER already exists in the teams table
    TEAM_EXISTS=$($PSQL "SELECT 1 FROM teams WHERE name='$WINNER'")
    if [[ -z $TEAM_EXISTS ]]; then
      INSERT_WINNER=$($PSQL "INSERT INTO teams(name) VALUES ('$WINNER')")
    fi

    # Check if OPPONENT already exists in the teams table
    TEAM_EXISTS=$($PSQL "SELECT 1 FROM teams WHERE name='$OPPONENT'")
    if [[ -z $TEAM_EXISTS ]]; then
      INSERT_WINNER=$($PSQL "INSERT INTO teams(name) VALUES ('$OPPONENT')")
    fi
  fi

  # inserting data into games table  ,
  # if [[ $YEAR !='year' && $WINNER != 'winner' && $OPPONENT != 'opponent' && $W_GOALS != 'winner_goals' && $O_GOALS != 'opponent_goals' ]]
  if [[ $YEAR != 'year' ]]
  then
    # get winner team ID
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    
    # get opponent team ID
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    INSERT_DATA=$($PSQL "INSERT INTO 
      games(year, round, winner_id, opponent_id, winner_goals, opponent_goals)
      VALUES 
      ('$YEAR', '$ROUND', '$WINNER_ID', '$OPPONENT_ID', '$W_GOALS', '$O_GOALS')
    ")
  fi
done 