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
    name character varying(30),
    description text NOT NULL,
    has_life boolean,
    is_spherical boolean,
    size_in_lightyear integer,
    age_in_billions_of_years numeric(4,1),
    ngc_code integer,
    number_of_stars_in_trillion numeric(4,2)
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
-- Name: junc; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.junc (
    junc_id integer NOT NULL,
    name character varying(30) NOT NULL,
    moon_id integer,
    planet_id integer,
    star_id integer,
    galaxy_id integer
);


ALTER TABLE public.junc OWNER TO freecodecamp;

--
-- Name: junc_junc_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.junc_junc_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.junc_junc_id_seq OWNER TO freecodecamp;

--
-- Name: junc_junc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.junc_junc_id_seq OWNED BY public.junc.junc_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30),
    description text,
    has_life boolean,
    is_spherical boolean,
    radius_in_km integer,
    age_in_billions_of_years numeric(4,2),
    orbiting_distance_in_km integer
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
    star_id integer NOT NULL,
    name character varying(30),
    description text,
    has_life boolean,
    is_spherical boolean,
    radius_in_km integer,
    age_in_billions_of_years numeric(4,2),
    iau_abbreviation character varying(30),
    number_of_moons integer
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
    galaxy_id integer NOT NULL,
    name character varying(30),
    description text,
    has_life boolean,
    is_spherical boolean,
    mass_in_suns integer,
    age_in_billions_of_years numeric(4,2),
    spectral_classification character varying(30),
    number_of_orb_planets integer
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
-- Name: junc junc_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junc ALTER COLUMN junc_id SET DEFAULT nextval('public.junc_junc_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'where our little Earth is', true, true, 87400, 13.9, 6744, 0.30);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'gets its name from the part of the sky it appears in', true, true, 220000, 7.0, 224, 1.00);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'believed to be a satellite of the Andromeda Galaxy', false, true, 60000, 7.0, 598, 0.04);
INSERT INTO public.galaxy VALUES (4, 'Bullet Cluster', 'galaxy cluster is formed from the collision of two large clusters of galaxies', false, true, 2000000, 0.4, 657558, 0.10);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'peculiar galaxy of unclear classification in the constellation borders of Virgo and Corvus', false, false, 50000, 13.3, 4594, 0.10);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'One of the largest and most massive galaxies in the local universe', false, false, 132000, 13.3, 4486, 1.00);


