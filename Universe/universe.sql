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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    size_bill_km numeric(9,2),
    tipo character varying(30),
    no_stars integer,
    no_planets integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: human; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.human (
    human_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    planet_id integer,
    percentage integer,
    number integer
);


ALTER TABLE public.human OWNER TO freecodecamp;

--
-- Name: human_human_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.human_human_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.human_human_id_seq OWNER TO freecodecamp;

--
-- Name: human_human_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.human_human_id_seq OWNED BY public.human.human_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    planet_id integer,
    no_humans integer,
    days_trans integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    star_id integer,
    no_moons integer,
    no_humans integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    size_mill_km numeric(9,2),
    galaxy_id integer,
    no_planets integer,
    no_moons integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: human human_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.human ALTER COLUMN human_id SET DEFAULT nextval('public.human_human_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'andromeda', 'bonita', NULL, 'espiral', NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Messier 82', 'bonita', NULL, 'cigarro', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Nube de Magallanes', 'bonita', NULL, 'nube', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'IC 3583', 'bonita', NULL, 'nube', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'NGC', 'bonita', NULL, 'espiral', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Galaxia del sombrero', 'bonita', NULL, 'circular', NULL, NULL);
INSERT INTO public.galaxy VALUES (7, 'Via Lactea', 'bonita', NULL, 'espiral', NULL, NULL);


--
-- Data for Name: human; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.human VALUES (1, 'Negros', 'aguantan el sol', 3, NULL, NULL);
INSERT INTO public.human VALUES (2, 'Asiaticos', 'ojos rasgados', 3, NULL, NULL);
INSERT INTO public.human VALUES (3, 'Blancos', 'son gueros', 3, NULL, NULL);
INSERT INTO public.human VALUES (4, 'Latinos', 'como yo', 3, NULL, NULL);
INSERT INTO public.human VALUES (5, 'Rojos', 'no traen con queso', 3, NULL, NULL);
INSERT INTO public.human VALUES (6, 'Hindu', 'moreno', 3, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'queso', true, 3, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Deimos', 'luna', false, 4, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Phobos', 'luna', false, 4, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Callisto', 'luna', false, 5, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', 'luna', false, 5, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Io', 'luna', false, 5, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Adrastea', 'luna', false, 5, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Aitne', 'luna', false, 5, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Amalthea', 'luna', false, 5, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Ananke', 'luna', false, 5, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Aoede', 'luna', false, 5, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Arche', 'luna', false, 5, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Autonoe', 'luna', false, 5, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Carme', 'luna', false, 5, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Callirhoe', 'luna', false, 5, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Carpo', 'luna', false, 5, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Chaldene', 'luna', false, 5, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Cyllene', 'luna', false, 5, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Elara', 'luna', false, 5, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Erinome', 'luna', false, 5, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Euanthe', 'luna', false, 5, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Eukelade', 'luna', false, 5, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'Euporie', 'luna', false, 5, NULL, NULL);
INSERT INTO public.moon VALUES (24, 'Eurydome', 'luna', false, 5, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', 'chiquillo', false, 6, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', 'gaseoso', false, 6, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'Tierra', 'Bonito', true, 6, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'Marte', 'Rojo', false, 6, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gigante', false, 6, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'Saturno', 'Anillado', false, 6, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'Urano', 'uranus', false, 6, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'Neptuno', 'como el dios', false, 6, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'Pluton', 'ya no es planeta', false, 6, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Vulcan', 'No existe', false, 6, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Raelandia', 'Gigante', false, 4, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Mi planeta', 'Anillado', false, 3, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirio', 'enana blanca', NULL, 7, NULL, NULL);
INSERT INTO public.star VALUES (2, 'Canopus', 'Supergigante blanco', NULL, 7, NULL, NULL);
INSERT INTO public.star VALUES (3, 'Arturo', 'Gigante naranja', NULL, 7, NULL, NULL);
INSERT INTO public.star VALUES (4, 'Alfa Centauri A', 'Enana Amarilla', NULL, 7, NULL, NULL);
INSERT INTO public.star VALUES (5, 'Vega', 'Gigante Blanca', NULL, 7, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Sol', 'enana roja', NULL, 7, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: human_human_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.human_human_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: human human_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.human
    ADD CONSTRAINT human_name_key UNIQUE (name);


--
-- Name: human human_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.human
    ADD CONSTRAINT human_pkey PRIMARY KEY (human_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: human fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.human
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

