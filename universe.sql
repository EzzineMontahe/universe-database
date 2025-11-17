--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_km integer NOT NULL,
    orbital_period_years numeric(10,2) NOT NULL,
    is_hazardous boolean NOT NULL,
    discovery_year integer NOT NULL,
    description text
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type character varying(20) NOT NULL,
    diameter_light_years numeric(12,2) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_earth numeric(15,2),
    description text
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer NOT NULL,
    orbital_period_days numeric(8,3) NOT NULL,
    has_atmosphere boolean NOT NULL,
    is_spherical boolean NOT NULL,
    discovery_year integer
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
    star_id integer NOT NULL,
    planet_type character varying(20) NOT NULL,
    diameter_km integer NOT NULL,
    mass_earth numeric(8,4) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    orbital_period_days numeric(10,2),
    description text
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
    galaxy_id integer NOT NULL,
    spectral_class character varying(10) NOT NULL,
    temperature_kelvin integer NOT NULL,
    solar_mass numeric(5,2) NOT NULL,
    age_millions_of_years integer NOT NULL,
    is_spherical boolean NOT NULL
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 946, 4.60, false, 1801, 'Largest asteroid in belt');
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525, 3.63, false, 1807, 'Brightest asteroid');
INSERT INTO public.asteroid VALUES (3, 'Pallas', 512, 4.62, false, 1802, 'Second asteroid discovered');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 105700.00, true, false, 0.00, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 152000.00, false, false, 2537000.00, 'Nearest spiral galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 60000.00, false, false, 3000000.00, 'Third largest in local group');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Spiral', 50000.00, false, false, 29350000.00, 'Edge-on spiral galaxy');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 60000.00, false, false, 23160000.00, 'Interacting galaxy');
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Elliptical', 60000.00, false, true, 13700000.00, 'Radio galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, 27.320, false, true, 0);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, 0.320, false, false, 1877);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, 1.260, false, false, 1877);
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, 1.770, false, true, 1610);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3121, 3.550, false, true, 1610);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, 7.150, false, true, 1610);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4820, 16.690, false, true, 1610);
INSERT INTO public.moon VALUES (8, 'Mimas', 6, 396, 0.940, false, true, 1789);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 504, 1.370, true, true, 1789);
INSERT INTO public.moon VALUES (10, 'Tethys', 6, 1062, 1.890, false, true, 1684);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 1123, 2.740, false, true, 1684);
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 1527, 4.520, false, true, 1672);
INSERT INTO public.moon VALUES (13, 'Titan', 6, 5149, 15.950, true, true, 1655);
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, 1469, 79.330, false, true, 1671);
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 472, 1.410, false, true, 1948);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 1158, 2.520, false, true, 1851);
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 1169, 4.140, false, true, 1851);
INSERT INTO public.moon VALUES (18, 'Titania', 7, 1577, 8.710, false, true, 1787);
INSERT INTO public.moon VALUES (19, 'Oberon', 7, 1522, 13.460, false, true, 1787);
INSERT INTO public.moon VALUES (20, 'Triton', 8, 2706, 5.880, true, true, 1846);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 4879, 0.0550, false, true, 88.00, 'Smallest planet');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 12104, 0.8150, false, true, 224.70, 'Hottest planet');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 12742, 1.0000, true, true, 365.25, 'Our home');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 6779, 0.1070, false, true, 687.00, 'Red planet');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 139820, 317.8000, false, true, 4332.82, 'Largest planet');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 116460, 95.1600, false, true, 10755.70, 'Ringed planet');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', 50724, 14.5400, false, true, 30687.15, 'Sideways planet');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', 49244, 17.1500, false, true, 60190.03, 'Windy planet');
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 6, 'Terrestrial', 14000, 1.2700, false, true, 11.19, 'Closest exoplanet');
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 5, 'Terrestrial', 15400, 1.4400, true, true, 129.90, 'Earth-sized');
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 4, 'Gas Giant', 157800, 220.0000, false, true, 3.52, 'Hot Jupiter');
INSERT INTO public.planet VALUES (12, 'Gliese 581c', 3, 'Terrestrial', 18000, 5.6000, false, true, 12.93, 'Super-Earth');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 5778, 1.00, 4600000, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A1V', 9940, 2.06, 250000, true);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1, 'G2V', 5790, 1.10, 6000000, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 'M1-M2', 3500, 11.60, 8000000, true);
INSERT INTO public.star VALUES (5, 'Vega', 1, 'A0V', 9602, 2.14, 455000, true);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, 'M5.5Ve', 3042, 0.12, 4800000, true);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

