--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

-- Started on 2022-09-08 22:57:33 -05

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
-- TOC entry 2 (class 3079 OID 20758)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- TOC entry 3071 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 29407)
-- Name: cart; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.cart (
    id integer NOT NULL,
    token_cart character varying(120) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.cart OWNER TO test;

--
-- TOC entry 209 (class 1259 OID 29405)
-- Name: cart_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_id_seq OWNER TO test;

--
-- TOC entry 3072 (class 0 OID 0)
-- Dependencies: 209
-- Name: cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.cart_id_seq OWNED BY public.cart.id;


--
-- TOC entry 208 (class 1259 OID 29393)
-- Name: cart_item; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.cart_item (
    id integer NOT NULL,
    product_id integer DEFAULT 0 NOT NULL,
    cart_id character varying NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "cartId" integer
);


ALTER TABLE public.cart_item OWNER TO test;

--
-- TOC entry 207 (class 1259 OID 29391)
-- Name: cart_item_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.cart_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_item_id_seq OWNER TO test;

--
-- TOC entry 3073 (class 0 OID 0)
-- Dependencies: 207
-- Name: cart_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.cart_item_id_seq OWNED BY public.cart_item.id;


--
-- TOC entry 204 (class 1259 OID 29365)
-- Name: category; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.category (
    id integer NOT NULL,
    category_id integer DEFAULT 0 NOT NULL,
    name character varying(120) NOT NULL,
    icon character varying(120) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.category OWNER TO test;

--
-- TOC entry 203 (class 1259 OID 29363)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO test;

--
-- TOC entry 3074 (class 0 OID 0)
-- Dependencies: 203
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 206 (class 1259 OID 29376)
-- Name: product; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.product (
    id integer NOT NULL,
    product_id integer DEFAULT 0 NOT NULL,
    name character varying(120) NOT NULL,
    "time" character varying(120) NOT NULL,
    qualification numeric DEFAULT '0'::numeric NOT NULL,
    price numeric DEFAULT '0'::numeric NOT NULL,
    image character varying(120) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "categoryId" integer DEFAULT 0 NOT NULL,
    category_id character varying DEFAULT 'none'::character varying NOT NULL
);


ALTER TABLE public.product OWNER TO test;

--
-- TOC entry 205 (class 1259 OID 29374)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO test;

--
-- TOC entry 3075 (class 0 OID 0)
-- Dependencies: 205
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 2919 (class 2604 OID 29410)
-- Name: cart id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.cart ALTER COLUMN id SET DEFAULT nextval('public.cart_id_seq'::regclass);


--
-- TOC entry 2915 (class 2604 OID 29396)
-- Name: cart_item id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.cart_item ALTER COLUMN id SET DEFAULT nextval('public.cart_item_id_seq'::regclass);


--
-- TOC entry 2903 (class 2604 OID 29368)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 2907 (class 2604 OID 29379)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 3065 (class 0 OID 29407)
-- Dependencies: 210
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.cart (id, token_cart, "createdAt", "updatedAt") FROM stdin;
1	d3241329-5211-44e0-a2f2-eca3db8595e8	2022-09-08 22:40:02.209851	2022-09-08 22:40:02.209851
2	c7346a31-4416-44c7-bc18-f00018e482ac	2022-09-08 22:40:02.7651	2022-09-08 22:40:02.7651
3	985e445d-d0f3-400e-ad99-95c21bd5c940	2022-09-08 22:40:02.834006	2022-09-08 22:40:02.834006
4	f32928a8-8197-4639-9486-c604b5768e73	2022-09-08 22:40:26.583787	2022-09-08 22:40:26.583787
5	f04cbca9-38ca-47ad-89bb-e8f18f8caf94	2022-09-08 22:40:27.042802	2022-09-08 22:40:27.042802
6	8f9c8151-ee5d-4699-9ca0-70b83346ab29	2022-09-08 22:43:41.172148	2022-09-08 22:43:41.172148
7	8ab0c727-ef29-4db6-a9dd-324fdcaf5122	2022-09-08 22:43:41.194847	2022-09-08 22:43:41.194847
8	9ecb0a2d-227a-46d4-afb2-0c6ab99c2eb3	2022-09-08 22:43:41.927224	2022-09-08 22:43:41.927224
9	8448f7cb-f465-4b95-a4c6-fd4837797c34	2022-09-08 22:47:11.132902	2022-09-08 22:47:11.132902
10	348a7039-3a15-49ef-9692-d9d2a78db710	2022-09-08 22:47:12.413976	2022-09-08 22:47:12.413976
11	c2e5f7a2-866f-4e52-8534-f20cc5c86c54	2022-09-08 22:50:12.710985	2022-09-08 22:50:12.710985
12	d8e63733-fa0e-4817-baf4-b13e8cdf999c	2022-09-08 22:50:13.204153	2022-09-08 22:50:13.204153
13	369282ed-9b2a-4a2d-bc16-7c3d26046048	2022-09-08 22:50:21.054738	2022-09-08 22:50:21.054738
14	5ae1da47-ab9f-495c-8e4d-494be88fa4e5	2022-09-08 22:50:21.418148	2022-09-08 22:50:21.418148
15	edfa6500-88bd-4fa3-a352-d9f27f6852ab	2022-09-08 22:50:34.513258	2022-09-08 22:50:34.513258
16	586f348f-a492-47d7-8b20-e1291dae16de	2022-09-08 22:50:34.981299	2022-09-08 22:50:34.981299
17	b47eefd9-142a-4096-b0e1-b4ed4e614fe5	2022-09-08 22:53:06.70989	2022-09-08 22:53:06.70989
18	356b60b2-08eb-4912-9eb1-8a55b3bd5462	2022-09-08 22:53:18.305017	2022-09-08 22:53:18.305017
19	c13bfef4-7d93-482d-9574-0598aea9238d	2022-09-08 22:53:18.7702	2022-09-08 22:53:18.7702
20	5d29f84e-83df-44cf-b204-3242077c4687	2022-09-08 22:54:10.562622	2022-09-08 22:54:10.562622
21	77fee680-9613-4167-9d13-6609ff30d948	2022-09-08 22:54:26.591351	2022-09-08 22:54:26.591351
22	eabff9f7-90c2-47a7-b53b-74a469984cda	2022-09-08 22:54:36.840327	2022-09-08 22:54:36.840327
23	3ea9f3d5-cb51-4142-b8df-75f0ef3aabd9	2022-09-08 22:54:37.308901	2022-09-08 22:54:37.308901
24	5043e8b8-b973-4024-88f1-30486029a0e4	2022-09-08 22:54:41.028946	2022-09-08 22:54:41.028946
25	78de4e15-2e84-4cc6-93fb-f8803de009fb	2022-09-08 22:54:47.841674	2022-09-08 22:54:47.841674
\.


--
-- TOC entry 3063 (class 0 OID 29393)
-- Dependencies: 208
-- Data for Name: cart_item; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.cart_item (id, product_id, cart_id, "createdAt", "updatedAt", "cartId") FROM stdin;
1	1	586f348f-a492-47d7-8b20-e1291dae16de	2022-09-08 22:50:39.814015	2022-09-08 22:50:39.814015	\N
2	1	c13bfef4-7d93-482d-9574-0598aea9238d	2022-09-08 22:53:23.726689	2022-09-08 22:53:23.726689	\N
3	2	c13bfef4-7d93-482d-9574-0598aea9238d	2022-09-08 22:53:38.477235	2022-09-08 22:53:38.477235	\N
4	1	3ea9f3d5-cb51-4142-b8df-75f0ef3aabd9	2022-09-08 22:54:38.745005	2022-09-08 22:54:38.745005	\N
5	2	5043e8b8-b973-4024-88f1-30486029a0e4	2022-09-08 22:54:45.250808	2022-09-08 22:54:45.250808	\N
\.


--
-- TOC entry 3059 (class 0 OID 29365)
-- Dependencies: 204
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.category (id, category_id, name, icon, "createdAt", "updatedAt") FROM stdin;
1	1	All	https://image.flaticon.com/icons/svg/701/701965.svg	2022-09-08 22:39:59.714302	2022-09-08 22:39:59.714302
2	2	Pizza	https://image.flaticon.com/icons/svg/599/599995.svg	2022-09-08 22:39:59.722704	2022-09-08 22:39:59.722704
3	3	Asian	https://image.flaticon.com/icons/svg/1895/1895684.svg	2022-09-08 22:39:59.725037	2022-09-08 22:39:59.725037
4	4	Burgers	https://image.flaticon.com/icons/svg/883/883806.svg	2022-09-08 22:39:59.727261	2022-09-08 22:39:59.727261
5	5	Barbecue	https://image.flaticon.com/icons/svg/933/933310.svg	2022-09-08 22:39:59.72942	2022-09-08 22:39:59.72942
6	6	Dessers	https://image.flaticon.com/icons/svg/174/174394.svg	2022-09-08 22:39:59.731536	2022-09-08 22:39:59.731536
7	7	Thai	https://image.flaticon.com/icons/svg/135/135367.svg	2022-09-08 22:39:59.733599	2022-09-08 22:39:59.733599
8	8	Sushi	https://image.flaticon.com/icons/svg/1900/1900683.svg	2022-09-08 22:39:59.735729	2022-09-08 22:39:59.735729
\.


--
-- TOC entry 3061 (class 0 OID 29376)
-- Dependencies: 206
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.product (id, product_id, name, "time", qualification, price, image, "createdAt", "updatedAt", "categoryId", category_id) FROM stdin;
1	1	Filete de ternera con salsa	25-30min	4.9	14.99	https://images.pexels.com/photos/675951/pexels-photo-675951.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=226&w=440	2022-09-08 22:39:59.739086	2022-09-08 22:39:59.739086	6	none
2	2	Desayuno de primer plano lácteos	20-25min	4.7	9.99	https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=226&w=440	2022-09-08 22:39:59.743275	2022-09-08 22:39:59.743275	1	none
3	3	Burrito de pollo	25-30min	4.6	13.99	https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=226&w=440	2022-09-08 22:39:59.746663	2022-09-08 22:39:59.746663	4	none
4	4	Plato de salmón	25-30min	4.5	15.99	https://images.pexels.com/photos/46239/salmon-dish-food-meal-46239.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=226&w=440	2022-09-08 22:39:59.749826	2022-09-08 22:39:59.749826	2	none
5	5	Postre	15-20min	4.8	6.99	https://images.pexels.com/photos/1099680/pexels-photo-1099680.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=226&w=440	2022-09-08 22:39:59.752868	2022-09-08 22:39:59.752868	3	none
6	6	Sándwich servido en la tabla de cortar	10-15min	4.7	9.99	https://images.pexels.com/photos/1600711/pexels-zphoto-1600711.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=226&w=440	2022-09-08 22:39:59.755799	2022-09-08 22:39:59.755799	7	none
7	7	Plato de aguacate cocido	15-25min	4.4	12.99	https://images.pexels.com/photos/262959/pexels-photo-262959.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=226&w=440	2022-09-08 22:39:59.758757	2022-09-08 22:39:59.758757	2	none
8	8	Hamburguesa	10-15min	4.6	14.99	https://images.pexels.com/photos/156114/pexels-photo-156114.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=226&w=440	2022-09-08 22:39:59.761897	2022-09-08 22:39:59.761897	4	none
\.


--
-- TOC entry 3076 (class 0 OID 0)
-- Dependencies: 209
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.cart_id_seq', 25, true);


--
-- TOC entry 3077 (class 0 OID 0)
-- Dependencies: 207
-- Name: cart_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.cart_item_id_seq', 5, true);


--
-- TOC entry 3078 (class 0 OID 0)
-- Dependencies: 203
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.category_id_seq', 8, true);


--
-- TOC entry 3079 (class 0 OID 0)
-- Dependencies: 205
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.product_id_seq', 8, true);


--
-- TOC entry 2923 (class 2606 OID 29373)
-- Name: category PK_9c4e4a89e3674fc9f382d733f03; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT "PK_9c4e4a89e3674fc9f382d733f03" PRIMARY KEY (id);


--
-- TOC entry 2927 (class 2606 OID 29404)
-- Name: cart_item PK_bd94725aa84f8cf37632bcde997; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT "PK_bd94725aa84f8cf37632bcde997" PRIMARY KEY (id);


--
-- TOC entry 2925 (class 2606 OID 29390)
-- Name: product PK_bebc9158e480b949565b4dc7a82; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT "PK_bebc9158e480b949565b4dc7a82" PRIMARY KEY (id);


--
-- TOC entry 2929 (class 2606 OID 29414)
-- Name: cart PK_c524ec48751b9b5bcfbf6e59be7; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "PK_c524ec48751b9b5bcfbf6e59be7" PRIMARY KEY (id);


--
-- TOC entry 2931 (class 2606 OID 29422)
-- Name: cart_item FK_29e590514f9941296f3a2440d39; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT "FK_29e590514f9941296f3a2440d39" FOREIGN KEY ("cartId") REFERENCES public.cart(id);


--
-- TOC entry 2930 (class 2606 OID 29417)
-- Name: product FK_ff0c0301a95e517153df97f6812; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT "FK_ff0c0301a95e517153df97f6812" FOREIGN KEY ("categoryId") REFERENCES public.category(id);


-- Completed on 2022-09-08 22:57:33 -05

--
-- PostgreSQL database dump complete
--

