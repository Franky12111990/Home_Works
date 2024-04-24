CREATE TABLE public.Artists (
    artist_id SERIAL PRIMARY KEY,
    artist_name VARCHAR(255)
);

CREATE TABLE public.Genres (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(255)
);

CREATE TABLE public.Albums (
    album_id SERIAL PRIMARY KEY,
    album_title VARCHAR(255),
    release_year INTEGER
);

CREATE TABLE public.Tracks (
    track_id SERIAL PRIMARY KEY,
    track_title VARCHAR(255),
    duration INTEGER,
    album_id INTEGER REFERENCES public.Albums(album_id)
);

CREATE TABLE public.Collections (
    collection_id SERIAL PRIMARY KEY,
    collection_title VARCHAR(255),
    release_year INTEGER
);

CREATE TABLE public.Artists_Genres (
    artist_id INTEGER REFERENCES public.Artists(artist_id),
    genre_id INTEGER REFERENCES public.Genres(genre_id),
    PRIMARY KEY (artist_id, genre_id)
);

CREATE TABLE public.Artists_Albums (
    artist_id INTEGER REFERENCES public.Artists(artist_id),
    album_id INTEGER REFERENCES public.Albums(album_id),
    PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE public.Tracks_Collections (
    track_id INTEGER REFERENCES public.Tracks(track_id),
    collection_id INTEGER REFERENCES public.Collections(collection_id),
    PRIMARY KEY (track_id, collection_id)
);
