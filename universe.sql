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
-- Name: civil_lvl; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.civil_lvl (
    civil_lvl_id integer NOT NULL,
    name character varying NOT NULL,
    description text
);


ALTER TABLE public.civil_lvl OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    age_in_millions_of_years numeric,
    distance_from_earth integer,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    has_life boolean,
    description text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    has_life boolean,
    description text,
    star_id integer,
    civil_lvl_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    age_in_millions_of_years numeric,
    distance_from_earth integer,
    description text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: civil_lvl; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.civil_lvl VALUES (1, 'top', NULL);
INSERT INTO public.civil_lvl VALUES (2, 'meduim', NULL);
INSERT INTO public.civil_lvl VALUES (3, 'low', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (6, 'f', 1.6, 60, NULL);
INSERT INTO public.galaxy VALUES (1, 'a', 1.1, 10, NULL);
INSERT INTO public.galaxy VALUES (2, 'b', 1.2, 20, NULL);
INSERT INTO public.galaxy VALUES (3, 'c', 1.3, 30, NULL);
INSERT INTO public.galaxy VALUES (4, 'd', 1.4, 40, NULL);
INSERT INTO public.galaxy VALUES (5, 'e', 1.5, 50, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, '1', NULL, NULL, 1);
INSERT INTO public.moon VALUES (2, '2', NULL, NULL, 2);
INSERT INTO public.moon VALUES (3, '3', NULL, NULL, 3);
INSERT INTO public.moon VALUES (4, '4', NULL, NULL, 4);
INSERT INTO public.moon VALUES (5, '5', NULL, NULL, 5);
INSERT INTO public.moon VALUES (6, '6', NULL, NULL, 6);
INSERT INTO public.moon VALUES (7, '7', NULL, NULL, 7);
INSERT INTO public.moon VALUES (8, '8', NULL, NULL, 8);
INSERT INTO public.moon VALUES (9, '9', NULL, NULL, 9);
INSERT INTO public.moon VALUES (10, '10', NULL, NULL, 10);
INSERT INTO public.moon VALUES (61, '61', NULL, NULL, 1);
INSERT INTO public.moon VALUES (71, '71', NULL, NULL, 1);
INSERT INTO public.moon VALUES (81, '81', NULL, NULL, 1);
INSERT INTO public.moon VALUES (91, '91', NULL, NULL, 1);
INSERT INTO public.moon VALUES (110, '110', NULL, NULL, 1);
INSERT INTO public.moon VALUES (612, '621', NULL, NULL, 1);
INSERT INTO public.moon VALUES (712, '721', NULL, NULL, 1);
INSERT INTO public.moon VALUES (281, '281', NULL, NULL, 1);
INSERT INTO public.moon VALUES (921, '291', NULL, NULL, 1);
INSERT INTO public.moon VALUES (1210, '1210', NULL, NULL, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, '1', NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (2, '2', NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (3, '3', NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (4, '4', NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (5, '5', NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (6, '6', NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (7, '7', NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (8, '8', NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (9, '9', NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (10, '10', NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (11, '11', NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (12, '12', NULL, NULL, 1, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'a1', NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (2, '2', NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES (3, '3', NULL, NULL, NULL, 3);
INSERT INTO public.star VALUES (4, '4', NULL, NULL, NULL, 4);
INSERT INTO public.star VALUES (5, '5', NULL, NULL, NULL, 5);
INSERT INTO public.star VALUES (6, '6', NULL, NULL, NULL, 6);


--
-- Name: civil_lvl civil_lvl_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civil_lvl
    ADD CONSTRAINT civil_lvl_name_key UNIQUE (name);


--
-- Name: civil_lvl civil_lvl_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civil_lvl
    ADD CONSTRAINT civil_lvl_pkey PRIMARY KEY (civil_lvl_id);


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
-- Name: planet planet_civil_lvl_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_civil_lvl_id_fkey FOREIGN KEY (civil_lvl_id) REFERENCES public.civil_lvl(civil_lvl_id);


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

