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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    user_name character varying(30),
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Daniel', 1, 7);
INSERT INTO public.users VALUES (2, 'Maria', 1, 7);
INSERT INTO public.users VALUES (4, 'user_1663894701106', 2, 688);
INSERT INTO public.users VALUES (49, 'user_1663968596184', 2, 304);
INSERT INTO public.users VALUES (3, 'user_1663894701107', 5, 302);
INSERT INTO public.users VALUES (48, 'user_1663968596185', 5, 179);
INSERT INTO public.users VALUES (6, 'user_1663905522129', 2, 391);
INSERT INTO public.users VALUES (5, 'user_1663905522130', 5, 308);
INSERT INTO public.users VALUES (8, 'user_1663963682507', 2, 419);
INSERT INTO public.users VALUES (7, 'user_1663963682508', 5, 13);
INSERT INTO public.users VALUES (41, 'user_1663964536752', 2, 388);
INSERT INTO public.users VALUES (40, 'user_1663964536753', 5, 283);
INSERT INTO public.users VALUES (43, 'user_1663965138007', 2, 281);
INSERT INTO public.users VALUES (42, 'user_1663965138008', 5, 280);
INSERT INTO public.users VALUES (45, 'user_1663966150303', 2, 570);
INSERT INTO public.users VALUES (44, 'user_1663966150304', 5, 103);
INSERT INTO public.users VALUES (47, 'user_1663966293353', 2, 302);
INSERT INTO public.users VALUES (46, 'user_1663966293354', 5, 194);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 49, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

