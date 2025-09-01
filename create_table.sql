-- Create database for owner tickitz
create database tickitz owner tickitz;

-- Enum
CREATE TYPE "role_type" AS ENUM ('admin', 'user');

-- done
CREATE TABLE "transactions" (
  "id" UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  "user_id" UUID,
  "payment_id" INT,
  "paid_at" TIMESTAMPTZ,
  "total_payment" INT,
  "is_paid" BOOLEAN,
  "full_name" VARCHAR(60),
  -- jika sudah ada first & last name di user_profiles, ini di isi otomatis disisi front-end
  "email" TEXT,
  -- disini dicatat email agar jika user ganti email, ada catatan dulu user ini transaksi di email mana
  "phone_number" VARCHAR(13),
  "created_at" TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  "schedule_id" INT
);

-- done
CREATE TABLE "cinemas" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "name" TEXT NOT NULL,
  "img" TEXT NOT NULL,
  "ticket_price" INT NOT NULL
);

-- done
CREATE TABLE "payments" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "method" TEXT NOT NULL,
  "img" TEXT NOT NULL
);

-- done
CREATE TABLE "users" (
  "id" UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  "role" role_type DEFAULT 'user',
  "email" TEXT,
  "password" TEXT,
  "created_at" TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- done
CREATE TABLE "user_profiles" (
  "user_id" UUID PRIMARY KEY,
  "first_name" VARCHAR(30),
  "last_name" VARCHAR(30),
  "profile_img" TEXT,
  "phone_number" VARCHAR(13),
  "points" INT,
  "created_at" TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- done
CREATE TABLE "movies" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "title" TEXT,
  "synopsis" TEXT,
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
) 
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
  "movie_id" INT,
  "city_id" INT,
  "show_time_id" INT,
  "cinema_id" INT,
  "show_date" DATE
);

-- done
CREATE TABLE "transactions_seats" (
  "seats_id" INT,
  "transactions_id" UUID,
  PRIMARY KEY ("seats_id", "transactions_id")
);

-- done
CREATE TABLE "seat_codes" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "seat_code" VARCHAR(3) NOT NULL
);

-- done
CREATE TABLE "cities" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "name" TEXT UNIQUE NOT NULL
);

-- done
CREATE TABLE "show_time" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "show_time" TIME UNIQUE NOT NULL
);

-- done
CREATE TABLE "movie_genres" (
  "movie_id" INT, 
  "genre_id" INT,
  PRIMARY KEY ("movie_id", "genre_id")
  );

-- done
CREATE TABLE "genre" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "name" VARCHAR(20) UNIQUE NOT NULL
);

-- done
CREATE TABLE "people" (
  "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "name" TEXT UNIQUE NOT NULL
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
  FOREIGN KEY ("show_time_id") REFERENCES "show_time" ("id");

ALTER TABLE
  "movie_genres"
ADD
  FOREIGN KEY ("genre_id") REFERENCES "genre" ("id");
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

