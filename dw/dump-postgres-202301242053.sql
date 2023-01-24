--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.15
-- Dumped by pg_dump version 14.2

-- Started on 2023-01-24 20:53:04

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

--
-- TOC entry 2185 (class 1262 OID 12404)
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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

--
-- TOC entry 2186 (class 0 OID 0)
-- Dependencies: 2185
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2187 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

--
-- TOC entry 189 (class 1259 OID 24595)
-- Name: dim_country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_country (
    id_dim_country bigint NOT NULL,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    country character varying(14)
);


ALTER TABLE public.dim_country OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 24593)
-- Name: dim_country_id_dim_country_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_country_id_dim_country_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_country_id_dim_country_seq OWNER TO postgres;

--
-- TOC entry 2188 (class 0 OID 0)
-- Dependencies: 188
-- Name: dim_country_id_dim_country_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_country_id_dim_country_seq OWNED BY public.dim_country.id_dim_country;


--
-- TOC entry 191 (class 1259 OID 24603)
-- Name: dim_observation_band; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_observation_band (
    id_dim_observation_band bigint NOT NULL,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    observation_band character varying(6)
);


ALTER TABLE public.dim_observation_band OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 24601)
-- Name: dim_observation_band_id_dim_observation_band_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_observation_band_id_dim_observation_band_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_observation_band_id_dim_observation_band_seq OWNER TO postgres;

--
-- TOC entry 2189 (class 0 OID 0)
-- Dependencies: 190
-- Name: dim_observation_band_id_dim_observation_band_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_observation_band_id_dim_observation_band_seq OWNED BY public.dim_observation_band.id_dim_observation_band;


--
-- TOC entry 187 (class 1259 OID 24587)
-- Name: dim_proposal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_proposal (
    id_dim_proposal bigint NOT NULL,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    proposal_id character varying(8),
    proposal_title character varying(123),
    total_hrs_requested numeric(9,2),
    total_hrs_recommended numeric(9,2)
);


ALTER TABLE public.dim_proposal OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 24585)
-- Name: dim_proposal_id_dim_proposal_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_proposal_id_dim_proposal_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_proposal_id_dim_proposal_seq OWNER TO postgres;

--
-- TOC entry 2190 (class 0 OID 0)
-- Dependencies: 186
-- Name: dim_proposal_id_dim_proposal_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_proposal_id_dim_proposal_seq OWNED BY public.dim_proposal.id_dim_proposal;


--
-- TOC entry 193 (class 1259 OID 24611)
-- Name: dim_reviewer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_reviewer (
    id_dim_reviewer bigint NOT NULL,
    version integer,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    reviewer character varying(12)
);


ALTER TABLE public.dim_reviewer OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 24609)
-- Name: dim_reviewer_id_dim_reviewer_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_reviewer_id_dim_reviewer_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_reviewer_id_dim_reviewer_seq OWNER TO postgres;

--
-- TOC entry 2191 (class 0 OID 0)
-- Dependencies: 192
-- Name: dim_reviewer_id_dim_reviewer_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_reviewer_id_dim_reviewer_seq OWNED BY public.dim_reviewer.id_dim_reviewer;


--
-- TOC entry 194 (class 1259 OID 24617)
-- Name: fact_proposal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fact_proposal (
    investigators character varying(806),
    total_hrs_requested numeric(9,2),
    reviewer1_score numeric(5,1),
    reviewer2_score numeric(5,1),
    reviewer3_score numeric(5,1),
    total_hrs_recommended numeric(9,2),
    id_dim_proposal integer,
    id_dim_country integer,
    id_dim_observation_band integer,
    id_dim_reviewer1 integer,
    id_dim_reviewer2 integer,
    id_dim_reviewer3 integer
);


ALTER TABLE public.fact_proposal OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 24623)
-- Name: fact_score; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fact_score (
    id_dim_proposal integer,
    id_dim_country integer,
    id_dim_observation_band integer,
    id_dim_reviewer integer,
    reviewer character varying(20),
    score numeric(5,1)
);


ALTER TABLE public.fact_score OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 24676)
-- Name: fact_team; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fact_team (
    role character varying(20),
    fullname text,
    country text,
    id_dim_proposal integer,
    id_dim_country_proposal integer,
    id_dim_observation_band integer,
    id_dim_country_team integer
);


ALTER TABLE public.fact_team OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 24576)
-- Name: stage_opencall; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stage_opencall (
    proposal_id character varying(8),
    proposal_title character varying(123),
    country character varying(14),
    investigators character varying(806),
    observation_band character varying(6),
    total_hrs_requested numeric(7,2),
    reviewer1 character varying(12),
    reviewer1_score numeric(4,1),
    reviewer2 character varying(12),
    reviewer2_score numeric(4,1),
    reviewer3 character varying(12),
    reviewer3_score numeric(4,1),
    total_hrs_recommended numeric(7,2)
);


ALTER TABLE public.stage_opencall OWNER TO postgres;

--
-- TOC entry 2040 (class 2604 OID 24598)
-- Name: dim_country id_dim_country; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_country ALTER COLUMN id_dim_country SET DEFAULT nextval('public.dim_country_id_dim_country_seq'::regclass);


--
-- TOC entry 2041 (class 2604 OID 24606)
-- Name: dim_observation_band id_dim_observation_band; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_observation_band ALTER COLUMN id_dim_observation_band SET DEFAULT nextval('public.dim_observation_band_id_dim_observation_band_seq'::regclass);


--
-- TOC entry 2039 (class 2604 OID 24590)
-- Name: dim_proposal id_dim_proposal; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_proposal ALTER COLUMN id_dim_proposal SET DEFAULT nextval('public.dim_proposal_id_dim_proposal_seq'::regclass);


--
-- TOC entry 2042 (class 2604 OID 24614)
-- Name: dim_reviewer id_dim_reviewer; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_reviewer ALTER COLUMN id_dim_reviewer SET DEFAULT nextval('public.dim_reviewer_id_dim_reviewer_seq'::regclass);


