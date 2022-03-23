--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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
-- Name: coach_seat_setter(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.coach_seat_setter() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF mod(NEW.seat_no,8) = 1 or mod(NEW.seat_no,8) = 4  THEN
        new."Max_count" := 1;
        new."Berth_position" := 'LB';
        new."Status":='CNF';

    ELSEIF mod(NEW.seat_no,8) = 2 or mod(NEW.seat_no,8) = 5  THEN
        new."Max_count" := 1;
        new."Berth_position" := 'MB';
        new."Status":='CNF';

    ELSEIF mod(NEW.seat_no,8) = 3 or mod(NEW.seat_no,8) = 6  THEN
        new."Max_count" := 1;
        new."Berth_position" := 'UB';
        new."Status":='CNF';

    ELSEIF mod(NEW.seat_no,8) = 7  THEN
        new."Max_count" := 2;
        new."Berth_position" := 'SL';
        new."Status":='RAC';

    ELSE
        new."Max_count" := 1;
        new."Berth_position" := 'SU';
        new."Status":='CNF';
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.coach_seat_setter() OWNER TO postgres;

--
-- Name: reassign(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.reassign() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    declare waiting_serialNo integer := 0;
    begin
        waiting_serialNo := (select "Not_confirm".serial_no
                             from "Not_confirm" order by time limit 1);
        if new.berth_status = true and waiting_serialNo != 0 then
                update passengers set
                                      seat_no = new.seat_no,berth_status = 'CNF',
                                      berth_position = new."Berth_position"
                where serial_no =  waiting_serialNo;
                update coach_table set "Max_count" = "Max_count"-1 where "Max_count" >= 1 and seat_no  = new.seat_no;
                update coach_table set berth_status = false where seat_no = new.seat_no and "Max_count" = 0;

                delete from "Not_confirm" where serial_no = waiting_serialNo;
        end if;
    return new;
    end;
    $$;


ALTER FUNCTION public.reassign() OWNER TO postgres;

--
-- Name: update_status(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_status() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
    update coach_table set berth_status = TRUE
    where coach_table.seat_no = old.seat_no;
    update coach_table set "Max_count" = "Max_count"+1
    where coach_table.seat_no = old.seat_no;
    return old;
    end;
$$;


ALTER FUNCTION public.update_status() OWNER TO postgres;

--
-- Name: waiting_list(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.waiting_list() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    if new.berth_status = 'RAC' or new.berth_status = 'WL' then
        SET timezone = 'Asia/Kolkata';
        insert into "Not_confirm"(serial_no, status,time)VALUES (new.serial_no,new.berth_status,now());
    end if;
    return new;
end
$$;


ALTER FUNCTION public.waiting_list() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Not_confirm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Not_confirm" (
    serial_no integer NOT NULL,
    status character varying(3) NOT NULL,
    "time" timestamp with time zone NOT NULL
);


ALTER TABLE public."Not_confirm" OWNER TO postgres;

--
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin (
    name character varying(50) NOT NULL,
    password character varying(20),
    "Admin_code" integer DEFAULT 532 NOT NULL,
    "admin_phNo." character varying(10) NOT NULL
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- Name: coach_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coach_table (
    seat_no integer NOT NULL,
    berth_status boolean DEFAULT true,
    "Max_count" integer NOT NULL,
    "Status" character varying(3),
    "Berth_position" character varying(3)
);


ALTER TABLE public.coach_table OWNER TO postgres;

--
-- Name: coach_table_seat_no_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coach_table_seat_no_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coach_table_seat_no_seq OWNER TO postgres;

--
-- Name: coach_table_seat_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coach_table_seat_no_seq OWNED BY public.coach_table.seat_no;


--
-- Name: passengers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passengers (
    serial_no integer NOT NULL,
    name character varying(100) NOT NULL,
    age integer NOT NULL,
    phone_number character varying(10) NOT NULL,
    seat_no integer,
    berth_position character varying,
    berth_status character varying(3),
    pnr_no character varying(7) NOT NULL,
    user_id character varying(7) NOT NULL
);


ALTER TABLE public.passengers OWNER TO postgres;

--
-- Name: passengers_serial_no_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.passengers_serial_no_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.passengers_serial_no_seq OWNER TO postgres;

--
-- Name: passengers_serial_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.passengers_serial_no_seq OWNED BY public.passengers.serial_no;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    pnr_no character varying(7) NOT NULL,
    user_name character varying(100) NOT NULL,
    password character varying(20) NOT NULL,
    age bigint NOT NULL,
    phone_number character varying(10) NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: coach_table seat_no; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coach_table ALTER COLUMN seat_no SET DEFAULT nextval('public.coach_table_seat_no_seq'::regclass);


--
-- Name: passengers serial_no; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passengers ALTER COLUMN serial_no SET DEFAULT nextval('public.passengers_serial_no_seq'::regclass);


--
-- Data for Name: Not_confirm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Not_confirm" (serial_no, status, "time") FROM stdin;
41	RAC	2022-03-23 19:43:52.694658+05:30
\.


--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin (name, password, "Admin_code", "admin_phNo.") FROM stdin;
AdminAakash	Aakash@ad#12	532	9626380548
\.


--
-- Data for Name: coach_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coach_table (seat_no, berth_status, "Max_count", "Status", "Berth_position") FROM stdin;
3	f	1	CNF	UB
5	f	0	CNF	MB
10	f	0	CNF	MB
7	t	1	RAC	SL
8	f	1	CNF	SU
1	t	1	CNF	LB
4	t	1	CNF	LB
2	t	1	CNF	MB
9	t	1	CNF	LB
6	t	1	CNF	UB
\.


--
-- Data for Name: passengers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.passengers (serial_no, name, age, phone_number, seat_no, berth_position, berth_status, pnr_no, user_id) FROM stdin;
36	NewOne	20	7072011083	3	UB	CNF	4565458	2570584
37	Deepak	22	7072011083	5	MB	CNF	3602384	2570584
38	deepa	20	8078711083	10	MB	CNF	3602384	2570584
40	test	20	7072011083	8	SU	CNF	4565458	2570584
41	test2	21	7072011083	7	SL	RAC	4565457	2570584
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (pnr_no, user_name, password, age, phone_number) FROM stdin;
2570584	Aakash	Aakash@26	12	8072011083
4567895	Arun	Arun@15	80	1252585258
\.


--
-- Name: coach_table_seat_no_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coach_table_seat_no_seq', 10, true);


--
-- Name: passengers_serial_no_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.passengers_serial_no_seq', 41, true);


--
-- Name: passengers passengers_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passengers
    ADD CONSTRAINT passengers_pk PRIMARY KEY (serial_no);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (pnr_no);


--
-- Name: passengers cancel_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER cancel_trigger AFTER DELETE ON public.passengers FOR EACH ROW EXECUTE FUNCTION public.update_status();


--
-- Name: coach_table coach_setter; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER coach_setter BEFORE INSERT ON public.coach_table FOR EACH ROW EXECUTE FUNCTION public.coach_seat_setter();


--
-- Name: coach_table reassign_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER reassign_trigger AFTER INSERT OR UPDATE ON public.coach_table FOR EACH ROW EXECUTE FUNCTION public.reassign();


--
-- Name: passengers waiting_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER waiting_trigger AFTER INSERT ON public.passengers FOR EACH ROW EXECUTE FUNCTION public.waiting_list();


--
-- Name: Not_confirm not_confirm_passengers_serial_no_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Not_confirm"
    ADD CONSTRAINT not_confirm_passengers_serial_no_fk FOREIGN KEY (serial_no) REFERENCES public.passengers(serial_no) ON DELETE CASCADE;


--
-- Name: passengers passengers_user_pnr_no_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passengers
    ADD CONSTRAINT passengers_user_pnr_no_fk FOREIGN KEY (user_id) REFERENCES public."user"(pnr_no) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

