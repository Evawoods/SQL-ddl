-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "League" (
    "id" int   NOT NULL,
    "team_id" INTEGER   NOT NULL,
    "season_start_id" INTEGER   NOT NULL,
    "season_end_id" INTEGER   NOT NULL,
    "rank_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_League" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Teams" (
    "id" int   NOT NULL,
    "player_id" INTEGER   NOT NULL,
    "ranking_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_Teams" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Players" (
    "id" int   NOT NULL,
    "team_id" INTEGER   NOT NULL,
    "league_id" INTEGER   NOT NULL,
    "goal_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_Players" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Goals" (
    "id" int   NOT NULL,
    "player_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_Goals" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Games" (
    "id" int   NOT NULL,
    "goal_id" INTEGER   NOT NULL,
    "referee_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_Games" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Referees" (
    "id" int   NOT NULL,
    "game_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_Referees" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Season" (
    "start_id" int   NOT NULL,
    "end_id" int   NOT NULL,
    CONSTRAINT "pk_Season" PRIMARY KEY (
        "start_id","end_id"
     )
);

CREATE TABLE "Rankings" (
    "id" int   NOT NULL,
    "team_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_Rankings" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "League" ADD CONSTRAINT "fk_League_id" FOREIGN KEY("id")
REFERENCES "Players" ("league_id");

ALTER TABLE "League" ADD CONSTRAINT "fk_League_team_id" FOREIGN KEY("team_id")
REFERENCES "Rankings" ("team_id");

ALTER TABLE "Teams" ADD CONSTRAINT "fk_Teams_id_ranking_id" FOREIGN KEY("id", "ranking_id")
REFERENCES "League" ("team_id", "rank_id");

ALTER TABLE "Teams" ADD CONSTRAINT "fk_Teams_player_id" FOREIGN KEY("player_id")
REFERENCES "Players" ("id");

ALTER TABLE "Players" ADD CONSTRAINT "fk_Players_team_id" FOREIGN KEY("team_id")
REFERENCES "Teams" ("id");

ALTER TABLE "Players" ADD CONSTRAINT "fk_Players_goal_id" FOREIGN KEY("goal_id")
REFERENCES "Goals" ("id");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_id" FOREIGN KEY("id")
REFERENCES "Games" ("goal_id");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_player_id" FOREIGN KEY("player_id")
REFERENCES "Players" ("id");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_id" FOREIGN KEY("id")
REFERENCES "Referees" ("game_id");

ALTER TABLE "Referees" ADD CONSTRAINT "fk_Referees_id" FOREIGN KEY("id")
REFERENCES "Games" ("referee_id");

ALTER TABLE "Season" ADD CONSTRAINT "fk_Season_start_id_end_id" FOREIGN KEY("start_id", "end_id")
REFERENCES "League" ("season_start_id", "season_end_id");

ALTER TABLE "Rankings" ADD CONSTRAINT "fk_Rankings_id" FOREIGN KEY("id")
REFERENCES "Teams" ("ranking_id");

