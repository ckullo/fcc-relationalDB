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
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    distance_light_year numeric(10,2),
    number_of_stars integer,
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
    name character varying(100) NOT NULL,
    planet_id integer,
    mass numeric(10,2),
    radius integer NOT NULL,
    orbital_period numeric(10,2),
    distance_from_planet integer NOT NULL,
    surface_composition character varying(100)
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
    name character varying(100) NOT NULL,
    star_id integer,
    type character varying(50) NOT NULL,
    mass numeric(10,2),
    radius integer NOT NULL,
    orbital_period numeric(10,2),
    distance_from_star numeric(10,2),
    has_rings boolean DEFAULT false,
    atmosphere character varying(100)
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
    name character varying(100) NOT NULL,
    galaxy_id integer,
    type character varying(50) NOT NULL,
    mass numeric(10,2),
    radius integer NOT NULL,
    luminosity integer,
    temperature integer NOT NULL,
    distance_light_years integer
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
-- Name: universe_details; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.universe_details (
    universe_details_id integer NOT NULL,
    age numeric(10,2) NOT NULL,
    expansion_rate numeric(10,2),
    has_dark_matter boolean NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.universe_details OWNER TO freecodecamp;

--
-- Name: universe_details_universe_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.universe_details_universe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universe_details_universe_id_seq OWNER TO freecodecamp;

--
-- Name: universe_details_universe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.universe_details_universe_id_seq OWNED BY public.universe_details.universe_details_id;


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
-- Name: universe_details universe_details_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_details ALTER COLUMN universe_details_id SET DEFAULT nextval('public.universe_details_universe_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.galaxy (galaxy_id, name, type, distance_light_year, number_of_stars, description) FROM stdin;
1	Milky Way	Spiral	0.00	100000000	Home galaxy of Earth
2	Andromeda	Spiral	2537000.00	1000000000	Closest spiral galaxy to Milky Way
3	Triangulum	Spiral	3000000.00	40000000	Third-largest member of the Local Group
4	Whirlpool	Spiral	23000000.00	150000000	Located in the constellation Canes Venatici
5	Sombrero	Spiral	29000000.00	800000000	Bright galaxy with a large central bulge
6	Pinwheel	Spiral	21000000.00	100000000	Found in Ursa Major
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.moon (moon_id, name, planet_id, mass, radius, orbital_period, distance_from_planet, surface_composition) FROM stdin;
1	Moon	1	0.01	1737	27.30	384400	Rocky
2	Phobos	2	0.00	11	0.32	9377	Rocky
3	Deimos	2	0.00	6	1.26	23460	Rocky
4	Io	3	0.01	1821	1.77	421700	Sulfuric
5	Europa	3	0.01	1560	3.55	670900	Ice-Rich
6	Ganymede	3	0.03	2634	7.16	1070400	Rock and Ice
7	Callisto	3	0.02	2410	16.69	1882700	Rock and Ice
8	Titan	4	0.02	2575	15.95	1221870	Nitrogen-Atmosphere
9	Enceladus	4	0.00	252	1.37	238042	Water-Ice
10	Mimas	4	0.00	198	0.94	185540	Rocky
11	Triton	9	0.00	1353	5.88	354800	Nitrogen-Ice
12	Oberon	12	0.00	761	13.46	583500	Rocky-Ice
13	Umbriel	12	0.00	584	4.14	266000	Rocky
14	Miranda	12	0.00	236	1.41	129390	Ice-Rich
15	Ariel	12	0.00	578	2.52	191020	Ice-Rich
16	Nereid	9	0.00	170	360.13	5513400	Rocky
17	Charon	7	0.00	606	6.39	19571	Rock-Ice
18	Dysnomia	6	0.00	158	15.77	37000	Rocky
19	Hippocamp	9	0.00	17	1.09	12000	Rocky
20	Proteus	9	0.00	210	1.12	117600	Rocky
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.planet (planet_id, name, star_id, type, mass, radius, orbital_period, distance_from_star, has_rings, atmosphere) FROM stdin;
1	Earth	1	Terrestrial	1.00	6371	365.25	1.00	f	Nitrogen-Oxygen
2	Mars	1	Terrestrial	0.11	3389	687.00	1.52	f	CO2
3	Jupiter	1	Gas Giant	317.80	69911	4332.59	5.20	t	Hydrogen-Helium
4	Saturn	1	Gas Giant	95.16	58232	10759.00	9.58	t	Hydrogen-Helium
5	Proxima b	5	Exoplanet	1.27	6800	11.20	0.05	f	\N
6	Alpha Centauri Bb	6	Exoplanet	1.13	6600	3.20	0.04	f	\N
7	GJ 1214 b	3	Exoplanet	6.60	15900	38.00	0.01	f	\N
8	HD 209458 b	4	Gas Giant	0.69	10300	3.50	0.05	t	Hydrogen
9	Neptune	1	Ice Giant	17.15	24622	60190.00	30.07	f	Hydrogen-Helium
10	Venus	1	Terrestrial	0.82	6052	224.70	0.72	f	CO2
11	Mercury	1	Terrestrial	0.06	2439	88.00	0.39	f	\N
12	Uranus	1	Ice Giant	14.54	25362	30687.00	19.20	t	Hydrogen-Helium
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.star (star_id, name, galaxy_id, type, mass, radius, luminosity, temperature, distance_light_years) FROM stdin;
1	Sun	1	Main Sequence	1.00	695700	1	5778	0
2	Sirius	1	Main Sequence	2.10	1189644	25	9940	9
3	Betelgeuse	1	Red Supergiant	20.00	887000000	100000	3500	642
4	Rigel	1	Blue Supergiant	21.00	1089000	120000	11000	860
5	Proxima Centauri	2	Red Dwarf	0.12	70000	0	3050	4
6	Alpha Centauri A	2	Main Sequence	1.10	864340	2	5790	4
\.


--
-- Data for Name: universe_details; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.universe_details (universe_details_id, age, expansion_rate, has_dark_matter, name) FROM stdin;
1	13.80	73.50	t	Observable Universe
2	13.70	70.40	t	Early Universe
3	13.60	67.70	t	Proto-Universe
4	13.50	65.20	f	Young Universe
5	13.40	64.30	t	Dark Matter Free Model
6	13.30	63.80	f	Alternative Universe
\.


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
-- Name: universe_details_universe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.universe_details_universe_id_seq', 6, true);


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
-- Name: universe_details universe_details_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_details
    ADD CONSTRAINT universe_details_name_key UNIQUE (name);


--
-- Name: universe_details universe_details_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_details
    ADD CONSTRAINT universe_details_pkey PRIMARY KEY (universe_details_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

