-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.


-- Drops the tournament database if it exists. This is useful if the database
-- needs to be recreated from scratch.
DROP DATABASE IF EXISTS tournament;

CREATE DATABASE tournament;

\c tournament

CREATE TABLE players(
  playerid serial primary key,
  playername text
);

CREATE TABLE matches(
  matchid serial primary key,
  winnerid int references players(playerid),
  loserid int references players(playerid)
);

CREATE VIEW winners as
  SELECT matchid, winnerid
    FROM matches;

-- Code used for inserting data for testing (not to be graded, personal use)
-- Does not impact tournament_test.py due to it clearing players and matches
INSERT INTO players (playername) values ('Joe Smith');
INSERT INTO players (playername) values ('John Doe');
INSERT INTO players (playername) values ('Jane Apple');
INSERT INTO players (playername) values ('Katie Jones');

INSERT INTO MATCHES (winnerid, loserid) values (
  (SELECT playerid from players where playername = 'Joe Smith'),
  (SELECT playerid from players where playername = 'John Doe')
);
INSERT INTO MATCHES (winnerid, loserid) values (
  (SELECT playerid from players where playername = 'Katie Jones'),
  (SELECT playerid from players where playername = 'Jane Apple')
);
INSERT INTO MATCHES (winnerid, loserid) values (
  (SELECT playerid from players where playername = 'John Doe'),
  (SELECT playerid from players where playername = 'Jane Apple')
);
