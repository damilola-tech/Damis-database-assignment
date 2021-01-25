create DATABASE movie;
use movie;

-- actor table--
create TABLE actor (
	act_id      INTEGER     NOT NULL,
    act_fname	CHAR(20)	NOT NULL,
	act_lname	char(20)	NOT NULL,
    act_gender	char(1)	NOT NULL,
    CONSTRAINT	actor_pk	PRIMARY KEY(act_id)
	);
    
        -- movie table--
    
    create TABLE movie (
		mov_id 		INTEGER     NOT NULL,
        mov_title   CHAR(50)    NOT NULL,
        mov_year	INTEGER     NOT NULL,
        mov_time	INTEGER     NOT NULL,
        mov_lang	CHAR(50)    NOT NULL,
        mov_dt_rel  DATE        NOT NULL,
        -- mov_rel_country INTEGER NOT NULL,
        mov_rel_country CHAR(5) NOT NULL,
        CONSTRAINT  movie_pk	PRIMARY KEY(mov_id)
	);
    
    alter table movie
    modify mov_dt_rel  DATE NULL;
   
   -- genre table--
    
    create TABLE genres (
		gen_id 		INTEGER     NOT NULL,
        gen_title   CHAR(20)    NOT NULL,
        CONSTRAINT  genres_pk	PRIMARY KEY(gen_id)
        );
       
  
  -- reviewer table--
    
    create TABLE reviewer (
        rev_id		INTEGER     NOT NULL,
        rev_name    CHAR(30)    NOT NULL,
		CONSTRAINT  reviewer_pk	PRIMARY KEY(rev_id)
        );
        
         -- rating table--
create TABLE rating (
	mov_id        INTEGER   NOT NULL,
    rev_id   	  INTEGER 	NOT NULL,
	rev_stars	  INTEGER,
    num_o_ratings INTEGER,
    constraint rating_pk primary key(mov_id),
    CONSTRAINT rating_fk_1	FOREIGN KEY(mov_id)
							REFERENCES movie(mov_id),
	CONSTRAINT rating_fk_2	FOREIGN KEY(rev_id)
							REFERENCES reviewer(rev_id)
	);
    
alter table rating
modify rev_stars	   NUMERIC(4,2)		NULL,
modify num_o_ratings   INTEGER			NULL;
	      
   
   -- director table--
    
    create TABLE director (
        dir_id		INTEGER     NOT NULL,
        dir_fname   CHAR(20)    NOT NULL,
        dir_lname   CHAR(20)    NOT NULL,
		CONSTRAINT  director_pk	PRIMARY KEY(dir_id)
        );
       
       
          -- movie_cast table--
    
    create TABLE movie_cast (
        mov_id		INTEGER     NOT NULL,
        act_id      INTEGER     NOT NULL,
        role        CHAR(30)    NOT NULL,
        CONSTRAINT movie_cast_pk	PRIMARY KEY(mov_id, act_id),
        CONSTRAINT  movie_cast_fk_1	FOREIGN KEY(mov_id)
									REFERENCES movie(mov_id),
        CONSTRAINT  movie_cast_fk_2	FOREIGN KEY(act_id)
									REFERENCES actor(act_id)
        );
        
        
         -- movie_direction table--
    
    create TABLE movie_direction (
        dir_id		INTEGER     NOT NULL,
        mov_id      INTEGER     NOT NULL,
        CONSTRAINT  movie_direction_pk		PRIMARY KEY(dir_id, mov_id),
        CONSTRAINT  movie_direction_fk_1	FOREIGN KEY(dir_id)
										    REFERENCES director(dir_id),
        CONSTRAINT  movie_direction_fk_2	FOREIGN KEY(mov_id)
										    REFERENCES movie(mov_id)
        );
       
       
	   -- movie_genres table--
    
    create TABLE movie_genres (
        mov_id		INTEGER     NOT NULL,
        gen_id   	INTEGER   NOT NULL,
        CONSTRAINT movie_genres_pk		PRIMARY KEY(mov_id, gen_id),
        CONSTRAINT  movie_genres_fk_1	FOREIGN KEY(mov_id) REFERENCES movie(mov_id),
        CONSTRAINT  movie_genres_fk_2	FOREIGN KEY(gen_id) REFERENCES genres(gen_id)
        );
        
        
       