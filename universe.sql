--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: universe; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO postgres;

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type text NOT NULL,
    has_black_hole boolean NOT NULL,
    age_in_millions_years integer NOT NULL,
    diameter_light_years integer
);


ALTER TABLE public.galaxy OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    surface_ice boolean NOT NULL,
    diameter_km integer NOT NULL,
    is_geologically_active boolean NOT NULL,
    rock_composition text
);


ALTER TABLE public.moon OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer,
    has_life boolean NOT NULL,
    population bigint,
    gravity numeric NOT NULL,
    is_habitable boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: spacecraft; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spacecraft (
    spacecraft_id integer NOT NULL,
    name character varying(100) NOT NULL,
    mission text NOT NULL,
    launched boolean NOT NULL,
    crew_capacity integer NOT NULL,
    speed numeric NOT NULL
);


ALTER TABLE public.spacecraft OWNER TO postgres;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spacecraft_spacecraft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spacecraft_spacecraft_id_seq OWNER TO postgres;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spacecraft_spacecraft_id_seq OWNED BY public.spacecraft.spacecraft_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    spectral_type text NOT NULL,
    temperature_k integer NOT NULL,
    is_visible boolean NOT NULL
);


ALTER TABLE public.star OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: spacecraft spacecraft_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spacecraft ALTER COLUMN spacecraft_id SET DEFAULT nextval('public.spacecraft_spacecraft_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', true, 13600, 100000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', true, 14000, 220000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', false, 13000, 60000);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Elliptical', true, 12000, 50000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', false, 10000, 76000);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 'Spiral', true, 11000, 70000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, false, 3474, false, 'Silicate');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, false, 22, false, 'Carbonaceous');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, false, 12, false, 'Carbonaceous');
INSERT INTO public.moon VALUES (4, 'Europa', 1, true, 3121, true, 'Ice/Silicate');
INSERT INTO public.moon VALUES (5, 'Ganymede', 1, true, 5268, false, 'Ice/Silicate');
INSERT INTO public.moon VALUES (6, 'Callisto', 1, true, 4821, false, 'Ice');
INSERT INTO public.moon VALUES (7, 'Io', 1, false, 3642, true, 'Sulfur');
INSERT INTO public.moon VALUES (8, 'Titan', 3, true, 5150, false, 'Ice/Methane');
INSERT INTO public.moon VALUES (9, 'Enceladus', 3, true, 504, true, 'Ice');
INSERT INTO public.moon VALUES (10, 'Triton', 4, true, 2706, false, 'Ice');
INSERT INTO public.moon VALUES (11, 'Charon', 5, false, 1212, false, 'Ice/Rock');
INSERT INTO public.moon VALUES (12, 'Luna', 6, false, 3474, false, 'Silicate');
INSERT INTO public.moon VALUES (13, 'Nereid', 6, false, 340, false, 'Ice');
INSERT INTO public.moon VALUES (14, 'Hyperion', 7, false, 270, false, 'Porous Ice');
INSERT INTO public.moon VALUES (15, 'Oberon', 7, false, 1522, false, 'Ice/Rock');
INSERT INTO public.moon VALUES (16, 'Rhea', 8, true, 1528, false, 'Ice');
INSERT INTO public.moon VALUES (17, 'Iapetus', 9, false, 1470, false, 'Ice');
INSERT INTO public.moon VALUES (18, 'Miranda', 10, false, 471, false, 'Rock/Ice');
INSERT INTO public.moon VALUES (19, 'Ariel', 11, false, 1158, false, 'Ice');
INSERT INTO public.moon VALUES (20, 'Umbriel', 12, false, 1169, false, 'Ice');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 8000000000, 9.8, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, 0, 3.7, false);
INSERT INTO public.planet VALUES (3, 'Venus', 1, false, 0, 8.87, false);
INSERT INTO public.planet VALUES (4, 'Kepler-22b', 2, false, 0, 9.4, true);
INSERT INTO public.planet VALUES (5, 'Proxima b', 2, false, 0, 1.1, false);
INSERT INTO public.planet VALUES (6, 'Planet X', 3, false, 0, 6.5, false);
INSERT INTO public.planet VALUES (7, 'Zebes', 4, false, 0, 7.8, false);
INSERT INTO public.planet VALUES (8, 'Talos IV', 4, false, 0, 8.1, false);
INSERT INTO public.planet VALUES (9, 'Pandora', 5, false, 0, 9.1, true);
INSERT INTO public.planet VALUES (10, 'LV-426', 5, false, 0, 10.1, false);
INSERT INTO public.planet VALUES (11, 'Yavin IV', 6, false, 0, 8.9, false);
INSERT INTO public.planet VALUES (12, 'Hoth', 6, false, 0, 9.0, false);


--
-- Data for Name: spacecraft; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.spacecraft VALUES (1, 'Voyager 1', 'Explore outer solar system', true, 0, 17.0);
INSERT INTO public.spacecraft VALUES (2, 'Apollo 11', 'Moon landing', true, 3, 11.0);
INSERT INTO public.spacecraft VALUES (3, 'Enterprise', 'Interstellar exploration', false, 100, 50.0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 5778, true);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, 'G2V', 5790, true);
INSERT INTO public.star VALUES (3, 'Sirius A', 1, 'A1V', 9940, true);
INSERT INTO public.star VALUES (4, 'Vega', 1, 'A0V', 9602, true);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, 'M1-2Ia-Iab', 3500, true);
INSERT INTO public.star VALUES (6, 'Rigel', 1, 'B8Ia', 12130, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spacecraft_spacecraft_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: spacecraft spacecraft_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_name_key UNIQUE (name);


--
-- Name: spacecraft spacecraft_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_pkey PRIMARY KEY (spacecraft_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

