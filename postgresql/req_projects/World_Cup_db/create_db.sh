#!/bin/bash
psql --username=postgres -d postgres -c "DROP DATABASE IF EXISTS worldcup"
psql --username=postgres -d postgres -c "CREATE DATABASE worldcup"

PSQL="psql -X --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

CREATE_TEAMS=$($PSQL "
  CREATE TABLE teams(
    team_id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR NOT NULL UNIQUE
  )
")

CREATE_GAMES=$($PSQL "
  CREATE TABLE games(
    game_id SERIAL PRIMARY KEY NOT NULL,
    year INT NOT NULL,
    round VARCHAR NOT NULL,
    winner_id INT NOT NULL,
    opponent_id INT NOT NULL,
    FOREIGN KEY (winner_id) REFERENCES teams(team_id),
    FOREIGN KEY (opponent_id) REFERENCES teams(team_id),
    winner_goals INT NOT NULL,
    opponent_goals INT NOT NULL
  )
")