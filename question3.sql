
CREATE TABLE public.instrument (
                Name VARCHAR(20) NOT NULL,
                Pitch VARCHAR(5) NOT NULL,
                CONSTRAINT instrument_pk PRIMARY KEY (Name)
);


CREATE TABLE public.address (
                AddressID INTEGER NOT NULL,
                Number VARCHAR(30) NOT NULL,
                Street1 VARCHAR(30) NOT NULL,
                Street2 VARCHAR(30) NOT NULL,
                City VARCHAR(20) NOT NULL,
                State VARCHAR(20) NOT NULL,
                Telephone VARCHAR(12) NOT NULL,
                ZipCode INTEGER NOT NULL,
                CONSTRAINT address_pk PRIMARY KEY (AddressID)
);


CREATE TABLE public.musician (
                SSN INTEGER NOT NULL,
                AddressID INTEGER NOT NULL,
                Name VARCHAR(20) NOT NULL,
                CONSTRAINT musician_pk PRIMARY KEY (SSN)
);


CREATE TABLE public.album (
                AlbumID INTEGER NOT NULL,
                Title VARCHAR(20) NOT NULL,
                Release_Date DATE NOT NULL,
                Format VARCHAR(20) NOT NULL,
                Age INTEGER NOT NULL,
                Producer INTEGER NOT NULL,
                CONSTRAINT album_pk PRIMARY KEY (AlbumID)
);


CREATE TABLE public.song (
                Title VARCHAR(20) NOT NULL,
                Length TIME NOT NULL,
                AlbumID INTEGER NOT NULL,
                Author INTEGER NOT NULL,
                CONSTRAINT song_pk PRIMARY KEY (Title)
);


CREATE TABLE public.used_in (
                Name VARCHAR(20) NOT NULL,
                Title VARCHAR(20) NOT NULL,
                CONSTRAINT used_in_pk PRIMARY KEY (Name, Title)
);


CREATE TABLE public.plays (
                SSN INTEGER NOT NULL,
                Name VARCHAR(20) NOT NULL,
                CONSTRAINT plays_pk PRIMARY KEY (SSN, Name)
);


CREATE TABLE public.performs (
                PerformerID INTEGER NOT NULL,
                Title VARCHAR(20) NOT NULL,
                CONSTRAINT performs_pk PRIMARY KEY (PerformerID, Title)
);


ALTER TABLE public.plays ADD CONSTRAINT instrument_plays_fk
FOREIGN KEY (Name)
REFERENCES public.instrument (Name)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.used_in ADD CONSTRAINT instrument_used_in_fk
FOREIGN KEY (Name)
REFERENCES public.instrument (Name)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.musician ADD CONSTRAINT address_musician_fk
FOREIGN KEY (AddressID)
REFERENCES public.address (AddressID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.performs ADD CONSTRAINT musician_performs_fk
FOREIGN KEY (PerformerID)
REFERENCES public.musician (SSN)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.plays ADD CONSTRAINT musician_plays_fk
FOREIGN KEY (SSN)
REFERENCES public.musician (SSN)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.song ADD CONSTRAINT musician_song_fk
FOREIGN KEY (Author)
REFERENCES public.musician (SSN)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.album ADD CONSTRAINT musician_album_fk
FOREIGN KEY (Producer)
REFERENCES public.musician (SSN)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.song ADD CONSTRAINT album_song_fk
FOREIGN KEY (AlbumID)
REFERENCES public.album (AlbumID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.used_in ADD CONSTRAINT song_used_in_fk
FOREIGN KEY (Title)
REFERENCES public.song (Title)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.performs ADD CONSTRAINT song_performs_fk
FOREIGN KEY (Title)
REFERENCES public.song (Title)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