--
-- Data for Name: junc; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.junc VALUES (1, 'Milky Way', NULL, NULL, NULL, 1);
INSERT INTO public.junc VALUES (2, 'Andromeda', NULL, NULL, NULL, 2);
INSERT INTO public.junc VALUES (3, 'Triangulum', NULL, NULL, NULL, 3);
INSERT INTO public.junc VALUES (4, 'Bullet Cluster', NULL, NULL, NULL, 4);
INSERT INTO public.junc VALUES (5, 'Sombrero', NULL, NULL, NULL, 5);
INSERT INTO public.junc VALUES (6, 'Messier 87', NULL, NULL, NULL, 6);
INSERT INTO public.junc VALUES (7, 'Sun', NULL, NULL, 1, 1);
INSERT INTO public.junc VALUES (8, 'Barnard Star', NULL, NULL, 2, 1);
INSERT INTO public.junc VALUES (9, 'Alpheratz', NULL, NULL, 3, 2);
INSERT INTO public.junc VALUES (10, 'Mirach', NULL, NULL, 4, 2);
INSERT INTO public.junc VALUES (11, 'Alpha Trianguli', NULL, NULL, 5, 3);
INSERT INTO public.junc VALUES (12, 'Proxima Centauri', NULL, NULL, 6, 1);
INSERT INTO public.junc VALUES (13, 'Earth', NULL, 1, 1, NULL);
INSERT INTO public.junc VALUES (14, 'Mercury', NULL, 2, 1, NULL);
INSERT INTO public.junc VALUES (15, 'Venus', NULL, 3, 1, NULL);
INSERT INTO public.junc VALUES (16, 'Saturn', NULL, 4, 1, NULL);
INSERT INTO public.junc VALUES (17, 'Jupiter', NULL, 5, 1, NULL);
INSERT INTO public.junc VALUES (18, 'Mars', NULL, 6, 1, NULL);
INSERT INTO public.junc VALUES (19, 'Uranus', NULL, 7, 1, NULL);
INSERT INTO public.junc VALUES (20, 'Neptune', NULL, 8, 1, NULL);
INSERT INTO public.junc VALUES (21, 'Barnard b', NULL, 9, 2, NULL);
INSERT INTO public.junc VALUES (22, 'Barnard c', NULL, 10, 2, NULL);
INSERT INTO public.junc VALUES (23, 'Barnard d', NULL, 11, 2, NULL);
INSERT INTO public.junc VALUES (24, 'Proxima b', NULL, 12, 6, NULL);
INSERT INTO public.junc VALUES (25, 'The Moon', 1, 1, NULL, NULL);
INSERT INTO public.junc VALUES (26, 'Titan', 2, 4, NULL, NULL);
INSERT INTO public.junc VALUES (27, 'Rhea', 3, 4, NULL, NULL);
INSERT INTO public.junc VALUES (28, 'Iapetus', 4, 4, NULL, NULL);
INSERT INTO public.junc VALUES (29, 'Dione', 5, 4, NULL, NULL);
INSERT INTO public.junc VALUES (30, 'Enceladus', 6, 4, NULL, NULL);
INSERT INTO public.junc VALUES (31, 'Mimas', 7, 4, NULL, NULL);
INSERT INTO public.junc VALUES (32, 'Hyperion', 8, 4, NULL, NULL);
INSERT INTO public.junc VALUES (33, 'Phoebe', 9, 4, NULL, NULL);
INSERT INTO public.junc VALUES (34, 'Janus', 10, 4, NULL, NULL);
INSERT INTO public.junc VALUES (35, 'Ganymede', 11, 5, NULL, NULL);
INSERT INTO public.junc VALUES (36, 'Callisto', 12, 5, NULL, NULL);
INSERT INTO public.junc VALUES (37, 'Io', 13, 5, NULL, NULL);
INSERT INTO public.junc VALUES (38, 'Phobos', 14, 6, NULL, NULL);
INSERT INTO public.junc VALUES (39, 'Titania', 15, 7, NULL, NULL);
INSERT INTO public.junc VALUES (40, 'Oberon', 16, 7, NULL, NULL);
INSERT INTO public.junc VALUES (41, 'Umbriel', 17, 7, NULL, NULL);
INSERT INTO public.junc VALUES (42, 'Triton', 18, 8, NULL, NULL);
INSERT INTO public.junc VALUES (43, 'Proteus', 19, 8, NULL, NULL);
INSERT INTO public.junc VALUES (44, 'Nereid', 20, 8, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'The Moon', 'The sole moon of Earth', false, true, 1737, 4.50, 382500);
INSERT INTO public.moon VALUES (2, 4, 'Titan', 'largest moon of Saturn and the second-largest in the Solar System', false, true, 2575, 4.50, 1200000);
INSERT INTO public.moon VALUES (3, 4, 'Rhea', 'second largest moon of Saturn and the ninth-largest moon in the Solar System', false, true, 764, 4.50, 527000);
INSERT INTO public.moon VALUES (4, 4, 'Iapetus', 'the outermost of the large moons and the third largest one of Saturn', false, true, 734, 4.50, 3561000);
INSERT INTO public.moon VALUES (5, 4, 'Dione', 'fourth largest moon of Saturn', false, true, 561, 4.50, 377400);
INSERT INTO public.moon VALUES (6, 4, 'Enceladus', 'sixth largest moon of Saturn and the 18th-largest in the Solar System', false, true, 252, 4.50, 238000);
INSERT INTO public.moon VALUES (7, 4, 'Mimas', 'the  innermost major moon and seventh-largest natural satellite of Saturn', false, true, 198, 4.50, 186000);
INSERT INTO public.moon VALUES (8, 4, 'Hyperion', 'biggest irregular and the eighth-largest moon of Saturn', false, false, 135, 4.50, 1500000);
INSERT INTO public.moon VALUES (9, 4, 'Phoebe', 'fourth largest irregular natural satellite in the solar system and the ninth largest moon of Saturn', false, false, 106, 4.50, 12952000);
INSERT INTO public.moon VALUES (10, 4, 'Janus', 'irregular moon that shares an orbit with Epimetheus, another moon of Saturn and is the tenth largest', false, false, 90, 4.50, 151000);
INSERT INTO public.moon VALUES (11, 5, 'Ganymede', 'larger than Mercury and Pluto, the biggest moon of Jupiter and the largest moon in our Solar System', false, true, 2631, 4.50, 1070000);
INSERT INTO public.moon VALUES (12, 5, 'Callisto', 'second largest moon of Jupiter and the third largest moon in our Solar System', false, true, 2410, 4.50, 1883000);
INSERT INTO public.moon VALUES (13, 5, 'Io', 'third largest moon of Jupiter, fourth largest moon and the most volcanically active world in our Solar System', false, true, 1821, 4.50, 350000);
INSERT INTO public.moon VALUES (14, 6, 'Phobos', 'largest moon of Mars where the Stickney crater is', false, false, 11, 4.50, 6000);
INSERT INTO public.moon VALUES (15, 7, 'Titania', 'largest moon of Uranus and eighth largest moon in the Solar System', false, true, 788, 4.50, 436300);
INSERT INTO public.moon VALUES (16, 7, 'Oberon', 'the outermost and second-largest moon of Uranus', false, true, 761, 4.50, 583500);
INSERT INTO public.moon VALUES (17, 7, 'Umbriel', 'is the darkest among Uranus largest moons and third largest', false, true, 585, 4.50, 266000);
INSERT INTO public.moon VALUES (18, 8, 'Triton', 'largest and the only moon of Neptune massive enough to be rounded under its own gravity and hosts a thin, hazy atmosphere', false, true, 1354, 4.50, 354800);
INSERT INTO public.moon VALUES (19, 8, 'Proteus', 'second largest moon of Neptune and its largest inner satellite that has a box-like shape', false, false, 210, 4.50, 117647);
INSERT INTO public.moon VALUES (20, 8, 'Nereid', 'third largest moon of Neptune, it has one of the most eccentric orbits of any moon in the Solar System', false, false, 170, 4.50, 5515000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', 'the planet that has the conditions for life as humans know of it', true, true, 6378, 4.50, 'E', 1);
INSERT INTO public.planet VALUES (2, 1, 'Mercury', 'the first planet from the Sun and the smallest in the Solar System', false, true, 2440, 4.50, 'H', 0);
INSERT INTO public.planet VALUES (3, 1, 'Venus', 'the hottest planet in our solar system', false, true, 6052, 4.50, 'V', 0);
INSERT INTO public.planet VALUES (4, 1, 'Saturn', 'primarily composed of hydrogen and helium', false, true, 58232, 4.50, 'S', 274);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', 'largest planet in the Solar System', false, true, 69911, 4.50, 'J', 95);
INSERT INTO public.planet VALUES (6, 1, 'Mars', 'among the brightest objects seen from Earth', false, true, 3390, 4.50, 'MA', 2);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', 'gaseous cyan-coloured ice giant as most of the planet is made of water, ammonia, and methane', false, true, 25362, 4.50, 'U', 28);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', 'farthest planet from the sun in our Solar System', false, true, 24622, 4.50, 'N', 14);
INSERT INTO public.planet VALUES (9, 2, 'Barnard b', 'a rocky exoplanet discovered around the Barnard star', false, true, 8700, 10.01, NULL, 0);
INSERT INTO public.planet VALUES (10, 2, 'Barnard c', 'its mass is 0.335 Earths, it takes 4.1 days to complete one orbit of its star', false, true, 4739, 10.01, NULL, 0);
INSERT INTO public.planet VALUES (11, 2, 'Barnard d', 'its mass is 0.263 Earths, it takes 2.3 days to complete one orbit of its star', false, true, 1677, 10.01, NULL, 0);
INSERT INTO public.planet VALUES (12, 6, 'Proxima b', 'exoplanet orbiting within the habitable zone of the red dwarf star Proxima Centauri', false, true, 8929, 4.80, NULL, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 'the hottest star around Earth', true, true, 1, 4.60, 'G', 8);
INSERT INTO public.star VALUES (2, 1, 'Barnard Star', 'closest single star to Earth', false, true, 0, 10.01, 'M4.0V', 4);
INSERT INTO public.star VALUES (3, 2, 'Alpheratz', 'Alpheratz, Alpha Andromedae is a spectroscopic binary star located in the constellation Andromeda', false, true, 4, 0.06, 'B8', NULL);
INSERT INTO public.star VALUES (4, 2, 'Mirach', 'red giant star of the second magnitude', false, true, 3, 0.70, 'M0', NULL);
INSERT INTO public.star VALUES (5, 3, 'Alpha Trianguli', 'spectroscopic binary star', false, false, 7, 1.60, 'F5III', NULL);
INSERT INTO public.star VALUES (6, 1, 'Proxima Centauri', 'nearest star to Earth after the Sun, located 4.25 light-years away in the southern constellation of Centaurus', false, true, 0, 4.80, 'M5.5 Ve', 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: junc_junc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.junc_junc_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: junc junc_moon_id_planet_id_star_id_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junc
    ADD CONSTRAINT junc_moon_id_planet_id_star_id_galaxy_id_key UNIQUE (moon_id, planet_id, star_id, galaxy_id);


--
-- Name: junc junc_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junc
    ADD CONSTRAINT junc_name_key UNIQUE (name);


--
-- Name: junc junc_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junc
    ADD CONSTRAINT junc_pkey PRIMARY KEY (junc_id);


--
-- Name: moon moon_moon_id_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_planet_id_key UNIQUE (moon_id, planet_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: planet planet_planet_id_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_star_id_key UNIQUE (planet_id, star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_galaxy_id_key UNIQUE (star_id, galaxy_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: junc fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junc
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: junc fk_moon_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junc
    ADD CONSTRAINT fk_moon_id FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: junc fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junc
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: junc fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junc
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

