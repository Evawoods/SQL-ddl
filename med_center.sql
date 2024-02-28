-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- I couldn't figure out how to make a many to many table using quickDBD


CREATE TABLE "MedCenter" (
    "id" int   NOT NULL,
    "Medname" text   NOT NULL,
    "roomNum" integer   NOT NULL,
    "doc_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_MedCenter" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Doctors" (
    "id" int   NOT NULL,
    "docName" text   NOT NULL,
    "pt_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_Doctors" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Patients" (
    "id" int   NOT NULL,
    "ptName" text   NOT NULL,
    "diag_id" INTEGER   NOT NULL,
    "doc_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_Patients" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Diagnosis" (
    "id" int   NOT NULL,
    "diagName" text   NOT NULL,
    "pt_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_Diagnosis" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Doctors" ADD CONSTRAINT "fk_Doctors_id" FOREIGN KEY("id")
REFERENCES "MedCenter" ("doc_id");

ALTER TABLE "Doctors" ADD CONSTRAINT "fk_Doctors_pt_id" FOREIGN KEY("pt_id")
REFERENCES "Patients" ("id");

ALTER TABLE "Patients" ADD CONSTRAINT "fk_Patients_diag_id" FOREIGN KEY("diag_id")
REFERENCES "Diagnosis" ("id");

ALTER TABLE "Patients" ADD CONSTRAINT "fk_Patients_doc_id" FOREIGN KEY("doc_id")
REFERENCES "Doctors" ("id");

ALTER TABLE "Diagnosis" ADD CONSTRAINT "fk_Diagnosis_pt_id" FOREIGN KEY("pt_id")
REFERENCES "Patients" ("id");

