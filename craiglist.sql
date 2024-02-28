-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Post" (
    "id" int   NOT NULL,
    "region_id" INTEGER   NOT NULL,
    "title" text   NOT NULL,
    "text" text   NOT NULL,
    "user_id" INTEGER   NOT NULL,
    "username" text   NOT NULL,
    "location" text   NOT NULL,
    "category" text   NOT NULL,
    CONSTRAINT "pk_Post" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Region" (
    "id" int   NOT NULL,
    "user_id" INTEGER   NOT NULL,
    "location" text   NOT NULL,
    CONSTRAINT "pk_Region" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "User" (
    "id" int   NOT NULL,
    "region_id" INTEGER   NOT NULL,
    "username" text   NOT NULL,
    "location" text   NOT NULL,
    CONSTRAINT "pk_User" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Post" ADD CONSTRAINT "fk_Post_user_id" FOREIGN KEY("user_id")
REFERENCES "Region" ("user_id");

ALTER TABLE "Region" ADD CONSTRAINT "fk_Region_id_location" FOREIGN KEY("id", "location")
REFERENCES "User" ("region_id", "location");

ALTER TABLE "User" ADD CONSTRAINT "fk_User_id_region_id_username_location" FOREIGN KEY("id", "region_id", "username", "location")
REFERENCES "Post" ("user_id", "region_id", "username", "location");