--
-- TOC entry 2172 (class 0 OID 24595)
-- Dependencies: 189
-- Data for Name: dim_country; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dim_country VALUES (0, 1, NULL, NULL, NULL);
INSERT INTO public.dim_country VALUES (1, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PORTUGAL');
INSERT INTO public.dim_country VALUES (2, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'Portugal');
INSERT INTO public.dim_country VALUES (3, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'Netherlands');
INSERT INTO public.dim_country VALUES (4, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'CANADA');
INSERT INTO public.dim_country VALUES (5, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'SWEDEN');
INSERT INTO public.dim_country VALUES (6, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'CHINA');
INSERT INTO public.dim_country VALUES (7, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'ITALY');
INSERT INTO public.dim_country VALUES (8, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'SOUTH AFRICA');
INSERT INTO public.dim_country VALUES (9, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'GERMANY');
INSERT INTO public.dim_country VALUES (10, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'FRANCE');
INSERT INTO public.dim_country VALUES (11, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'INDIA');
INSERT INTO public.dim_country VALUES (12, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'GHANA');
INSERT INTO public.dim_country VALUES (13, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'SWITZERLAND');
INSERT INTO public.dim_country VALUES (14, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'SPAIN');
INSERT INTO public.dim_country VALUES (15, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'NETHERLANDS');
INSERT INTO public.dim_country VALUES (16, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'AUSTRALIA');
INSERT INTO public.dim_country VALUES (17, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'UNITED KINGDOM');
INSERT INTO public.dim_country VALUES (18, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'India');
INSERT INTO public.dim_country VALUES (19, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'Switzerland');
INSERT INTO public.dim_country VALUES (20, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'South Africa');
INSERT INTO public.dim_country VALUES (21, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'Sweden');
INSERT INTO public.dim_country VALUES (22, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'Australia');
INSERT INTO public.dim_country VALUES (23, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'Canada');
INSERT INTO public.dim_country VALUES (24, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'Spain');
INSERT INTO public.dim_country VALUES (25, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'Italy');
INSERT INTO public.dim_country VALUES (26, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'Ghana');
INSERT INTO public.dim_country VALUES (27, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'China');
INSERT INTO public.dim_country VALUES (28, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'France');
INSERT INTO public.dim_country VALUES (29, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'Germany');
INSERT INTO public.dim_country VALUES (30, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', NULL);
INSERT INTO public.dim_country VALUES (31, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'United Kingdom');
INSERT INTO public.dim_country VALUES (32, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', NULL);
INSERT INTO public.dim_country VALUES (33, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', NULL);
INSERT INTO public.dim_country VALUES (34, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', NULL);
INSERT INTO public.dim_country VALUES (35, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', NULL);
INSERT INTO public.dim_country VALUES (36, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', NULL);
INSERT INTO public.dim_country VALUES (37, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', NULL);
INSERT INTO public.dim_country VALUES (38, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', NULL);
INSERT INTO public.dim_country VALUES (39, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', NULL);
INSERT INTO public.dim_country VALUES (40, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', NULL);
INSERT INTO public.dim_country VALUES (41, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', NULL);
INSERT INTO public.dim_country VALUES (42, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', NULL);
INSERT INTO public.dim_country VALUES (43, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', NULL);
INSERT INTO public.dim_country VALUES (44, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', NULL);
INSERT INTO public.dim_country VALUES (45, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', NULL);
INSERT INTO public.dim_country VALUES (46, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', NULL);


--
-- TOC entry 2174 (class 0 OID 24603)
-- Dependencies: 191
-- Data for Name: dim_observation_band; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dim_observation_band VALUES (0, 1, NULL, NULL, NULL);
INSERT INTO public.dim_observation_band VALUES (1, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'S-BAND');
INSERT INTO public.dim_observation_band VALUES (2, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'UHF');
INSERT INTO public.dim_observation_band VALUES (3, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'L-BAND');
INSERT INTO public.dim_observation_band VALUES (4, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'X-BAND');


--
-- TOC entry 2170 (class 0 OID 24587)
-- Dependencies: 187
-- Data for Name: dim_proposal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dim_proposal VALUES (0, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.dim_proposal VALUES (1, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-041', 'A COMPLETE PICTURE OF GAS, DUST, AND STARS IN SIX OF THE BEST-STUDIED MEERKAT-VISIBLE GALAXIES', 48.00, 48.00);
INSERT INTO public.dim_proposal VALUES (2, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-001', 'THE ORIGIN OF ORCS: A NEW CLASS OF ASTRONOMICAL OBJECTS?', 64.00, 64.00);
INSERT INTO public.dim_proposal VALUES (3, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-002', 'CHARACTERISING LARGE-SCALE OVERDENSE STRUCTURES AT Z = 2.2 BY IDENTIFYING THEIR RADIO MEMBERS', 22.00, 22.00);
INSERT INTO public.dim_proposal VALUES (4, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-003', 'A MEERKAT ATLAS OF IRAS RBGS GALAXIES IN THE SOUTHERN HEMISPHERE', 82.00, 82.00);
INSERT INTO public.dim_proposal VALUES (5, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-004', 'THE JO135 JELLYFISH GALAXY: A MEERKAT PERSPECTIVE', 11.66, 8.75);
INSERT INTO public.dim_proposal VALUES (6, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-005', 'RESOLVING HI EMISSION AT KPC SCALES OF ULTRA DIFFUSE GALAXIES', 48.00, 43.00);
INSERT INTO public.dim_proposal VALUES (7, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-006', 'FROM GALAXY DISK TO CGM -- DEEP MAGNETIZED HALOS', 36.00, 29.25);
INSERT INTO public.dim_proposal VALUES (8, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-007', 'RADIO GALAXY HARASSMENT CAUGHT IN THE ACT', 4.50, 4.50);
INSERT INTO public.dim_proposal VALUES (9, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-008', 'REVEALING THE NATURE OF IGR J11014-6103 JETS WITH MEERKAT', 2.66, 2.66);
INSERT INTO public.dim_proposal VALUES (10, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-009', 'RESOLVING ULTRA-DIFFUSE GALAXIES IN HI', 17.00, 17.00);
INSERT INTO public.dim_proposal VALUES (11, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-010', 'MAGNETIC FIELD STRUCTURE IN THE JELLYFISH GALAXY JO194', 12.00, 12.00);
INSERT INTO public.dim_proposal VALUES (12, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-011', 'IMAGING NEW DIFFUSE CLUSTER RADIO SOURCES SELECTED AT LOW FREQUENCIES', 8.00, 8.00);
INSERT INTO public.dim_proposal VALUES (13, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-012', 'MAPPING HI AROUND AGB STARS', 31.00, 24.75);
INSERT INTO public.dim_proposal VALUES (14, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-013', 'A MEERKAT VIEW ON GALAXIES IN FILAMENTS FALLING ONTO THE VIRGO CLUSTER (VIRGOFIL)', 22.33, 22.33);
INSERT INTO public.dim_proposal VALUES (15, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-014', 'MEERKAT HI IMAGING OF TWO SOUTHERN DUSTPEDIA GALAXIES', 20.00, 20.00);
INSERT INTO public.dim_proposal VALUES (16, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-015', 'MEASURING THE TRUE OCCURRENCE RATE OF JETS IN TDES VIA LATE-TIME MEERKAT OBSERVATIONS', 12.00, 12.00);
INSERT INTO public.dim_proposal VALUES (17, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-016', 'OBSERVATION OF GALAXIES DISCOVERED IN THE PILOT FAST ULTRA DEEP SURVEY', 25.00, 25.00);
INSERT INTO public.dim_proposal VALUES (18, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-017', 'UNDERSTANDING THE UNUSUAL RADIO BEHAVIOUR OF THE HOT MAGNETIC STAR CU VIR', 8.75, 8.75);
INSERT INTO public.dim_proposal VALUES (19, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-018', 'HI OBSERVATIONS OF ULTRA DIFFUSE GALAXIES (UDGS) IN GALAXY GROUPS', 15.00, 13.50);
INSERT INTO public.dim_proposal VALUES (20, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-019', 'CONSTRAINING QUENCHING SCENARIOS IN RECENTLY QUENCHED ELLIPTICAL (RQE) GALAXIES VIA HI STUDY', 30.00, 30.00);
INSERT INTO public.dim_proposal VALUES (21, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-020', 'A STUDY OF AN UNEXPLORED POPULATION OF ``FAST'''' RADIO SUPERNOVAE', 30.00, 30.00);
INSERT INTO public.dim_proposal VALUES (22, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-021', 'UNRAVELLING NEW MAGNETIC FIELDS IN THE LARGE SCALE STRUCTURE OF THE UNIVERSE: THE CASE OF THE GALAXY CLUSTER A3718', 25.00, 25.00);
INSERT INTO public.dim_proposal VALUES (23, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-022', 'SEARCHING FOR FAST OUTFLOWS OF COLD GAS AT INTERMEDIATE REDSHIFTS', 12.00, 12.00);
INSERT INTO public.dim_proposal VALUES (24, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-023', 'TESTING STANDARD COSMOLOGY WITH GIANT RADIO GALAXIES IN THE DISTANT UNIVERSE', 18.00, 18.00);
INSERT INTO public.dim_proposal VALUES (25, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-024', 'GRBS: THE REVERSE SHOCK RENAISSANCE', 10.00, 9.00);
INSERT INTO public.dim_proposal VALUES (26, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-025', 'MEERKAT OBSERVATIONS OF THE MAGNETIZED COSMIC WEB', 74.25, 55.75);
INSERT INTO public.dim_proposal VALUES (27, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-026', 'STAR FORMATION AND THE ISM IN NEARBY GALAXIES WITH MEERKAT', 50.00, 37.50);
INSERT INTO public.dim_proposal VALUES (28, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-027', 'USING MEERKAT UHF TO BRIDGE THE GAP IN ABELL 2443', 8.00, 8.00);
INSERT INTO public.dim_proposal VALUES (29, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-028', 'DISENTANGLING THE HISTORY OF PARTICLE ACCELERATION IN ULTRA STEEP SPECTRUM RELIC CLUSTERS ABELL 2443 AND CIZA J0719.5+0043', 17.00, 13.50);
INSERT INTO public.dim_proposal VALUES (30, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-029', 'WHAT IS THE ORIGIN OF THE KPC-SCALE RADIO EMISSION IN RADIO-QUIET ACTIVE GALACTIC NUCLEI', 9.00, 9.00);
INSERT INTO public.dim_proposal VALUES (31, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-030', 'OBSERVING HI IN THE REIONIZATION EPOCH ANALOG GALAXY HARO11', 11.00, 11.00);
INSERT INTO public.dim_proposal VALUES (32, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-031', 'IMAGING THE DISK AND OUTFLOW OF THE STARBURST GALAXY NGC 253 WITH HIGH-RESOLUTION HI', 45.00, 33.75);
INSERT INTO public.dim_proposal VALUES (33, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-032', 'AN HI PERSPECTIVE ON GALAXY EVOLUTION IN ABELL 2626 AND ITS SURROUNDINGS', 48.00, 48.00);
INSERT INTO public.dim_proposal VALUES (34, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-033', 'THE CONNECTION BETWEEN STAR FORMATION, GAS PROPERTIES AND MAGNETIC FIELD IN NEARBY GALAXIES AT HIGH SPATIAL RESOLUTION', 49.00, 39.25);
INSERT INTO public.dim_proposal VALUES (35, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-034', 'ANTLIA CLUSTER IN HIGH DEF: A STUDY OF EARLY GALAXY CLUSTER ASSEMBLY', 49.00, 37.00);
INSERT INTO public.dim_proposal VALUES (36, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-035', 'MERGHERS: EVOLUTION OF CLUSTER SCALE RADIO SOURCES THROUGH COSMIC TIME', 99.50, 99.50);
INSERT INTO public.dim_proposal VALUES (37, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-083', 'A SEARCH FOR PULSARS AROUND SGR A* THROUGH ROTATION MEASURE', 9.00, 9.00);
INSERT INTO public.dim_proposal VALUES (38, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-036', 'THE HIGHEST-REDSHIFT GALAXIES IN THE G4JY SAMPLE', 13.00, 13.00);
INSERT INTO public.dim_proposal VALUES (39, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-037', 'EXO-SPACE WEATHER ON LATE-TYPE STARS: IMPACTS ON HABITABILITY OF EXO-PLANETS', 12.00, 12.00);
INSERT INTO public.dim_proposal VALUES (40, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-038', 'LOOKING FOR LOW COLUMN DENSITY HI WITH MEERKAT & FAST: NGC 3521', 12.00, 9.00);
INSERT INTO public.dim_proposal VALUES (41, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-039', 'MEERKAT SPINS THE COSMIC WEB: MAPPING A LOCAL NEXUS OF GALAXY FILAMENTS', 50.00, 45.00);
INSERT INTO public.dim_proposal VALUES (42, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-040', 'RADIO STUDY OF X-RAY EMITTING STARS WITH MEERKAT', 44.50, 44.50);
INSERT INTO public.dim_proposal VALUES (43, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-042', 'OBSERVATIONS OF DWARF GALAXIES WITH VERY EXTENDED HI DISKS', 36.00, 36.00);
INSERT INTO public.dim_proposal VALUES (44, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-043', 'TAILSPIN: MEERKAT OBSERVATIONS OF A DIFFUSE CLUSTER SOURCE IN ATLBS FIELDS', 2.75, 2.00);
INSERT INTO public.dim_proposal VALUES (45, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-044', 'PROBING GAMMA-RAY BURST PHYSICS WITH MEERKAT', 42.00, 42.00);
INSERT INTO public.dim_proposal VALUES (46, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-045', 'A HI ABSORPTION SEARCH TOWARDS THE BRIGHTEST G4JY SOURCES', 50.00, 50.00);
INSERT INTO public.dim_proposal VALUES (47, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-046', 'SEARCHING FOR AURORAL EMISSION IN EXOPLANETARY SYSTEMS', 55.00, 41.25);
INSERT INTO public.dim_proposal VALUES (48, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-047', 'MAPPING TIDAL INTERACTIONS IN NEARBY GALAXY GROUPS', 36.00, 32.00);
INSERT INTO public.dim_proposal VALUES (49, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-048', 'STUCK IN THE TRAP: FINDING SYNCHROTRON PAIR HALOS AROUND PULSARS', 24.50, 24.50);
INSERT INTO public.dim_proposal VALUES (50, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-049', 'MEERCHOIRS: EFFECTS OF GROUP ENVIRONMENT ON GALAXY EVOLUTION', 36.00, 36.00);
INSERT INTO public.dim_proposal VALUES (51, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-050', 'CHANCE DISCOVERY OF TWO RADIO GALAXIES WITH PREVIOUSLY-UNKNOWN EXTENDED EMISSION', 9.00, 9.00);
INSERT INTO public.dim_proposal VALUES (52, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-051', 'USING MEERKAT FOR MAPPING COSMIC SHEAR AND SEARCHING FOR COSMIC BIREFRINGENCE', 11.00, 11.00);
INSERT INTO public.dim_proposal VALUES (53, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-052', 'EXPLORING NEW REGIMES IN PARTICLE ACCELERATION PHYSICS: THE GALAXY CLUSTER PAIR ABELL 141', 10.00, 10.00);
INSERT INTO public.dim_proposal VALUES (54, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-053', 'SEARCHING FOR EVIDENCE OF GALACTIC WINDS IN CENTAURUS A', 24.00, 24.00);
INSERT INTO public.dim_proposal VALUES (55, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-054', 'EXPLORING THE LARGE SCALE ENVIRONMENT AND STAR FORMATION PROPERTIES OF THE SPIDERWEB PROTO-CLUSTER AT Z = 2.17 WITH MEERKAT', 24.00, 24.00);
INSERT INTO public.dim_proposal VALUES (56, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-055', 'MULTI-WAVELENGTH REAL-TIME FAST TRANSIENTS WITH MEERKAT', 34.00, 27.25);
INSERT INTO public.dim_proposal VALUES (57, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-056', 'MEERKAT - UGMRT COMBINED SURVEY OF THE SARASWATI SUPERCLUSTER: TOWARDS THE SKA', 82.00, 65.50);
INSERT INTO public.dim_proposal VALUES (58, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-057', 'NEUTRAL HYDROGEN EMISSION AT Z = 0.654 IN A STRONGLY-LENSED QUASAR', 10.50, 10.50);
INSERT INTO public.dim_proposal VALUES (59, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-058', 'AN X/S OF RARE RADIO MORPHOLOGIES?', 68.50, 68.50);
INSERT INTO public.dim_proposal VALUES (60, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-059', 'ULTRA FAINT CENTRAL REGION OF GALAXY NGC 1350', 5.00, 5.00);
INSERT INTO public.dim_proposal VALUES (61, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-060', 'HI STUDY OF ULTRA-DIFFUSE GALAXIES AND GALAXY EVOLUTION IN THE CENTRAL REGION OF HYDRA I', 12.00, 10.75);
INSERT INTO public.dim_proposal VALUES (62, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-061', 'LOW FREQUENCY FOLLOW-UP OF GIANT RADIO GALAXIES THAT SHOULDN''T EXIST!', 8.00, 8.00);
INSERT INTO public.dim_proposal VALUES (63, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-062', 'MEERKAT DEEP OBSERVATION OF THE X-RAY FILAMENT', 16.00, 12.75);
INSERT INTO public.dim_proposal VALUES (64, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-063', 'LOW-FREQUENCY MEERKAT DEEP OBSERVATION OF THE X-RAY FILAMENT', 12.00, 10.00);
INSERT INTO public.dim_proposal VALUES (65, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-064', 'INDIRECT DARK MATTER DETECTION IN DWARF GALAXIES', 70.00, 70.00);
INSERT INTO public.dim_proposal VALUES (66, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-065', 'SEARCH FOR NEUTRAL HI GAS AT Z~ 0.5 WITH THE MEERKAT', 19.00, 19.00);
INSERT INTO public.dim_proposal VALUES (67, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-066', 'HIGH REDSHIFT HI OBSERVATIONS AND A RADIO HALO IN ABELL 370', 12.00, 9.50);
INSERT INTO public.dim_proposal VALUES (68, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-067', 'MEERKAT OBSERVATIONS OF GIANT LOW SURFACE BRIGHTNESS GALAXIES', 49.50, 49.50);
INSERT INTO public.dim_proposal VALUES (69, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-068', 'PROBING STAR-PLANET INTERACTION IN THE PROXIMA - PROXIMA B SYSTEM WITH MEERKAT', 18.00, 16.25);
INSERT INTO public.dim_proposal VALUES (70, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-069', 'CATCHING CLUES OF THE ENERGY TRANSPORT BY JET/WINDSIN THE NORTH TRANSITION REGION OF CENTAURUS A', 9.00, 9.00);
INSERT INTO public.dim_proposal VALUES (71, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-070', 'INVESTIGATING GAMMA-RAY EMITTING RADIO GALAXIES', 4.00, 3.00);
INSERT INTO public.dim_proposal VALUES (72, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-082', 'A MEERKAT HI-LINE STUDY OF LOCAL VOLUME DWARF GALAXIES', 39.00, 39.00);
INSERT INTO public.dim_proposal VALUES (73, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-071', 'INVESTIGATING THE PROPERTIES OF LOCALISED FAST RADIO BURSTS AND THEIR HOST GALAXIES', 49.00, 49.00);
INSERT INTO public.dim_proposal VALUES (74, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-072', 'EARLY RADIO EMISSION FROM TIDAL DISRUPTION EVENTS', 32.00, 25.50);
INSERT INTO public.dim_proposal VALUES (75, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-073', 'DUTY CYCLE AND ENERGETICS OF THE REMNANT RADIO GALAXY MIDAS J2253-3446', 3.50, 3.00);
INSERT INTO public.dim_proposal VALUES (76, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-074', 'RESOLVING THE MYSTERY OF A CANDIDATE DARK GALAXY', 12.00, 9.50);
INSERT INTO public.dim_proposal VALUES (77, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-075', 'MAGNETIZATION AND KINEMATICS IN CIRCUMGALACTIC MEDIUM: TIDAL VS. GAS ACCRETION', 22.00, 22.00);
INSERT INTO public.dim_proposal VALUES (78, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-076', 'FORMATION OF GAMMA RAY BURSTS IN INTERACTING GALAXIES', 36.00, 32.00);
INSERT INTO public.dim_proposal VALUES (79, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-077', 'SEARCH FOR DIFFUSE RADIO EMISSION IN SZ SELECTED GALAXY CLUSTERS IN THE SOUTHERN HEMISPHERE WITH THE MEERKAT', 24.00, 21.50);
INSERT INTO public.dim_proposal VALUES (80, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-078', 'DELINEATE THE FERMI BUBBLES AT RADIO WITH MEERKAT: A PILOT STUDY', 40.00, 40.00);
INSERT INTO public.dim_proposal VALUES (81, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-079', 'ISOLATED DWARF GALAXIES DOMINATED BY BARYONS', 36.00, 36.00);
INSERT INTO public.dim_proposal VALUES (82, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-080', 'HI LINE IMAGING OF NGC 5846 GROUP', 89.00, 71.25);
INSERT INTO public.dim_proposal VALUES (83, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-081', 'TO MAP THE WARM IONIZED MEDIUM IN THE GALAXY USING MEERKAT AND FAST', 8.00, 7.00);
INSERT INTO public.dim_proposal VALUES (84, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-084', 'ACCELERATED EVOLUTION IN THE DENSEST GROUPS OF GALAXIES: MEERKAT IMAGING OF THE MISSING HI', 37.50, 37.50);
INSERT INTO public.dim_proposal VALUES (85, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-085', 'MEERKAT OBSERVATIONS OF THE RIDGE CONNECTING THE GALAXY CLUSTERS PAIR A399-A401', 52.00, 41.50);
INSERT INTO public.dim_proposal VALUES (86, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-086', 'A SOUTHERN RADIO SURVEY OF THE FAST BLUE OPTICAL TRANSIENTS', 13.50, 13.50);
INSERT INTO public.dim_proposal VALUES (87, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'PROP-087', 'HI INTENSITY MAPPING WITH MEERKAT: HUNTING DOWN THE POWER SPECTRUM', 85.00, 68.00);


--
-- TOC entry 2176 (class 0 OID 24611)
-- Dependencies: 193
-- Data for Name: dim_reviewer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dim_reviewer VALUES (0, 1, NULL, NULL, NULL);
INSERT INTO public.dim_reviewer VALUES (1, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'N. KATOU');
INSERT INTO public.dim_reviewer VALUES (0, 1, NULL, NULL, NULL);
INSERT INTO public.dim_reviewer VALUES (2, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'P. ROOSEVELT');
INSERT INTO public.dim_reviewer VALUES (0, 1, NULL, NULL, NULL);
INSERT INTO public.dim_reviewer VALUES (3, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'P. NORTON');
INSERT INTO public.dim_reviewer VALUES (4, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'P. FUENTES');
INSERT INTO public.dim_reviewer VALUES (5, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'A. LI');
INSERT INTO public.dim_reviewer VALUES (6, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'D. PIRAINO');
INSERT INTO public.dim_reviewer VALUES (7, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'D. PIRAINO');
INSERT INTO public.dim_reviewer VALUES (8, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'C. MAAS');
INSERT INTO public.dim_reviewer VALUES (9, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'K. ANGIOLI');
INSERT INTO public.dim_reviewer VALUES (11, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'A. LI');
INSERT INTO public.dim_reviewer VALUES (10, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'K. ANGIOLI');
INSERT INTO public.dim_reviewer VALUES (12, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'K. ANGIOLI');
INSERT INTO public.dim_reviewer VALUES (14, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'P. FUENTES');
INSERT INTO public.dim_reviewer VALUES (13, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'C. MAAS');
INSERT INTO public.dim_reviewer VALUES (15, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'C. MAAS');
INSERT INTO public.dim_reviewer VALUES (16, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'P. FUENTES');
INSERT INTO public.dim_reviewer VALUES (17, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'A. LI');
INSERT INTO public.dim_reviewer VALUES (18, 1, '1900-01-01 00:00:00', '2199-12-31 23:59:59.999', 'D. PIRAINO');


--
-- TOC entry 2177 (class 0 OID 24617)
-- Dependencies: 194
-- Data for Name: fact_proposal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Alys Wright", "pi_country": "Canada"}, "tech_lead": {"tech_lead_fullname": "Ida Mullins", "tech_lead_country": "Portugal"}, "co_pis": [{"co_pi_fullname": "Bailey David", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Silas Stein", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Howard Koch", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Kabir Charles", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Duncan Holder", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Imran Rubio", "co_pi_country": "Canada", "is_student": false}]}', 64.00, 9.6, 4.6, 9.4, 64.00, 2, 4, 2, 4, 6, 2);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Maia Mccoy", "pi_country": "Sweden"}, "tech_lead": {"tech_lead_fullname": "Keane Randall", "tech_lead_country": "Ghana"}, "co_pis": [{"co_pi_fullname": "Asa Chen", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Imran Rubio", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Abel Contreras", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Seth Curtis", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Maisy Dejesus", "co_pi_country": "Sweden", "is_student": false}]}', 22.00, 9.2, 8.1, 4.9, 22.00, 3, 5, 1, 5, 8, 9);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Kabir Charles", "pi_country": "China"}, "tech_lead": {"tech_lead_fullname": "Tilly Yoder", "tech_lead_country": "Australia"}, "co_pis": [{"co_pi_fullname": "Maariyah Harding", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Kieran Crane", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Tamsin Pugh", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Maisy Dejesus", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Wayne Palmer", "co_pi_country": "China", "is_student": false}]}', 82.00, 8.5, 7.0, 5.1, 82.00, 4, 6, 3, 6, 9, 1);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Duncan Holder", "pi_country": "Italy"}, "tech_lead": {"tech_lead_fullname": "Connie Gallagher", "tech_lead_country": "Sweden"}, "co_pis": [{"co_pi_fullname": "Amina Edwards", "co_pi_country": "Italy", "is_student": false}]}', 11.66, 9.3, 7.6, 9.8, 8.75, 5, 7, 4, 2, 5, 1);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Maximillian Walker", "pi_country": "South Africa"}, "tech_lead": {"tech_lead_fullname": "Wiktor Church", "tech_lead_country": "Portugal"}, "co_pis": []}', 48.00, 9.5, 5.5, 6.9, 43.00, 6, 8, 3, 1, 5, 4);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Emilio Garza", "pi_country": "Canada"}, "tech_lead": {"tech_lead_fullname": "Silas Stein", "tech_lead_country": "Spain"}, "co_pis": [{"co_pi_fullname": "Kylie Logan", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Marshall Lester", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Stuart Farrell", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Tilly Yoder", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Ayah Escobar", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Adelaide Villarreal", "co_pi_country": "Canada", "is_student": false}]}', 36.00, 6.9, 6.4, 9.4, 29.25, 7, 4, 2, 3, 5, 8);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Naomi Keith", "pi_country": "Germany"}, "tech_lead": {"tech_lead_fullname": "Herbie Lin", "tech_lead_country": "Spain"}, "co_pis": [{"co_pi_fullname": "Marshall Lester", "co_pi_country": "Germany", "is_student": false}, {"co_pi_fullname": "Abraham Beasley", "co_pi_country": "Germany", "is_student": false}, {"co_pi_fullname": "Mike Matthews", "co_pi_country": "Germany", "is_student": false}, {"co_pi_fullname": "Arron Simpson", "co_pi_country": "Germany", "is_student": false}, {"co_pi_fullname": "Naomi Keith", "co_pi_country": "Germany", "is_student": false}, {"co_pi_fullname": "Howard Koch", "co_pi_country": "Germany", "is_student": false}, {"co_pi_fullname": "Bertha Lopez", "co_pi_country": "Germany", "is_student": false}]}', 4.50, 5.1, 7.8, 8.6, 4.50, 8, 9, 4, 2, 6, 5);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Rex Harmon", "pi_country": "France"}, "tech_lead": {"tech_lead_fullname": "Harvey Richards", "tech_lead_country": "China"}, "co_pis": [{"co_pi_fullname": "Olivia Moreno", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Amanda Bush", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Gregory Leach", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Arron Simpson", "co_pi_country": "France", "is_student": false}]}', 2.66, 5.9, 8.7, 8.7, 2.66, 9, 10, 2, 5, 8, 1);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Maximillian Walker", "pi_country": "South Africa"}, "tech_lead": {"tech_lead_fullname": "Gwen Stuart", "tech_lead_country": "Italy"}, "co_pis": [{"co_pi_fullname": "Emilio Garza", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Emilio Garza", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Agnes Lambert", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Gregory Leach", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Silas Stein", "co_pi_country": "South Africa", "is_student": false}]}', 17.00, 9.7, 8.1, 4.8, 17.00, 10, 8, 1, 6, 1, 3);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Laurence Reid", "pi_country": "Italy"}, "tech_lead": {"tech_lead_fullname": "Gwen Stuart", "tech_lead_country": "Italy"}, "co_pis": [{"co_pi_fullname": "Harri Carlson", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Christine Joyce", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Effie Fitzpatrick", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Nana Shepard", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Kylie Logan", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Olivia Moreno", "co_pi_country": "Italy", "is_student": false}]}', 12.00, 4.9, 6.0, 5.5, 12.00, 11, 7, 1, 9, 1, 6);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Maisy Dejesus", "pi_country": "India"}, "tech_lead": {"tech_lead_fullname": "Abdulrahman Blanchard", "tech_lead_country": "Sweden"}, "co_pis": [{"co_pi_fullname": "Cecilia Hutchinson", "co_pi_country": "India", "is_student": false}]}', 8.00, 8.9, 4.9, 6.7, 8.00, 12, 11, 3, 9, 6, 8);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Andrew Kane", "pi_country": "Portugal"}, "tech_lead": {"tech_lead_fullname": "Janice Mcgowan", "tech_lead_country": "Netherlands"}, "co_pis": [{"co_pi_fullname": "Ashwin Barker", "co_pi_country": "Portugal", "is_student": false}]}', 31.00, 8.2, 7.5, 5.6, 24.75, 13, 1, 1, 4, 1, 3);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Zoe Sweeney", "pi_country": "South Africa"}, "tech_lead": {"tech_lead_fullname": "Maariyah Harding", "tech_lead_country": "Australia"}, "co_pis": [{"co_pi_fullname": "Zakir Strong", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Zakir Strong", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Christine Joyce", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Duncan Holder", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Mikey Saunders", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Alys Wright", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Ayah Escobar", "co_pi_country": "South Africa", "is_student": false}]}', 22.33, 8.1, 6.3, 4.7, 22.33, 14, 8, 3, 2, 3, 4);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Brandon Vance", "pi_country": "Ghana"}, "tech_lead": {"tech_lead_fullname": "Bailey David", "tech_lead_country": "Canada"}, "co_pis": [{"co_pi_fullname": "Fatimah Cruz", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Elaine Jimenez", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Olivia Moreno", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Maia Mccoy", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Effie Fitzpatrick", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Mariyah Humphrey", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Zakir Strong", "co_pi_country": "Ghana", "is_student": false}]}', 20.00, 7.4, 7.3, 9.1, 20.00, 15, 12, 1, 5, 4, 6);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Bailey David", "pi_country": "Canada"}, "tech_lead": {"tech_lead_fullname": "Kara Trujillo", "tech_lead_country": "China"}, "co_pis": [{"co_pi_fullname": "Willie Harvey", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Tamsin Pugh", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Amanda Bush", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Pedro Parsons", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Mike Matthews", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Imran Rubio", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Jennie Newton", "co_pi_country": "Canada", "is_student": false}]}', 12.00, 4.7, 7.9, 5.0, 12.00, 16, 4, 1, 9, 1, 6);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Kabir Charles", "pi_country": "China"}, "tech_lead": {"tech_lead_fullname": "Maia Mccoy", "tech_lead_country": "Sweden"}, "co_pis": [{"co_pi_fullname": "Maariyah Harding", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Ellen Abbott", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Alice Conner", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Isra Rhodes", "co_pi_country": "China", "is_student": false}]}', 25.00, 6.3, 6.2, 6.4, 25.00, 17, 6, 2, 9, 2, 5);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Zakir Strong", "pi_country": "Switzerland"}, "tech_lead": {"tech_lead_fullname": "Abdulrahman Blanchard", "tech_lead_country": "Sweden"}, "co_pis": [{"co_pi_fullname": "Stuart Farrell", "co_pi_country": "Switzerland", "is_student": false}, {"co_pi_fullname": "Connie Gallagher", "co_pi_country": "Switzerland", "is_student": false}, {"co_pi_fullname": "Harri Carlson", "co_pi_country": "Switzerland", "is_student": false}, {"co_pi_fullname": "Susie Watkins", "co_pi_country": "Switzerland", "is_student": false}]}', 8.75, 7.5, 6.1, 9.2, 8.75, 18, 13, 2, 8, 9, 1);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Abel Contreras", "pi_country": "South Africa"}, "tech_lead": {"tech_lead_fullname": "Agnes Lambert", "tech_lead_country": "Netherlands"}, "co_pis": [{"co_pi_fullname": "Clementine Golden", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Lochlan Mack", "co_pi_country": "South Africa", "is_student": false}]}', 15.00, 8.2, 4.8, 9.3, 13.50, 19, 8, 1, 1, 5, 2);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Maisy Dejesus", "pi_country": "India"}, "tech_lead": {"tech_lead_fullname": "Keane Randall", "tech_lead_country": "Ghana"}, "co_pis": [{"co_pi_fullname": "Kylie Logan", "co_pi_country": "India", "is_student": false}]}', 30.00, 5.8, 5.8, 7.3, 30.00, 20, 11, 4, 8, 9, 5);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Isra Rhodes", "pi_country": "Spain"}, "tech_lead": {"tech_lead_fullname": "Kylie Logan", "tech_lead_country": "Germany"}, "co_pis": []}', 30.00, 9.6, 6.1, 7.4, 30.00, 21, 14, 2, 1, 6, 5);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Janice Mcgowan", "pi_country": "Netherlands"}, "tech_lead": {"tech_lead_fullname": "Gwen Stuart", "tech_lead_country": "Italy"}, "co_pis": [{"co_pi_fullname": "Eddie O''Connor", "co_pi_country": "Netherlands", "is_student": false}, {"co_pi_fullname": "Keane Randall", "co_pi_country": "Netherlands", "is_student": false}, {"co_pi_fullname": "Keane Randall", "co_pi_country": "Netherlands", "is_student": false}, {"co_pi_fullname": "Asa Chen", "co_pi_country": "Netherlands", "is_student": false}, {"co_pi_fullname": "Effie Fitzpatrick", "co_pi_country": "Netherlands", "is_student": false}, {"co_pi_fullname": "Wayne Palmer", "co_pi_country": "Netherlands", "is_student": false}]}', 25.00, 9.5, 5.7, 8.1, 25.00, 22, 15, 2, 6, 1, 4);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Mollie Campbell", "pi_country": "Sweden"}, "tech_lead": {"tech_lead_fullname": "Kieran Crane", "tech_lead_country": "France"}, "co_pis": [{"co_pi_fullname": "Zaki Harrington", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Ben Stone", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Tamsin Pugh", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Priya Cannon", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Zaki Harrington", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Cian Santana", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Eugene Brock", "co_pi_country": "Sweden", "is_student": false}]}', 12.00, 4.6, 5.4, 6.0, 12.00, 23, 5, 4, 9, 2, 8);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Ridwan Torres", "pi_country": "South Africa"}, "tech_lead": {"tech_lead_fullname": "Arron Simpson", "tech_lead_country": "Spain"}, "co_pis": []}', 18.00, 6.0, 7.9, 8.7, 18.00, 24, 8, 4, 8, 9, 5);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Marshall Lester", "pi_country": "France"}, "tech_lead": {"tech_lead_fullname": "Laurence Reid", "tech_lead_country": "Italy"}, "co_pis": [{"co_pi_fullname": "Kabir Charles", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Martina Bloggs", "co_pi_country": "France", "is_student": false}]}', 10.00, 8.6, 6.3, 8.0, 9.00, 25, 10, 1, 1, 4, 2);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Sebastian Knapp", "pi_country": "Portugal"}, "tech_lead": {"tech_lead_fullname": "Harvey Richards", "tech_lead_country": "China"}, "co_pis": [{"co_pi_fullname": "Abraham Beasley", "co_pi_country": "Portugal", "is_student": false}, {"co_pi_fullname": "Tasneem Blake", "co_pi_country": "Portugal", "is_student": false}, {"co_pi_fullname": "Jakob Elliott", "co_pi_country": "Portugal", "is_student": false}]}', 74.25, 6.2, 7.8, 7.3, 55.75, 26, 1, 3, 2, 6, 9);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Janice Mcgowan", "pi_country": "Netherlands"}, "tech_lead": {"tech_lead_fullname": "Omari Winters", "tech_lead_country": "Italy"}, "co_pis": []}', 50.00, 7.1, 8.3, 9.8, 37.50, 27, 15, 3, 3, 6, 5);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Maisy Dejesus", "pi_country": "India"}, "tech_lead": {"tech_lead_fullname": "Mariyah Humphrey", "tech_lead_country": "France"}, "co_pis": [{"co_pi_fullname": "Nicolas Rice", "co_pi_country": "India", "is_student": false}, {"co_pi_fullname": "Honey Campos", "co_pi_country": "India", "is_student": false}, {"co_pi_fullname": "Bertha Lopez", "co_pi_country": "India", "is_student": false}, {"co_pi_fullname": "Zoe Sweeney", "co_pi_country": "India", "is_student": false}, {"co_pi_fullname": "Duncan Holder", "co_pi_country": "India", "is_student": false}, {"co_pi_fullname": "Abel Contreras", "co_pi_country": "India", "is_student": false}, {"co_pi_fullname": "Rex Harmon", "co_pi_country": "India", "is_student": false}]}', 8.00, 9.7, 8.1, 8.2, 8.00, 28, 11, 3, 1, 4, 5);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Kara Trujillo", "pi_country": "China"}, "tech_lead": {"tech_lead_fullname": "Stuart Farrell", "tech_lead_country": "Australia"}, "co_pis": [{"co_pi_fullname": "Alec Dotson", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Howard Koch", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Tilly Yoder", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Bailey David", "co_pi_country": "China", "is_student": false}]}', 17.00, 9.8, 5.9, 8.0, 13.50, 29, 6, 1, 2, 8, 4);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Alys Wright", "pi_country": "Canada"}, "tech_lead": {"tech_lead_fullname": "Vinny Powers", "tech_lead_country": "Portugal"}, "co_pis": [{"co_pi_fullname": "Kara Trujillo", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Sebastien Singleton", "co_pi_country": "Canada", "is_student": false}]}', 9.00, 6.4, 6.8, 7.7, 9.00, 30, 4, 3, 9, 1, 8);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Dawid Fleming", "pi_country": "Italy"}, "tech_lead": {"tech_lead_fullname": "Marshall Lester", "tech_lead_country": "France"}, "co_pis": [{"co_pi_fullname": "Agnes Lambert", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Honey Campos", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Keane Randall", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Abel Contreras", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Marshall Lester", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Rex Harmon", "co_pi_country": "Italy", "is_student": false}]}', 11.00, 5.6, 6.3, 9.3, 11.00, 31, 7, 4, 2, 5, 9);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Silas Stein", "pi_country": "Spain"}, "tech_lead": {"tech_lead_fullname": "Mollie Campbell", "tech_lead_country": "Sweden"}, "co_pis": [{"co_pi_fullname": "Jennie Newton", "co_pi_country": "Spain", "is_student": false}, {"co_pi_fullname": "Ellen Abbott", "co_pi_country": "Spain", "is_student": false}, {"co_pi_fullname": "Asa Chen", "co_pi_country": "Spain", "is_student": false}, {"co_pi_fullname": "Dawson Warren", "co_pi_country": "Spain", "is_student": false}]}', 45.00, 9.4, 4.8, 4.7, 33.75, 32, 14, 2, 9, 4, 2);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Kieran Crane", "pi_country": "France"}, "tech_lead": {"tech_lead_fullname": "Ayah Escobar", "tech_lead_country": "France"}, "co_pis": [{"co_pi_fullname": "Sebastien Singleton", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Ida Mullins", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Martina Bloggs", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Jennie Newton", "co_pi_country": "France", "is_student": false}]}', 48.00, 9.3, 9.4, 6.9, 48.00, 33, 10, 4, 1, 2, 5);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Herbert Padilla", "pi_country": "Germany"}, "tech_lead": {"tech_lead_fullname": "Alice Conner", "tech_lead_country": "Netherlands"}, "co_pis": [{"co_pi_fullname": "Harvey Richards", "co_pi_country": "Germany", "is_student": false}, {"co_pi_fullname": "Pedro Parsons", "co_pi_country": "Germany", "is_student": false}, {"co_pi_fullname": "Aysha Whitaker", "co_pi_country": "Germany", "is_student": false}, {"co_pi_fullname": "Isra Rhodes", "co_pi_country": "Germany", "is_student": false}, {"co_pi_fullname": "Keane Randall", "co_pi_country": "Germany", "is_student": false}, {"co_pi_fullname": "Dawson Warren", "co_pi_country": "Germany", "is_student": false}]}', 49.00, 8.8, 7.3, 5.4, 39.25, 34, 9, 2, 9, 6, 8);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Alec Dotson", "pi_country": "France"}, "tech_lead": {"tech_lead_fullname": "Clementine Golden", "tech_lead_country": "Switzerland"}, "co_pis": [{"co_pi_fullname": "Tabitha Lamb", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Abel Contreras", "co_pi_country": "France", "is_student": false}]}', 49.00, 6.7, 7.2, 5.6, 37.00, 35, 10, 4, 1, 4, 3);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Ben Stone", "pi_country": "India"}, "tech_lead": {"tech_lead_fullname": "Mollie Campbell", "tech_lead_country": "Sweden"}, "co_pis": []}', 99.50, 5.4, 6.5, 7.6, 99.50, 36, 11, 4, 1, 8, 2);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Eugene Brock", "pi_country": "Germany"}, "tech_lead": {"tech_lead_fullname": "Priya Cannon", "tech_lead_country": "Australia"}, "co_pis": [{"co_pi_fullname": "Tabitha Lamb", "co_pi_country": "Germany", "is_student": false}]}', 9.00, 8.0, 6.2, 5.1, 9.00, 37, 9, 3, 9, 4, 2);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Alec Dotson", "pi_country": "France"}, "tech_lead": {"tech_lead_fullname": "Ashwin Barker", "tech_lead_country": "Portugal"}, "co_pis": [{"co_pi_fullname": "Jakob Elliott", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Herbie Lin", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Daniyal Gonzales", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Honey Campos", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Blaine Hansen", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Cian Santana", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Fatimah Cruz", "co_pi_country": "France", "is_student": false}]}', 13.00, 9.1, 8.6, 8.2, 13.00, 38, 10, 4, 6, 9, 2);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Clementine Golden", "pi_country": "Switzerland"}, "tech_lead": {"tech_lead_fullname": "Bailey David", "tech_lead_country": "Canada"}, "co_pis": [{"co_pi_fullname": "Herbert Padilla", "co_pi_country": "Switzerland", "is_student": false}]}', 12.00, 6.4, 5.8, 8.3, 12.00, 39, 13, 2, 6, 1, 2);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Seth Curtis", "pi_country": "Australia"}, "tech_lead": {"tech_lead_fullname": "Jennie Newton", "tech_lead_country": "Canada"}, "co_pis": [{"co_pi_fullname": "Elaine Jimenez", "co_pi_country": "Australia", "is_student": false}, {"co_pi_fullname": "Kieran Crane", "co_pi_country": "Australia", "is_student": false}]}', 12.00, 5.5, 5.1, 5.1, 9.00, 40, 16, 2, 4, 2, 3);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Adelaide Villarreal", "pi_country": "South Africa"}, "tech_lead": {"tech_lead_fullname": "Tasneem Blake", "tech_lead_country": "Germany"}, "co_pis": [{"co_pi_fullname": "Olivia Moreno", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Bertha Lopez", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Alice Conner", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Isra Rhodes", "co_pi_country": "South Africa", "is_student": false}]}', 50.00, 7.2, 8.3, 7.2, 45.00, 41, 8, 2, 9, 4, 1);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Maisy Dejesus", "pi_country": "India"}, "tech_lead": {"tech_lead_fullname": "Eddie O''Connor", "tech_lead_country": "Australia"}, "co_pis": [{"co_pi_fullname": "Eddie O''Connor", "co_pi_country": "India", "is_student": false}, {"co_pi_fullname": "Sebastien Singleton", "co_pi_country": "India", "is_student": false}, {"co_pi_fullname": "Silas Stein", "co_pi_country": "India", "is_student": false}, {"co_pi_fullname": "Maximillian Walker", "co_pi_country": "India", "is_student": false}, {"co_pi_fullname": "Kieran Crane", "co_pi_country": "India", "is_student": false}, {"co_pi_fullname": "Effie Fitzpatrick", "co_pi_country": "India", "is_student": false}]}', 44.50, 9.1, 6.3, 6.2, 44.50, 42, 11, 4, 2, 1, 5);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Sebastian Knapp", "pi_country": "Portugal"}, "tech_lead": {"tech_lead_fullname": "Christine Joyce", "tech_lead_country": "Netherlands"}, "co_pis": [{"co_pi_fullname": "Andrew Kane", "co_pi_country": "Portugal", "is_student": false}, {"co_pi_fullname": "Maia Mccoy", "co_pi_country": "Portugal", "is_student": false}, {"co_pi_fullname": "Brandon Vance", "co_pi_country": "Portugal", "is_student": false}]}', 48.00, 4.6, 9.9, 9.5, 48.00, 1, 1, 1, 1, 2, 3);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Connie Gallagher", "pi_country": "Sweden"}, "tech_lead": {"tech_lead_fullname": "Herbie Lin", "tech_lead_country": "Spain"}, "co_pis": [{"co_pi_fullname": "Laurence Reid", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Nicolas Rice", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Mikey Saunders", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Seth Curtis", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Eugene Brock", "co_pi_country": "Sweden", "is_student": false}]}', 36.00, 9.5, 5.9, 9.8, 36.00, 43, 5, 4, 9, 3, 8);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Ashwin Barker", "pi_country": "Portugal"}, "tech_lead": {"tech_lead_fullname": "Effie Fitzpatrick", "tech_lead_country": "Portugal"}, "co_pis": [{"co_pi_fullname": "Daniyal Gonzales", "co_pi_country": "Portugal", "is_student": false}, {"co_pi_fullname": "Brandon Vance", "co_pi_country": "Portugal", "is_student": false}, {"co_pi_fullname": "Connie Gallagher", "co_pi_country": "Portugal", "is_student": false}, {"co_pi_fullname": "Imran Rubio", "co_pi_country": "Portugal", "is_student": false}]}', 2.75, 8.5, 9.1, 5.6, 2.00, 44, 1, 1, 4, 6, 8);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Abdulrahman Blanchard", "pi_country": "Sweden"}, "tech_lead": {"tech_lead_fullname": "Cian Santana", "tech_lead_country": "Portugal"}, "co_pis": [{"co_pi_fullname": "Lochlan Mack", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Blaine Hansen", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Alice Conner", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Harri Carlson", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Nana Shepard", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Marshall Lester", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Clementine Golden", "co_pi_country": "Sweden", "is_student": false}]}', 42.00, 9.4, 6.1, 6.2, 42.00, 45, 5, 1, 6, 5, 8);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Sebastian Knapp", "pi_country": "Portugal"}, "tech_lead": {"tech_lead_fullname": "Hasan Phillips", "tech_lead_country": "Netherlands"}, "co_pis": [{"co_pi_fullname": "Tamsin Pugh", "co_pi_country": "Portugal", "is_student": false}, {"co_pi_fullname": "Harri Carlson", "co_pi_country": "Portugal", "is_student": false}]}', 50.00, 5.1, 6.3, 6.9, 50.00, 46, 1, 4, 3, 1, 4);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Keane Randall", "pi_country": "Ghana"}, "tech_lead": {"tech_lead_fullname": "Eddie O''Connor", "tech_lead_country": "Australia"}, "co_pis": [{"co_pi_fullname": "Tilly Yoder", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Alice Conner", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Connie Gallagher", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Jakob Elliott", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Priya Cannon", "co_pi_country": "Ghana", "is_student": false}]}', 55.00, 8.3, 8.0, 9.1, 41.25, 47, 12, 1, 8, 5, 6);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Susie Watkins", "pi_country": "Switzerland"}, "tech_lead": {"tech_lead_fullname": "Zaki Harrington", "tech_lead_country": "China"}, "co_pis": [{"co_pi_fullname": "Alys Wright", "co_pi_country": "Switzerland", "is_student": false}, {"co_pi_fullname": "Olivia Moreno", "co_pi_country": "Switzerland", "is_student": false}]}', 36.00, 6.7, 9.4, 8.8, 32.00, 48, 13, 2, 9, 3, 5);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Tilly Yoder", "pi_country": "Australia"}, "tech_lead": {"tech_lead_fullname": "Ben Stone", "tech_lead_country": "India"}, "co_pis": [{"co_pi_fullname": "Janice Mcgowan", "co_pi_country": "Australia", "is_student": false}, {"co_pi_fullname": "Wiktor Church", "co_pi_country": "Australia", "is_student": false}, {"co_pi_fullname": "Daniyal Gonzales", "co_pi_country": "Australia", "is_student": false}, {"co_pi_fullname": "Abel Contreras", "co_pi_country": "Australia", "is_student": false}, {"co_pi_fullname": "Janice Mcgowan", "co_pi_country": "Australia", "is_student": false}, {"co_pi_fullname": "Dawson Warren", "co_pi_country": "Australia", "is_student": false}]}', 24.50, 7.8, 7.4, 8.1, 24.50, 49, 16, 4, 5, 1, 6);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Brandon Vance", "pi_country": "Ghana"}, "tech_lead": {"tech_lead_fullname": "Tommy Murray", "tech_lead_country": "Switzerland"}, "co_pis": []}', 36.00, 6.0, 9.7, 7.9, 36.00, 50, 12, 3, 3, 5, 6);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Mikey Saunders", "pi_country": "United Kingdom"}, "tech_lead": {"tech_lead_fullname": "Alfie Higgins", "tech_lead_country": "China"}, "co_pis": [{"co_pi_fullname": "Seth Curtis", "co_pi_country": "United Kingdom", "is_student": false}]}', 9.00, 6.9, 5.1, 5.1, 9.00, 51, 17, 4, 3, 9, 2);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Ben Stone", "pi_country": "India"}, "tech_lead": {"tech_lead_fullname": "Pedro Parsons", "tech_lead_country": "Australia"}, "co_pis": [{"co_pi_fullname": "Cecilia Hutchinson", "co_pi_country": "India", "is_student": false}, {"co_pi_fullname": "Fatimah Cruz", "co_pi_country": "India", "is_student": false}, {"co_pi_fullname": "Wiktor Church", "co_pi_country": "India", "is_student": false}, {"co_pi_fullname": "Clementine Golden", "co_pi_country": "India", "is_student": false}]}', 11.00, 9.1, 6.7, 7.9, 11.00, 52, 11, 2, 3, 4, 2);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Zaki Harrington", "pi_country": "China"}, "tech_lead": {"tech_lead_fullname": "Bailey David", "tech_lead_country": "Canada"}, "co_pis": [{"co_pi_fullname": "Silas Stein", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Tabitha Lamb", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Andrew Kane", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Sebastien Singleton", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Emilio Garza", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Gregory Leach", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Wiktor Church", "co_pi_country": "China", "is_student": false}]}', 10.00, 7.0, 9.6, 7.7, 10.00, 53, 6, 4, 2, 9, 3);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Asa Chen", "pi_country": "Canada"}, "tech_lead": {"tech_lead_fullname": "Abel Contreras", "tech_lead_country": "South Africa"}, "co_pis": [{"co_pi_fullname": "Ben Stone", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Alice Conner", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Bruce Bullock", "co_pi_country": "Canada", "is_student": false}]}', 24.00, 9.9, 6.5, 6.7, 24.00, 54, 4, 4, 2, 5, 1);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Susie Watkins", "pi_country": "Switzerland"}, "tech_lead": {"tech_lead_fullname": "Abdulrahman Blanchard", "tech_lead_country": "Sweden"}, "co_pis": [{"co_pi_fullname": "Priya Cannon", "co_pi_country": "Switzerland", "is_student": false}, {"co_pi_fullname": "Cecilia Hutchinson", "co_pi_country": "Switzerland", "is_student": false}, {"co_pi_fullname": "Stuart Farrell", "co_pi_country": "Switzerland", "is_student": false}, {"co_pi_fullname": "Herbert Padilla", "co_pi_country": "Switzerland", "is_student": false}, {"co_pi_fullname": "Janice Mcgowan", "co_pi_country": "Switzerland", "is_student": false}]}', 24.00, 5.3, 7.6, 5.6, 24.00, 55, 13, 2, 8, 6, 5);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Zaki Harrington", "pi_country": "China"}, "tech_lead": {"tech_lead_fullname": "Wiktor Church", "tech_lead_country": "Portugal"}, "co_pis": [{"co_pi_fullname": "Bailey David", "co_pi_country": "China", "is_student": false}]}', 34.00, 7.9, 7.1, 5.9, 27.25, 56, 6, 4, 1, 5, 4);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Silas Stein", "pi_country": "Spain"}, "tech_lead": {"tech_lead_fullname": "Asa Chen", "tech_lead_country": "Canada"}, "co_pis": [{"co_pi_fullname": "Omari Winters", "co_pi_country": "Spain", "is_student": false}]}', 82.00, 8.1, 9.7, 9.1, 65.50, 57, 14, 2, 9, 5, 1);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Bailey David", "pi_country": "Canada"}, "tech_lead": {"tech_lead_fullname": "Cecilia Hutchinson", "tech_lead_country": "South Africa"}, "co_pis": [{"co_pi_fullname": "Nicolas Rice", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Imran Rubio", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Maisy Dejesus", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Ayah Escobar", "co_pi_country": "Canada", "is_student": false}]}', 10.50, 7.7, 6.3, 7.9, 10.50, 58, 4, 4, 4, 2, 3);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Alice Conner", "pi_country": "Netherlands"}, "tech_lead": {"tech_lead_fullname": "Andrew Kane", "tech_lead_country": "Portugal"}, "co_pis": [{"co_pi_fullname": "Tabitha Lamb", "co_pi_country": "Netherlands", "is_student": false}, {"co_pi_fullname": "Abraham Beasley", "co_pi_country": "Netherlands", "is_student": false}, {"co_pi_fullname": "Agnes Lambert", "co_pi_country": "Netherlands", "is_student": false}, {"co_pi_fullname": "Tommy Murray", "co_pi_country": "Netherlands", "is_student": false}]}', 68.50, 9.0, 9.7, 7.6, 68.50, 59, 15, 1, 8, 2, 9);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Abraham Beasley", "pi_country": "South Africa"}, "tech_lead": {"tech_lead_fullname": "Pedro Parsons", "tech_lead_country": "Australia"}, "co_pis": []}', 5.00, 8.6, 8.1, 6.9, 5.00, 60, 8, 4, 1, 5, 8);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Bailey David", "pi_country": "Canada"}, "tech_lead": {"tech_lead_fullname": "Sebastien Singleton", "tech_lead_country": "Spain"}, "co_pis": [{"co_pi_fullname": "Agnes Lambert", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Tommy Murray", "co_pi_country": "Canada", "is_student": false}]}', 12.00, 4.6, 4.7, 6.5, 10.75, 61, 4, 4, 9, 3, 4);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Martina Bloggs", "pi_country": "Ghana"}, "tech_lead": {"tech_lead_fullname": "Harri Carlson", "tech_lead_country": "Portugal"}, "co_pis": [{"co_pi_fullname": "Mollie Campbell", "co_pi_country": "Ghana", "is_student": false}]}', 8.00, 9.3, 5.7, 8.5, 8.00, 62, 12, 4, 6, 4, 8);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Keane Randall", "pi_country": "Ghana"}, "tech_lead": {"tech_lead_fullname": "Priya Cannon", "tech_lead_country": "Australia"}, "co_pis": [{"co_pi_fullname": "Fatimah Cruz", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Jakob Elliott", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Omari Winters", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Zakir Strong", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Kara Trujillo", "co_pi_country": "Ghana", "is_student": false}]}', 16.00, 6.2, 5.8, 9.0, 12.75, 63, 12, 3, 3, 4, 1);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Eddie O''Connor", "pi_country": "Australia"}, "tech_lead": {"tech_lead_fullname": "Alec Dotson", "tech_lead_country": "France"}, "co_pis": [{"co_pi_fullname": "Susie Watkins", "co_pi_country": "Australia", "is_student": false}, {"co_pi_fullname": "Adelaide Villarreal", "co_pi_country": "Australia", "is_student": false}, {"co_pi_fullname": "Bertha Lopez", "co_pi_country": "Australia", "is_student": false}, {"co_pi_fullname": "Ridwan Torres", "co_pi_country": "Australia", "is_student": false}, {"co_pi_fullname": "Amanda Bush", "co_pi_country": "Australia", "is_student": false}, {"co_pi_fullname": "Tasneem Blake", "co_pi_country": "Australia", "is_student": false}]}', 12.00, 6.8, 7.2, 7.7, 10.00, 64, 16, 2, 2, 3, 1);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Nicolas Rice", "pi_country": "Italy"}, "tech_lead": {"tech_lead_fullname": "Priya Cannon", "tech_lead_country": "Australia"}, "co_pis": [{"co_pi_fullname": "Marshall Lester", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Maisy Dejesus", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Amanda Bush", "co_pi_country": "Italy", "is_student": false}]}', 70.00, 8.3, 5.4, 7.3, 70.00, 65, 7, 4, 9, 4, 6);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Eugene Brock", "pi_country": "Germany"}, "tech_lead": {"tech_lead_fullname": "Eddie O''Connor", "tech_lead_country": "Australia"}, "co_pis": []}', 19.00, 5.4, 5.8, 5.1, 19.00, 66, 9, 2, 2, 9, 5);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Nana Shepard", "pi_country": "Italy"}, "tech_lead": {"tech_lead_fullname": "Maia Mccoy", "tech_lead_country": "Sweden"}, "co_pis": [{"co_pi_fullname": "Wiktor Church", "co_pi_country": "Italy", "is_student": false}]}', 12.00, 4.8, 6.3, 8.2, 9.50, 67, 7, 2, 3, 2, 8);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Aysha Whitaker", "pi_country": "South Africa"}, "tech_lead": {"tech_lead_fullname": "Jakob Elliott", "tech_lead_country": "Spain"}, "co_pis": [{"co_pi_fullname": "Kabir Charles", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Jakob Elliott", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Alys Wright", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Tabitha Lamb", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Herbie Lin", "co_pi_country": "South Africa", "is_student": false}]}', 49.50, 7.1, 9.3, 6.6, 49.50, 68, 8, 4, 6, 2, 3);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Susie Watkins", "pi_country": "Switzerland"}, "tech_lead": {"tech_lead_fullname": "Amina Edwards", "tech_lead_country": "Sweden"}, "co_pis": [{"co_pi_fullname": "Maisy Dejesus", "co_pi_country": "Switzerland", "is_student": false}, {"co_pi_fullname": "Eugene Brock", "co_pi_country": "Switzerland", "is_student": false}, {"co_pi_fullname": "Arron Simpson", "co_pi_country": "Switzerland", "is_student": false}, {"co_pi_fullname": "Maximillian Walker", "co_pi_country": "Switzerland", "is_student": false}, {"co_pi_fullname": "Agnes Lambert", "co_pi_country": "Switzerland", "is_student": false}, {"co_pi_fullname": "Kylie Logan", "co_pi_country": "Switzerland", "is_student": false}]}', 18.00, 8.6, 6.9, 9.5, 16.25, 69, 13, 3, 5, 9, 6);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Jakob Elliott", "pi_country": "Spain"}, "tech_lead": {"tech_lead_fullname": "Cian Santana", "tech_lead_country": "Portugal"}, "co_pis": [{"co_pi_fullname": "Wayne Palmer", "co_pi_country": "Spain", "is_student": false}, {"co_pi_fullname": "Bailey David", "co_pi_country": "Spain", "is_student": false}, {"co_pi_fullname": "Bruce Bullock", "co_pi_country": "Spain", "is_student": false}, {"co_pi_fullname": "Tommy Murray", "co_pi_country": "Spain", "is_student": false}, {"co_pi_fullname": "Susie Watkins", "co_pi_country": "Spain", "is_student": false}]}', 9.00, 8.2, 9.9, 5.4, 9.00, 70, 14, 2, 4, 6, 1);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Nicolas Rice", "pi_country": "Italy"}, "tech_lead": {"tech_lead_fullname": "Olivia Moreno", "tech_lead_country": "Germany"}, "co_pis": [{"co_pi_fullname": "Sebastien Singleton", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Nicolas Rice", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Zakir Strong", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Sebastien Singleton", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Hasan Phillips", "co_pi_country": "Italy", "is_student": false}]}', 4.00, 9.4, 5.9, 9.1, 3.00, 71, 7, 2, 2, 6, 8);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Abel Contreras", "pi_country": "South Africa"}, "tech_lead": {"tech_lead_fullname": "Tasneem Blake", "tech_lead_country": "Germany"}, "co_pis": [{"co_pi_fullname": "Clementine Golden", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Barbara Baird", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Wiktor Church", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Jakob Elliott", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Barbara Baird", "co_pi_country": "South Africa", "is_student": false}]}', 39.00, 6.1, 7.9, 7.9, 39.00, 72, 8, 1, 5, 3, 2);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Wiktor Church", "pi_country": "Portugal"}, "tech_lead": {"tech_lead_fullname": "Adelaide Villarreal", "tech_lead_country": "South Africa"}, "co_pis": [{"co_pi_fullname": "Aysha Whitaker", "co_pi_country": "Portugal", "is_student": false}, {"co_pi_fullname": "Jennie Newton", "co_pi_country": "Portugal", "is_student": false}, {"co_pi_fullname": "Kabir Charles", "co_pi_country": "Portugal", "is_student": false}, {"co_pi_fullname": "Omari Winters", "co_pi_country": "Portugal", "is_student": false}, {"co_pi_fullname": "Gwen Stuart", "co_pi_country": "Portugal", "is_student": false}, {"co_pi_fullname": "Elaine Jimenez", "co_pi_country": "Portugal", "is_student": false}, {"co_pi_fullname": "Abraham Beasley", "co_pi_country": "Portugal", "is_student": false}]}', 49.00, 6.5, 7.7, 5.5, 49.00, 73, 1, 1, 9, 2, 5);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Bailey David", "pi_country": "Canada"}, "tech_lead": {"tech_lead_fullname": "Priya Cannon", "tech_lead_country": "Australia"}, "co_pis": [{"co_pi_fullname": "Laurence Reid", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Ridwan Torres", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Olivia Moreno", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Daniyal Gonzales", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Agnes Lambert", "co_pi_country": "Canada", "is_student": false}]}', 32.00, 7.0, 7.7, 5.8, 25.50, 74, 4, 1, 2, 3, 1);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Nana Shepard", "pi_country": "Italy"}, "tech_lead": {"tech_lead_fullname": "Mike Matthews", "tech_lead_country": "Canada"}, "co_pis": [{"co_pi_fullname": "Ashwin Barker", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Effie Fitzpatrick", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Tilly Yoder", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Howard Koch", "co_pi_country": "Italy", "is_student": false}]}', 3.50, 7.7, 7.2, 9.7, 3.00, 75, 7, 3, 3, 4, 1);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Alfie Higgins", "pi_country": "China"}, "tech_lead": {"tech_lead_fullname": "Stuart Farrell", "tech_lead_country": "Australia"}, "co_pis": [{"co_pi_fullname": "Daniyal Gonzales", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Amanda Bush", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Honey Campos", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Elaine Jimenez", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Martina Bloggs", "co_pi_country": "China", "is_student": false}]}', 12.00, 6.1, 5.6, 7.1, 9.50, 76, 6, 3, 5, 3, 4);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Ridwan Torres", "pi_country": "South Africa"}, "tech_lead": {"tech_lead_fullname": "Harri Carlson", "tech_lead_country": "Portugal"}, "co_pis": [{"co_pi_fullname": "Jennie Newton", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Effie Fitzpatrick", "co_pi_country": "South Africa", "is_student": false}]}', 22.00, 5.1, 5.7, 9.2, 22.00, 77, 8, 4, 6, 2, 9);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Bailey David", "pi_country": "Canada"}, "tech_lead": {"tech_lead_fullname": "Stuart Farrell", "tech_lead_country": "Australia"}, "co_pis": [{"co_pi_fullname": "Dawid Fleming", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Honey Campos", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Ellen Abbott", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Sebastien Singleton", "co_pi_country": "Canada", "is_student": false}]}', 36.00, 6.5, 7.2, 7.7, 32.00, 78, 4, 2, 4, 9, 5);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Ida Mullins", "pi_country": "Portugal"}, "tech_lead": {"tech_lead_fullname": "Asa Chen", "tech_lead_country": "Canada"}, "co_pis": [{"co_pi_fullname": "Adelaide Villarreal", "co_pi_country": "Portugal", "is_student": false}, {"co_pi_fullname": "Amina Edwards", "co_pi_country": "Portugal", "is_student": false}]}', 24.00, 5.6, 8.1, 7.6, 21.50, 79, 1, 4, 8, 4, 9);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Ayah Escobar", "pi_country": "France"}, "tech_lead": {"tech_lead_fullname": "Priya Cannon", "tech_lead_country": "Australia"}, "co_pis": [{"co_pi_fullname": "Tilly Yoder", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Sebastien Singleton", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Clementine Golden", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Marshall Lester", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Honey Campos", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Martina Bloggs", "co_pi_country": "France", "is_student": false}]}', 40.00, 6.6, 6.4, 7.0, 40.00, 80, 10, 4, 4, 3, 1);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Brandon Vance", "pi_country": "Ghana"}, "tech_lead": {"tech_lead_fullname": "Gregory Leach", "tech_lead_country": "Germany"}, "co_pis": [{"co_pi_fullname": "Wayne Palmer", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Vinny Powers", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Eugene Brock", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Agnes Lambert", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Tommy Murray", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Zoe Sweeney", "co_pi_country": "Ghana", "is_student": false}]}', 36.00, 8.1, 5.3, 8.1, 36.00, 81, 12, 3, 8, 2, 1);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Susie Watkins", "pi_country": "Switzerland"}, "tech_lead": {"tech_lead_fullname": "Kylie Logan", "tech_lead_country": "Germany"}, "co_pis": [{"co_pi_fullname": "Maximillian Walker", "co_pi_country": "Switzerland", "is_student": false}, {"co_pi_fullname": "Lochlan Mack", "co_pi_country": "Switzerland", "is_student": false}, {"co_pi_fullname": "Keane Randall", "co_pi_country": "Switzerland", "is_student": false}, {"co_pi_fullname": "Alys Wright", "co_pi_country": "Switzerland", "is_student": false}]}', 89.00, 6.6, 8.7, 6.1, 71.25, 82, 13, 1, 1, 6, 8);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Blaine Hansen", "pi_country": "Sweden"}, "tech_lead": {"tech_lead_fullname": "Cian Santana", "tech_lead_country": "Portugal"}, "co_pis": [{"co_pi_fullname": "Mikey Saunders", "co_pi_country": "Sweden", "is_student": false}]}', 8.00, 9.0, 6.5, 9.9, 7.00, 83, 5, 1, 4, 3, 2);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Tilly Yoder", "pi_country": "Australia"}, "tech_lead": {"tech_lead_fullname": "Mike Matthews", "tech_lead_country": "Canada"}, "co_pis": [{"co_pi_fullname": "Stuart Farrell", "co_pi_country": "Australia", "is_student": false}, {"co_pi_fullname": "Cian Santana", "co_pi_country": "Australia", "is_student": false}]}', 37.50, 4.9, 6.7, 7.5, 37.50, 84, 16, 1, 8, 6, 2);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Fatimah Cruz", "pi_country": "United Kingdom"}, "tech_lead": {"tech_lead_fullname": "Maariyah Harding", "tech_lead_country": "Australia"}, "co_pis": [{"co_pi_fullname": "Harri Carlson", "co_pi_country": "United Kingdom", "is_student": false}, {"co_pi_fullname": "Dawid Fleming", "co_pi_country": "United Kingdom", "is_student": false}, {"co_pi_fullname": "Honey Campos", "co_pi_country": "United Kingdom", "is_student": false}, {"co_pi_fullname": "Olivia Moreno", "co_pi_country": "United Kingdom", "is_student": false}, {"co_pi_fullname": "Honey Campos", "co_pi_country": "United Kingdom", "is_student": false}]}', 52.00, 6.6, 9.7, 6.2, 41.50, 85, 17, 4, 5, 2, 1);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Pedro Parsons", "pi_country": "Australia"}, "tech_lead": {"tech_lead_fullname": "Janice Mcgowan", "tech_lead_country": "Netherlands"}, "co_pis": [{"co_pi_fullname": "Mikey Saunders", "co_pi_country": "Australia", "is_student": false}, {"co_pi_fullname": "Gwen Stuart", "co_pi_country": "Australia", "is_student": false}, {"co_pi_fullname": "Jakob Elliott", "co_pi_country": "Australia", "is_student": false}]}', 13.50, 8.9, 5.8, 9.4, 13.50, 86, 16, 4, 1, 8, 2);
INSERT INTO public.fact_proposal VALUES ('{"pi": {"pi_fullname": "Aysha Whitaker", "pi_country": "South Africa"}, "tech_lead": {"tech_lead_fullname": "Bruce Bullock", "tech_lead_country": "United Kingdom"}, "co_pis": [{"co_pi_fullname": "Aysha Whitaker", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Howard Koch", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Nicolas Rice", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Tabitha Lamb", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Amanda Bush", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Fatimah Cruz", "co_pi_country": "South Africa", "is_student": false}]}', 85.00, 5.6, 8.9, 9.8, 68.00, 87, 8, 3, 1, 8, 3);


--
-- TOC entry 2178 (class 0 OID 24623)
-- Dependencies: 195
-- Data for Name: fact_score; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fact_score VALUES (2, 4, 2, 4, 'Reviewer 1', 9.6);
INSERT INTO public.fact_score VALUES (2, 4, 2, 6, 'Reviewer 2', 4.6);
INSERT INTO public.fact_score VALUES (2, 4, 2, 2, 'Reviewer 3', 9.4);
INSERT INTO public.fact_score VALUES (3, 5, 1, 5, 'Reviewer 1', 9.2);
INSERT INTO public.fact_score VALUES (3, 5, 1, 8, 'Reviewer 2', 8.1);
INSERT INTO public.fact_score VALUES (3, 5, 1, 9, 'Reviewer 3', 4.9);
INSERT INTO public.fact_score VALUES (4, 6, 3, 6, 'Reviewer 1', 8.5);
INSERT INTO public.fact_score VALUES (4, 6, 3, 9, 'Reviewer 2', 7.0);
INSERT INTO public.fact_score VALUES (4, 6, 3, 1, 'Reviewer 3', 5.1);
INSERT INTO public.fact_score VALUES (5, 7, 4, 2, 'Reviewer 1', 9.3);
INSERT INTO public.fact_score VALUES (5, 7, 4, 5, 'Reviewer 2', 7.6);
INSERT INTO public.fact_score VALUES (5, 7, 4, 1, 'Reviewer 3', 9.8);
INSERT INTO public.fact_score VALUES (6, 8, 3, 1, 'Reviewer 1', 9.5);
INSERT INTO public.fact_score VALUES (6, 8, 3, 5, 'Reviewer 2', 5.5);
INSERT INTO public.fact_score VALUES (6, 8, 3, 4, 'Reviewer 3', 6.9);
INSERT INTO public.fact_score VALUES (7, 4, 2, 3, 'Reviewer 1', 6.9);
INSERT INTO public.fact_score VALUES (7, 4, 2, 5, 'Reviewer 2', 6.4);
INSERT INTO public.fact_score VALUES (7, 4, 2, 8, 'Reviewer 3', 9.4);
INSERT INTO public.fact_score VALUES (8, 9, 4, 2, 'Reviewer 1', 5.1);
INSERT INTO public.fact_score VALUES (8, 9, 4, 6, 'Reviewer 2', 7.8);
INSERT INTO public.fact_score VALUES (8, 9, 4, 5, 'Reviewer 3', 8.6);
INSERT INTO public.fact_score VALUES (9, 10, 2, 5, 'Reviewer 1', 5.9);
INSERT INTO public.fact_score VALUES (9, 10, 2, 8, 'Reviewer 2', 8.7);
INSERT INTO public.fact_score VALUES (9, 10, 2, 1, 'Reviewer 3', 8.7);
INSERT INTO public.fact_score VALUES (10, 8, 1, 6, 'Reviewer 1', 9.7);
INSERT INTO public.fact_score VALUES (10, 8, 1, 1, 'Reviewer 2', 8.1);
INSERT INTO public.fact_score VALUES (10, 8, 1, 3, 'Reviewer 3', 4.8);
INSERT INTO public.fact_score VALUES (11, 7, 1, 9, 'Reviewer 1', 4.9);
INSERT INTO public.fact_score VALUES (11, 7, 1, 1, 'Reviewer 2', 6.0);
INSERT INTO public.fact_score VALUES (11, 7, 1, 6, 'Reviewer 3', 5.5);
INSERT INTO public.fact_score VALUES (12, 11, 3, 9, 'Reviewer 1', 8.9);
INSERT INTO public.fact_score VALUES (12, 11, 3, 6, 'Reviewer 2', 4.9);
INSERT INTO public.fact_score VALUES (12, 11, 3, 8, 'Reviewer 3', 6.7);
INSERT INTO public.fact_score VALUES (13, 1, 1, 4, 'Reviewer 1', 8.2);
INSERT INTO public.fact_score VALUES (13, 1, 1, 1, 'Reviewer 2', 7.5);
INSERT INTO public.fact_score VALUES (13, 1, 1, 3, 'Reviewer 3', 5.6);
INSERT INTO public.fact_score VALUES (14, 8, 3, 2, 'Reviewer 1', 8.1);
INSERT INTO public.fact_score VALUES (14, 8, 3, 3, 'Reviewer 2', 6.3);
INSERT INTO public.fact_score VALUES (14, 8, 3, 4, 'Reviewer 3', 4.7);
INSERT INTO public.fact_score VALUES (15, 12, 1, 5, 'Reviewer 1', 7.4);
INSERT INTO public.fact_score VALUES (15, 12, 1, 4, 'Reviewer 2', 7.3);
INSERT INTO public.fact_score VALUES (15, 12, 1, 6, 'Reviewer 3', 9.1);
INSERT INTO public.fact_score VALUES (16, 4, 1, 9, 'Reviewer 1', 4.7);
INSERT INTO public.fact_score VALUES (16, 4, 1, 1, 'Reviewer 2', 7.9);
INSERT INTO public.fact_score VALUES (16, 4, 1, 6, 'Reviewer 3', 5.0);
INSERT INTO public.fact_score VALUES (17, 6, 2, 9, 'Reviewer 1', 6.3);
INSERT INTO public.fact_score VALUES (17, 6, 2, 2, 'Reviewer 2', 6.2);
INSERT INTO public.fact_score VALUES (17, 6, 2, 5, 'Reviewer 3', 6.4);
INSERT INTO public.fact_score VALUES (18, 13, 2, 8, 'Reviewer 1', 7.5);
INSERT INTO public.fact_score VALUES (18, 13, 2, 9, 'Reviewer 2', 6.1);
INSERT INTO public.fact_score VALUES (18, 13, 2, 1, 'Reviewer 3', 9.2);
INSERT INTO public.fact_score VALUES (19, 8, 1, 1, 'Reviewer 1', 8.2);
INSERT INTO public.fact_score VALUES (19, 8, 1, 5, 'Reviewer 2', 4.8);
INSERT INTO public.fact_score VALUES (19, 8, 1, 2, 'Reviewer 3', 9.3);
INSERT INTO public.fact_score VALUES (20, 11, 4, 8, 'Reviewer 1', 5.8);
INSERT INTO public.fact_score VALUES (20, 11, 4, 9, 'Reviewer 2', 5.8);
INSERT INTO public.fact_score VALUES (20, 11, 4, 5, 'Reviewer 3', 7.3);
INSERT INTO public.fact_score VALUES (21, 14, 2, 1, 'Reviewer 1', 9.6);
INSERT INTO public.fact_score VALUES (21, 14, 2, 6, 'Reviewer 2', 6.1);
INSERT INTO public.fact_score VALUES (21, 14, 2, 5, 'Reviewer 3', 7.4);
INSERT INTO public.fact_score VALUES (22, 15, 2, 6, 'Reviewer 1', 9.5);
INSERT INTO public.fact_score VALUES (22, 15, 2, 1, 'Reviewer 2', 5.7);
INSERT INTO public.fact_score VALUES (22, 15, 2, 4, 'Reviewer 3', 8.1);
INSERT INTO public.fact_score VALUES (23, 5, 4, 9, 'Reviewer 1', 4.6);
INSERT INTO public.fact_score VALUES (23, 5, 4, 2, 'Reviewer 2', 5.4);
INSERT INTO public.fact_score VALUES (23, 5, 4, 8, 'Reviewer 3', 6.0);
INSERT INTO public.fact_score VALUES (24, 8, 4, 8, 'Reviewer 1', 6.0);
INSERT INTO public.fact_score VALUES (24, 8, 4, 9, 'Reviewer 2', 7.9);
INSERT INTO public.fact_score VALUES (24, 8, 4, 5, 'Reviewer 3', 8.7);
INSERT INTO public.fact_score VALUES (25, 10, 1, 1, 'Reviewer 1', 8.6);
INSERT INTO public.fact_score VALUES (25, 10, 1, 4, 'Reviewer 2', 6.3);
INSERT INTO public.fact_score VALUES (25, 10, 1, 2, 'Reviewer 3', 8.0);
INSERT INTO public.fact_score VALUES (26, 1, 3, 2, 'Reviewer 1', 6.2);
INSERT INTO public.fact_score VALUES (26, 1, 3, 6, 'Reviewer 2', 7.8);
INSERT INTO public.fact_score VALUES (26, 1, 3, 9, 'Reviewer 3', 7.3);
INSERT INTO public.fact_score VALUES (27, 15, 3, 3, 'Reviewer 1', 7.1);
INSERT INTO public.fact_score VALUES (27, 15, 3, 6, 'Reviewer 2', 8.3);
INSERT INTO public.fact_score VALUES (27, 15, 3, 5, 'Reviewer 3', 9.8);
INSERT INTO public.fact_score VALUES (28, 11, 3, 1, 'Reviewer 1', 9.7);
INSERT INTO public.fact_score VALUES (28, 11, 3, 4, 'Reviewer 2', 8.1);
INSERT INTO public.fact_score VALUES (28, 11, 3, 5, 'Reviewer 3', 8.2);
INSERT INTO public.fact_score VALUES (29, 6, 1, 2, 'Reviewer 1', 9.8);
INSERT INTO public.fact_score VALUES (29, 6, 1, 8, 'Reviewer 2', 5.9);
INSERT INTO public.fact_score VALUES (29, 6, 1, 4, 'Reviewer 3', 8.0);
INSERT INTO public.fact_score VALUES (30, 4, 3, 9, 'Reviewer 1', 6.4);
INSERT INTO public.fact_score VALUES (30, 4, 3, 1, 'Reviewer 2', 6.8);
INSERT INTO public.fact_score VALUES (30, 4, 3, 8, 'Reviewer 3', 7.7);
INSERT INTO public.fact_score VALUES (31, 7, 4, 2, 'Reviewer 1', 5.6);
INSERT INTO public.fact_score VALUES (31, 7, 4, 5, 'Reviewer 2', 6.3);
INSERT INTO public.fact_score VALUES (31, 7, 4, 9, 'Reviewer 3', 9.3);
INSERT INTO public.fact_score VALUES (32, 14, 2, 9, 'Reviewer 1', 9.4);
INSERT INTO public.fact_score VALUES (32, 14, 2, 4, 'Reviewer 2', 4.8);
INSERT INTO public.fact_score VALUES (32, 14, 2, 2, 'Reviewer 3', 4.7);
INSERT INTO public.fact_score VALUES (33, 10, 4, 1, 'Reviewer 1', 9.3);
INSERT INTO public.fact_score VALUES (33, 10, 4, 2, 'Reviewer 2', 9.4);
INSERT INTO public.fact_score VALUES (33, 10, 4, 5, 'Reviewer 3', 6.9);
INSERT INTO public.fact_score VALUES (34, 9, 2, 9, 'Reviewer 1', 8.8);
INSERT INTO public.fact_score VALUES (34, 9, 2, 6, 'Reviewer 2', 7.3);
INSERT INTO public.fact_score VALUES (34, 9, 2, 8, 'Reviewer 3', 5.4);
INSERT INTO public.fact_score VALUES (35, 10, 4, 1, 'Reviewer 1', 6.7);
INSERT INTO public.fact_score VALUES (35, 10, 4, 4, 'Reviewer 2', 7.2);
INSERT INTO public.fact_score VALUES (35, 10, 4, 3, 'Reviewer 3', 5.6);
INSERT INTO public.fact_score VALUES (36, 11, 4, 1, 'Reviewer 1', 5.4);
INSERT INTO public.fact_score VALUES (36, 11, 4, 8, 'Reviewer 2', 6.5);
INSERT INTO public.fact_score VALUES (36, 11, 4, 2, 'Reviewer 3', 7.6);
INSERT INTO public.fact_score VALUES (37, 9, 3, 9, 'Reviewer 1', 8.0);
INSERT INTO public.fact_score VALUES (37, 9, 3, 4, 'Reviewer 2', 6.2);
INSERT INTO public.fact_score VALUES (37, 9, 3, 2, 'Reviewer 3', 5.1);
INSERT INTO public.fact_score VALUES (38, 10, 4, 6, 'Reviewer 1', 9.1);
INSERT INTO public.fact_score VALUES (38, 10, 4, 9, 'Reviewer 2', 8.6);
INSERT INTO public.fact_score VALUES (38, 10, 4, 2, 'Reviewer 3', 8.2);
INSERT INTO public.fact_score VALUES (39, 13, 2, 6, 'Reviewer 1', 6.4);
INSERT INTO public.fact_score VALUES (39, 13, 2, 1, 'Reviewer 2', 5.8);
INSERT INTO public.fact_score VALUES (39, 13, 2, 2, 'Reviewer 3', 8.3);
INSERT INTO public.fact_score VALUES (40, 16, 2, 4, 'Reviewer 1', 5.5);
INSERT INTO public.fact_score VALUES (40, 16, 2, 2, 'Reviewer 2', 5.1);
INSERT INTO public.fact_score VALUES (40, 16, 2, 3, 'Reviewer 3', 5.1);
INSERT INTO public.fact_score VALUES (41, 8, 2, 9, 'Reviewer 1', 7.2);
INSERT INTO public.fact_score VALUES (41, 8, 2, 4, 'Reviewer 2', 8.3);
INSERT INTO public.fact_score VALUES (41, 8, 2, 1, 'Reviewer 3', 7.2);
INSERT INTO public.fact_score VALUES (42, 11, 4, 2, 'Reviewer 1', 9.1);
INSERT INTO public.fact_score VALUES (42, 11, 4, 1, 'Reviewer 2', 6.3);
INSERT INTO public.fact_score VALUES (42, 11, 4, 5, 'Reviewer 3', 6.2);
INSERT INTO public.fact_score VALUES (1, 1, 1, 1, 'Reviewer 1', 4.6);
INSERT INTO public.fact_score VALUES (1, 1, 1, 2, 'Reviewer 2', 9.9);
INSERT INTO public.fact_score VALUES (1, 1, 1, 3, 'Reviewer 3', 9.5);
INSERT INTO public.fact_score VALUES (43, 5, 4, 9, 'Reviewer 1', 9.5);
INSERT INTO public.fact_score VALUES (43, 5, 4, 3, 'Reviewer 2', 5.9);
INSERT INTO public.fact_score VALUES (43, 5, 4, 8, 'Reviewer 3', 9.8);
INSERT INTO public.fact_score VALUES (44, 1, 1, 4, 'Reviewer 1', 8.5);
INSERT INTO public.fact_score VALUES (44, 1, 1, 6, 'Reviewer 2', 9.1);
INSERT INTO public.fact_score VALUES (44, 1, 1, 8, 'Reviewer 3', 5.6);
INSERT INTO public.fact_score VALUES (45, 5, 1, 6, 'Reviewer 1', 9.4);
INSERT INTO public.fact_score VALUES (45, 5, 1, 5, 'Reviewer 2', 6.1);
INSERT INTO public.fact_score VALUES (45, 5, 1, 8, 'Reviewer 3', 6.2);
INSERT INTO public.fact_score VALUES (46, 1, 4, 3, 'Reviewer 1', 5.1);
INSERT INTO public.fact_score VALUES (46, 1, 4, 1, 'Reviewer 2', 6.3);
INSERT INTO public.fact_score VALUES (46, 1, 4, 4, 'Reviewer 3', 6.9);
INSERT INTO public.fact_score VALUES (47, 12, 1, 8, 'Reviewer 1', 8.3);
INSERT INTO public.fact_score VALUES (47, 12, 1, 5, 'Reviewer 2', 8.0);
INSERT INTO public.fact_score VALUES (47, 12, 1, 6, 'Reviewer 3', 9.1);
INSERT INTO public.fact_score VALUES (48, 13, 2, 9, 'Reviewer 1', 6.7);
INSERT INTO public.fact_score VALUES (48, 13, 2, 3, 'Reviewer 2', 9.4);
INSERT INTO public.fact_score VALUES (48, 13, 2, 5, 'Reviewer 3', 8.8);
INSERT INTO public.fact_score VALUES (49, 16, 4, 5, 'Reviewer 1', 7.8);
INSERT INTO public.fact_score VALUES (49, 16, 4, 1, 'Reviewer 2', 7.4);
INSERT INTO public.fact_score VALUES (49, 16, 4, 6, 'Reviewer 3', 8.1);
INSERT INTO public.fact_score VALUES (50, 12, 3, 3, 'Reviewer 1', 6.0);
INSERT INTO public.fact_score VALUES (50, 12, 3, 5, 'Reviewer 2', 9.7);
INSERT INTO public.fact_score VALUES (50, 12, 3, 6, 'Reviewer 3', 7.9);
INSERT INTO public.fact_score VALUES (51, 17, 4, 3, 'Reviewer 1', 6.9);
INSERT INTO public.fact_score VALUES (51, 17, 4, 9, 'Reviewer 2', 5.1);
INSERT INTO public.fact_score VALUES (51, 17, 4, 2, 'Reviewer 3', 5.1);
INSERT INTO public.fact_score VALUES (52, 11, 2, 3, 'Reviewer 1', 9.1);
INSERT INTO public.fact_score VALUES (52, 11, 2, 4, 'Reviewer 2', 6.7);
INSERT INTO public.fact_score VALUES (52, 11, 2, 2, 'Reviewer 3', 7.9);
INSERT INTO public.fact_score VALUES (53, 6, 4, 2, 'Reviewer 1', 7.0);
INSERT INTO public.fact_score VALUES (53, 6, 4, 9, 'Reviewer 2', 9.6);
INSERT INTO public.fact_score VALUES (53, 6, 4, 3, 'Reviewer 3', 7.7);
INSERT INTO public.fact_score VALUES (54, 4, 4, 2, 'Reviewer 1', 9.9);
INSERT INTO public.fact_score VALUES (54, 4, 4, 5, 'Reviewer 2', 6.5);
INSERT INTO public.fact_score VALUES (54, 4, 4, 1, 'Reviewer 3', 6.7);
INSERT INTO public.fact_score VALUES (55, 13, 2, 8, 'Reviewer 1', 5.3);
INSERT INTO public.fact_score VALUES (55, 13, 2, 6, 'Reviewer 2', 7.6);
INSERT INTO public.fact_score VALUES (55, 13, 2, 5, 'Reviewer 3', 5.6);
INSERT INTO public.fact_score VALUES (56, 6, 4, 1, 'Reviewer 1', 7.9);
INSERT INTO public.fact_score VALUES (56, 6, 4, 5, 'Reviewer 2', 7.1);
INSERT INTO public.fact_score VALUES (56, 6, 4, 4, 'Reviewer 3', 5.9);
INSERT INTO public.fact_score VALUES (57, 14, 2, 9, 'Reviewer 1', 8.1);
INSERT INTO public.fact_score VALUES (57, 14, 2, 5, 'Reviewer 2', 9.7);
INSERT INTO public.fact_score VALUES (57, 14, 2, 1, 'Reviewer 3', 9.1);
INSERT INTO public.fact_score VALUES (58, 4, 4, 4, 'Reviewer 1', 7.7);
INSERT INTO public.fact_score VALUES (58, 4, 4, 2, 'Reviewer 2', 6.3);
INSERT INTO public.fact_score VALUES (58, 4, 4, 3, 'Reviewer 3', 7.9);
INSERT INTO public.fact_score VALUES (59, 15, 1, 8, 'Reviewer 1', 9.0);
INSERT INTO public.fact_score VALUES (59, 15, 1, 2, 'Reviewer 2', 9.7);
INSERT INTO public.fact_score VALUES (59, 15, 1, 9, 'Reviewer 3', 7.6);
INSERT INTO public.fact_score VALUES (60, 8, 4, 1, 'Reviewer 1', 8.6);
INSERT INTO public.fact_score VALUES (60, 8, 4, 5, 'Reviewer 2', 8.1);
INSERT INTO public.fact_score VALUES (60, 8, 4, 8, 'Reviewer 3', 6.9);
INSERT INTO public.fact_score VALUES (61, 4, 4, 9, 'Reviewer 1', 4.6);
INSERT INTO public.fact_score VALUES (61, 4, 4, 3, 'Reviewer 2', 4.7);
INSERT INTO public.fact_score VALUES (61, 4, 4, 4, 'Reviewer 3', 6.5);
INSERT INTO public.fact_score VALUES (62, 12, 4, 6, 'Reviewer 1', 9.3);
INSERT INTO public.fact_score VALUES (62, 12, 4, 4, 'Reviewer 2', 5.7);
INSERT INTO public.fact_score VALUES (62, 12, 4, 8, 'Reviewer 3', 8.5);
INSERT INTO public.fact_score VALUES (63, 12, 3, 3, 'Reviewer 1', 6.2);
INSERT INTO public.fact_score VALUES (63, 12, 3, 4, 'Reviewer 2', 5.8);
INSERT INTO public.fact_score VALUES (63, 12, 3, 1, 'Reviewer 3', 9.0);
INSERT INTO public.fact_score VALUES (64, 16, 2, 2, 'Reviewer 1', 6.8);
INSERT INTO public.fact_score VALUES (64, 16, 2, 3, 'Reviewer 2', 7.2);
INSERT INTO public.fact_score VALUES (64, 16, 2, 1, 'Reviewer 3', 7.7);
INSERT INTO public.fact_score VALUES (65, 7, 4, 9, 'Reviewer 1', 8.3);
INSERT INTO public.fact_score VALUES (65, 7, 4, 4, 'Reviewer 2', 5.4);
INSERT INTO public.fact_score VALUES (65, 7, 4, 6, 'Reviewer 3', 7.3);
INSERT INTO public.fact_score VALUES (66, 9, 2, 2, 'Reviewer 1', 5.4);
INSERT INTO public.fact_score VALUES (66, 9, 2, 9, 'Reviewer 2', 5.8);
INSERT INTO public.fact_score VALUES (66, 9, 2, 5, 'Reviewer 3', 5.1);
INSERT INTO public.fact_score VALUES (67, 7, 2, 3, 'Reviewer 1', 4.8);
INSERT INTO public.fact_score VALUES (67, 7, 2, 2, 'Reviewer 2', 6.3);
INSERT INTO public.fact_score VALUES (67, 7, 2, 8, 'Reviewer 3', 8.2);
INSERT INTO public.fact_score VALUES (68, 8, 4, 6, 'Reviewer 1', 7.1);
INSERT INTO public.fact_score VALUES (68, 8, 4, 2, 'Reviewer 2', 9.3);
INSERT INTO public.fact_score VALUES (68, 8, 4, 3, 'Reviewer 3', 6.6);
INSERT INTO public.fact_score VALUES (69, 13, 3, 5, 'Reviewer 1', 8.6);
INSERT INTO public.fact_score VALUES (69, 13, 3, 9, 'Reviewer 2', 6.9);
INSERT INTO public.fact_score VALUES (69, 13, 3, 6, 'Reviewer 3', 9.5);
INSERT INTO public.fact_score VALUES (70, 14, 2, 4, 'Reviewer 1', 8.2);
INSERT INTO public.fact_score VALUES (70, 14, 2, 6, 'Reviewer 2', 9.9);
INSERT INTO public.fact_score VALUES (70, 14, 2, 1, 'Reviewer 3', 5.4);
INSERT INTO public.fact_score VALUES (71, 7, 2, 2, 'Reviewer 1', 9.4);
INSERT INTO public.fact_score VALUES (71, 7, 2, 6, 'Reviewer 2', 5.9);
INSERT INTO public.fact_score VALUES (71, 7, 2, 8, 'Reviewer 3', 9.1);
INSERT INTO public.fact_score VALUES (72, 8, 1, 5, 'Reviewer 1', 6.1);
INSERT INTO public.fact_score VALUES (72, 8, 1, 3, 'Reviewer 2', 7.9);
INSERT INTO public.fact_score VALUES (72, 8, 1, 2, 'Reviewer 3', 7.9);
INSERT INTO public.fact_score VALUES (73, 1, 1, 9, 'Reviewer 1', 6.5);
INSERT INTO public.fact_score VALUES (73, 1, 1, 2, 'Reviewer 2', 7.7);
INSERT INTO public.fact_score VALUES (73, 1, 1, 5, 'Reviewer 3', 5.5);
INSERT INTO public.fact_score VALUES (74, 4, 1, 2, 'Reviewer 1', 7.0);
INSERT INTO public.fact_score VALUES (74, 4, 1, 3, 'Reviewer 2', 7.7);
INSERT INTO public.fact_score VALUES (74, 4, 1, 1, 'Reviewer 3', 5.8);
INSERT INTO public.fact_score VALUES (75, 7, 3, 3, 'Reviewer 1', 7.7);
INSERT INTO public.fact_score VALUES (75, 7, 3, 4, 'Reviewer 2', 7.2);
INSERT INTO public.fact_score VALUES (75, 7, 3, 1, 'Reviewer 3', 9.7);
INSERT INTO public.fact_score VALUES (76, 6, 3, 5, 'Reviewer 1', 6.1);
INSERT INTO public.fact_score VALUES (76, 6, 3, 3, 'Reviewer 2', 5.6);
INSERT INTO public.fact_score VALUES (76, 6, 3, 4, 'Reviewer 3', 7.1);
INSERT INTO public.fact_score VALUES (77, 8, 4, 6, 'Reviewer 1', 5.1);
INSERT INTO public.fact_score VALUES (77, 8, 4, 2, 'Reviewer 2', 5.7);
INSERT INTO public.fact_score VALUES (77, 8, 4, 9, 'Reviewer 3', 9.2);
INSERT INTO public.fact_score VALUES (78, 4, 2, 4, 'Reviewer 1', 6.5);
INSERT INTO public.fact_score VALUES (78, 4, 2, 9, 'Reviewer 2', 7.2);
INSERT INTO public.fact_score VALUES (78, 4, 2, 5, 'Reviewer 3', 7.7);
INSERT INTO public.fact_score VALUES (79, 1, 4, 8, 'Reviewer 1', 5.6);
INSERT INTO public.fact_score VALUES (79, 1, 4, 4, 'Reviewer 2', 8.1);
INSERT INTO public.fact_score VALUES (79, 1, 4, 9, 'Reviewer 3', 7.6);
INSERT INTO public.fact_score VALUES (80, 10, 4, 4, 'Reviewer 1', 6.6);
INSERT INTO public.fact_score VALUES (80, 10, 4, 3, 'Reviewer 2', 6.4);
INSERT INTO public.fact_score VALUES (80, 10, 4, 1, 'Reviewer 3', 7.0);
INSERT INTO public.fact_score VALUES (81, 12, 3, 8, 'Reviewer 1', 8.1);
INSERT INTO public.fact_score VALUES (81, 12, 3, 2, 'Reviewer 2', 5.3);
INSERT INTO public.fact_score VALUES (81, 12, 3, 1, 'Reviewer 3', 8.1);
INSERT INTO public.fact_score VALUES (82, 13, 1, 1, 'Reviewer 1', 6.6);
INSERT INTO public.fact_score VALUES (82, 13, 1, 6, 'Reviewer 2', 8.7);
INSERT INTO public.fact_score VALUES (82, 13, 1, 8, 'Reviewer 3', 6.1);
INSERT INTO public.fact_score VALUES (83, 5, 1, 4, 'Reviewer 1', 9.0);
INSERT INTO public.fact_score VALUES (83, 5, 1, 3, 'Reviewer 2', 6.5);
INSERT INTO public.fact_score VALUES (83, 5, 1, 2, 'Reviewer 3', 9.9);
INSERT INTO public.fact_score VALUES (84, 16, 1, 8, 'Reviewer 1', 4.9);
INSERT INTO public.fact_score VALUES (84, 16, 1, 6, 'Reviewer 2', 6.7);
INSERT INTO public.fact_score VALUES (84, 16, 1, 2, 'Reviewer 3', 7.5);
INSERT INTO public.fact_score VALUES (85, 17, 4, 5, 'Reviewer 1', 6.6);
INSERT INTO public.fact_score VALUES (85, 17, 4, 2, 'Reviewer 2', 9.7);
INSERT INTO public.fact_score VALUES (85, 17, 4, 1, 'Reviewer 3', 6.2);
INSERT INTO public.fact_score VALUES (86, 16, 4, 1, 'Reviewer 1', 8.9);
INSERT INTO public.fact_score VALUES (86, 16, 4, 8, 'Reviewer 2', 5.8);
INSERT INTO public.fact_score VALUES (86, 16, 4, 2, 'Reviewer 3', 9.4);
INSERT INTO public.fact_score VALUES (87, 8, 3, 1, 'Reviewer 1', 5.6);
INSERT INTO public.fact_score VALUES (87, 8, 3, 8, 'Reviewer 2', 8.9);
INSERT INTO public.fact_score VALUES (87, 8, 3, 3, 'Reviewer 3', 9.8);


--
-- TOC entry 2179 (class 0 OID 24676)
-- Dependencies: 196
-- Data for Name: fact_team; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Andrew Kane', 'Portugal', 1, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Sebastian Knapp', 'Portugal', 1, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Christine Joyce', 'Netherlands', 1, 1, 1, 3);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Brandon Vance', 'Portugal', 1, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Maia Mccoy', 'Portugal', 1, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Cecilia Hutchinson', 'India', 12, 11, 3, 18);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Arron Simpson', 'Switzerland', 69, 13, 3, 19);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Ridwan Torres', 'South Africa', 77, 8, 4, 20);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Abdulrahman Blanchard', 'Sweden', 45, 5, 1, 21);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Priya Cannon', 'Australia', 63, 12, 3, 22);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Bailey David', 'Canada', 16, 4, 1, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Clementine Golden', 'India', 52, 11, 2, 18);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Jennie Newton', 'Spain', 32, 14, 2, 24);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Cecilia Hutchinson', 'India', 52, 11, 2, 18);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Omari Winters', 'Italy', 27, 15, 3, 25);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Martina Bloggs', 'Ghana', 62, 12, 4, 26);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Effie Fitzpatrick', 'Portugal', 44, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Alice Conner', 'Netherlands', 34, 9, 2, 3);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Sebastien Singleton', 'Italy', 71, 7, 2, 25);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Amina Edwards', 'Sweden', 69, 13, 3, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Wayne Palmer', 'China', 4, 6, 3, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Olivia Moreno', 'Italy', 11, 7, 1, 25);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Herbie Lin', 'Spain', 8, 9, 4, 24);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Nicolas Rice', 'India', 28, 11, 3, 18);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Brandon Vance', 'Ghana', 81, 12, 3, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Janice Mcgowan', 'Australia', 49, 16, 4, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Eugene Brock', 'Sweden', 43, 5, 4, 21);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Bailey David', 'Canada', 58, 4, 4, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Lochlan Mack', 'Sweden', 45, 5, 1, 21);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Alice Conner', 'Netherlands', 59, 15, 1, 3);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Marshall Lester', 'Italy', 31, 7, 4, 25);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Tilly Yoder', 'Australia', 49, 16, 4, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Honey Campos', 'France', 80, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Gregory Leach', 'France', 9, 10, 2, 28);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Ayah Escobar', 'France', 80, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Stuart Farrell', 'Australia', 76, 6, 3, 22);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Mollie Campbell', 'Sweden', 32, 14, 2, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Olivia Moreno', 'France', 9, 10, 2, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Kabir Charles', 'France', 25, 10, 1, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Maariyah Harding', 'China', 4, 6, 3, 27);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Janice Mcgowan', 'Netherlands', 27, 15, 3, 3);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Pedro Parsons', 'Germany', 34, 9, 2, 29);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Maariyah Harding', 'Australia', 14, 8, 3, 22);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Emilio Garza', 'Canada', 7, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Ayah Escobar', 'France', 33, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Silas Stein', 'China', 53, 6, 4, 27);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Zoe Sweeney', 'South Africa', 14, 8, 3, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Mariyah Humphrey', 'Ghana', 15, 12, 1, 26);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Maximillian Walker', 'South Africa', 6, 8, 3, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Abraham Beasley', 'Portugal', 73, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Eugene Brock', 'Switzerland', 69, 13, 3, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Zakir Strong', 'South Africa', 14, 8, 3, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Honey Campos', 'France', 38, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Honey Campos', 'Canada', 78, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Kieran Crane', 'China', 4, 6, 3, 27);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Bailey David', 'Canada', 78, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Mike Matthews', 'Canada', 16, 4, 1, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Kabir Charles', 'Canada', 2, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Howard Koch', 'South Africa', 87, 8, 3, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Amanda Bush', 'South Africa', 87, 8, 3, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Rex Harmon', 'Italy', 31, 7, 4, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Daniyal Gonzales', 'France', 38, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Asa Chen', 'Canada', 57, 14, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Wiktor Church', 'India', 52, 11, 2, 18);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Maia Mccoy', 'Ghana', 15, 12, 1, 26);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Kieran Crane', 'France', 33, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Kara Trujillo', 'China', 29, 6, 1, 27);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Bailey David', 'Canada', 61, 4, 4, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Aysha Whitaker', 'South Africa', 87, 8, 3, 20);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Jennie Newton', 'Canada', 40, 16, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Wiktor Church', 'Australia', 49, 16, 4, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Jennie Newton', 'France', 33, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Clementine Golden', 'South Africa', 72, 8, 1, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Honey Campos', 'Italy', 31, 7, 4, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tabitha Lamb', 'South Africa', 68, 8, 4, 20);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Susie Watkins', 'Switzerland', 69, 13, 3, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Blaine Hansen', 'Sweden', 45, 5, 1, 21);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Alfie Higgins', 'China', 51, 17, 4, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Jakob Elliott', 'South Africa', 72, 8, 1, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Howard Koch', 'Germany', 8, 9, 4, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Ayah Escobar', 'Canada', 58, 4, 4, 23);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Abel Contreras', 'South Africa', 54, 4, 4, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Dawson Warren', 'Australia', 49, 16, 4, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Alys Wright', 'South Africa', 14, 8, 3, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Harri Carlson', 'Portugal', 46, 1, 4, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Agnes Lambert', 'Canada', 74, 4, 1, 23);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Susie Watkins', 'Switzerland', 82, 13, 1, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Maisy Dejesus', 'Switzerland', 69, 13, 3, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Bailey David', 'China', 56, 6, 4, 27);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Brandon Vance', 'Ghana', 50, 12, 3, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tabitha Lamb', 'South Africa', 87, 8, 3, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Imran Rubio', 'Sweden', 3, 5, 1, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Honey Campos', 'China', 76, 6, 3, 27);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Herbie Lin', 'Spain', 43, 5, 4, 24);
INSERT INTO public.fact_team VALUES ('Co-Investigator', NULL, NULL, 6, 8, 3, 30);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Cian Santana', 'France', 38, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Gregory Leach', 'China', 53, 6, 4, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Jakob Elliott', 'Ghana', 47, 12, 1, 26);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Asa Chen', 'Canada', 54, 4, 4, 23);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Zaki Harrington', 'China', 56, 6, 4, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Fatimah Cruz', 'Ghana', 63, 12, 3, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tabitha Lamb', 'China', 53, 6, 4, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Fatimah Cruz', 'South Africa', 87, 8, 3, 20);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Tilly Yoder', 'Australia', 84, 16, 1, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Ben Stone', 'Canada', 54, 4, 4, 23);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Harri Carlson', 'Portugal', 77, 8, 4, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Imran Rubio', 'Canada', 58, 4, 4, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Marshall Lester', 'Germany', 8, 9, 4, 29);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Keane Randall', 'Ghana', 20, 11, 4, 26);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Mollie Campbell', 'Sweden', 36, 11, 4, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Alice Conner', 'Sweden', 45, 5, 1, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Imran Rubio', 'Canada', 16, 4, 1, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Blaine Hansen', 'France', 38, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Silas Stein', 'South Africa', 10, 8, 1, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Maisy Dejesus', 'China', 4, 6, 3, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Keane Randall', 'Netherlands', 22, 15, 2, 3);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Andrew Kane', 'Portugal', 1, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Marshall Lester', 'Canada', 7, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Ellen Abbott', 'Canada', 78, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Wiktor Church', 'Italy', 67, 7, 2, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Daniyal Gonzales', 'China', 76, 6, 3, 27);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Blaine Hansen', 'Sweden', 83, 5, 1, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Jakob Elliott', 'South Africa', 68, 8, 4, 20);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Stuart Farrell', 'Australia', 29, 6, 1, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Harvey Richards', 'Germany', 34, 9, 2, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Abraham Beasley', 'Netherlands', 59, 15, 1, 3);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Adelaide Villarreal', 'Canada', 7, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Daniyal Gonzales', 'Portugal', 44, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Bertha Lopez', 'Germany', 8, 9, 4, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Priya Cannon', 'Ghana', 47, 12, 1, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Marshall Lester', 'France', 80, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tasneem Blake', 'Australia', 64, 16, 2, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Isra Rhodes', 'China', 17, 6, 2, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Abel Contreras', 'Italy', 31, 7, 4, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Elaine Jimenez', 'Ghana', 15, 12, 1, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Keane Randall', 'Italy', 31, 7, 4, 25);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Priya Cannon', 'Australia', 74, 4, 1, 22);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Zaki Harrington', 'China', 53, 6, 4, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Amina Edwards', 'Italy', 5, 7, 4, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Nicolas Rice', 'Italy', 71, 7, 2, 25);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Kylie Logan', 'Germany', 21, 14, 2, 29);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Bailey David', 'Canada', 15, 12, 1, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tommy Murray', 'Ghana', 81, 12, 3, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Amanda Bush', 'Italy', 65, 7, 4, 25);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Eddie O''Connor', 'Australia', 42, 11, 4, 22);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Eddie O''Connor', 'Australia', 66, 9, 2, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Mikey Saunders', 'Sweden', 83, 5, 1, 21);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Clementine Golden', 'Switzerland', 39, 13, 2, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Olivia Moreno', 'United Kingdom', 85, 17, 4, 31);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Effie Fitzpatrick', 'Italy', 75, 7, 3, 25);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Dawid Fleming', 'Italy', 31, 7, 4, 25);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Gwen Stuart', 'Italy', 10, 8, 1, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Zoe Sweeney', 'India', 28, 11, 3, 18);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Susie Watkins', 'Switzerland', 55, 13, 2, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Maisy Dejesus', 'Italy', 65, 7, 4, 25);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Kara Trujillo', 'China', 16, 4, 1, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Cian Santana', 'Sweden', 23, 5, 4, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Omari Winters', 'Ghana', 63, 12, 3, 26);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Connie Gallagher', 'Sweden', 5, 7, 4, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Maisy Dejesus', 'Canada', 58, 4, 4, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tommy Murray', 'Netherlands', 59, 15, 1, 3);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Kylie Logan', 'Switzerland', 69, 13, 3, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Sebastien Singleton', 'France', 33, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Connie Gallagher', 'Ghana', 47, 12, 1, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Agnes Lambert', 'Switzerland', 69, 13, 3, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Wiktor Church', 'South Africa', 72, 8, 1, 20);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Aysha Whitaker', 'South Africa', 87, 8, 3, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Imran Rubio', 'Portugal', 44, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Aysha Whitaker', 'South Africa', 68, 8, 4, 20);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Eugene Brock', 'Germany', 66, 9, 2, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', NULL, NULL, 27, 15, 3, 32);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Eugene Brock', 'Germany', 37, 9, 3, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', NULL, NULL, 66, 9, 2, 33);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Bailey David', 'Canada', 39, 13, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Mikey Saunders', 'South Africa', 14, 8, 3, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Naomi Keith', 'Germany', 8, 9, 4, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Martina Bloggs', 'France', 33, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Harvey Richards', 'China', 26, 1, 3, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Olivia Moreno', 'South Africa', 41, 8, 2, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Emilio Garza', 'China', 53, 6, 4, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Elaine Jimenez', 'Australia', 40, 16, 2, 22);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Tasneem Blake', 'Germany', 72, 8, 1, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tabitha Lamb', 'Netherlands', 59, 15, 1, 3);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Abdulrahman Blanchard', 'Sweden', 18, 13, 2, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Omari Winters', 'Spain', 57, 14, 2, 24);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Adelaide Villarreal', 'South Africa', 73, 1, 1, 20);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Nicolas Rice', 'Italy', 65, 7, 4, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Susie Watkins', 'Spain', 70, 14, 2, 24);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Mikey Saunders', 'Australia', 86, 16, 4, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', NULL, NULL, 24, 8, 4, 34);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Agnes Lambert', 'Canada', 61, 4, 4, 23);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Maximillian Walker', 'South Africa', 10, 8, 1, 20);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Kabir Charles', 'China', 4, 6, 3, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Alec Dotson', 'China', 29, 6, 1, 27);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Marshall Lester', 'France', 25, 10, 1, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tamsin Pugh', 'Sweden', 23, 5, 4, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Wayne Palmer', 'Spain', 70, 14, 2, 24);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Zaki Harrington', 'China', 48, 13, 2, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Eddie O''Connor', 'India', 42, 11, 4, 18);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Maximillian Walker', 'Switzerland', 82, 13, 1, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Kylie Logan', 'Canada', 7, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Abel Contreras', 'Australia', 49, 16, 4, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Asa Chen', 'Netherlands', 22, 15, 2, 3);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Alys Wright', 'Canada', 2, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Alice Conner', 'China', 17, 6, 2, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Marshall Lester', 'Italy', 65, 7, 4, 25);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Priya Cannon', 'Australia', 80, 10, 4, 22);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Kieran Crane', 'France', 23, 5, 4, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Effie Fitzpatrick', 'Italy', 11, 7, 1, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Barbara Baird', 'South Africa', 72, 8, 1, 20);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Tasneem Blake', 'Germany', 41, 8, 2, 29);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Harvey Richards', 'China', 9, 10, 2, 27);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Alec Dotson', 'France', 38, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Duncan Holder', 'South Africa', 14, 8, 3, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Laurence Reid', 'Canada', 74, 4, 1, 23);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Mariyah Humphrey', 'France', 28, 11, 3, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Brandon Vance', 'Portugal', 44, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Ben Stone', 'India', 52, 11, 2, 18);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Gregory Leach', 'South Africa', 10, 8, 1, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Abel Contreras', 'France', 35, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Seth Curtis', 'United Kingdom', 51, 17, 4, 31);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Zoe Sweeney', 'Ghana', 81, 12, 3, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Kieran Crane', 'India', 42, 11, 4, 18);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Daniyal Gonzales', 'Canada', 74, 4, 1, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Effie Fitzpatrick', 'South Africa', 77, 8, 4, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Cecilia Hutchinson', 'Switzerland', 55, 13, 2, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Ashwin Barker', 'Italy', 75, 7, 3, 25);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Silas Stein', 'Spain', 32, 14, 2, 24);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Herbie Lin', 'South Africa', 68, 8, 4, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Herbie Lin', 'France', 38, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Ida Mullins', 'Portugal', 2, 4, 2, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Ashwin Barker', 'Portugal', 13, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Hasan Phillips', 'Netherlands', 46, 1, 4, 3);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Gwen Stuart', 'Portugal', 73, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Fatimah Cruz', 'Ghana', 15, 12, 1, 26);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Mike Matthews', 'Canada', 84, 16, 1, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Ridwan Torres', 'Australia', 64, 16, 2, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Ben Stone', 'Sweden', 23, 5, 4, 21);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Eddie O''Connor', 'Australia', 47, 12, 1, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Kylie Logan', 'Italy', 11, 7, 1, 25);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Andrew Kane', 'Portugal', 59, 15, 1, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Ayah Escobar', 'South Africa', 14, 8, 3, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Dawid Fleming', 'Canada', 78, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Clementine Golden', 'Switzerland', 35, 10, 4, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Honey Campos', 'United Kingdom', 85, 17, 4, 31);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Eugene Brock', 'Sweden', 23, 5, 4, 21);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Janice Mcgowan', 'Netherlands', 86, 16, 4, 3);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Connie Gallagher', 'Sweden', 43, 5, 4, 21);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Ben Stone', 'India', 36, 11, 4, 18);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Fatimah Cruz', 'India', 52, 11, 2, 18);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Harri Carlson', 'United Kingdom', 85, 17, 4, 31);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Gwen Stuart', 'Italy', 11, 7, 1, 25);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Janice Mcgowan', 'Netherlands', 13, 1, 1, 3);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Silas Stein', 'Spain', 7, 4, 2, 24);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Stuart Farrell', 'Switzerland', 18, 13, 2, 19);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Seth Curtis', 'Australia', 40, 16, 2, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Agnes Lambert', 'Ghana', 81, 12, 3, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Sebastien Singleton', 'Canada', 78, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Alfie Higgins', 'China', 76, 6, 3, 27);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Silas Stein', 'Spain', 57, 14, 2, 24);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Duncan Holder', 'India', 28, 11, 3, 18);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Jakob Elliott', 'Spain', 68, 8, 4, 24);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Bertha Lopez', 'Australia', 64, 16, 2, 22);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Pedro Parsons', 'Australia', 86, 16, 4, 22);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Cian Santana', 'Portugal', 70, 14, 2, 2);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Brandon Vance', 'Ghana', 15, 12, 1, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Mikey Saunders', 'Sweden', 43, 5, 4, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Silas Stein', 'India', 42, 11, 4, 18);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Asa Chen', 'Canada', 79, 1, 4, 23);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Bailey David', 'Canada', 53, 6, 4, 23);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Mike Matthews', 'Canada', 75, 7, 3, 23);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Bailey David', 'Canada', 74, 4, 1, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', NULL, NULL, 36, 11, 4, 35);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Sebastien Singleton', 'China', 53, 6, 4, 27);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Jakob Elliott', 'Spain', 70, 14, 2, 24);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Maisy Dejesus', 'India', 20, 11, 4, 18);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Tilly Yoder', 'Australia', 4, 6, 3, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Bailey David', 'Canada', 2, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Laurence Reid', 'Sweden', 43, 5, 4, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Jennie Newton', 'Canada', 16, 4, 1, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Lochlan Mack', 'South Africa', 19, 8, 1, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Olivia Moreno', 'Ghana', 15, 12, 1, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Wayne Palmer', 'Ghana', 81, 12, 3, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Mollie Campbell', 'Ghana', 62, 12, 4, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Nana Shepard', 'Italy', 11, 7, 1, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Olivia Moreno', 'Switzerland', 48, 13, 2, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Agnes Lambert', 'Netherlands', 59, 15, 1, 3);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Asa Chen', 'Sweden', 3, 5, 1, 21);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Ben Stone', 'India', 49, 16, 4, 18);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Naomi Keith', 'Germany', 8, 9, 4, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Agnes Lambert', 'South Africa', 10, 8, 1, 20);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Keane Randall', 'Ghana', 3, 5, 1, 26);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Alys Wright', 'Canada', 30, 4, 3, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Lochlan Mack', 'Switzerland', 82, 13, 1, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Nicolas Rice', 'Sweden', 43, 5, 4, 21);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Wiktor Church', 'Portugal', 73, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Ashwin Barker', 'Portugal', 38, 10, 4, 2);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Abel Contreras', 'South Africa', 19, 8, 1, 20);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Nana Shepard', 'Italy', 67, 7, 2, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Alys Wright', 'South Africa', 68, 8, 4, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Asa Chen', 'Spain', 32, 14, 2, 24);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Vinny Powers', 'Portugal', 30, 4, 3, 2);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Andrew Kane', 'Portugal', 13, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Harri Carlson', 'Italy', 11, 7, 1, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Adelaide Villarreal', 'Australia', 64, 16, 2, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tommy Murray', 'Spain', 70, 14, 2, 24);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Ellen Abbott', 'Spain', 32, 14, 2, 24);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Nicolas Rice', 'South Africa', 87, 8, 3, 20);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Isra Rhodes', 'Spain', 21, 14, 2, 24);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Adelaide Villarreal', 'South Africa', 41, 8, 2, 20);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Wiktor Church', 'Portugal', 6, 8, 3, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Marshall Lester', 'Sweden', 45, 5, 1, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Alys Wright', 'Switzerland', 48, 13, 2, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Bertha Lopez', 'India', 28, 11, 3, 18);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Elaine Jimenez', 'Portugal', 73, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Amanda Bush', 'France', 9, 10, 2, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Jakob Elliott', 'France', 38, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Olivia Moreno', 'Germany', 71, 7, 2, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Silas Stein', 'Canada', 2, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Gwen Stuart', 'Australia', 86, 16, 4, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Priya Cannon', 'Sweden', 23, 5, 4, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Jakob Elliott', 'Ghana', 63, 12, 3, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Zakir Strong', 'Italy', 71, 7, 2, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tilly Yoder', 'Italy', 75, 7, 3, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Cian Santana', 'Australia', 84, 16, 1, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Nana Shepard', 'Sweden', 45, 5, 1, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tasneem Blake', 'Portugal', 26, 1, 3, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Martina Bloggs', 'France', 25, 10, 1, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Aysha Whitaker', 'Germany', 34, 9, 2, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Wiktor Church', 'China', 53, 6, 4, 27);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Laurence Reid', 'Italy', 11, 7, 1, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Elaine Jimenez', 'China', 76, 6, 3, 27);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Stuart Farrell', 'Australia', 78, 4, 2, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Howard Koch', 'Canada', 2, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Agnes Lambert', 'Netherlands', 19, 8, 1, 3);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Eugene Brock', 'Ghana', 81, 12, 3, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Susie Watkins', 'Australia', 64, 16, 2, 22);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Abel Contreras', 'South Africa', 72, 8, 1, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Jennie Newton', 'Portugal', 73, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Omari Winters', 'Portugal', 73, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Harri Carlson', 'Sweden', 45, 5, 1, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Clementine Golden', 'France', 80, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Maia Mccoy', 'Sweden', 3, 5, 1, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Isra Rhodes', 'South Africa', 41, 8, 2, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', NULL, NULL, 21, 14, 2, 36);
INSERT INTO public.fact_team VALUES ('Co-Investigator', NULL, NULL, 50, 12, 3, 37);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Andrew Kane', 'China', 53, 6, 4, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tilly Yoder', 'China', 29, 6, 1, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Christine Joyce', 'Italy', 11, 7, 1, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Seth Curtis', 'Sweden', 3, 5, 1, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Bertha Lopez', 'South Africa', 41, 8, 2, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Dawson Warren', 'Germany', 34, 9, 2, 29);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Ashwin Barker', 'Portugal', 44, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Mollie Campbell', 'Sweden', 23, 5, 4, 21);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Kabir Charles', 'China', 17, 6, 2, 27);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Sebastian Knapp', 'Portugal', 1, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Wiktor Church', 'Portugal', 56, 6, 4, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Bailey David', 'Spain', 70, 14, 2, 24);
INSERT INTO public.fact_team VALUES ('Co-Investigator', NULL, NULL, 60, 8, 4, 38);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Kabir Charles', 'South Africa', 68, 8, 4, 20);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Maisy Dejesus', 'India', 42, 11, 4, 18);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Zakir Strong', 'Ghana', 15, 12, 1, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Emilio Garza', 'South Africa', 10, 8, 1, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Sebastien Singleton', 'France', 80, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Kylie Logan', 'Germany', 82, 13, 1, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Jakob Elliott', 'Australia', 86, 16, 4, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Amina Edwards', 'Portugal', 79, 1, 4, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Effie Fitzpatrick', 'Ghana', 15, 12, 1, 26);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Cecilia Hutchinson', 'South Africa', 58, 4, 4, 20);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Christine Joyce', 'Netherlands', 1, 1, 1, 3);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Effie Fitzpatrick', 'India', 42, 11, 4, 18);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Bruce Bullock', 'United Kingdom', 87, 8, 3, 31);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Alys Wright', 'Switzerland', 82, 13, 1, 19);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Duncan Holder', 'Italy', 5, 7, 4, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Olivia Moreno', 'Canada', 74, 4, 1, 23);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Herbert Padilla', 'Germany', 34, 9, 2, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Abraham Beasley', 'Portugal', 26, 1, 3, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Christine Joyce', 'South Africa', 14, 8, 3, 20);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Abraham Beasley', 'South Africa', 60, 8, 4, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Kylie Logan', 'India', 20, 11, 4, 18);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Tommy Murray', 'Switzerland', 50, 12, 3, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Abel Contreras', 'Sweden', 3, 5, 1, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Amanda Bush', 'Australia', 64, 16, 2, 22);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Cian Santana', 'Portugal', 45, 5, 1, 2);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Pedro Parsons', 'Australia', 60, 8, 4, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Adelaide Villarreal', 'Portugal', 79, 1, 4, 2);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Keane Randall', 'Ghana', 47, 12, 1, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Alice Conner', 'South Africa', 41, 8, 2, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Jennie Newton', 'South Africa', 77, 8, 4, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Howard Koch', 'Italy', 75, 7, 3, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Isra Rhodes', 'Germany', 34, 9, 2, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Arron Simpson', 'France', 9, 10, 2, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Keane Randall', 'Switzerland', 82, 13, 1, 19);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Abdulrahman Blanchard', 'Sweden', 55, 13, 2, 21);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Mikey Saunders', 'United Kingdom', 51, 17, 4, 31);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Amanda Bush', 'Canada', 16, 4, 1, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Agnes Lambert', 'Italy', 31, 7, 4, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Nicolas Rice', 'Canada', 58, 4, 4, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Alice Conner', 'Canada', 54, 4, 4, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Howard Koch', 'China', 29, 6, 1, 27);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Gregory Leach', 'Germany', 81, 12, 3, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tamsin Pugh', 'China', 4, 6, 3, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tilly Yoder', 'Canada', 7, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Fatimah Cruz', 'France', 38, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Sebastien Singleton', 'Canada', 30, 4, 3, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Ridwan Torres', 'Canada', 74, 4, 1, 23);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Keane Randall', 'Ghana', 63, 12, 3, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Kieran Crane', 'Australia', 40, 16, 2, 22);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Nana Shepard', 'Italy', 75, 7, 3, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tamsin Pugh', 'Portugal', 46, 1, 4, 2);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Zakir Strong', 'Switzerland', 18, 13, 2, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Dawid Fleming', 'United Kingdom', 85, 17, 4, 31);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Herbert Padilla', 'Switzerland', 55, 13, 2, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Imran Rubio', 'Canada', 2, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Vinny Powers', 'Ghana', 81, 12, 3, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Stuart Farrell', 'Canada', 7, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Pedro Parsons', 'Australia', 52, 11, 2, 22);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Sebastian Knapp', 'Portugal', 46, 1, 4, 2);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Priya Cannon', 'Australia', 37, 9, 3, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Maximillian Walker', 'Switzerland', 69, 13, 3, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Connie Gallagher', 'Portugal', 44, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Martina Bloggs', 'China', 76, 6, 3, 27);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Laurence Reid', 'Italy', 25, 10, 1, 25);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Janice Mcgowan', 'Netherlands', 22, 15, 2, 3);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Harri Carlson', 'Switzerland', 18, 13, 2, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Honey Campos', 'India', 28, 11, 3, 18);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Maisy Dejesus', 'India', 28, 11, 3, 18);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Arron Simpson', 'Spain', 24, 8, 4, 24);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Abdulrahman Blanchard', 'Sweden', 12, 11, 3, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tabitha Lamb', 'Germany', 37, 9, 3, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Aysha Whitaker', 'Portugal', 73, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Mike Matthews', 'Germany', 8, 9, 4, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Abel Contreras', 'India', 28, 11, 3, 18);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Maia Mccoy', 'Sweden', 67, 7, 2, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Eddie O''Connor', 'Netherlands', 22, 15, 2, 3);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Sebastien Singleton', 'Spain', 61, 4, 4, 24);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Jakob Elliott', 'Portugal', 26, 1, 3, 2);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Harri Carlson', 'Portugal', 62, 12, 4, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Ellen Abbott', 'China', 17, 6, 2, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Clementine Golden', 'Sweden', 45, 5, 1, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tamsin Pugh', 'Canada', 16, 4, 1, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Maariyah Harding', 'China', 17, 6, 2, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Keane Randall', 'Germany', 34, 9, 2, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Wayne Palmer', 'Netherlands', 22, 15, 2, 3);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Janice Mcgowan', 'Switzerland', 55, 13, 2, 19);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Nicolas Rice', 'Italy', 71, 7, 2, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tabitha Lamb', 'France', 35, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Fatimah Cruz', 'United Kingdom', 85, 17, 4, 31);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Amanda Bush', 'China', 76, 6, 3, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tilly Yoder', 'France', 80, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Zakir Strong', 'Ghana', 63, 12, 3, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Bailey David', 'China', 29, 6, 1, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Bruce Bullock', 'Spain', 70, 14, 2, 24);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Kabir Charles', 'Portugal', 73, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Gwen Stuart', 'Italy', 22, 15, 2, 25);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Priya Cannon', 'Australia', 65, 7, 4, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Sebastien Singleton', 'India', 42, 11, 4, 18);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Brandon Vance', 'Portugal', 1, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Willie Harvey', 'Canada', 16, 4, 1, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Stuart Farrell', 'Switzerland', 55, 13, 2, 19);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Maariyah Harding', 'Australia', 85, 17, 4, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tilly Yoder', 'Ghana', 47, 12, 1, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Stuart Farrell', 'Australia', 84, 16, 1, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Effie Fitzpatrick', 'Netherlands', 22, 15, 2, 3);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Clementine Golden', 'South Africa', 19, 8, 1, 20);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Sebastian Knapp', 'Portugal', 26, 1, 3, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Bruce Bullock', 'Canada', 54, 4, 4, 23);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Maia Mccoy', 'Sweden', 17, 6, 2, 21);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Rex Harmon', 'France', 9, 10, 2, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Maximillian Walker', 'India', 42, 11, 4, 18);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Maisy Dejesus', 'India', 12, 11, 3, 18);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Ida Mullins', 'Portugal', 79, 1, 4, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Pedro Parsons', 'Canada', 16, 4, 1, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Martina Bloggs', 'France', 80, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Eddie O''Connor', 'Australia', 64, 16, 2, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Ayah Escobar', 'Canada', 7, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Duncan Holder', 'Canada', 2, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Daniyal Gonzales', 'Australia', 49, 16, 4, 22);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Susie Watkins', 'Switzerland', 48, 13, 2, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Dawson Warren', 'Spain', 32, 14, 2, 24);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Hasan Phillips', 'Italy', 71, 7, 2, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Ida Mullins', 'France', 33, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Zaki Harrington', 'Sweden', 23, 5, 4, 21);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Ridwan Torres', 'South Africa', 24, 8, 4, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Alice Conner', 'Ghana', 47, 12, 1, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Susie Watkins', 'Switzerland', 18, 13, 2, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Seth Curtis', 'Sweden', 43, 5, 4, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Kara Trujillo', 'Canada', 30, 4, 3, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Priya Cannon', 'Switzerland', 55, 13, 2, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Herbert Padilla', 'Switzerland', 39, 13, 2, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Arron Simpson', 'Germany', 8, 9, 4, 29);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Cian Santana', 'Portugal', 83, 5, 1, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Maia Mccoy', 'Portugal', 1, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Marshall Lester', 'France', 31, 7, 4, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Rex Harmon', 'India', 28, 11, 3, 18);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Maisy Dejesus', 'Sweden', 3, 5, 1, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Connie Gallagher', 'Switzerland', 18, 13, 2, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tommy Murray', 'Canada', 61, 4, 4, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Kara Trujillo', 'Ghana', 63, 12, 3, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Abraham Beasley', 'Germany', 8, 9, 4, 29);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Alec Dotson', 'France', 35, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Alec Dotson', 'France', 64, 16, 2, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Cecilia Hutchinson', 'India', 12, 11, 3, 18);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Arron Simpson', 'Switzerland', 69, 13, 3, 19);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Ridwan Torres', 'South Africa', 77, 8, 4, 20);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Abdulrahman Blanchard', 'Sweden', 45, 5, 1, 21);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Priya Cannon', 'Australia', 63, 12, 3, 22);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Bailey David', 'Canada', 16, 4, 1, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Clementine Golden', 'India', 52, 11, 2, 18);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Jennie Newton', 'Spain', 32, 14, 2, 24);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Cecilia Hutchinson', 'India', 52, 11, 2, 18);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Omari Winters', 'Italy', 27, 15, 3, 25);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Martina Bloggs', 'Ghana', 62, 12, 4, 26);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Effie Fitzpatrick', 'Portugal', 44, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Alice Conner', 'Netherlands', 34, 9, 2, 3);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Sebastien Singleton', 'Italy', 71, 7, 2, 25);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Amina Edwards', 'Sweden', 69, 13, 3, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Wayne Palmer', 'China', 4, 6, 3, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Olivia Moreno', 'Italy', 11, 7, 1, 25);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Herbie Lin', 'Spain', 8, 9, 4, 24);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Nicolas Rice', 'India', 28, 11, 3, 18);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Brandon Vance', 'Ghana', 81, 12, 3, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Janice Mcgowan', 'Australia', 49, 16, 4, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Eugene Brock', 'Sweden', 43, 5, 4, 21);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Bailey David', 'Canada', 58, 4, 4, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Lochlan Mack', 'Sweden', 45, 5, 1, 21);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Alice Conner', 'Netherlands', 59, 15, 1, 3);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Marshall Lester', 'Italy', 31, 7, 4, 25);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Tilly Yoder', 'Australia', 49, 16, 4, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Honey Campos', 'France', 80, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Gregory Leach', 'France', 9, 10, 2, 28);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Ayah Escobar', 'France', 80, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Stuart Farrell', 'Australia', 76, 6, 3, 22);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Mollie Campbell', 'Sweden', 32, 14, 2, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Olivia Moreno', 'France', 9, 10, 2, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Kabir Charles', 'France', 25, 10, 1, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Maariyah Harding', 'China', 4, 6, 3, 27);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Janice Mcgowan', 'Netherlands', 27, 15, 3, 3);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Pedro Parsons', 'Germany', 34, 9, 2, 29);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Maariyah Harding', 'Australia', 14, 8, 3, 22);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Emilio Garza', 'Canada', 7, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Ayah Escobar', 'France', 33, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Silas Stein', 'China', 53, 6, 4, 27);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Zoe Sweeney', 'South Africa', 14, 8, 3, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Mariyah Humphrey', 'Ghana', 15, 12, 1, 26);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Maximillian Walker', 'South Africa', 6, 8, 3, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Abraham Beasley', 'Portugal', 73, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Eugene Brock', 'Switzerland', 69, 13, 3, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Zakir Strong', 'South Africa', 14, 8, 3, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Honey Campos', 'France', 38, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Honey Campos', 'Canada', 78, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Kieran Crane', 'China', 4, 6, 3, 27);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Bailey David', 'Canada', 78, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Mike Matthews', 'Canada', 16, 4, 1, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Kabir Charles', 'Canada', 2, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Howard Koch', 'South Africa', 87, 8, 3, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Amanda Bush', 'South Africa', 87, 8, 3, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Rex Harmon', 'Italy', 31, 7, 4, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Daniyal Gonzales', 'France', 38, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Asa Chen', 'Canada', 57, 14, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Wiktor Church', 'India', 52, 11, 2, 18);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Maia Mccoy', 'Ghana', 15, 12, 1, 26);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Kieran Crane', 'France', 33, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Kara Trujillo', 'China', 29, 6, 1, 27);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Bailey David', 'Canada', 61, 4, 4, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Aysha Whitaker', 'South Africa', 87, 8, 3, 20);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Jennie Newton', 'Canada', 40, 16, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Wiktor Church', 'Australia', 49, 16, 4, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Jennie Newton', 'France', 33, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Clementine Golden', 'South Africa', 72, 8, 1, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Honey Campos', 'Italy', 31, 7, 4, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tabitha Lamb', 'South Africa', 68, 8, 4, 20);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Susie Watkins', 'Switzerland', 69, 13, 3, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Blaine Hansen', 'Sweden', 45, 5, 1, 21);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Alfie Higgins', 'China', 51, 17, 4, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Jakob Elliott', 'South Africa', 72, 8, 1, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Howard Koch', 'Germany', 8, 9, 4, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Ayah Escobar', 'Canada', 58, 4, 4, 23);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Abel Contreras', 'South Africa', 54, 4, 4, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Dawson Warren', 'Australia', 49, 16, 4, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Alys Wright', 'South Africa', 14, 8, 3, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Harri Carlson', 'Portugal', 46, 1, 4, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Agnes Lambert', 'Canada', 74, 4, 1, 23);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Susie Watkins', 'Switzerland', 82, 13, 1, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Maisy Dejesus', 'Switzerland', 69, 13, 3, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Bailey David', 'China', 56, 6, 4, 27);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Brandon Vance', 'Ghana', 50, 12, 3, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tabitha Lamb', 'South Africa', 87, 8, 3, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Imran Rubio', 'Sweden', 3, 5, 1, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Honey Campos', 'China', 76, 6, 3, 27);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Herbie Lin', 'Spain', 43, 5, 4, 24);
INSERT INTO public.fact_team VALUES ('Co-Investigator', NULL, NULL, 6, 8, 3, 39);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Cian Santana', 'France', 38, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Gregory Leach', 'China', 53, 6, 4, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Jakob Elliott', 'Ghana', 47, 12, 1, 26);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Asa Chen', 'Canada', 54, 4, 4, 23);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Zaki Harrington', 'China', 56, 6, 4, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Fatimah Cruz', 'Ghana', 63, 12, 3, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tabitha Lamb', 'China', 53, 6, 4, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Fatimah Cruz', 'South Africa', 87, 8, 3, 20);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Tilly Yoder', 'Australia', 84, 16, 1, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Ben Stone', 'Canada', 54, 4, 4, 23);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Harri Carlson', 'Portugal', 77, 8, 4, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Imran Rubio', 'Canada', 58, 4, 4, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Marshall Lester', 'Germany', 8, 9, 4, 29);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Keane Randall', 'Ghana', 20, 11, 4, 26);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Mollie Campbell', 'Sweden', 36, 11, 4, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Alice Conner', 'Sweden', 45, 5, 1, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Imran Rubio', 'Canada', 16, 4, 1, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Blaine Hansen', 'France', 38, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Silas Stein', 'South Africa', 10, 8, 1, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Maisy Dejesus', 'China', 4, 6, 3, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Keane Randall', 'Netherlands', 22, 15, 2, 3);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Andrew Kane', 'Portugal', 1, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Marshall Lester', 'Canada', 7, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Ellen Abbott', 'Canada', 78, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Wiktor Church', 'Italy', 67, 7, 2, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Daniyal Gonzales', 'China', 76, 6, 3, 27);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Blaine Hansen', 'Sweden', 83, 5, 1, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Jakob Elliott', 'South Africa', 68, 8, 4, 20);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Stuart Farrell', 'Australia', 29, 6, 1, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Harvey Richards', 'Germany', 34, 9, 2, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Abraham Beasley', 'Netherlands', 59, 15, 1, 3);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Adelaide Villarreal', 'Canada', 7, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Daniyal Gonzales', 'Portugal', 44, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Bertha Lopez', 'Germany', 8, 9, 4, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Priya Cannon', 'Ghana', 47, 12, 1, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Marshall Lester', 'France', 80, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tasneem Blake', 'Australia', 64, 16, 2, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Isra Rhodes', 'China', 17, 6, 2, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Abel Contreras', 'Italy', 31, 7, 4, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Elaine Jimenez', 'Ghana', 15, 12, 1, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Keane Randall', 'Italy', 31, 7, 4, 25);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Priya Cannon', 'Australia', 74, 4, 1, 22);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Zaki Harrington', 'China', 53, 6, 4, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Amina Edwards', 'Italy', 5, 7, 4, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Nicolas Rice', 'Italy', 71, 7, 2, 25);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Kylie Logan', 'Germany', 21, 14, 2, 29);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Bailey David', 'Canada', 15, 12, 1, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tommy Murray', 'Ghana', 81, 12, 3, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Amanda Bush', 'Italy', 65, 7, 4, 25);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Eddie O''Connor', 'Australia', 42, 11, 4, 22);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Eddie O''Connor', 'Australia', 66, 9, 2, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Mikey Saunders', 'Sweden', 83, 5, 1, 21);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Clementine Golden', 'Switzerland', 39, 13, 2, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Olivia Moreno', 'United Kingdom', 85, 17, 4, 31);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Effie Fitzpatrick', 'Italy', 75, 7, 3, 25);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Dawid Fleming', 'Italy', 31, 7, 4, 25);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Gwen Stuart', 'Italy', 10, 8, 1, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Zoe Sweeney', 'India', 28, 11, 3, 18);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Susie Watkins', 'Switzerland', 55, 13, 2, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Maisy Dejesus', 'Italy', 65, 7, 4, 25);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Kara Trujillo', 'China', 16, 4, 1, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Cian Santana', 'Sweden', 23, 5, 4, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Omari Winters', 'Ghana', 63, 12, 3, 26);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Connie Gallagher', 'Sweden', 5, 7, 4, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Maisy Dejesus', 'Canada', 58, 4, 4, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tommy Murray', 'Netherlands', 59, 15, 1, 3);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Kylie Logan', 'Switzerland', 69, 13, 3, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Sebastien Singleton', 'France', 33, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Connie Gallagher', 'Ghana', 47, 12, 1, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Agnes Lambert', 'Switzerland', 69, 13, 3, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Wiktor Church', 'South Africa', 72, 8, 1, 20);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Aysha Whitaker', 'South Africa', 87, 8, 3, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Imran Rubio', 'Portugal', 44, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Aysha Whitaker', 'South Africa', 68, 8, 4, 20);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Eugene Brock', 'Germany', 66, 9, 2, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', NULL, NULL, 27, 15, 3, 40);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Eugene Brock', 'Germany', 37, 9, 3, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', NULL, NULL, 66, 9, 2, 41);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Bailey David', 'Canada', 39, 13, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Mikey Saunders', 'South Africa', 14, 8, 3, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Naomi Keith', 'Germany', 8, 9, 4, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Martina Bloggs', 'France', 33, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Harvey Richards', 'China', 26, 1, 3, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Olivia Moreno', 'South Africa', 41, 8, 2, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Emilio Garza', 'China', 53, 6, 4, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Elaine Jimenez', 'Australia', 40, 16, 2, 22);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Tasneem Blake', 'Germany', 72, 8, 1, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tabitha Lamb', 'Netherlands', 59, 15, 1, 3);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Abdulrahman Blanchard', 'Sweden', 18, 13, 2, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Omari Winters', 'Spain', 57, 14, 2, 24);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Adelaide Villarreal', 'South Africa', 73, 1, 1, 20);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Nicolas Rice', 'Italy', 65, 7, 4, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Susie Watkins', 'Spain', 70, 14, 2, 24);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Mikey Saunders', 'Australia', 86, 16, 4, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', NULL, NULL, 24, 8, 4, 42);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Agnes Lambert', 'Canada', 61, 4, 4, 23);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Maximillian Walker', 'South Africa', 10, 8, 1, 20);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Kabir Charles', 'China', 4, 6, 3, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Alec Dotson', 'China', 29, 6, 1, 27);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Marshall Lester', 'France', 25, 10, 1, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tamsin Pugh', 'Sweden', 23, 5, 4, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Wayne Palmer', 'Spain', 70, 14, 2, 24);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Zaki Harrington', 'China', 48, 13, 2, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Eddie O''Connor', 'India', 42, 11, 4, 18);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Maximillian Walker', 'Switzerland', 82, 13, 1, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Kylie Logan', 'Canada', 7, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Abel Contreras', 'Australia', 49, 16, 4, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Asa Chen', 'Netherlands', 22, 15, 2, 3);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Alys Wright', 'Canada', 2, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Alice Conner', 'China', 17, 6, 2, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Marshall Lester', 'Italy', 65, 7, 4, 25);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Priya Cannon', 'Australia', 80, 10, 4, 22);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Kieran Crane', 'France', 23, 5, 4, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Effie Fitzpatrick', 'Italy', 11, 7, 1, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Barbara Baird', 'South Africa', 72, 8, 1, 20);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Tasneem Blake', 'Germany', 41, 8, 2, 29);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Harvey Richards', 'China', 9, 10, 2, 27);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Alec Dotson', 'France', 38, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Duncan Holder', 'South Africa', 14, 8, 3, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Laurence Reid', 'Canada', 74, 4, 1, 23);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Mariyah Humphrey', 'France', 28, 11, 3, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Brandon Vance', 'Portugal', 44, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Ben Stone', 'India', 52, 11, 2, 18);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Gregory Leach', 'South Africa', 10, 8, 1, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Abel Contreras', 'France', 35, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Seth Curtis', 'United Kingdom', 51, 17, 4, 31);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Zoe Sweeney', 'Ghana', 81, 12, 3, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Kieran Crane', 'India', 42, 11, 4, 18);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Daniyal Gonzales', 'Canada', 74, 4, 1, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Effie Fitzpatrick', 'South Africa', 77, 8, 4, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Cecilia Hutchinson', 'Switzerland', 55, 13, 2, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Ashwin Barker', 'Italy', 75, 7, 3, 25);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Silas Stein', 'Spain', 32, 14, 2, 24);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Herbie Lin', 'South Africa', 68, 8, 4, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Herbie Lin', 'France', 38, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Ida Mullins', 'Portugal', 2, 4, 2, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Ashwin Barker', 'Portugal', 13, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Hasan Phillips', 'Netherlands', 46, 1, 4, 3);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Gwen Stuart', 'Portugal', 73, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Fatimah Cruz', 'Ghana', 15, 12, 1, 26);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Mike Matthews', 'Canada', 84, 16, 1, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Ridwan Torres', 'Australia', 64, 16, 2, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Ben Stone', 'Sweden', 23, 5, 4, 21);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Eddie O''Connor', 'Australia', 47, 12, 1, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Kylie Logan', 'Italy', 11, 7, 1, 25);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Andrew Kane', 'Portugal', 59, 15, 1, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Ayah Escobar', 'South Africa', 14, 8, 3, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Dawid Fleming', 'Canada', 78, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Clementine Golden', 'Switzerland', 35, 10, 4, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Honey Campos', 'United Kingdom', 85, 17, 4, 31);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Eugene Brock', 'Sweden', 23, 5, 4, 21);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Janice Mcgowan', 'Netherlands', 86, 16, 4, 3);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Connie Gallagher', 'Sweden', 43, 5, 4, 21);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Ben Stone', 'India', 36, 11, 4, 18);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Fatimah Cruz', 'India', 52, 11, 2, 18);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Harri Carlson', 'United Kingdom', 85, 17, 4, 31);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Gwen Stuart', 'Italy', 11, 7, 1, 25);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Janice Mcgowan', 'Netherlands', 13, 1, 1, 3);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Silas Stein', 'Spain', 7, 4, 2, 24);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Stuart Farrell', 'Switzerland', 18, 13, 2, 19);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Seth Curtis', 'Australia', 40, 16, 2, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Agnes Lambert', 'Ghana', 81, 12, 3, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Sebastien Singleton', 'Canada', 78, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Alfie Higgins', 'China', 76, 6, 3, 27);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Silas Stein', 'Spain', 57, 14, 2, 24);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Duncan Holder', 'India', 28, 11, 3, 18);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Jakob Elliott', 'Spain', 68, 8, 4, 24);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Bertha Lopez', 'Australia', 64, 16, 2, 22);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Pedro Parsons', 'Australia', 86, 16, 4, 22);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Cian Santana', 'Portugal', 70, 14, 2, 2);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Brandon Vance', 'Ghana', 15, 12, 1, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Mikey Saunders', 'Sweden', 43, 5, 4, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Silas Stein', 'India', 42, 11, 4, 18);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Asa Chen', 'Canada', 79, 1, 4, 23);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Bailey David', 'Canada', 53, 6, 4, 23);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Mike Matthews', 'Canada', 75, 7, 3, 23);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Bailey David', 'Canada', 74, 4, 1, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', NULL, NULL, 36, 11, 4, 43);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Sebastien Singleton', 'China', 53, 6, 4, 27);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Jakob Elliott', 'Spain', 70, 14, 2, 24);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Maisy Dejesus', 'India', 20, 11, 4, 18);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Tilly Yoder', 'Australia', 4, 6, 3, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Bailey David', 'Canada', 2, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Laurence Reid', 'Sweden', 43, 5, 4, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Jennie Newton', 'Canada', 16, 4, 1, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Lochlan Mack', 'South Africa', 19, 8, 1, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Olivia Moreno', 'Ghana', 15, 12, 1, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Wayne Palmer', 'Ghana', 81, 12, 3, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Mollie Campbell', 'Ghana', 62, 12, 4, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Nana Shepard', 'Italy', 11, 7, 1, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Olivia Moreno', 'Switzerland', 48, 13, 2, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Agnes Lambert', 'Netherlands', 59, 15, 1, 3);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Asa Chen', 'Sweden', 3, 5, 1, 21);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Ben Stone', 'India', 49, 16, 4, 18);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Naomi Keith', 'Germany', 8, 9, 4, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Agnes Lambert', 'South Africa', 10, 8, 1, 20);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Keane Randall', 'Ghana', 3, 5, 1, 26);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Alys Wright', 'Canada', 30, 4, 3, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Lochlan Mack', 'Switzerland', 82, 13, 1, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Nicolas Rice', 'Sweden', 43, 5, 4, 21);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Wiktor Church', 'Portugal', 73, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Ashwin Barker', 'Portugal', 38, 10, 4, 2);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Abel Contreras', 'South Africa', 19, 8, 1, 20);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Nana Shepard', 'Italy', 67, 7, 2, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Alys Wright', 'South Africa', 68, 8, 4, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Asa Chen', 'Spain', 32, 14, 2, 24);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Vinny Powers', 'Portugal', 30, 4, 3, 2);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Andrew Kane', 'Portugal', 13, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Harri Carlson', 'Italy', 11, 7, 1, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Adelaide Villarreal', 'Australia', 64, 16, 2, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tommy Murray', 'Spain', 70, 14, 2, 24);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Ellen Abbott', 'Spain', 32, 14, 2, 24);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Nicolas Rice', 'South Africa', 87, 8, 3, 20);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Isra Rhodes', 'Spain', 21, 14, 2, 24);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Adelaide Villarreal', 'South Africa', 41, 8, 2, 20);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Wiktor Church', 'Portugal', 6, 8, 3, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Marshall Lester', 'Sweden', 45, 5, 1, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Alys Wright', 'Switzerland', 48, 13, 2, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Bertha Lopez', 'India', 28, 11, 3, 18);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Elaine Jimenez', 'Portugal', 73, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Amanda Bush', 'France', 9, 10, 2, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Jakob Elliott', 'France', 38, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Olivia Moreno', 'Germany', 71, 7, 2, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Silas Stein', 'Canada', 2, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Gwen Stuart', 'Australia', 86, 16, 4, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Priya Cannon', 'Sweden', 23, 5, 4, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Jakob Elliott', 'Ghana', 63, 12, 3, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Zakir Strong', 'Italy', 71, 7, 2, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tilly Yoder', 'Italy', 75, 7, 3, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Cian Santana', 'Australia', 84, 16, 1, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Nana Shepard', 'Sweden', 45, 5, 1, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tasneem Blake', 'Portugal', 26, 1, 3, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Martina Bloggs', 'France', 25, 10, 1, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Aysha Whitaker', 'Germany', 34, 9, 2, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Wiktor Church', 'China', 53, 6, 4, 27);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Laurence Reid', 'Italy', 11, 7, 1, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Elaine Jimenez', 'China', 76, 6, 3, 27);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Stuart Farrell', 'Australia', 78, 4, 2, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Howard Koch', 'Canada', 2, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Agnes Lambert', 'Netherlands', 19, 8, 1, 3);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Eugene Brock', 'Ghana', 81, 12, 3, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Susie Watkins', 'Australia', 64, 16, 2, 22);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Abel Contreras', 'South Africa', 72, 8, 1, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Jennie Newton', 'Portugal', 73, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Omari Winters', 'Portugal', 73, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Harri Carlson', 'Sweden', 45, 5, 1, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Clementine Golden', 'France', 80, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Maia Mccoy', 'Sweden', 3, 5, 1, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Isra Rhodes', 'South Africa', 41, 8, 2, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', NULL, NULL, 21, 14, 2, 44);
INSERT INTO public.fact_team VALUES ('Co-Investigator', NULL, NULL, 50, 12, 3, 45);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Andrew Kane', 'China', 53, 6, 4, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tilly Yoder', 'China', 29, 6, 1, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Christine Joyce', 'Italy', 11, 7, 1, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Seth Curtis', 'Sweden', 3, 5, 1, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Bertha Lopez', 'South Africa', 41, 8, 2, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Dawson Warren', 'Germany', 34, 9, 2, 29);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Ashwin Barker', 'Portugal', 44, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Mollie Campbell', 'Sweden', 23, 5, 4, 21);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Kabir Charles', 'China', 17, 6, 2, 27);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Sebastian Knapp', 'Portugal', 1, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Wiktor Church', 'Portugal', 56, 6, 4, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Bailey David', 'Spain', 70, 14, 2, 24);
INSERT INTO public.fact_team VALUES ('Co-Investigator', NULL, NULL, 60, 8, 4, 46);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Kabir Charles', 'South Africa', 68, 8, 4, 20);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Maisy Dejesus', 'India', 42, 11, 4, 18);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Zakir Strong', 'Ghana', 15, 12, 1, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Emilio Garza', 'South Africa', 10, 8, 1, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Sebastien Singleton', 'France', 80, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Kylie Logan', 'Germany', 82, 13, 1, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Jakob Elliott', 'Australia', 86, 16, 4, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Amina Edwards', 'Portugal', 79, 1, 4, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Effie Fitzpatrick', 'Ghana', 15, 12, 1, 26);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Cecilia Hutchinson', 'South Africa', 58, 4, 4, 20);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Christine Joyce', 'Netherlands', 1, 1, 1, 3);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Effie Fitzpatrick', 'India', 42, 11, 4, 18);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Bruce Bullock', 'United Kingdom', 87, 8, 3, 31);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Alys Wright', 'Switzerland', 82, 13, 1, 19);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Duncan Holder', 'Italy', 5, 7, 4, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Olivia Moreno', 'Canada', 74, 4, 1, 23);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Herbert Padilla', 'Germany', 34, 9, 2, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Abraham Beasley', 'Portugal', 26, 1, 3, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Christine Joyce', 'South Africa', 14, 8, 3, 20);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Abraham Beasley', 'South Africa', 60, 8, 4, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Kylie Logan', 'India', 20, 11, 4, 18);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Tommy Murray', 'Switzerland', 50, 12, 3, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Abel Contreras', 'Sweden', 3, 5, 1, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Amanda Bush', 'Australia', 64, 16, 2, 22);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Cian Santana', 'Portugal', 45, 5, 1, 2);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Pedro Parsons', 'Australia', 60, 8, 4, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Adelaide Villarreal', 'Portugal', 79, 1, 4, 2);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Keane Randall', 'Ghana', 47, 12, 1, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Alice Conner', 'South Africa', 41, 8, 2, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Jennie Newton', 'South Africa', 77, 8, 4, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Howard Koch', 'Italy', 75, 7, 3, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Isra Rhodes', 'Germany', 34, 9, 2, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Arron Simpson', 'France', 9, 10, 2, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Keane Randall', 'Switzerland', 82, 13, 1, 19);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Abdulrahman Blanchard', 'Sweden', 55, 13, 2, 21);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Mikey Saunders', 'United Kingdom', 51, 17, 4, 31);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Amanda Bush', 'Canada', 16, 4, 1, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Agnes Lambert', 'Italy', 31, 7, 4, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Nicolas Rice', 'Canada', 58, 4, 4, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Alice Conner', 'Canada', 54, 4, 4, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Howard Koch', 'China', 29, 6, 1, 27);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Gregory Leach', 'Germany', 81, 12, 3, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tamsin Pugh', 'China', 4, 6, 3, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tilly Yoder', 'Canada', 7, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Fatimah Cruz', 'France', 38, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Sebastien Singleton', 'Canada', 30, 4, 3, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Ridwan Torres', 'Canada', 74, 4, 1, 23);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Keane Randall', 'Ghana', 63, 12, 3, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Kieran Crane', 'Australia', 40, 16, 2, 22);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Nana Shepard', 'Italy', 75, 7, 3, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tamsin Pugh', 'Portugal', 46, 1, 4, 2);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Zakir Strong', 'Switzerland', 18, 13, 2, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Dawid Fleming', 'United Kingdom', 85, 17, 4, 31);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Herbert Padilla', 'Switzerland', 55, 13, 2, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Imran Rubio', 'Canada', 2, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Vinny Powers', 'Ghana', 81, 12, 3, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Stuart Farrell', 'Canada', 7, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Pedro Parsons', 'Australia', 52, 11, 2, 22);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Sebastian Knapp', 'Portugal', 46, 1, 4, 2);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Priya Cannon', 'Australia', 37, 9, 3, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Maximillian Walker', 'Switzerland', 69, 13, 3, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Connie Gallagher', 'Portugal', 44, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Martina Bloggs', 'China', 76, 6, 3, 27);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Laurence Reid', 'Italy', 25, 10, 1, 25);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Janice Mcgowan', 'Netherlands', 22, 15, 2, 3);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Harri Carlson', 'Switzerland', 18, 13, 2, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Honey Campos', 'India', 28, 11, 3, 18);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Maisy Dejesus', 'India', 28, 11, 3, 18);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Arron Simpson', 'Spain', 24, 8, 4, 24);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Abdulrahman Blanchard', 'Sweden', 12, 11, 3, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tabitha Lamb', 'Germany', 37, 9, 3, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Aysha Whitaker', 'Portugal', 73, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Mike Matthews', 'Germany', 8, 9, 4, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Abel Contreras', 'India', 28, 11, 3, 18);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Maia Mccoy', 'Sweden', 67, 7, 2, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Eddie O''Connor', 'Netherlands', 22, 15, 2, 3);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Sebastien Singleton', 'Spain', 61, 4, 4, 24);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Jakob Elliott', 'Portugal', 26, 1, 3, 2);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Harri Carlson', 'Portugal', 62, 12, 4, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Ellen Abbott', 'China', 17, 6, 2, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Clementine Golden', 'Sweden', 45, 5, 1, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tamsin Pugh', 'Canada', 16, 4, 1, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Maariyah Harding', 'China', 17, 6, 2, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Keane Randall', 'Germany', 34, 9, 2, 29);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Wayne Palmer', 'Netherlands', 22, 15, 2, 3);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Janice Mcgowan', 'Switzerland', 55, 13, 2, 19);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Nicolas Rice', 'Italy', 71, 7, 2, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tabitha Lamb', 'France', 35, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Fatimah Cruz', 'United Kingdom', 85, 17, 4, 31);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Amanda Bush', 'China', 76, 6, 3, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tilly Yoder', 'France', 80, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Zakir Strong', 'Ghana', 63, 12, 3, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Bailey David', 'China', 29, 6, 1, 27);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Bruce Bullock', 'Spain', 70, 14, 2, 24);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Kabir Charles', 'Portugal', 73, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Gwen Stuart', 'Italy', 22, 15, 2, 25);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Priya Cannon', 'Australia', 65, 7, 4, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Sebastien Singleton', 'India', 42, 11, 4, 18);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Brandon Vance', 'Portugal', 1, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Willie Harvey', 'Canada', 16, 4, 1, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Stuart Farrell', 'Switzerland', 55, 13, 2, 19);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Maariyah Harding', 'Australia', 85, 17, 4, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tilly Yoder', 'Ghana', 47, 12, 1, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Stuart Farrell', 'Australia', 84, 16, 1, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Effie Fitzpatrick', 'Netherlands', 22, 15, 2, 3);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Clementine Golden', 'South Africa', 19, 8, 1, 20);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Sebastian Knapp', 'Portugal', 26, 1, 3, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Bruce Bullock', 'Canada', 54, 4, 4, 23);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Maia Mccoy', 'Sweden', 17, 6, 2, 21);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Rex Harmon', 'France', 9, 10, 2, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Maximillian Walker', 'India', 42, 11, 4, 18);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Maisy Dejesus', 'India', 12, 11, 3, 18);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Ida Mullins', 'Portugal', 79, 1, 4, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Pedro Parsons', 'Canada', 16, 4, 1, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Martina Bloggs', 'France', 80, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Eddie O''Connor', 'Australia', 64, 16, 2, 22);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Ayah Escobar', 'Canada', 7, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Duncan Holder', 'Canada', 2, 4, 2, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Daniyal Gonzales', 'Australia', 49, 16, 4, 22);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Susie Watkins', 'Switzerland', 48, 13, 2, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Dawson Warren', 'Spain', 32, 14, 2, 24);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Hasan Phillips', 'Italy', 71, 7, 2, 25);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Ida Mullins', 'France', 33, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Zaki Harrington', 'Sweden', 23, 5, 4, 21);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Ridwan Torres', 'South Africa', 24, 8, 4, 20);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Alice Conner', 'Ghana', 47, 12, 1, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Susie Watkins', 'Switzerland', 18, 13, 2, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Seth Curtis', 'Sweden', 43, 5, 4, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Kara Trujillo', 'Canada', 30, 4, 3, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Priya Cannon', 'Switzerland', 55, 13, 2, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Herbert Padilla', 'Switzerland', 39, 13, 2, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Arron Simpson', 'Germany', 8, 9, 4, 29);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Cian Santana', 'Portugal', 83, 5, 1, 2);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Maia Mccoy', 'Portugal', 1, 1, 1, 2);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Marshall Lester', 'France', 31, 7, 4, 28);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Rex Harmon', 'India', 28, 11, 3, 18);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Maisy Dejesus', 'Sweden', 3, 5, 1, 21);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Connie Gallagher', 'Switzerland', 18, 13, 2, 19);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Tommy Murray', 'Canada', 61, 4, 4, 23);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Kara Trujillo', 'Ghana', 63, 12, 3, 26);
INSERT INTO public.fact_team VALUES ('Co-Investigator', 'Abraham Beasley', 'Germany', 8, 9, 4, 29);
INSERT INTO public.fact_team VALUES ('Primary Investigator', 'Alec Dotson', 'France', 35, 10, 4, 28);
INSERT INTO public.fact_team VALUES ('Tech Lead', 'Alec Dotson', 'France', 64, 16, 2, 28);


--
-- TOC entry 2168 (class 0 OID 24576)
-- Dependencies: 185
-- Data for Name: stage_opencall; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.stage_opencall VALUES ('prop-001', 'The origin of ORCs: a new class of astronomical objects?', 'Canada', '{"pi": {"pi_fullname": "Alys Wright", "pi_country": "Canada"}, "tech_lead": {"tech_lead_fullname": "Ida Mullins", "tech_lead_country": "Portugal"}, "co_pis": [{"co_pi_fullname": "Bailey David", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Silas Stein", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Howard Koch", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Kabir Charles", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Duncan Holder", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Imran Rubio", "co_pi_country": "Canada", "is_student": false}]}', 'UHF', 64.00, 'P. Fuentes', 9.6, 'D. Piraino', 4.6, 'P. Roosevelt', 9.4, 64.00);
INSERT INTO public.stage_opencall VALUES ('prop-002', 'Characterising large-scale overdense structures at z = 2.2 by identifying their radio members', 'Sweden', '{"pi": {"pi_fullname": "Maia Mccoy", "pi_country": "Sweden"}, "tech_lead": {"tech_lead_fullname": "Keane Randall", "tech_lead_country": "Ghana"}, "co_pis": [{"co_pi_fullname": "Asa Chen", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Imran Rubio", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Abel Contreras", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Seth Curtis", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Maisy Dejesus", "co_pi_country": "Sweden", "is_student": false}]}', 'S-Band', 22.00, 'A. Li', 9.2, 'C. Maas', 8.1, 'K. Angioli', 4.9, 22.00);
INSERT INTO public.stage_opencall VALUES ('prop-003', 'A MeerKAT Atlas of IRAS RBGS Galaxies in the Southern Hemisphere', 'China', '{"pi": {"pi_fullname": "Kabir Charles", "pi_country": "China"}, "tech_lead": {"tech_lead_fullname": "Tilly Yoder", "tech_lead_country": "Australia"}, "co_pis": [{"co_pi_fullname": "Maariyah Harding", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Kieran Crane", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Tamsin Pugh", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Maisy Dejesus", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Wayne Palmer", "co_pi_country": "China", "is_student": false}]}', 'L-Band', 82.00, 'D. Piraino', 8.5, 'K. Angioli', 7.0, 'N. Katou', 5.1, 82.00);
INSERT INTO public.stage_opencall VALUES ('prop-004', 'The JO135 jellyfish galaxy: A MeerKAT perspective', 'Italy', '{"pi": {"pi_fullname": "Duncan Holder", "pi_country": "Italy"}, "tech_lead": {"tech_lead_fullname": "Connie Gallagher", "tech_lead_country": "Sweden"}, "co_pis": [{"co_pi_fullname": "Amina Edwards", "co_pi_country": "Italy", "is_student": false}]}', 'X-Band', 11.66, 'P. Roosevelt', 9.3, 'A. Li', 7.6, 'N. Katou', 9.8, 8.75);
INSERT INTO public.stage_opencall VALUES ('prop-005', 'RESOLVING HI EMISSION AT KPC SCALES OF ULTRA DIFFUSE GALAXIES', 'South Africa', '{"pi": {"pi_fullname": "Maximillian Walker", "pi_country": "South Africa"}, "tech_lead": {"tech_lead_fullname": "Wiktor Church", "tech_lead_country": "Portugal"}, "co_pis": []}', 'L-Band', 48.00, 'N. Katou', 9.5, 'A. Li', 5.5, 'P. Fuentes', 6.9, 43.00);
INSERT INTO public.stage_opencall VALUES ('prop-006', 'From Galaxy Disk to CGM -- Deep Magnetized Halos', 'Canada', '{"pi": {"pi_fullname": "Emilio Garza", "pi_country": "Canada"}, "tech_lead": {"tech_lead_fullname": "Silas Stein", "tech_lead_country": "Spain"}, "co_pis": [{"co_pi_fullname": "Kylie Logan", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Marshall Lester", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Stuart Farrell", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Tilly Yoder", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Ayah Escobar", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Adelaide Villarreal", "co_pi_country": "Canada", "is_student": false}]}', 'UHF', 36.00, 'P. Norton', 6.9, 'A. Li', 6.4, 'C. Maas', 9.4, 29.25);
INSERT INTO public.stage_opencall VALUES ('prop-007', 'Radio galaxy harassment caught in the act', 'Germany', '{"pi": {"pi_fullname": "Naomi Keith", "pi_country": "Germany"}, "tech_lead": {"tech_lead_fullname": "Herbie Lin", "tech_lead_country": "Spain"}, "co_pis": [{"co_pi_fullname": "Marshall Lester", "co_pi_country": "Germany", "is_student": false}, {"co_pi_fullname": "Abraham Beasley", "co_pi_country": "Germany", "is_student": false}, {"co_pi_fullname": "Mike Matthews", "co_pi_country": "Germany", "is_student": false}, {"co_pi_fullname": "Arron Simpson", "co_pi_country": "Germany", "is_student": false}, {"co_pi_fullname": "Naomi Keith", "co_pi_country": "Germany", "is_student": false}, {"co_pi_fullname": "Howard Koch", "co_pi_country": "Germany", "is_student": false}, {"co_pi_fullname": "Bertha Lopez", "co_pi_country": "Germany", "is_student": false}]}', 'X-Band', 4.50, 'P. Roosevelt', 5.1, 'D. Piraino', 7.8, 'A. Li', 8.6, 4.50);
INSERT INTO public.stage_opencall VALUES ('prop-008', 'Revealing the nature of IGR J11014-6103 jets with MeerKAT', 'France', '{"pi": {"pi_fullname": "Rex Harmon", "pi_country": "France"}, "tech_lead": {"tech_lead_fullname": "Harvey Richards", "tech_lead_country": "China"}, "co_pis": [{"co_pi_fullname": "Olivia Moreno", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Amanda Bush", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Gregory Leach", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Arron Simpson", "co_pi_country": "France", "is_student": false}]}', 'UHF', 2.66, 'A. Li', 5.9, 'C. Maas', 8.7, 'N. Katou', 8.7, 2.66);
INSERT INTO public.stage_opencall VALUES ('prop-009', 'Resolving Ultra-Diffuse Galaxies in HI', 'South Africa', '{"pi": {"pi_fullname": "Maximillian Walker", "pi_country": "South Africa"}, "tech_lead": {"tech_lead_fullname": "Gwen Stuart", "tech_lead_country": "Italy"}, "co_pis": [{"co_pi_fullname": "Emilio Garza", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Emilio Garza", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Agnes Lambert", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Gregory Leach", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Silas Stein", "co_pi_country": "South Africa", "is_student": false}]}', 'S-Band', 17.00, 'D. Piraino', 9.7, 'N. Katou', 8.1, 'P. Norton', 4.8, 17.00);
INSERT INTO public.stage_opencall VALUES ('prop-010', 'Magnetic field structure in the jellyfish galaxy JO194', 'Italy', '{"pi": {"pi_fullname": "Laurence Reid", "pi_country": "Italy"}, "tech_lead": {"tech_lead_fullname": "Gwen Stuart", "tech_lead_country": "Italy"}, "co_pis": [{"co_pi_fullname": "Harri Carlson", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Christine Joyce", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Effie Fitzpatrick", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Nana Shepard", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Kylie Logan", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Olivia Moreno", "co_pi_country": "Italy", "is_student": false}]}', 'S-Band', 12.00, 'K. Angioli', 4.9, 'N. Katou', 6.0, 'D. Piraino', 5.5, 12.00);
INSERT INTO public.stage_opencall VALUES ('prop-011', 'Imaging new diffuse cluster radio sources selected at low frequencies', 'India', '{"pi": {"pi_fullname": "Maisy Dejesus", "pi_country": "India"}, "tech_lead": {"tech_lead_fullname": "Abdulrahman Blanchard", "tech_lead_country": "Sweden"}, "co_pis": [{"co_pi_fullname": "Cecilia Hutchinson", "co_pi_country": "India", "is_student": false}]}', 'L-Band', 8.00, 'K. Angioli', 8.9, 'D. Piraino', 4.9, 'C. Maas', 6.7, 8.00);
INSERT INTO public.stage_opencall VALUES ('prop-012', 'Mapping HI around AGB stars', 'Portugal', '{"pi": {"pi_fullname": "Andrew Kane", "pi_country": "Portugal"}, "tech_lead": {"tech_lead_fullname": "Janice Mcgowan", "tech_lead_country": "Netherlands"}, "co_pis": [{"co_pi_fullname": "Ashwin Barker", "co_pi_country": "Portugal", "is_student": false}]}', 'S-Band', 31.00, 'P. Fuentes', 8.2, 'N. Katou', 7.5, 'P. Norton', 5.6, 24.75);
INSERT INTO public.stage_opencall VALUES ('prop-013', 'A MeerKAT view on galaxies in filaments falling onto the Virgo cluster (VirgoFil)', 'South Africa', '{"pi": {"pi_fullname": "Zoe Sweeney", "pi_country": "South Africa"}, "tech_lead": {"tech_lead_fullname": "Maariyah Harding", "tech_lead_country": "Australia"}, "co_pis": [{"co_pi_fullname": "Zakir Strong", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Zakir Strong", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Christine Joyce", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Duncan Holder", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Mikey Saunders", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Alys Wright", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Ayah Escobar", "co_pi_country": "South Africa", "is_student": false}]}', 'L-Band', 22.33, 'P. Roosevelt', 8.1, 'P. Norton', 6.3, 'P. Fuentes', 4.7, 22.33);
INSERT INTO public.stage_opencall VALUES ('prop-014', 'MeerKAT HI imaging of two southern DustPedia galaxies', 'Ghana', '{"pi": {"pi_fullname": "Brandon Vance", "pi_country": "Ghana"}, "tech_lead": {"tech_lead_fullname": "Bailey David", "tech_lead_country": "Canada"}, "co_pis": [{"co_pi_fullname": "Fatimah Cruz", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Elaine Jimenez", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Olivia Moreno", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Maia Mccoy", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Effie Fitzpatrick", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Mariyah Humphrey", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Zakir Strong", "co_pi_country": "Ghana", "is_student": false}]}', 'S-Band', 20.00, 'A. Li', 7.4, 'P. Fuentes', 7.3, 'D. Piraino', 9.1, 20.00);
INSERT INTO public.stage_opencall VALUES ('prop-015', 'Measuring the True Occurrence Rate of Jets in TDEs via Late-Time MeerKAT Observations', 'Canada', '{"pi": {"pi_fullname": "Bailey David", "pi_country": "Canada"}, "tech_lead": {"tech_lead_fullname": "Kara Trujillo", "tech_lead_country": "China"}, "co_pis": [{"co_pi_fullname": "Willie Harvey", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Tamsin Pugh", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Amanda Bush", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Pedro Parsons", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Mike Matthews", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Imran Rubio", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Jennie Newton", "co_pi_country": "Canada", "is_student": false}]}', 'S-Band', 12.00, 'K. Angioli', 4.7, 'N. Katou', 7.9, 'D. Piraino', 5.0, 12.00);
INSERT INTO public.stage_opencall VALUES ('prop-016', 'Observation of galaxies discovered in the Pilot FAST Ultra Deep Survey', 'China', '{"pi": {"pi_fullname": "Kabir Charles", "pi_country": "China"}, "tech_lead": {"tech_lead_fullname": "Maia Mccoy", "tech_lead_country": "Sweden"}, "co_pis": [{"co_pi_fullname": "Maariyah Harding", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Ellen Abbott", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Alice Conner", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Isra Rhodes", "co_pi_country": "China", "is_student": false}]}', 'UHF', 25.00, 'K. Angioli', 6.3, 'P. Roosevelt', 6.2, 'A. Li', 6.4, 25.00);
INSERT INTO public.stage_opencall VALUES ('prop-017', 'Understanding the unusual radio behaviour of the hot magnetic star CU Vir', 'Switzerland', '{"pi": {"pi_fullname": "Zakir Strong", "pi_country": "Switzerland"}, "tech_lead": {"tech_lead_fullname": "Abdulrahman Blanchard", "tech_lead_country": "Sweden"}, "co_pis": [{"co_pi_fullname": "Stuart Farrell", "co_pi_country": "Switzerland", "is_student": false}, {"co_pi_fullname": "Connie Gallagher", "co_pi_country": "Switzerland", "is_student": false}, {"co_pi_fullname": "Harri Carlson", "co_pi_country": "Switzerland", "is_student": false}, {"co_pi_fullname": "Susie Watkins", "co_pi_country": "Switzerland", "is_student": false}]}', 'UHF', 8.75, 'C. Maas', 7.5, 'K. Angioli', 6.1, 'N. Katou', 9.2, 8.75);
INSERT INTO public.stage_opencall VALUES ('prop-018', 'HI observations of ultra diffuse galaxies (UDGs) in galaxy groups', 'South Africa', '{"pi": {"pi_fullname": "Abel Contreras", "pi_country": "South Africa"}, "tech_lead": {"tech_lead_fullname": "Agnes Lambert", "tech_lead_country": "Netherlands"}, "co_pis": [{"co_pi_fullname": "Clementine Golden", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Lochlan Mack", "co_pi_country": "South Africa", "is_student": false}]}', 'S-Band', 15.00, 'N. Katou', 8.2, 'A. Li', 4.8, 'P. Roosevelt', 9.3, 13.50);
INSERT INTO public.stage_opencall VALUES ('prop-019', 'Constraining quenching scenarios in Recently Quenched Elliptical (RQE) galaxies via HI study', 'India', '{"pi": {"pi_fullname": "Maisy Dejesus", "pi_country": "India"}, "tech_lead": {"tech_lead_fullname": "Keane Randall", "tech_lead_country": "Ghana"}, "co_pis": [{"co_pi_fullname": "Kylie Logan", "co_pi_country": "India", "is_student": false}]}', 'X-Band', 30.00, 'C. Maas', 5.8, 'K. Angioli', 5.8, 'A. Li', 7.3, 30.00);
INSERT INTO public.stage_opencall VALUES ('prop-020', 'A Study of an Unexplored Population of ``Fast'''' Radio Supernovae', 'Spain', '{"pi": {"pi_fullname": "Isra Rhodes", "pi_country": "Spain"}, "tech_lead": {"tech_lead_fullname": "Kylie Logan", "tech_lead_country": "Germany"}, "co_pis": []}', 'UHF', 30.00, 'N. Katou', 9.6, 'D. Piraino', 6.1, 'A. Li', 7.4, 30.00);
INSERT INTO public.stage_opencall VALUES ('prop-021', 'Unravelling new magnetic fields in the large scale structure of the Universe: the case of the galaxy cluster A3718', 'Netherlands', '{"pi": {"pi_fullname": "Janice Mcgowan", "pi_country": "Netherlands"}, "tech_lead": {"tech_lead_fullname": "Gwen Stuart", "tech_lead_country": "Italy"}, "co_pis": [{"co_pi_fullname": "Eddie O''Connor", "co_pi_country": "Netherlands", "is_student": false}, {"co_pi_fullname": "Keane Randall", "co_pi_country": "Netherlands", "is_student": false}, {"co_pi_fullname": "Keane Randall", "co_pi_country": "Netherlands", "is_student": false}, {"co_pi_fullname": "Asa Chen", "co_pi_country": "Netherlands", "is_student": false}, {"co_pi_fullname": "Effie Fitzpatrick", "co_pi_country": "Netherlands", "is_student": false}, {"co_pi_fullname": "Wayne Palmer", "co_pi_country": "Netherlands", "is_student": false}]}', 'UHF', 25.00, 'D. Piraino', 9.5, 'N. Katou', 5.7, 'P. Fuentes', 8.1, 25.00);
INSERT INTO public.stage_opencall VALUES ('prop-022', 'Searching for fast outflows of cold gas at intermediate redshifts', 'Sweden', '{"pi": {"pi_fullname": "Mollie Campbell", "pi_country": "Sweden"}, "tech_lead": {"tech_lead_fullname": "Kieran Crane", "tech_lead_country": "France"}, "co_pis": [{"co_pi_fullname": "Zaki Harrington", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Ben Stone", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Tamsin Pugh", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Priya Cannon", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Zaki Harrington", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Cian Santana", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Eugene Brock", "co_pi_country": "Sweden", "is_student": false}]}', 'X-Band', 12.00, 'K. Angioli', 4.6, 'P. Roosevelt', 5.4, 'C. Maas', 6.0, 12.00);
INSERT INTO public.stage_opencall VALUES ('prop-023', 'Testing Standard Cosmology with Giant Radio Galaxies in the Distant Universe', 'South Africa', '{"pi": {"pi_fullname": "Ridwan Torres", "pi_country": "South Africa"}, "tech_lead": {"tech_lead_fullname": "Arron Simpson", "tech_lead_country": "Spain"}, "co_pis": []}', 'X-Band', 18.00, 'C. Maas', 6.0, 'K. Angioli', 7.9, 'A. Li', 8.7, 18.00);
INSERT INTO public.stage_opencall VALUES ('prop-024', 'GRBs: The Reverse Shock Renaissance', 'France', '{"pi": {"pi_fullname": "Marshall Lester", "pi_country": "France"}, "tech_lead": {"tech_lead_fullname": "Laurence Reid", "tech_lead_country": "Italy"}, "co_pis": [{"co_pi_fullname": "Kabir Charles", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Martina Bloggs", "co_pi_country": "France", "is_student": false}]}', 'S-Band', 10.00, 'N. Katou', 8.6, 'P. Fuentes', 6.3, 'P. Roosevelt', 8.0, 9.00);
INSERT INTO public.stage_opencall VALUES ('prop-025', 'MeerKAT observations of the magnetized cosmic web', 'Portugal', '{"pi": {"pi_fullname": "Sebastian Knapp", "pi_country": "Portugal"}, "tech_lead": {"tech_lead_fullname": "Harvey Richards", "tech_lead_country": "China"}, "co_pis": [{"co_pi_fullname": "Abraham Beasley", "co_pi_country": "Portugal", "is_student": false}, {"co_pi_fullname": "Tasneem Blake", "co_pi_country": "Portugal", "is_student": false}, {"co_pi_fullname": "Jakob Elliott", "co_pi_country": "Portugal", "is_student": false}]}', 'L-Band', 74.25, 'P. Roosevelt', 6.2, 'D. Piraino', 7.8, 'K. Angioli', 7.3, 55.75);
INSERT INTO public.stage_opencall VALUES ('prop-026', 'Star formation and the ISM in Nearby Galaxies with MeerKAT', 'Netherlands', '{"pi": {"pi_fullname": "Janice Mcgowan", "pi_country": "Netherlands"}, "tech_lead": {"tech_lead_fullname": "Omari Winters", "tech_lead_country": "Italy"}, "co_pis": []}', 'L-Band', 50.00, 'P. Norton', 7.1, 'D. Piraino', 8.3, 'A. Li', 9.8, 37.50);
INSERT INTO public.stage_opencall VALUES ('prop-027', 'Using MeerKAT UHF to Bridge the Gap in Abell 2443', 'India', '{"pi": {"pi_fullname": "Maisy Dejesus", "pi_country": "India"}, "tech_lead": {"tech_lead_fullname": "Mariyah Humphrey", "tech_lead_country": "France"}, "co_pis": [{"co_pi_fullname": "Nicolas Rice", "co_pi_country": "India", "is_student": false}, {"co_pi_fullname": "Honey Campos", "co_pi_country": "India", "is_student": false}, {"co_pi_fullname": "Bertha Lopez", "co_pi_country": "India", "is_student": false}, {"co_pi_fullname": "Zoe Sweeney", "co_pi_country": "India", "is_student": false}, {"co_pi_fullname": "Duncan Holder", "co_pi_country": "India", "is_student": false}, {"co_pi_fullname": "Abel Contreras", "co_pi_country": "India", "is_student": false}, {"co_pi_fullname": "Rex Harmon", "co_pi_country": "India", "is_student": false}]}', 'L-Band', 8.00, 'N. Katou', 9.7, 'P. Fuentes', 8.1, 'A. Li', 8.2, 8.00);
INSERT INTO public.stage_opencall VALUES ('prop-028', 'Disentangling the History of Particle Acceleration In Ultra Steep Spectrum Relic Clusters Abell 2443 and CIZA J0719.5+0043', 'China', '{"pi": {"pi_fullname": "Kara Trujillo", "pi_country": "China"}, "tech_lead": {"tech_lead_fullname": "Stuart Farrell", "tech_lead_country": "Australia"}, "co_pis": [{"co_pi_fullname": "Alec Dotson", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Howard Koch", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Tilly Yoder", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Bailey David", "co_pi_country": "China", "is_student": false}]}', 'S-Band', 17.00, 'P. Roosevelt', 9.8, 'C. Maas', 5.9, 'P. Fuentes', 8.0, 13.50);
INSERT INTO public.stage_opencall VALUES ('prop-029', 'What is the origin of the kpc-scale radio emission in radio-quiet active galactic nuclei', 'Canada', '{"pi": {"pi_fullname": "Alys Wright", "pi_country": "Canada"}, "tech_lead": {"tech_lead_fullname": "Vinny Powers", "tech_lead_country": "Portugal"}, "co_pis": [{"co_pi_fullname": "Kara Trujillo", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Sebastien Singleton", "co_pi_country": "Canada", "is_student": false}]}', 'L-Band', 9.00, 'K. Angioli', 6.4, 'N. Katou', 6.8, 'C. Maas', 7.7, 9.00);
INSERT INTO public.stage_opencall VALUES ('prop-030', 'Observing HI in the Reionization Epoch Analog Galaxy Haro11', 'Italy', '{"pi": {"pi_fullname": "Dawid Fleming", "pi_country": "Italy"}, "tech_lead": {"tech_lead_fullname": "Marshall Lester", "tech_lead_country": "France"}, "co_pis": [{"co_pi_fullname": "Agnes Lambert", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Honey Campos", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Keane Randall", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Abel Contreras", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Marshall Lester", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Rex Harmon", "co_pi_country": "Italy", "is_student": false}]}', 'X-Band', 11.00, 'P. Roosevelt', 5.6, 'A. Li', 6.3, 'K. Angioli', 9.3, 11.00);
INSERT INTO public.stage_opencall VALUES ('prop-031', 'Imaging the Disk and Outflow of the Starburst Galaxy NGC 253 with High-Resolution HI', 'Spain', '{"pi": {"pi_fullname": "Silas Stein", "pi_country": "Spain"}, "tech_lead": {"tech_lead_fullname": "Mollie Campbell", "tech_lead_country": "Sweden"}, "co_pis": [{"co_pi_fullname": "Jennie Newton", "co_pi_country": "Spain", "is_student": false}, {"co_pi_fullname": "Ellen Abbott", "co_pi_country": "Spain", "is_student": false}, {"co_pi_fullname": "Asa Chen", "co_pi_country": "Spain", "is_student": false}, {"co_pi_fullname": "Dawson Warren", "co_pi_country": "Spain", "is_student": false}]}', 'UHF', 45.00, 'K. Angioli', 9.4, 'P. Fuentes', 4.8, 'P. Roosevelt', 4.7, 33.75);
INSERT INTO public.stage_opencall VALUES ('prop-032', 'An HI perspective on galaxy evolution in Abell 2626 and its surroundings', 'France', '{"pi": {"pi_fullname": "Kieran Crane", "pi_country": "France"}, "tech_lead": {"tech_lead_fullname": "Ayah Escobar", "tech_lead_country": "France"}, "co_pis": [{"co_pi_fullname": "Sebastien Singleton", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Ida Mullins", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Martina Bloggs", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Jennie Newton", "co_pi_country": "France", "is_student": false}]}', 'X-Band', 48.00, 'N. Katou', 9.3, 'P. Roosevelt', 9.4, 'A. Li', 6.9, 48.00);
INSERT INTO public.stage_opencall VALUES ('prop-033', 'The connection between star formation, gas properties and magnetic field in nearby galaxies at high spatial resolution', 'Germany', '{"pi": {"pi_fullname": "Herbert Padilla", "pi_country": "Germany"}, "tech_lead": {"tech_lead_fullname": "Alice Conner", "tech_lead_country": "Netherlands"}, "co_pis": [{"co_pi_fullname": "Harvey Richards", "co_pi_country": "Germany", "is_student": false}, {"co_pi_fullname": "Pedro Parsons", "co_pi_country": "Germany", "is_student": false}, {"co_pi_fullname": "Aysha Whitaker", "co_pi_country": "Germany", "is_student": false}, {"co_pi_fullname": "Isra Rhodes", "co_pi_country": "Germany", "is_student": false}, {"co_pi_fullname": "Keane Randall", "co_pi_country": "Germany", "is_student": false}, {"co_pi_fullname": "Dawson Warren", "co_pi_country": "Germany", "is_student": false}]}', 'UHF', 49.00, 'K. Angioli', 8.8, 'D. Piraino', 7.3, 'C. Maas', 5.4, 39.25);
INSERT INTO public.stage_opencall VALUES ('prop-034', 'Antlia Cluster in HIgh def: A study of early galaxy cluster assembly', 'France', '{"pi": {"pi_fullname": "Alec Dotson", "pi_country": "France"}, "tech_lead": {"tech_lead_fullname": "Clementine Golden", "tech_lead_country": "Switzerland"}, "co_pis": [{"co_pi_fullname": "Tabitha Lamb", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Abel Contreras", "co_pi_country": "France", "is_student": false}]}', 'X-Band', 49.00, 'N. Katou', 6.7, 'P. Fuentes', 7.2, 'P. Norton', 5.6, 37.00);
INSERT INTO public.stage_opencall VALUES ('prop-035', 'MERGHERS: evolution of cluster scale radio sources through cosmic time', 'India', '{"pi": {"pi_fullname": "Ben Stone", "pi_country": "India"}, "tech_lead": {"tech_lead_fullname": "Mollie Campbell", "tech_lead_country": "Sweden"}, "co_pis": []}', 'X-Band', 99.50, 'N. Katou', 5.4, 'C. Maas', 6.5, 'P. Roosevelt', 7.6, 99.50);
INSERT INTO public.stage_opencall VALUES ('prop-083', 'A Search for Pulsars Around Sgr A* through Rotation Measure', 'Germany', '{"pi": {"pi_fullname": "Eugene Brock", "pi_country": "Germany"}, "tech_lead": {"tech_lead_fullname": "Priya Cannon", "tech_lead_country": "Australia"}, "co_pis": [{"co_pi_fullname": "Tabitha Lamb", "co_pi_country": "Germany", "is_student": false}]}', 'L-Band', 9.00, 'K. Angioli', 8.0, 'P. Fuentes', 6.2, 'P. Roosevelt', 5.1, 9.00);
INSERT INTO public.stage_opencall VALUES ('prop-036', 'The highest-redshift galaxies in the G4Jy Sample', 'France', '{"pi": {"pi_fullname": "Alec Dotson", "pi_country": "France"}, "tech_lead": {"tech_lead_fullname": "Ashwin Barker", "tech_lead_country": "Portugal"}, "co_pis": [{"co_pi_fullname": "Jakob Elliott", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Herbie Lin", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Daniyal Gonzales", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Honey Campos", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Blaine Hansen", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Cian Santana", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Fatimah Cruz", "co_pi_country": "France", "is_student": false}]}', 'X-Band', 13.00, 'D. Piraino', 9.1, 'K. Angioli', 8.6, 'P. Roosevelt', 8.2, 13.00);
INSERT INTO public.stage_opencall VALUES ('prop-037', 'Exo-space Weather on Late-type Stars: Impacts on Habitability of Exo-planets', 'Switzerland', '{"pi": {"pi_fullname": "Clementine Golden", "pi_country": "Switzerland"}, "tech_lead": {"tech_lead_fullname": "Bailey David", "tech_lead_country": "Canada"}, "co_pis": [{"co_pi_fullname": "Herbert Padilla", "co_pi_country": "Switzerland", "is_student": false}]}', 'UHF', 12.00, 'D. Piraino', 6.4, 'N. Katou', 5.8, 'P. Roosevelt', 8.3, 12.00);
INSERT INTO public.stage_opencall VALUES ('prop-038', 'Looking for Low Column Density HI with MeerKAT & FAST: NGC 3521', 'Australia', '{"pi": {"pi_fullname": "Seth Curtis", "pi_country": "Australia"}, "tech_lead": {"tech_lead_fullname": "Jennie Newton", "tech_lead_country": "Canada"}, "co_pis": [{"co_pi_fullname": "Elaine Jimenez", "co_pi_country": "Australia", "is_student": false}, {"co_pi_fullname": "Kieran Crane", "co_pi_country": "Australia", "is_student": false}]}', 'UHF', 12.00, 'P. Fuentes', 5.5, 'P. Roosevelt', 5.1, 'P. Norton', 5.1, 9.00);
INSERT INTO public.stage_opencall VALUES ('prop-039', 'MeerKAT spins the Cosmic Web: Mapping a local nexus of galaxy filaments', 'South Africa', '{"pi": {"pi_fullname": "Adelaide Villarreal", "pi_country": "South Africa"}, "tech_lead": {"tech_lead_fullname": "Tasneem Blake", "tech_lead_country": "Germany"}, "co_pis": [{"co_pi_fullname": "Olivia Moreno", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Bertha Lopez", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Alice Conner", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Isra Rhodes", "co_pi_country": "South Africa", "is_student": false}]}', 'UHF', 50.00, 'K. Angioli', 7.2, 'P. Fuentes', 8.3, 'N. Katou', 7.2, 45.00);
INSERT INTO public.stage_opencall VALUES ('prop-040', 'Radio study of X-ray emitting stars with MeerKAT', 'India', '{"pi": {"pi_fullname": "Maisy Dejesus", "pi_country": "India"}, "tech_lead": {"tech_lead_fullname": "Eddie O''Connor", "tech_lead_country": "Australia"}, "co_pis": [{"co_pi_fullname": "Eddie O''Connor", "co_pi_country": "India", "is_student": false}, {"co_pi_fullname": "Sebastien Singleton", "co_pi_country": "India", "is_student": false}, {"co_pi_fullname": "Silas Stein", "co_pi_country": "India", "is_student": false}, {"co_pi_fullname": "Maximillian Walker", "co_pi_country": "India", "is_student": false}, {"co_pi_fullname": "Kieran Crane", "co_pi_country": "India", "is_student": false}, {"co_pi_fullname": "Effie Fitzpatrick", "co_pi_country": "India", "is_student": false}]}', 'X-Band', 44.50, 'P. Roosevelt', 9.1, 'N. Katou', 6.3, 'A. Li', 6.2, 44.50);
INSERT INTO public.stage_opencall VALUES ('prop-041', 'A Complete Picture of Gas, Dust, and Stars in Six of the Best-Studied MeerKAT-Visible Galaxies', 'Portugal', '{"pi": {"pi_fullname": "Sebastian Knapp", "pi_country": "Portugal"}, "tech_lead": {"tech_lead_fullname": "Christine Joyce", "tech_lead_country": "Netherlands"}, "co_pis": [{"co_pi_fullname": "Andrew Kane", "co_pi_country": "Portugal", "is_student": false}, {"co_pi_fullname": "Maia Mccoy", "co_pi_country": "Portugal", "is_student": false}, {"co_pi_fullname": "Brandon Vance", "co_pi_country": "Portugal", "is_student": false}]}', 'S-Band', 48.00, 'N. Katou', 4.6, 'P. Roosevelt', 9.9, 'P. Norton', 9.5, 48.00);
INSERT INTO public.stage_opencall VALUES ('prop-042', 'Observations of Dwarf Galaxies with Very Extended HI Disks', 'Sweden', '{"pi": {"pi_fullname": "Connie Gallagher", "pi_country": "Sweden"}, "tech_lead": {"tech_lead_fullname": "Herbie Lin", "tech_lead_country": "Spain"}, "co_pis": [{"co_pi_fullname": "Laurence Reid", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Nicolas Rice", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Mikey Saunders", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Seth Curtis", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Eugene Brock", "co_pi_country": "Sweden", "is_student": false}]}', 'X-Band', 36.00, 'K. Angioli', 9.5, 'P. Norton', 5.9, 'C. Maas', 9.8, 36.00);
INSERT INTO public.stage_opencall VALUES ('prop-043', 'TailSpin: MeerKAT observations of a diffuse cluster source in ATLBS fields', 'Portugal', '{"pi": {"pi_fullname": "Ashwin Barker", "pi_country": "Portugal"}, "tech_lead": {"tech_lead_fullname": "Effie Fitzpatrick", "tech_lead_country": "Portugal"}, "co_pis": [{"co_pi_fullname": "Daniyal Gonzales", "co_pi_country": "Portugal", "is_student": false}, {"co_pi_fullname": "Brandon Vance", "co_pi_country": "Portugal", "is_student": false}, {"co_pi_fullname": "Connie Gallagher", "co_pi_country": "Portugal", "is_student": false}, {"co_pi_fullname": "Imran Rubio", "co_pi_country": "Portugal", "is_student": false}]}', 'S-Band', 2.75, 'P. Fuentes', 8.5, 'D. Piraino', 9.1, 'C. Maas', 5.6, 2.00);
INSERT INTO public.stage_opencall VALUES ('prop-044', 'Probing Gamma-Ray Burst Physics with MeerKAT', 'Sweden', '{"pi": {"pi_fullname": "Abdulrahman Blanchard", "pi_country": "Sweden"}, "tech_lead": {"tech_lead_fullname": "Cian Santana", "tech_lead_country": "Portugal"}, "co_pis": [{"co_pi_fullname": "Lochlan Mack", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Blaine Hansen", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Alice Conner", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Harri Carlson", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Nana Shepard", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Marshall Lester", "co_pi_country": "Sweden", "is_student": false}, {"co_pi_fullname": "Clementine Golden", "co_pi_country": "Sweden", "is_student": false}]}', 'S-Band', 42.00, 'D. Piraino', 9.4, 'A. Li', 6.1, 'C. Maas', 6.2, 42.00);
INSERT INTO public.stage_opencall VALUES ('prop-045', 'A HI absorption search towards the brightest G4Jy sources', 'Portugal', '{"pi": {"pi_fullname": "Sebastian Knapp", "pi_country": "Portugal"}, "tech_lead": {"tech_lead_fullname": "Hasan Phillips", "tech_lead_country": "Netherlands"}, "co_pis": [{"co_pi_fullname": "Tamsin Pugh", "co_pi_country": "Portugal", "is_student": false}, {"co_pi_fullname": "Harri Carlson", "co_pi_country": "Portugal", "is_student": false}]}', 'X-Band', 50.00, 'P. Norton', 5.1, 'N. Katou', 6.3, 'P. Fuentes', 6.9, 50.00);
INSERT INTO public.stage_opencall VALUES ('prop-046', 'Searching for Auroral Emission in Exoplanetary Systems', 'Ghana', '{"pi": {"pi_fullname": "Keane Randall", "pi_country": "Ghana"}, "tech_lead": {"tech_lead_fullname": "Eddie O''Connor", "tech_lead_country": "Australia"}, "co_pis": [{"co_pi_fullname": "Tilly Yoder", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Alice Conner", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Connie Gallagher", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Jakob Elliott", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Priya Cannon", "co_pi_country": "Ghana", "is_student": false}]}', 'S-Band', 55.00, 'C. Maas', 8.3, 'A. Li', 8.0, 'D. Piraino', 9.1, 41.25);
INSERT INTO public.stage_opencall VALUES ('prop-047', 'Mapping tidal interactions in nearby galaxy groups', 'Switzerland', '{"pi": {"pi_fullname": "Susie Watkins", "pi_country": "Switzerland"}, "tech_lead": {"tech_lead_fullname": "Zaki Harrington", "tech_lead_country": "China"}, "co_pis": [{"co_pi_fullname": "Alys Wright", "co_pi_country": "Switzerland", "is_student": false}, {"co_pi_fullname": "Olivia Moreno", "co_pi_country": "Switzerland", "is_student": false}]}', 'UHF', 36.00, 'K. Angioli', 6.7, 'P. Norton', 9.4, 'A. Li', 8.8, 32.00);
INSERT INTO public.stage_opencall VALUES ('prop-048', 'Stuck in the trap: finding synchrotron pair halos around pulsars', 'Australia', '{"pi": {"pi_fullname": "Tilly Yoder", "pi_country": "Australia"}, "tech_lead": {"tech_lead_fullname": "Ben Stone", "tech_lead_country": "India"}, "co_pis": [{"co_pi_fullname": "Janice Mcgowan", "co_pi_country": "Australia", "is_student": false}, {"co_pi_fullname": "Wiktor Church", "co_pi_country": "Australia", "is_student": false}, {"co_pi_fullname": "Daniyal Gonzales", "co_pi_country": "Australia", "is_student": false}, {"co_pi_fullname": "Abel Contreras", "co_pi_country": "Australia", "is_student": false}, {"co_pi_fullname": "Janice Mcgowan", "co_pi_country": "Australia", "is_student": false}, {"co_pi_fullname": "Dawson Warren", "co_pi_country": "Australia", "is_student": false}]}', 'X-Band', 24.50, 'A. Li', 7.8, 'N. Katou', 7.4, 'D. Piraino', 8.1, 24.50);
INSERT INTO public.stage_opencall VALUES ('prop-049', 'MeerChoirs: Effects of Group Environment on Galaxy Evolution', 'Ghana', '{"pi": {"pi_fullname": "Brandon Vance", "pi_country": "Ghana"}, "tech_lead": {"tech_lead_fullname": "Tommy Murray", "tech_lead_country": "Switzerland"}, "co_pis": []}', 'L-Band', 36.00, 'P. Norton', 6.0, 'A. Li', 9.7, 'D. Piraino', 7.9, 36.00);
INSERT INTO public.stage_opencall VALUES ('prop-050', 'Chance discovery of two radio galaxies with previously-unknown extended emission', 'United Kingdom', '{"pi": {"pi_fullname": "Mikey Saunders", "pi_country": "United Kingdom"}, "tech_lead": {"tech_lead_fullname": "Alfie Higgins", "tech_lead_country": "China"}, "co_pis": [{"co_pi_fullname": "Seth Curtis", "co_pi_country": "United Kingdom", "is_student": false}]}', 'X-Band', 9.00, 'P. Norton', 6.9, 'K. Angioli', 5.1, 'P. Roosevelt', 5.1, 9.00);
INSERT INTO public.stage_opencall VALUES ('prop-051', 'Using MeerKAT for mapping cosmic shear and searching for cosmic birefringence', 'India', '{"pi": {"pi_fullname": "Ben Stone", "pi_country": "India"}, "tech_lead": {"tech_lead_fullname": "Pedro Parsons", "tech_lead_country": "Australia"}, "co_pis": [{"co_pi_fullname": "Cecilia Hutchinson", "co_pi_country": "India", "is_student": false}, {"co_pi_fullname": "Fatimah Cruz", "co_pi_country": "India", "is_student": false}, {"co_pi_fullname": "Wiktor Church", "co_pi_country": "India", "is_student": false}, {"co_pi_fullname": "Clementine Golden", "co_pi_country": "India", "is_student": false}]}', 'UHF', 11.00, 'P. Norton', 9.1, 'P. Fuentes', 6.7, 'P. Roosevelt', 7.9, 11.00);
INSERT INTO public.stage_opencall VALUES ('prop-052', 'Exploring new regimes in particle acceleration physics: the galaxy cluster pair Abell 141', 'China', '{"pi": {"pi_fullname": "Zaki Harrington", "pi_country": "China"}, "tech_lead": {"tech_lead_fullname": "Bailey David", "tech_lead_country": "Canada"}, "co_pis": [{"co_pi_fullname": "Silas Stein", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Tabitha Lamb", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Andrew Kane", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Sebastien Singleton", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Emilio Garza", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Gregory Leach", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Wiktor Church", "co_pi_country": "China", "is_student": false}]}', 'X-Band', 10.00, 'P. Roosevelt', 7.0, 'K. Angioli', 9.6, 'P. Norton', 7.7, 10.00);
INSERT INTO public.stage_opencall VALUES ('prop-053', 'Searching for evidence of galactic winds in Centaurus A', 'Canada', '{"pi": {"pi_fullname": "Asa Chen", "pi_country": "Canada"}, "tech_lead": {"tech_lead_fullname": "Abel Contreras", "tech_lead_country": "South Africa"}, "co_pis": [{"co_pi_fullname": "Ben Stone", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Alice Conner", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Bruce Bullock", "co_pi_country": "Canada", "is_student": false}]}', 'X-Band', 24.00, 'P. Roosevelt', 9.9, 'A. Li', 6.5, 'N. Katou', 6.7, 24.00);
INSERT INTO public.stage_opencall VALUES ('prop-054', 'Exploring the large scale environment and star formation properties of the Spiderweb proto-cluster at z = 2.17 with MeerKAT', 'Switzerland', '{"pi": {"pi_fullname": "Susie Watkins", "pi_country": "Switzerland"}, "tech_lead": {"tech_lead_fullname": "Abdulrahman Blanchard", "tech_lead_country": "Sweden"}, "co_pis": [{"co_pi_fullname": "Priya Cannon", "co_pi_country": "Switzerland", "is_student": false}, {"co_pi_fullname": "Cecilia Hutchinson", "co_pi_country": "Switzerland", "is_student": false}, {"co_pi_fullname": "Stuart Farrell", "co_pi_country": "Switzerland", "is_student": false}, {"co_pi_fullname": "Herbert Padilla", "co_pi_country": "Switzerland", "is_student": false}, {"co_pi_fullname": "Janice Mcgowan", "co_pi_country": "Switzerland", "is_student": false}]}', 'UHF', 24.00, 'C. Maas', 5.3, 'D. Piraino', 7.6, 'A. Li', 5.6, 24.00);
INSERT INTO public.stage_opencall VALUES ('prop-055', 'Multi-wavelength Real-time Fast Transients with MeerKAT', 'China', '{"pi": {"pi_fullname": "Zaki Harrington", "pi_country": "China"}, "tech_lead": {"tech_lead_fullname": "Wiktor Church", "tech_lead_country": "Portugal"}, "co_pis": [{"co_pi_fullname": "Bailey David", "co_pi_country": "China", "is_student": false}]}', 'X-Band', 34.00, 'N. Katou', 7.9, 'A. Li', 7.1, 'P. Fuentes', 5.9, 27.25);
INSERT INTO public.stage_opencall VALUES ('prop-056', 'MeerKAT - uGMRT Combined Survey of the Saraswati Supercluster: Towards the SKA', 'Spain', '{"pi": {"pi_fullname": "Silas Stein", "pi_country": "Spain"}, "tech_lead": {"tech_lead_fullname": "Asa Chen", "tech_lead_country": "Canada"}, "co_pis": [{"co_pi_fullname": "Omari Winters", "co_pi_country": "Spain", "is_student": false}]}', 'UHF', 82.00, 'K. Angioli', 8.1, 'A. Li', 9.7, 'N. Katou', 9.1, 65.50);
INSERT INTO public.stage_opencall VALUES ('prop-057', 'Neutral Hydrogen emission at z = 0.654 in a strongly-lensed quasar', 'Canada', '{"pi": {"pi_fullname": "Bailey David", "pi_country": "Canada"}, "tech_lead": {"tech_lead_fullname": "Cecilia Hutchinson", "tech_lead_country": "South Africa"}, "co_pis": [{"co_pi_fullname": "Nicolas Rice", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Imran Rubio", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Maisy Dejesus", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Ayah Escobar", "co_pi_country": "Canada", "is_student": false}]}', 'X-Band', 10.50, 'P. Fuentes', 7.7, 'P. Roosevelt', 6.3, 'P. Norton', 7.9, 10.50);
INSERT INTO public.stage_opencall VALUES ('prop-058', 'An X/S of rare radio morphologies?', 'Netherlands', '{"pi": {"pi_fullname": "Alice Conner", "pi_country": "Netherlands"}, "tech_lead": {"tech_lead_fullname": "Andrew Kane", "tech_lead_country": "Portugal"}, "co_pis": [{"co_pi_fullname": "Tabitha Lamb", "co_pi_country": "Netherlands", "is_student": false}, {"co_pi_fullname": "Abraham Beasley", "co_pi_country": "Netherlands", "is_student": false}, {"co_pi_fullname": "Agnes Lambert", "co_pi_country": "Netherlands", "is_student": false}, {"co_pi_fullname": "Tommy Murray", "co_pi_country": "Netherlands", "is_student": false}]}', 'S-Band', 68.50, 'C. Maas', 9.0, 'P. Roosevelt', 9.7, 'K. Angioli', 7.6, 68.50);
INSERT INTO public.stage_opencall VALUES ('prop-059', 'Ultra faint central region of galaxy NGC 1350', 'South Africa', '{"pi": {"pi_fullname": "Abraham Beasley", "pi_country": "South Africa"}, "tech_lead": {"tech_lead_fullname": "Pedro Parsons", "tech_lead_country": "Australia"}, "co_pis": []}', 'X-Band', 5.00, 'N. Katou', 8.6, 'A. Li', 8.1, 'C. Maas', 6.9, 5.00);
INSERT INTO public.stage_opencall VALUES ('prop-060', 'HI study of ultra-diffuse galaxies and galaxy evolution in the central region of Hydra I', 'Canada', '{"pi": {"pi_fullname": "Bailey David", "pi_country": "Canada"}, "tech_lead": {"tech_lead_fullname": "Sebastien Singleton", "tech_lead_country": "Spain"}, "co_pis": [{"co_pi_fullname": "Agnes Lambert", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Tommy Murray", "co_pi_country": "Canada", "is_student": false}]}', 'X-Band', 12.00, 'K. Angioli', 4.6, 'P. Norton', 4.7, 'P. Fuentes', 6.5, 10.75);
INSERT INTO public.stage_opencall VALUES ('prop-061', 'Low frequency follow-up of giant radio galaxies that shouldn''t exist!', 'Ghana', '{"pi": {"pi_fullname": "Martina Bloggs", "pi_country": "Ghana"}, "tech_lead": {"tech_lead_fullname": "Harri Carlson", "tech_lead_country": "Portugal"}, "co_pis": [{"co_pi_fullname": "Mollie Campbell", "co_pi_country": "Ghana", "is_student": false}]}', 'X-Band', 8.00, 'D. Piraino', 9.3, 'P. Fuentes', 5.7, 'C. Maas', 8.5, 8.00);
INSERT INTO public.stage_opencall VALUES ('prop-062', 'MeerKAT deep observation of the X-ray filament', 'Ghana', '{"pi": {"pi_fullname": "Keane Randall", "pi_country": "Ghana"}, "tech_lead": {"tech_lead_fullname": "Priya Cannon", "tech_lead_country": "Australia"}, "co_pis": [{"co_pi_fullname": "Fatimah Cruz", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Jakob Elliott", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Omari Winters", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Zakir Strong", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Kara Trujillo", "co_pi_country": "Ghana", "is_student": false}]}', 'L-Band', 16.00, 'P. Norton', 6.2, 'P. Fuentes', 5.8, 'N. Katou', 9.0, 12.75);
INSERT INTO public.stage_opencall VALUES ('prop-063', 'Low-frequency MeerKAT deep observation of the X-ray filament', 'Australia', '{"pi": {"pi_fullname": "Eddie O''Connor", "pi_country": "Australia"}, "tech_lead": {"tech_lead_fullname": "Alec Dotson", "tech_lead_country": "France"}, "co_pis": [{"co_pi_fullname": "Susie Watkins", "co_pi_country": "Australia", "is_student": false}, {"co_pi_fullname": "Adelaide Villarreal", "co_pi_country": "Australia", "is_student": false}, {"co_pi_fullname": "Bertha Lopez", "co_pi_country": "Australia", "is_student": false}, {"co_pi_fullname": "Ridwan Torres", "co_pi_country": "Australia", "is_student": false}, {"co_pi_fullname": "Amanda Bush", "co_pi_country": "Australia", "is_student": false}, {"co_pi_fullname": "Tasneem Blake", "co_pi_country": "Australia", "is_student": false}]}', 'UHF', 12.00, 'P. Roosevelt', 6.8, 'P. Norton', 7.2, 'N. Katou', 7.7, 10.00);
INSERT INTO public.stage_opencall VALUES ('prop-064', 'Indirect dark matter detection in dwarf galaxies', 'Italy', '{"pi": {"pi_fullname": "Nicolas Rice", "pi_country": "Italy"}, "tech_lead": {"tech_lead_fullname": "Priya Cannon", "tech_lead_country": "Australia"}, "co_pis": [{"co_pi_fullname": "Marshall Lester", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Maisy Dejesus", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Amanda Bush", "co_pi_country": "Italy", "is_student": false}]}', 'X-Band', 70.00, 'K. Angioli', 8.3, 'P. Fuentes', 5.4, 'D. Piraino', 7.3, 70.00);
INSERT INTO public.stage_opencall VALUES ('prop-065', 'Search for neutral Hi gas at Z~ 0.5 with the MeerKat', 'Germany', '{"pi": {"pi_fullname": "Eugene Brock", "pi_country": "Germany"}, "tech_lead": {"tech_lead_fullname": "Eddie O''Connor", "tech_lead_country": "Australia"}, "co_pis": []}', 'UHF', 19.00, 'P. Roosevelt', 5.4, 'K. Angioli', 5.8, 'A. Li', 5.1, 19.00);
INSERT INTO public.stage_opencall VALUES ('prop-066', 'High redshift HI observations and a radio halo in Abell 370', 'Italy', '{"pi": {"pi_fullname": "Nana Shepard", "pi_country": "Italy"}, "tech_lead": {"tech_lead_fullname": "Maia Mccoy", "tech_lead_country": "Sweden"}, "co_pis": [{"co_pi_fullname": "Wiktor Church", "co_pi_country": "Italy", "is_student": false}]}', 'UHF', 12.00, 'P. Norton', 4.8, 'P. Roosevelt', 6.3, 'C. Maas', 8.2, 9.50);
INSERT INTO public.stage_opencall VALUES ('prop-067', 'MeerKAT observations of giant low surface brightness galaxies', 'South Africa', '{"pi": {"pi_fullname": "Aysha Whitaker", "pi_country": "South Africa"}, "tech_lead": {"tech_lead_fullname": "Jakob Elliott", "tech_lead_country": "Spain"}, "co_pis": [{"co_pi_fullname": "Kabir Charles", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Jakob Elliott", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Alys Wright", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Tabitha Lamb", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Herbie Lin", "co_pi_country": "South Africa", "is_student": false}]}', 'X-Band', 49.50, 'D. Piraino', 7.1, 'P. Roosevelt', 9.3, 'P. Norton', 6.6, 49.50);
INSERT INTO public.stage_opencall VALUES ('prop-068', 'Probing star-planet interaction in the Proxima - Proxima b system with MeerKAT', 'Switzerland', '{"pi": {"pi_fullname": "Susie Watkins", "pi_country": "Switzerland"}, "tech_lead": {"tech_lead_fullname": "Amina Edwards", "tech_lead_country": "Sweden"}, "co_pis": [{"co_pi_fullname": "Maisy Dejesus", "co_pi_country": "Switzerland", "is_student": false}, {"co_pi_fullname": "Eugene Brock", "co_pi_country": "Switzerland", "is_student": false}, {"co_pi_fullname": "Arron Simpson", "co_pi_country": "Switzerland", "is_student": false}, {"co_pi_fullname": "Maximillian Walker", "co_pi_country": "Switzerland", "is_student": false}, {"co_pi_fullname": "Agnes Lambert", "co_pi_country": "Switzerland", "is_student": false}, {"co_pi_fullname": "Kylie Logan", "co_pi_country": "Switzerland", "is_student": false}]}', 'L-Band', 18.00, 'A. Li', 8.6, 'K. Angioli', 6.9, 'D. Piraino', 9.5, 16.25);
INSERT INTO public.stage_opencall VALUES ('prop-069', 'CATCHING CLUES OF THE ENERGY TRANSPORT BY JET/WINDSIN THE NORTH TRANSITION REGION OF CENTAURUS A', 'Spain', '{"pi": {"pi_fullname": "Jakob Elliott", "pi_country": "Spain"}, "tech_lead": {"tech_lead_fullname": "Cian Santana", "tech_lead_country": "Portugal"}, "co_pis": [{"co_pi_fullname": "Wayne Palmer", "co_pi_country": "Spain", "is_student": false}, {"co_pi_fullname": "Bailey David", "co_pi_country": "Spain", "is_student": false}, {"co_pi_fullname": "Bruce Bullock", "co_pi_country": "Spain", "is_student": false}, {"co_pi_fullname": "Tommy Murray", "co_pi_country": "Spain", "is_student": false}, {"co_pi_fullname": "Susie Watkins", "co_pi_country": "Spain", "is_student": false}]}', 'UHF', 9.00, 'P. Fuentes', 8.2, 'D. Piraino', 9.9, 'N. Katou', 5.4, 9.00);
INSERT INTO public.stage_opencall VALUES ('prop-070', 'Investigating gamma-ray emitting radio galaxies', 'Italy', '{"pi": {"pi_fullname": "Nicolas Rice", "pi_country": "Italy"}, "tech_lead": {"tech_lead_fullname": "Olivia Moreno", "tech_lead_country": "Germany"}, "co_pis": [{"co_pi_fullname": "Sebastien Singleton", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Nicolas Rice", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Zakir Strong", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Sebastien Singleton", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Hasan Phillips", "co_pi_country": "Italy", "is_student": false}]}', 'UHF', 4.00, 'P. Roosevelt', 9.4, 'D. Piraino', 5.9, 'C. Maas', 9.1, 3.00);
INSERT INTO public.stage_opencall VALUES ('prop-082', 'A MeerKAT HI-line study of Local Volume dwarf galaxies', 'South Africa', '{"pi": {"pi_fullname": "Abel Contreras", "pi_country": "South Africa"}, "tech_lead": {"tech_lead_fullname": "Tasneem Blake", "tech_lead_country": "Germany"}, "co_pis": [{"co_pi_fullname": "Clementine Golden", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Barbara Baird", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Wiktor Church", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Jakob Elliott", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Barbara Baird", "co_pi_country": "South Africa", "is_student": false}]}', 'S-Band', 39.00, 'A. Li', 6.1, 'P. Norton', 7.9, 'P. Roosevelt', 7.9, 39.00);
INSERT INTO public.stage_opencall VALUES ('prop-071', 'Investigating the properties of localised Fast Radio Bursts and their host galaxies', 'Portugal', '{"pi": {"pi_fullname": "Wiktor Church", "pi_country": "Portugal"}, "tech_lead": {"tech_lead_fullname": "Adelaide Villarreal", "tech_lead_country": "South Africa"}, "co_pis": [{"co_pi_fullname": "Aysha Whitaker", "co_pi_country": "Portugal", "is_student": false}, {"co_pi_fullname": "Jennie Newton", "co_pi_country": "Portugal", "is_student": false}, {"co_pi_fullname": "Kabir Charles", "co_pi_country": "Portugal", "is_student": false}, {"co_pi_fullname": "Omari Winters", "co_pi_country": "Portugal", "is_student": false}, {"co_pi_fullname": "Gwen Stuart", "co_pi_country": "Portugal", "is_student": false}, {"co_pi_fullname": "Elaine Jimenez", "co_pi_country": "Portugal", "is_student": false}, {"co_pi_fullname": "Abraham Beasley", "co_pi_country": "Portugal", "is_student": false}]}', 'S-Band', 49.00, 'K. Angioli', 6.5, 'P. Roosevelt', 7.7, 'A. Li', 5.5, 49.00);
INSERT INTO public.stage_opencall VALUES ('prop-072', 'Early Radio Emission from Tidal Disruption Events', 'Canada', '{"pi": {"pi_fullname": "Bailey David", "pi_country": "Canada"}, "tech_lead": {"tech_lead_fullname": "Priya Cannon", "tech_lead_country": "Australia"}, "co_pis": [{"co_pi_fullname": "Laurence Reid", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Ridwan Torres", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Olivia Moreno", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Daniyal Gonzales", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Agnes Lambert", "co_pi_country": "Canada", "is_student": false}]}', 'S-Band', 32.00, 'P. Roosevelt', 7.0, 'P. Norton', 7.7, 'N. Katou', 5.8, 25.50);
INSERT INTO public.stage_opencall VALUES ('prop-073', 'Duty cycle and energetics of the remnant radio galaxy MIDAS J2253-3446', 'Italy', '{"pi": {"pi_fullname": "Nana Shepard", "pi_country": "Italy"}, "tech_lead": {"tech_lead_fullname": "Mike Matthews", "tech_lead_country": "Canada"}, "co_pis": [{"co_pi_fullname": "Ashwin Barker", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Effie Fitzpatrick", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Tilly Yoder", "co_pi_country": "Italy", "is_student": false}, {"co_pi_fullname": "Howard Koch", "co_pi_country": "Italy", "is_student": false}]}', 'L-Band', 3.50, 'P. Norton', 7.7, 'P. Fuentes', 7.2, 'N. Katou', 9.7, 3.00);
INSERT INTO public.stage_opencall VALUES ('prop-074', 'Resolving the mystery of a candidate Dark Galaxy', 'China', '{"pi": {"pi_fullname": "Alfie Higgins", "pi_country": "China"}, "tech_lead": {"tech_lead_fullname": "Stuart Farrell", "tech_lead_country": "Australia"}, "co_pis": [{"co_pi_fullname": "Daniyal Gonzales", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Amanda Bush", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Honey Campos", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Elaine Jimenez", "co_pi_country": "China", "is_student": false}, {"co_pi_fullname": "Martina Bloggs", "co_pi_country": "China", "is_student": false}]}', 'L-Band', 12.00, 'A. Li', 6.1, 'P. Norton', 5.6, 'P. Fuentes', 7.1, 9.50);
INSERT INTO public.stage_opencall VALUES ('prop-075', 'Magnetization and kinematics in Circumgalactic Medium: Tidal vs. Gas Accretion', 'South Africa', '{"pi": {"pi_fullname": "Ridwan Torres", "pi_country": "South Africa"}, "tech_lead": {"tech_lead_fullname": "Harri Carlson", "tech_lead_country": "Portugal"}, "co_pis": [{"co_pi_fullname": "Jennie Newton", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Effie Fitzpatrick", "co_pi_country": "South Africa", "is_student": false}]}', 'X-Band', 22.00, 'D. Piraino', 5.1, 'P. Roosevelt', 5.7, 'K. Angioli', 9.2, 22.00);
INSERT INTO public.stage_opencall VALUES ('prop-076', 'Formation of Gamma Ray Bursts in interacting galaxies', 'Canada', '{"pi": {"pi_fullname": "Bailey David", "pi_country": "Canada"}, "tech_lead": {"tech_lead_fullname": "Stuart Farrell", "tech_lead_country": "Australia"}, "co_pis": [{"co_pi_fullname": "Dawid Fleming", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Honey Campos", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Ellen Abbott", "co_pi_country": "Canada", "is_student": false}, {"co_pi_fullname": "Sebastien Singleton", "co_pi_country": "Canada", "is_student": false}]}', 'UHF', 36.00, 'P. Fuentes', 6.5, 'K. Angioli', 7.2, 'A. Li', 7.7, 32.00);
INSERT INTO public.stage_opencall VALUES ('prop-077', 'Search for Diffuse Radio Emission in SZ selected Galaxy Clusters in the Southern Hemisphere with the MeerKAT', 'Portugal', '{"pi": {"pi_fullname": "Ida Mullins", "pi_country": "Portugal"}, "tech_lead": {"tech_lead_fullname": "Asa Chen", "tech_lead_country": "Canada"}, "co_pis": [{"co_pi_fullname": "Adelaide Villarreal", "co_pi_country": "Portugal", "is_student": false}, {"co_pi_fullname": "Amina Edwards", "co_pi_country": "Portugal", "is_student": false}]}', 'X-Band', 24.00, 'C. Maas', 5.6, 'P. Fuentes', 8.1, 'K. Angioli', 7.6, 21.50);
INSERT INTO public.stage_opencall VALUES ('prop-078', 'Delineate the Fermi bubbles at radio with MeerKAT: a pilot study', 'France', '{"pi": {"pi_fullname": "Ayah Escobar", "pi_country": "France"}, "tech_lead": {"tech_lead_fullname": "Priya Cannon", "tech_lead_country": "Australia"}, "co_pis": [{"co_pi_fullname": "Tilly Yoder", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Sebastien Singleton", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Clementine Golden", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Marshall Lester", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Honey Campos", "co_pi_country": "France", "is_student": false}, {"co_pi_fullname": "Martina Bloggs", "co_pi_country": "France", "is_student": false}]}', 'X-Band', 40.00, 'P. Fuentes', 6.6, 'P. Norton', 6.4, 'N. Katou', 7.0, 40.00);
INSERT INTO public.stage_opencall VALUES ('prop-079', 'Isolated dwarf galaxies dominated by baryons', 'Ghana', '{"pi": {"pi_fullname": "Brandon Vance", "pi_country": "Ghana"}, "tech_lead": {"tech_lead_fullname": "Gregory Leach", "tech_lead_country": "Germany"}, "co_pis": [{"co_pi_fullname": "Wayne Palmer", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Vinny Powers", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Eugene Brock", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Agnes Lambert", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Tommy Murray", "co_pi_country": "Ghana", "is_student": false}, {"co_pi_fullname": "Zoe Sweeney", "co_pi_country": "Ghana", "is_student": false}]}', 'L-Band', 36.00, 'C. Maas', 8.1, 'P. Roosevelt', 5.3, 'N. Katou', 8.1, 36.00);
INSERT INTO public.stage_opencall VALUES ('prop-080', 'HI line imaging of NGC 5846 group', 'Switzerland', '{"pi": {"pi_fullname": "Susie Watkins", "pi_country": "Switzerland"}, "tech_lead": {"tech_lead_fullname": "Kylie Logan", "tech_lead_country": "Germany"}, "co_pis": [{"co_pi_fullname": "Maximillian Walker", "co_pi_country": "Switzerland", "is_student": false}, {"co_pi_fullname": "Lochlan Mack", "co_pi_country": "Switzerland", "is_student": false}, {"co_pi_fullname": "Keane Randall", "co_pi_country": "Switzerland", "is_student": false}, {"co_pi_fullname": "Alys Wright", "co_pi_country": "Switzerland", "is_student": false}]}', 'S-Band', 89.00, 'N. Katou', 6.6, 'D. Piraino', 8.7, 'C. Maas', 6.1, 71.25);
INSERT INTO public.stage_opencall VALUES ('prop-081', 'To map the Warm Ionized Medium in the Galaxy using MeerKAT and FAST', 'Sweden', '{"pi": {"pi_fullname": "Blaine Hansen", "pi_country": "Sweden"}, "tech_lead": {"tech_lead_fullname": "Cian Santana", "tech_lead_country": "Portugal"}, "co_pis": [{"co_pi_fullname": "Mikey Saunders", "co_pi_country": "Sweden", "is_student": false}]}', 'S-Band', 8.00, 'P. Fuentes', 9.0, 'P. Norton', 6.5, 'P. Roosevelt', 9.9, 7.00);
INSERT INTO public.stage_opencall VALUES ('prop-084', 'Accelerated evolution in the densest groups of galaxies: MeerKAT imaging of the missing HI', 'Australia', '{"pi": {"pi_fullname": "Tilly Yoder", "pi_country": "Australia"}, "tech_lead": {"tech_lead_fullname": "Mike Matthews", "tech_lead_country": "Canada"}, "co_pis": [{"co_pi_fullname": "Stuart Farrell", "co_pi_country": "Australia", "is_student": false}, {"co_pi_fullname": "Cian Santana", "co_pi_country": "Australia", "is_student": false}]}', 'S-Band', 37.50, 'C. Maas', 4.9, 'D. Piraino', 6.7, 'P. Roosevelt', 7.5, 37.50);
INSERT INTO public.stage_opencall VALUES ('prop-085', 'MeerKAT observations of the ridge connecting the galaxy clusters pair A399-A401', 'United Kingdom', '{"pi": {"pi_fullname": "Fatimah Cruz", "pi_country": "United Kingdom"}, "tech_lead": {"tech_lead_fullname": "Maariyah Harding", "tech_lead_country": "Australia"}, "co_pis": [{"co_pi_fullname": "Harri Carlson", "co_pi_country": "United Kingdom", "is_student": false}, {"co_pi_fullname": "Dawid Fleming", "co_pi_country": "United Kingdom", "is_student": false}, {"co_pi_fullname": "Honey Campos", "co_pi_country": "United Kingdom", "is_student": false}, {"co_pi_fullname": "Olivia Moreno", "co_pi_country": "United Kingdom", "is_student": false}, {"co_pi_fullname": "Honey Campos", "co_pi_country": "United Kingdom", "is_student": false}]}', 'X-Band', 52.00, 'A. Li', 6.6, 'P. Roosevelt', 9.7, 'N. Katou', 6.2, 41.50);
INSERT INTO public.stage_opencall VALUES ('prop-086', 'A Southern Radio Survey of the Fast Blue Optical Transients', 'Australia', '{"pi": {"pi_fullname": "Pedro Parsons", "pi_country": "Australia"}, "tech_lead": {"tech_lead_fullname": "Janice Mcgowan", "tech_lead_country": "Netherlands"}, "co_pis": [{"co_pi_fullname": "Mikey Saunders", "co_pi_country": "Australia", "is_student": false}, {"co_pi_fullname": "Gwen Stuart", "co_pi_country": "Australia", "is_student": false}, {"co_pi_fullname": "Jakob Elliott", "co_pi_country": "Australia", "is_student": false}]}', 'X-Band', 13.50, 'N. Katou', 8.9, 'C. Maas', 5.8, 'P. Roosevelt', 9.4, 13.50);
INSERT INTO public.stage_opencall VALUES ('prop-087', 'HI intensity mapping with MeerKAT: Hunting down the power spectrum', 'South Africa', '{"pi": {"pi_fullname": "Aysha Whitaker", "pi_country": "South Africa"}, "tech_lead": {"tech_lead_fullname": "Bruce Bullock", "tech_lead_country": "United Kingdom"}, "co_pis": [{"co_pi_fullname": "Aysha Whitaker", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Howard Koch", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Nicolas Rice", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Tabitha Lamb", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Amanda Bush", "co_pi_country": "South Africa", "is_student": false}, {"co_pi_fullname": "Fatimah Cruz", "co_pi_country": "South Africa", "is_student": false}]}', 'L-Band', 85.00, 'N. Katou', 5.6, 'C. Maas', 8.9, 'P. Norton', 9.8, 68.00);


--
-- TOC entry 2192 (class 0 OID 0)
-- Dependencies: 188
-- Name: dim_country_id_dim_country_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dim_country_id_dim_country_seq', 1, false);


--
-- TOC entry 2193 (class 0 OID 0)
-- Dependencies: 190
-- Name: dim_observation_band_id_dim_observation_band_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dim_observation_band_id_dim_observation_band_seq', 1, false);


--
-- TOC entry 2194 (class 0 OID 0)
-- Dependencies: 186
-- Name: dim_proposal_id_dim_proposal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dim_proposal_id_dim_proposal_seq', 1, false);


--
-- TOC entry 2195 (class 0 OID 0)
-- Dependencies: 192
-- Name: dim_reviewer_id_dim_reviewer_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dim_reviewer_id_dim_reviewer_seq', 1, false);


--
-- TOC entry 2045 (class 1259 OID 24599)
-- Name: idx_dim_country_lookup; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dim_country_lookup ON public.dim_country USING btree (country);


--
-- TOC entry 2046 (class 1259 OID 24600)
-- Name: idx_dim_country_tk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dim_country_tk ON public.dim_country USING btree (id_dim_country);


--
-- TOC entry 2047 (class 1259 OID 24607)
-- Name: idx_dim_observation_band_lookup; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dim_observation_band_lookup ON public.dim_observation_band USING btree (observation_band);


--
-- TOC entry 2048 (class 1259 OID 24608)
-- Name: idx_dim_observation_band_tk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dim_observation_band_tk ON public.dim_observation_band USING btree (id_dim_observation_band);


--
-- TOC entry 2043 (class 1259 OID 24591)
-- Name: idx_dim_proposal_lookup; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dim_proposal_lookup ON public.dim_proposal USING btree (proposal_id);


--
-- TOC entry 2044 (class 1259 OID 24592)
-- Name: idx_dim_proposal_tk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dim_proposal_tk ON public.dim_proposal USING btree (id_dim_proposal);


--
-- TOC entry 2049 (class 1259 OID 24615)
-- Name: idx_dim_reviewer_lookup; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dim_reviewer_lookup ON public.dim_reviewer USING btree (reviewer);


--
-- TOC entry 2050 (class 1259 OID 24616)
-- Name: idx_dim_reviewer_tk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dim_reviewer_tk ON public.dim_reviewer USING btree (id_dim_reviewer);


-- Completed on 2023-01-24 20:53:04

--
-- PostgreSQL database dump complete
--

