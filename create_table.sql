-- --- --- Create database --- --- ---
CREATE DATABASE tickitz OWNER tickitz;


-- --- --- Enums --- --- ---
CREATE TYPE "role_type" AS ENUM ('admin', 'user');


-- --- --- Core Tables --- --- ---
CREATE TABLE "users" (
  "id" UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  "role" role_type DEFAULT 'user',
  "email" TEXT UNIQUE NOT NULL,
  "password" TEXT NOT NULL,
  "created_at" TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE "user_profiles" (
  "user_id" UUID PRIMARY KEY,
  "first_name" VARCHAR(30),
  "last_name" VARCHAR(30),
  "img" TEXT,
  "phone_number" VARCHAR(13),
  "points" INT,
  "created_at" TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE "transactions" (
  "id" UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  "user_id" UUID NOT NULL,
  "payment_id" INT NOT NULL,
  "total_payment" INT,
  "is_paid" BOOLEAN,
  "is_scanned" BOOLEAN,
  "full_name" VARCHAR(60), -- auto-filled from user_profiles (front-end)
  "email" TEXT, -- record for historical email
  "phone_number" VARCHAR(13),
  "paid_at" TIMESTAMPTZ,
  "created_at" TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  "schedule_id" INT
);


-- --- --- Reference Tables --- --- ---
CREATE TABLE "payments" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "method" TEXT NOT NULL,
  "img" TEXT NOT NULL
);


CREATE TABLE "cinemas" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "name" TEXT NOT NULL,
  "img" TEXT NOT NULL,
  "ticket_price" INT NOT NULL
);


CREATE TABLE "cities" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "name" TEXT UNIQUE NOT NULL
);


CREATE TABLE "show_times" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "start_at" TIME UNIQUE NOT NULL
);


CREATE TABLE "seat_codes" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "seat_code" VARCHAR(3) NOT NULL
);


CREATE TABLE "genres" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "name" VARCHAR(20) UNIQUE NOT NULL
);


CREATE TABLE "people" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "name" TEXT UNIQUE NOT NULL
);


CREATE TABLE "movie_genres" (
  "movie_id" INT, 
  "genre_id" INT,
  PRIMARY KEY ("movie_id", "genre_id")
  );



-- done
CREATE TABLE "movies" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "title" TEXT NOT NULL,
  "synopsis" TEXT ,
  "poster_img" TEXT,
  "backdrop_img" TEXT,
  "duration_minutes" INT,
  "release_date" DATE,
  "director_id" INT,
  "age_rating_id" INT,
  "created_at" TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

create table "age_ratings" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  age_rating TEXT UNIQUE NOT NULL
);
-- Assoc table
-- done
CREATE TABLE "movie_actors" (
  "actor_id" INT, 
  "movie_id" INT,
  PRIMARY KEY (actor_id, movie_id)
);

-- done
CREATE TABLE "schedules" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "movie_id" INT NOT NULL,
  "city_id" INT NOT NULL,
  "show_time_id" INT NOT NULL,
  "cinema_id" INT NOT NULL,
  "show_date" DATE NOT NULL
);

-- done
CREATE TABLE "transactions_seats" (
  "seats_id" INT,
  "transactions_id" UUID,
  PRIMARY KEY ("seats_id", "transactions_id")
);



ALTER TABLE
  "transactions"
ADD
  FOREIGN KEY ("user_id") REFERENCES "users" ("id");
ALTER TABLE
  "transactions"
ADD
  FOREIGN KEY ("schedule_id") REFERENCES "schedules" ("id");
ALTER TABLE
  "movies"
ADD
  FOREIGN KEY ("director_id") REFERENCES "people" ("id");
ALTER TABLE
  "transactions"
ADD
  FOREIGN KEY ("payment_id") REFERENCES "payments" ("id");

ALTER TABLE
  "schedules"
ADD
  FOREIGN KEY ("show_time_id") REFERENCES "show_times" ("id");

ALTER TABLE
  "movie_genres"
ADD
  FOREIGN KEY ("genre_id") REFERENCES "genres" ("id");
ALTER TABLE
  "movie_genres"
ADD
  FOREIGN KEY ("movie_id") REFERENCES "movies" ("id");
ALTER TABLE
  "movie_actors"
ADD
  FOREIGN KEY ("actor_id") REFERENCES "people" ("id");
ALTER TABLE
  "movie_actors"
ADD
  FOREIGN KEY ("movie_id") REFERENCES "movies" ("id");
ALTER TABLE
  "schedules"
ADD
  FOREIGN KEY ("city_id") REFERENCES "cities" ("id");
ALTER TABLE
  "schedules"
ADD
  FOREIGN KEY ("movie_id") REFERENCES "movies" ("id");
ALTER TABLE
  "user_profiles"
ADD
  FOREIGN KEY ("user_id") REFERENCES "users" ("id");
ALTER TABLE
  "schedules"
ADD
  FOREIGN KEY ("cinema_id") REFERENCES "cinemas" ("id");
ALTER TABLE
  "transactions_seats"
ADD
  FOREIGN KEY ("seats_id") REFERENCES "seat_codes" ("id");
ALTER TABLE
  "transactions_seats"
ADD
  FOREIGN KEY ("transactions_id") REFERENCES "transactions" ("id");

alter table
  movies
add
  constraint fk_age_rating foreign key (age_rating_id) references age_ratings (id);