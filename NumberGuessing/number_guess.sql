--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: number_guess; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.number_guess (
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.number_guess OWNER TO freecodecamp;

--
-- Data for Name: number_guess; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.number_guess VALUES ('Pepelepu', 1, 3);
INSERT INTO public.number_guess VALUES ('user_1699510210561', 2, 3);
INSERT INTO public.number_guess VALUES ('user_1699511522536', 2, 764);
INSERT INTO public.number_guess VALUES ('user_1699510210562', 5, 3);
INSERT INTO public.number_guess VALUES ('user_1699510314423', 2, 8);
INSERT INTO public.number_guess VALUES ('user_1699511522537', 5, 141);
INSERT INTO public.number_guess VALUES ('Jaimito', 1, 10);
INSERT INTO public.number_guess VALUES ('user_1699510314424', 5, 4);
INSERT INTO public.number_guess VALUES ('user_1699510419563', 2, 7);
INSERT INTO public.number_guess VALUES ('user_1699510419564', 5, 2);
INSERT INTO public.number_guess VALUES ('user_1699511899904', 2, 396);
INSERT INTO public.number_guess VALUES ('user_1699510478472', 2, 2);
INSERT INTO public.number_guess VALUES ('user_1699510478473', 5, 5);
INSERT INTO public.number_guess VALUES ('user_1699511899905', 5, 185);
INSERT INTO public.number_guess VALUES ('user_1699510534471', 2, 7);
INSERT INTO public.number_guess VALUES ('user_1699510534472', 5, 3);
INSERT INTO public.number_guess VALUES ('user_1699510590850', 2, 2);
INSERT INTO public.number_guess VALUES ('user_1699512172720', 2, 708);
INSERT INTO public.number_guess VALUES ('user_1699510590851', 5, 4);
INSERT INTO public.number_guess VALUES ('user_1699510704230', 2, 2);
INSERT INTO public.number_guess VALUES ('user_1699512172721', 5, 328);
INSERT INTO public.number_guess VALUES ('user_1699510704231', 5, 4);
INSERT INTO public.number_guess VALUES ('user_1699510804565', 2, 374);
INSERT INTO public.number_guess VALUES ('user_1699510804566', 5, 53);
INSERT INTO public.number_guess VALUES ('Ricardo', 4, 1);
INSERT INTO public.number_guess VALUES ('user_1699511341112', 2, 252);
INSERT INTO public.number_guess VALUES ('user_1699511341113', 5, 154);
INSERT INTO public.number_guess VALUES ('user_1699511344076', 2, 190);
INSERT INTO public.number_guess VALUES ('user_1699511344077', 5, 130);
INSERT INTO public.number_guess VALUES ('user_1699511347252', 2, 50);
INSERT INTO public.number_guess VALUES ('user_1699511347253', 5, 168);


--
-- PostgreSQL database dump complete
--

