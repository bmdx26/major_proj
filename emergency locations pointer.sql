--
-- PostgreSQL database dump
--

\restrict DUrWoyoZGrSWtICmTdGYQSklmhIklBWCGn2mm62XlQCZscFmJfffJxbKY3QrhzW

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-04-06 00:41:09

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2 (class 3079 OID 16401)
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 16389)
-- Name: emergency_services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emergency_services (
    id character varying(50) NOT NULL,
    department character varying(20) NOT NULL,
    name text NOT NULL,
    normalized_name text NOT NULL,
    state text,
    district text,
    phone text,
    alternate_phone text,
    email text,
    category text,
    ownership text,
    address_line text,
    pincode text,
    std_code text,
    office_number text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.emergency_services OWNER TO postgres;

--
-- TOC entry 4954 (class 0 OID 16389)
-- Dependencies: 220
-- Data for Name: emergency_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.emergency_services (id, department, name, normalized_name, state, district, phone, alternate_phone, email, category, ownership, address_line, pincode, std_code, office_number, created_at) FROM stdin;
KL_FSD_ALP_0001	FIRE	Chengannur Fire Station	chengannur	Kerala	Alappuzha	\N	\N	\N	\N	\N	\N	\N	0479	2456094	2026-02-27 02:48:31.782525
KL_FSD_ALP_0002	FIRE	Kayamkulam Fire Station	kayamkulam	Kerala	Alappuzha	\N	\N	\N	\N	\N	\N	\N	0479	2442101	2026-02-27 02:48:31.789921
KL_FSD_ALP_0003	FIRE	Cherthala Fire Station	cherthala	Kerala	Alappuzha	\N	\N	\N	\N	\N	\N	\N	0478	2812455	2026-02-27 02:48:31.791856
KL_FSD_ALP_0004	FIRE	Mavelikara Fire Station	mavelikara	Kerala	Alappuzha	\N	\N	\N	\N	\N	\N	\N	0479	2306264	2026-02-27 02:48:31.79629
KL_FSD_ALP_0005	FIRE	Alappuzha Fire Station	alappuzha	Kerala	Alappuzha	\N	\N	\N	\N	\N	\N	\N	0477	2230303	2026-02-27 02:48:31.798602
KL_FSD_CLT_0001	FIRE	Kozhikode Fire Station	kozhikode	Kerala	Kozhikode	\N	\N	\N	\N	\N	\N	\N	0495	2323191	2026-02-27 02:48:31.80276
KL_FSD_CLT_0002	FIRE	Kozhikode Fire Station	kozhikode	Kerala	Kozhikode	\N	\N	\N	\N	\N	\N	\N	0495	2321654	2026-02-27 02:48:31.803837
KL_FSD_CLT_0003	FIRE	Beach Road Fire Station	beach road	Kerala	Kozhikode	\N	\N	\N	\N	\N	\N	\N	0495	2365333	2026-02-27 02:48:31.804661
KL_FSD_CLT_0004	FIRE	Vellimadukunnu Fire Station	vellimadukunnu	Kerala	Kozhikode	\N	\N	\N	\N	\N	\N	\N	0495	2371003	2026-02-27 02:48:31.805615
KL_FSD_CLT_0005	FIRE	Koduvally Fire Station	koduvally	Kerala	Kozhikode	\N	\N	\N	\N	\N	\N	\N	0495	2519945	2026-02-27 02:48:31.80647
KL_FSD_CLT_0006	FIRE	Perambra Fire Station	perambra	Kerala	Kozhikode	\N	\N	\N	\N	\N	\N	\N	0496	2610201	2026-02-27 02:48:31.807184
KL_FSD_CLT_0007	FIRE	Mukkam Fire Station	mukkam	Kerala	Kozhikode	\N	\N	\N	\N	\N	\N	\N	0495	2297601	2026-02-27 02:48:31.807771
KL_FSD_CLT_0008	FIRE	Nadapuram Fire Station	nadapuram	Kerala	Kozhikode	\N	\N	\N	\N	\N	\N	\N	0496	2448000	2026-02-27 02:48:31.808344
KL_FSD_EKM_0001	FIRE	Kaloor Fire Station	kaloor	Kerala	Ernakulam	\N	\N	\N	\N	\N	\N	\N	0485	2287111	2026-02-27 02:48:31.808985
KL_FSD_EKM_0002	FIRE	Fort Kochi Fire Station	fort kochi	Kerala	Ernakulam	\N	\N	\N	\N	\N	\N	\N	0484	2215909	2026-02-27 02:48:31.809543
KL_FSD_EKM_0003	FIRE	Eloor Fire Station	eloor	Kerala	Ernakulam	\N	\N	\N	\N	\N	\N	\N	0484	2545500	2026-02-27 02:48:31.810085
KL_FSD_EKM_0004	FIRE	Ernakulam Fire Station	ernakulam	Kerala	Ernakulam	\N	\N	\N	\N	\N	\N	\N	0484	2355101	2026-02-27 02:48:31.810642
KL_FSD_EKM_0005	FIRE	Ernakulam Fire Station	ernakulam	Kerala	Ernakulam	\N	\N	\N	\N	\N	\N	\N	0484	2205550	2026-02-27 02:48:31.811189
KL_FSD_EKM_0006	FIRE	Ernakulam Fire Station	ernakulam	Kerala	Ernakulam	\N	\N	\N	\N	\N	\N	\N	0484	2206131	2026-02-27 02:48:31.811761
KL_FSD_EKM_0007	FIRE	Mattancherry Fire Station	mattancherry	Kerala	Ernakulam	\N	\N	\N	\N	\N	\N	\N	0484	2225555	2026-02-27 02:48:31.812303
KL_FSD_EKM_0008	FIRE	Thrikkakara Fire Station	thrikkakara	Kerala	Ernakulam	\N	\N	\N	\N	\N	\N	\N	0484	2423100	2026-02-27 02:48:31.812847
KL_FSD_EKM_0009	FIRE	Aluva Fire Station	aluva	Kerala	Ernakulam	\N	\N	\N	\N	\N	\N	\N	0484	2624101	2026-02-27 02:48:31.813409
KL_FSD_EKM_0010	FIRE	Angamaly Fire Station	angamaly	Kerala	Ernakulam	\N	\N	\N	\N	\N	\N	\N	0484	2452101	2026-02-27 02:48:31.81396
KL_FSD_EKM_0011	FIRE	Perumbavoor Fire Station	perumbavoor	Kerala	Ernakulam	\N	\N	\N	\N	\N	\N	\N	0484	2523123	2026-02-27 02:48:31.814471
KL_FSD_EKM_0012	FIRE	Muvattupuzha Fire Station	muvattupuzha	Kerala	Ernakulam	\N	\N	\N	\N	\N	\N	\N	0485	2832727	2026-02-27 02:48:31.814974
KL_FSD_EKM_0013	FIRE	Piravom Fire Station	piravom	Kerala	Ernakulam	\N	\N	\N	\N	\N	\N	\N	0485	2242373	2026-02-27 02:48:31.815469
KL_FSD_EKM_0014	FIRE	Thrippunithura Fire Station	thrippunithura	Kerala	Ernakulam	\N	\N	\N	\N	\N	\N	\N	0484	2775388	2026-02-27 02:48:31.815964
KL_FSD_IDK_0001	FIRE	Kattappana Fire Station	kattappana	Kerala	Idukki	\N	\N	\N	\N	\N	\N	\N	04868	272300	2026-02-27 02:48:31.81645
KL_FSD_IDK_0002	FIRE	Munnar Fire Station	munnar	Kerala	Idukki	\N	\N	\N	\N	\N	\N	\N	04865	230290	2026-02-27 02:48:31.81691
KL_FSD_IDK_0003	FIRE	Thodupuzha Fire Station	thodupuzha	Kerala	Idukki	\N	\N	\N	\N	\N	\N	\N	0486	2222911	2026-02-27 02:48:31.817332
KL_FSD_IDK_0004	FIRE	Idukki Fire Station	idukki	Kerala	Idukki	\N	\N	\N	\N	\N	\N	\N	0484	2236100	2026-02-27 02:48:31.817927
KL_FSD_KNR_0001	FIRE	Kannur Fire Station	kannur	Kerala	Kannur	\N	\N	\N	\N	\N	\N	\N	0497	2706900	2026-02-27 02:48:31.818415
KL_FSD_KNR_0002	FIRE	Iritty Fire Station	iritty	Kerala	Kannur	\N	\N	\N	\N	\N	\N	\N	0490	2493001	2026-02-27 02:48:31.818903
KL_FSD_KNR_0003	FIRE	Payyanur Fire Station	payyanur	Kerala	Kannur	\N	\N	\N	\N	\N	\N	\N	04985	202901	2026-02-27 02:48:31.819393
KL_FSD_KNR_0004	FIRE	Kuthuparamba Fire Station	kuthuparamba	Kerala	Kannur	\N	\N	\N	\N	\N	\N	\N	0490	2364200	2026-02-27 02:48:31.819871
KL_FSD_KNR_0005	FIRE	Taliparamba Fire Station	taliparamba	Kerala	Kannur	\N	\N	\N	\N	\N	\N	\N	0490	2207101	2026-02-27 02:48:31.820353
KL_FSD_KNR_0006	FIRE	Thalassery Fire Station	thalassery	Kerala	Kannur	\N	\N	\N	\N	\N	\N	\N	0490	2344101	2026-02-27 02:48:31.820828
KL_FSD_KNR_0007	FIRE	Peravoor Fire Station	peravoor	Kerala	Kannur	\N	\N	\N	\N	\N	\N	\N	0490	2443250	2026-02-27 02:48:31.821321
KL_FSD_KNR_0008	FIRE	Peringome Fire Station	peringome	Kerala	Kannur	\N	\N	\N	\N	\N	\N	\N	04985	236100	2026-02-27 02:48:31.82182
KL_FSD_KNR_0009	FIRE	Mattannur Fire Station	mattannur	Kerala	Kannur	\N	\N	\N	\N	\N	\N	\N	0490	2471101	2026-02-27 02:48:31.822527
KL_FSD_KSD_0001	FIRE	Uppala Fire Station	uppala	Kerala	Kasaragod	\N	\N	\N	\N	\N	\N	\N	04998	241101	2026-02-27 02:48:31.823047
KL_FSD_KSD_0002	FIRE	Kasaragod Fire Station	kasaragod	Kerala	Kasaragod	\N	\N	\N	\N	\N	\N	\N	0467	230101	2026-02-27 02:48:31.823536
KL_FSD_KSD_0003	FIRE	Kasaragod Fire Station	kasaragod	Kerala	Kasaragod	\N	\N	\N	\N	\N	\N	\N	0467	2202101	2026-02-27 02:48:31.824256
KL_FSD_KSD_0004	FIRE	Thrikaripur Fire Station	thrikaripur	Kerala	Kasaragod	\N	\N	\N	\N	\N	\N	\N	0467	2210201	2026-02-27 02:48:31.824754
KL_FSD_KLM_0001	FIRE	Kollam Fire Station	kollam	Kerala	Kollam	\N	\N	\N	\N	\N	\N	\N	0474	2746200	2026-02-27 02:48:31.825254
KL_FSD_KLM_0002	FIRE	Chinnakada Fire Station	chinnakada	Kerala	Kollam	\N	\N	\N	\N	\N	\N	\N	0474	2750201	2026-02-27 02:48:31.825748
KL_FSD_KLM_0003	FIRE	Karunagappally Fire Station	karunagappally	Kerala	Kollam	\N	\N	\N	\N	\N	\N	\N	0476	2620555	2026-02-27 02:48:31.826247
KL_FSD_KLM_0004	FIRE	Kundara Fire Station	kundara	Kerala	Kollam	\N	\N	\N	\N	\N	\N	\N	0474	2522590	2026-02-27 02:48:31.826741
KL_FSD_KLM_0005	FIRE	Punalur Fire Station	punalur	Kerala	Kollam	\N	\N	\N	\N	\N	\N	\N	0475	2222701	2026-02-27 02:48:31.827236
KL_FSD_KLM_0006	FIRE	Kadakkal Fire Station	kadakkal	Kerala	Kollam	\N	\N	\N	\N	\N	\N	\N	0474	2425288	2026-02-27 02:48:31.827723
KL_FSD_KLM_0007	FIRE	Paravur Fire Station	paravur	Kerala	Kollam	\N	\N	\N	\N	\N	\N	\N	0474	2518101	2026-02-27 02:48:31.82824
KL_FSD_KLM_0008	FIRE	Sasthamcotta Fire Station	sasthamcotta	Kerala	Kollam	\N	\N	\N	\N	\N	\N	\N	0476	2835101	2026-02-27 02:48:31.828759
KL_FSD_KLM_0009	FIRE	Sasthamcotta Fire Station	sasthamcotta	Kerala	Kollam	\N	\N	\N	\N	\N	\N	\N	0474	2650500	2026-02-27 02:48:31.829253
KL_FSD_KLM_0010	FIRE	Kottarakkara Fire Station	kottarakkara	Kerala	Kollam	\N	\N	\N	\N	\N	\N	\N	0474	2650500	2026-02-27 02:48:31.829749
KL_FSD_KTM_0001	FIRE	Yendayar Fire Station	yendayar	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04828	286200	2026-02-27 02:48:31.830245
KL_FSD_KTM_0002	FIRE	Velloor Fire Station	velloor	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0481	2382000	2026-02-27 02:48:31.830728
KL_FSD_KTM_0003	FIRE	Vellikulam Fire Station	vellikulam	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04822	259100	2026-02-27 02:48:31.831216
KL_FSD_KTM_0004	FIRE	Velichiyani Fire Station	velichiyani	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04828	270298	2026-02-27 02:48:31.831713
KL_FSD_KTM_0005	FIRE	Velichiyani Fire Station	velichiyani	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04828	270222	2026-02-27 02:48:31.832209
KL_FSD_KTM_0006	FIRE	Vazhoor Fire Station	vazhoor	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0481	2456200	2026-02-27 02:48:31.832691
KL_FSD_KTM_0007	FIRE	Valavoor Fire Station	valavoor	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04822	258120	2026-02-27 02:48:31.833227
KL_FSD_KTM_0008	FIRE	Vakathanam Fire Station	vakathanam	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0481	2462200	2026-02-27 02:48:31.833722
KL_FSD_KTM_0009	FIRE	Vakathanam Fire Station	vakathanam	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0481	2462198	2026-02-27 02:48:31.834206
KL_FSD_KTM_0010	FIRE	Vaikom Fire Station	vaikom	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04829	221244	2026-02-27 02:48:31.835555
KL_FSD_KTM_0011	FIRE	Uzhavoor Fire Station	uzhavoor	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04822	241215	2026-02-27 02:48:31.836091
KL_FSD_KTM_0012	FIRE	Thrikodithanam Fire Station	thrikodithanam	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0481	2442109	2026-02-27 02:48:31.836599
KL_FSD_KTM_0013	FIRE	Thellakom Fire Station	thellakom	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0481	2792198	2026-02-27 02:48:31.837101
KL_FSD_KTM_0014	FIRE	Thekkethukavala Fire Station	thekkethukavala	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04828	225000	2026-02-27 02:48:31.837596
KL_FSD_KTM_0015	FIRE	Theekoy Fire Station	theekoy	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04822	281020	2026-02-27 02:48:31.838094
KL_FSD_KTM_0016	FIRE	Thalayolaparampu Fire Station	thalayolaparampu	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04829	236120	2026-02-27 02:48:31.838589
KL_FSD_KTM_0017	FIRE	TV Puram Fire Station	tv puram	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04829	222198	2026-02-27 02:48:31.839094
KL_FSD_KTM_0018	FIRE	Ramapuram Fire Station	ramapuram	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04822	260200	2026-02-27 02:48:31.839601
KL_FSD_KTM_0019	FIRE	Puthuppally Fire Station	puthuppally	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0481	2352198	2026-02-27 02:48:31.840092
KL_FSD_KTM_0020	FIRE	Puthuppally Fire Station	puthuppally	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0481	2351111	2026-02-27 02:48:31.840585
KL_FSD_KTM_0021	FIRE	Puliyanoor Fire Station	puliyanoor	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04822	212533	2026-02-27 02:48:31.841103
KL_FSD_KTM_0022	FIRE	Poovarani Fire Station	poovarani	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04822	225200	2026-02-27 02:48:31.841601
KL_FSD_KTM_0023	FIRE	Ponkunnam Fire Station	ponkunnam	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04828	221200	2026-02-27 02:48:31.842089
KL_FSD_KTM_0024	FIRE	Pinnakkanadu Fire Station	pinnakkanadu	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04828	235198	2026-02-27 02:48:31.842583
KL_FSD_KTM_0025	FIRE	Pinnakkanadu Fire Station	pinnakkanadu	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04828	235200	2026-02-27 02:48:31.843074
KL_FSD_KTM_0026	FIRE	Peruva Fire Station	peruva	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04829	251200	2026-02-27 02:48:31.843564
KL_FSD_KTM_0027	FIRE	Peringalam Fire Station	peringalam	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04822	271198	2026-02-27 02:48:31.844229
KL_FSD_KTM_0028	FIRE	Pathampuza Fire Station	pathampuza	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04822	285198	2026-02-27 02:48:31.844728
KL_FSD_KTM_0029	FIRE	Parathanam Fire Station	parathanam	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04828	287198	2026-02-27 02:48:31.845233
KL_FSD_KTM_0030	FIRE	Panachikadu Fire Station	panachikadu	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0481	2432000	2026-02-27 02:48:31.845726
KL_FSD_KTM_0031	FIRE	Pampavalley Fire Station	pampavalley	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04828	214298	2026-02-27 02:48:31.846214
KL_FSD_KTM_0032	FIRE	Pallickathodu Fire Station	pallickathodu	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0481	2704200	2026-02-27 02:48:31.846736
KL_FSD_KTM_0033	FIRE	Njeezhoor Fire Station	njeezhoor	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04829	263698	2026-02-27 02:48:31.847233
KL_FSD_KTM_0034	FIRE	Neendoor Fire Station	neendoor	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0481	2512100	2026-02-27 02:48:31.847721
KL_FSD_KTM_0035	FIRE	Nedumkunnam Fire Station	nedumkunnam	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0481	2486000	2026-02-27 02:48:31.848239
KL_FSD_KTM_0036	FIRE	Nattakom Fire Station	nattakom	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0481	2362198	2026-02-27 02:48:31.84879
KL_FSD_KTM_0037	FIRE	Mundakkayam Fire Station	mundakkayam	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04828	272400	2026-02-27 02:48:31.849393
KL_FSD_KTM_0038	FIRE	Mukkuttuthara Fire Station	mukkuttuthara	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04828	254198	2026-02-27 02:48:31.849895
KL_FSD_KTM_0039	FIRE	Moonnilavu Fire Station	moonnilavu	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04822	286299	2026-02-27 02:48:31.850397
KL_FSD_KTM_0040	FIRE	Mooledom Fire Station	mooledom	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0481	2342222	2026-02-27 02:48:31.850886
KL_FSD_KTM_0041	FIRE	Monipally Fire Station	monipally	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04822	242198	2026-02-27 02:48:31.851372
KL_FSD_KTM_0042	FIRE	Monipally Fire Station	monipally	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04822	242270	2026-02-27 02:48:31.851861
KL_FSD_KTM_0043	FIRE	Mevallor Fire Station	mevallor	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04829	257120	2026-02-27 02:48:31.852347
KL_FSD_KTM_0044	FIRE	Melukavumattam Fire Station	melukavumattam	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04822	219020	2026-02-27 02:48:31.852862
KL_FSD_KTM_0045	FIRE	Meenadom Fire Station	meenadom	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0481	2507000	2026-02-27 02:48:31.85336
KL_FSD_KTM_0046	FIRE	Marangattupally Fire Station	marangattupally	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04822	251298	2026-02-27 02:48:31.853853
KL_FSD_KTM_0047	FIRE	Manarkadu Fire Station	manarkadu	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0481	2372198	2026-02-27 02:48:31.854344
KL_FSD_KTM_0048	FIRE	Manimala Fire Station	manimala	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04828	247200	2026-02-27 02:48:31.854828
KL_FSD_KTM_0049	FIRE	Mammood Fire Station	mammood	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0481	2473000	2026-02-27 02:48:31.855312
KL_FSD_KTM_0050	FIRE	Kurupanthara Fire Station	kurupanthara	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04829	242200	2026-02-27 02:48:31.855817
KL_FSD_KTM_0051	FIRE	Kurumannu Fire Station	kurumannu	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04822	221200	2026-02-27 02:48:31.856306
KL_FSD_KTM_0052	FIRE	Kuravilangad Fire Station	kuravilangad	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04822	230220	2026-02-27 02:48:31.856791
KL_FSD_KTM_0053	FIRE	Kunnonni Fire Station	kunnonni	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04822	284298	2026-02-27 02:48:31.857284
KL_FSD_KTM_0054	FIRE	Kumaranelloor Fire Station	kumaranelloor	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0481	2312198	2026-02-27 02:48:31.857831
KL_FSD_KTM_0055	FIRE	Kumarakom Fire Station	kumarakom	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0481	2524200	2026-02-27 02:48:31.858374
KL_FSD_KTM_0056	FIRE	Kudavachoor Fire Station	kudavachoor	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04829	275198	2026-02-27 02:48:31.858874
KL_FSD_KTM_0057	FIRE	Kudamaloor Fire Station	kudamaloor	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0481	2392198	2026-02-27 02:48:31.859365
KL_FSD_KTM_0058	FIRE	Kozhuvanal Fire Station	kozhuvanal	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04822	267020	2026-02-27 02:48:31.85985
KL_FSD_KTM_0059	FIRE	Koruthode Fire Station	koruthode	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04828	280298	2026-02-27 02:48:31.860339
KL_FSD_KTM_0060	FIRE	Koovapally Fire Station	koovapally	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04828	251198	2026-02-27 02:48:31.860832
KL_FSD_KTM_0061	FIRE	Kooropada Fire Station	kooropada	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0481	2507000	2026-02-27 02:48:31.861329
KL_FSD_KTM_0062	FIRE	Koottickal Fire Station	koottickal	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04828	284198	2026-02-27 02:48:31.861821
KL_FSD_KTM_0063	FIRE	Kilapally Fire Station	kilapally	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04822	246200	2026-02-27 02:48:31.862307
KL_FSD_KTM_0064	FIRE	Kidangoor Fire Station	kidangoor	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04822	254120	2026-02-27 02:48:31.863017
KL_FSD_KTM_0065	FIRE	Karukachal Fire Station	karukachal	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0481	2485100	2026-02-27 02:48:31.863513
KL_FSD_KTM_0066	FIRE	Kanjikkuzhy Fire Station	kanjikkuzhy	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0481	2572198	2026-02-27 02:48:31.864029
KL_FSD_KTM_0067	FIRE	Kangazha Fire Station	kangazha	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0481	2494398	2026-02-27 02:48:31.864506
KL_FSD_KTM_0068	FIRE	Kallara Fire Station	kallara	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04829	267300	2026-02-27 02:48:31.865023
KL_FSD_KTM_0069	FIRE	Gandhinagar Fire Station	gandhinagar	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0481	2598198	2026-02-27 02:48:31.865535
KL_FSD_KTM_0070	FIRE	Ettumanoor Fire Station	ettumanoor	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0481	2535198	2026-02-27 02:48:31.866043
KL_FSD_KTM_0071	FIRE	Erumely Fire Station	erumely	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04828	310220	2026-02-27 02:48:31.866585
KL_FSD_KTM_0072	FIRE	Erattupetta Fire Station	erattupetta	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	04822	272222	2026-02-27 02:48:31.867091
KL_FSD_KTM_0073	FIRE	Chingavanam Fire Station	chingavanam	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0481	2432220	2026-02-27 02:48:31.86759
KL_FSD_KTM_0074	FIRE	Kaduthuruthy Fire Station	kaduthuruthy	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0481	285151	2026-02-27 02:48:31.868095
KL_FSD_KTM_0075	FIRE	Pampady Fire Station	pampady	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0481	2506600	2026-02-27 02:48:31.868601
KL_FSD_KTM_0076	FIRE	Erattupetta Fire Station	erattupetta	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0482	2274700	2026-02-27 02:48:31.869115
KL_FSD_KTM_0077	FIRE	Pala Fire Station	pala	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0482	2274700	2026-02-27 02:48:31.869618
KL_FSD_KTM_0078	FIRE	Kottayam Fire Station	kottayam	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0481	2567440	2026-02-27 02:48:31.87015
KL_FSD_KTM_0079	FIRE	Kanjirappally Fire Station	kanjirappally	Kerala	Kottayam	\N	\N	\N	\N	\N	\N	\N	0481	202777	2026-02-27 02:48:31.870653
KL_FSD_MLP_0001	FIRE	Malappuram Fire Station	malappuram	Kerala	Malappuram	\N	\N	\N	\N	\N	\N	\N	0483	2734800	2026-02-27 02:48:31.871169
KL_FSD_MLP_0002	FIRE	Perinthalmanna Fire Station	perinthalmanna	Kerala	Malappuram	\N	\N	\N	\N	\N	\N	\N	04933	227800	2026-02-27 02:48:31.871675
KL_FSD_MLP_0003	FIRE	Tirur Fire Station	tirur	Kerala	Malappuram	\N	\N	\N	\N	\N	\N	\N	0494	2422333	2026-02-27 02:48:31.872192
KL_FSD_MLP_0004	FIRE	Ponnani Fire Station	ponnani	Kerala	Malappuram	\N	\N	\N	\N	\N	\N	\N	0494	2666002	2026-02-27 02:48:31.872689
KL_FSD_MLP_0005	FIRE	Nilambur Fire Station	nilambur	Kerala	Malappuram	\N	\N	\N	\N	\N	\N	\N	04931	224005	2026-02-27 02:48:31.873192
KL_FSD_PKD_0001	FIRE	Vadakkencherry Fire Station	vadakkencherry	Kerala	Palakkad	\N	\N	\N	\N	\N	\N	\N	04922	256101	2026-02-27 02:48:31.873691
KL_FSD_PKD_0002	FIRE	Shoranur Fire Station	shoranur	Kerala	Palakkad	\N	\N	\N	\N	\N	\N	\N	0466	2222501	2026-02-27 02:48:31.874198
KL_FSD_PKD_0003	FIRE	Kanjikode Fire Station	kanjikode	Kerala	Palakkad	\N	\N	\N	\N	\N	\N	\N	0491	2569702	2026-02-27 02:48:31.874703
KL_FSD_PKD_0004	FIRE	Chittur Fire Station	chittur	Kerala	Palakkad	\N	\N	\N	\N	\N	\N	\N	04923	222499	2026-02-27 02:48:31.875203
KL_FSD_PKD_0005	FIRE	Alathur Fire Station	alathur	Kerala	Palakkad	\N	\N	\N	\N	\N	\N	\N	0492	2223150	2026-02-27 02:48:31.875711
KL_FSD_PKD_0006	FIRE	Palakkad Town Fire Station	palakkad town	Kerala	Palakkad	\N	\N	\N	\N	\N	\N	\N	0491	2537101	2026-02-27 02:48:31.876241
KL_FSD_PKD_0007	FIRE	Palakkad Fire Station	palakkad	Kerala	Palakkad	\N	\N	\N	\N	\N	\N	\N	0491	2505701	2026-02-27 02:48:31.876755
KL_FSD_PKD_0008	FIRE	Kanjikode Fire Station	kanjikode	Kerala	Palakkad	\N	\N	\N	\N	\N	\N	\N	0491	2569701	2026-02-27 02:48:31.877266
KL_FSD_PKD_0009	FIRE	Mannarkkad Fire Station	mannarkkad	Kerala	Palakkad	\N	\N	\N	\N	\N	\N	\N	04924	230101	2026-02-27 02:48:31.877777
KL_FSD_PTA_0001	FIRE	Thiruvalla Fire Station	thiruvalla	Kerala	Pathanamthitta	\N	\N	\N	\N	\N	\N	\N	0469	2600101	2026-02-27 02:48:31.878289
KL_FSD_PTA_0002	FIRE	Ranni Fire Station	ranni	Kerala	Pathanamthitta	\N	\N	\N	\N	\N	\N	\N	04735	224101	2026-02-27 02:48:31.87879
KL_FSD_PTA_0003	FIRE	Adoor Fire Station	adoor	Kerala	Pathanamthitta	\N	\N	\N	\N	\N	\N	\N	04734	229100	2026-02-27 02:48:31.87929
KL_FSD_PTA_0004	FIRE	Pathanamthitta Fire Station	pathanamthitta	Kerala	Pathanamthitta	\N	\N	\N	\N	\N	\N	\N	0468	2222001	2026-02-27 02:48:31.8798
KL_FSD_TVM_0001	FIRE	Vizhinjam Fire Station	vizhinjam	Kerala	Thiruvananthapuram	\N	\N	\N	\N	\N	\N	\N	0471	2482101	2026-02-27 02:48:31.880347
KL_FSD_TVM_0002	FIRE	Vizhinjam Fire Station	vizhinjam	Kerala	Thiruvananthapuram	\N	\N	\N	\N	\N	\N	\N	0471	2480300	2026-02-27 02:48:31.88085
KL_FSD_TVM_0003	FIRE	Thiruvananthapuram Fire Station	thiruvananthapuram	Kerala	Thiruvananthapuram	\N	\N	\N	\N	\N	\N	\N	0471	2563660	2026-02-27 02:48:31.881345
KL_FSD_TVM_0004	FIRE	Thiruvananthapuram Fire Station	thiruvananthapuram	Kerala	Thiruvananthapuram	\N	\N	\N	\N	\N	\N	\N	0471	2562994	2026-02-27 02:48:31.881875
KL_FSD_TVM_0005	FIRE	Thiruvananthapuram Fire Station	thiruvananthapuram	Kerala	Thiruvananthapuram	\N	\N	\N	\N	\N	\N	\N	0471	2333101	2026-02-27 02:48:31.882566
KL_FSD_TVM_0006	FIRE	Thiruvananthapuram Fire Station	thiruvananthapuram	Kerala	Thiruvananthapuram	\N	\N	\N	\N	\N	\N	\N	0471	2501255	2026-02-27 02:48:31.883079
KL_FSD_TVM_0007	FIRE	Parassala Fire Station	parassala	Kerala	Thiruvananthapuram	\N	\N	\N	\N	\N	\N	\N	0471	2202536	2026-02-27 02:48:31.883581
KL_FSD_TVM_0008	FIRE	Parassala Fire Station	parassala	Kerala	Thiruvananthapuram	\N	\N	\N	\N	\N	\N	\N	0471	2201717	2026-02-27 02:48:31.884076
KL_FSD_TVM_0009	FIRE	Neyyattinkara Fire Station	neyyattinkara	Kerala	Thiruvananthapuram	\N	\N	\N	\N	\N	\N	\N	0471	2222101	2026-02-27 02:48:31.884576
KL_FSD_TVM_0010	FIRE	Neyyattinkara Fire Station	neyyattinkara	Kerala	Thiruvananthapuram	\N	\N	\N	\N	\N	\N	\N	0471	2222307	2026-02-27 02:48:31.885076
KL_FSD_TVM_0011	FIRE	Varkala Fire Station	varkala	Kerala	Thiruvananthapuram	\N	\N	\N	\N	\N	\N	\N	0470	2607700	2026-02-27 02:48:31.885568
KL_FSD_TVM_0012	FIRE	Poovar Fire Station	poovar	Kerala	Thiruvananthapuram	\N	\N	\N	\N	\N	\N	\N	0471	2210101	2026-02-27 02:48:31.886067
KL_FSD_TVM_0013	FIRE	Nedumangad Fire Station	nedumangad	Kerala	Thiruvananthapuram	\N	\N	\N	\N	\N	\N	\N	0472	2812101	2026-02-27 02:48:31.886565
KL_FSD_TVM_0014	FIRE	Attingal Fire Station	attingal	Kerala	Thiruvananthapuram	\N	\N	\N	\N	\N	\N	\N	0470	2622000	2026-02-27 02:48:31.88706
KL_FSD_TVM_0015	FIRE	Thiruvananthapuram City Fire Station	thiruvananthapuram city	Kerala	Thiruvananthapuram	\N	\N	\N	\N	\N	\N	\N	0471	2320868	2026-02-27 02:48:31.887583
KL_FSD_TVM_0016	FIRE	Thiruvananthapuram City Fire Station	thiruvananthapuram city	Kerala	Thiruvananthapuram	\N	\N	\N	\N	\N	\N	\N	0471	2320872	2026-02-27 02:48:31.888085
KL_FSD_TVM_0017	FIRE	Thiruvananthapuram City Fire Station	thiruvananthapuram city	Kerala	Thiruvananthapuram	\N	\N	\N	\N	\N	\N	\N	0471	2322354	2026-02-27 02:48:31.888595
KL_FSD_TVM_0018	FIRE	Kattakada Fire Station	kattakada	Kerala	Thiruvananthapuram	\N	\N	\N	\N	\N	\N	\N	0471	2280101	2026-02-27 02:48:31.889098
KL_FSD_TSR_0001	FIRE	Thrissur Fire Station	thrissur	Kerala	Thrissur	\N	\N	\N	\N	\N	\N	\N	0487	2325549	2026-02-27 02:48:31.889598
KL_FSD_TSR_0002	FIRE	Thrissur Town Fire Station	thrissur town	Kerala	Thrissur	\N	\N	\N	\N	\N	\N	\N	0487	2325569	2026-02-27 02:48:31.89009
KL_FSD_TSR_0003	FIRE	Chalakudy Fire Station	chalakudy	Kerala	Thrissur	\N	\N	\N	\N	\N	\N	\N	0480	2702000	2026-02-27 02:48:31.890592
KL_FSD_TSR_0004	FIRE	Guruvayur Fire Station	guruvayur	Kerala	Thrissur	\N	\N	\N	\N	\N	\N	\N	0487	2556300	2026-02-27 02:48:31.89109
KL_FSD_TSR_0005	FIRE	Irinjalakuda Fire Station	irinjalakuda	Kerala	Thrissur	\N	\N	\N	\N	\N	\N	\N	0480	2820558	2026-02-27 02:48:31.891581
KL_FSD_TSR_0006	FIRE	Kunnamkulam Fire Station	kunnamkulam	Kerala	Thrissur	\N	\N	\N	\N	\N	\N	\N	04885	222511	2026-02-27 02:48:31.892076
KL_FSD_TSR_0007	FIRE	Vadakkencherry Fire Station	vadakkencherry	Kerala	Thrissur	\N	\N	\N	\N	\N	\N	\N	04884	236101	2026-02-27 02:48:31.892582
KL_FSD_TSR_0008	FIRE	Viyyur Fire Station	viyyur	Kerala	Thrissur	\N	\N	\N	\N	\N	\N	\N	0487	2322664	2026-02-27 02:48:31.893084
KL_FSD_TSR_0009	FIRE	Mala Fire Station	mala	Kerala	Thrissur	\N	\N	\N	\N	\N	\N	\N	0480	2695010	2026-02-27 02:48:31.893576
KL_FSD_TSR_0010	FIRE	Thrissur Fire Station	thrissur	Kerala	Thrissur	\N	\N	\N	\N	\N	\N	\N	0480	2757101	2026-02-27 02:48:31.894078
KL_FSD_WYD_0001	FIRE	Kalpetta Fire Station	kalpetta	Kerala	Wayanad	\N	\N	\N	\N	\N	\N	\N	04936	202333	2026-02-27 02:48:31.894579
KL_FSD_WYD_0002	FIRE	Sultan Bathery Fire Station	sultan bathery	Kerala	Wayanad	\N	\N	\N	\N	\N	\N	\N	04936	227101	2026-02-27 02:48:31.89507
KL_FSD_WYD_0003	FIRE	Mananthavady Fire Station	mananthavady	Kerala	Wayanad	\N	\N	\N	\N	\N	\N	\N	04935	245052	2026-02-27 02:48:31.895657
KL_PSD_ALP_0001	POLICE	Alappuzha Traffic Police Station	alappuzha traffic	Kerala	Alappuzha	9497980303	\N	shotrfcpsalpy.pol@kerala.gov.in	\N	\N	\N	\N	0477	2251111	2026-02-27 02:48:31.897315
KL_PSD_ALP_0002	POLICE	Ambalapuzha Police Station	ambalapuzha	Kerala	Alappuzha	9497987060	\N	shoamblpaalpy.pol@kerala.gov.in	\N	\N	\N	\N	0477	2272022	2026-02-27 02:48:31.897964
KL_PSD_ALP_0003	POLICE	Mannanchery Police Station	mannanchery	Kerala	Alappuzha	9497909997	\N	shomncypsalpy.pol@kerala.gov.in	\N	\N	\N	\N	0477	2292100	2026-02-27 02:48:31.898469
KL_PSD_ALP_0004	POLICE	Muhamma Police Station	muhamma	Kerala	Alappuzha	9497980283	\N	shomhmapsalpy.pol@kerala.gov.in	\N	\N	\N	\N	0478	2862331	2026-02-27 02:48:31.898965
KL_PSD_ALP_0005	POLICE	Arthunkal Police Station	arthunkal	Kerala	Alappuzha	9497910011	\N	shoartnlpalpy.pol@kerala.gov.in	\N	\N	\N	\N	0478	2572233	2026-02-27 02:48:31.899664
KL_PSD_ALP_0006	POLICE	Mararikulam Police Station	mararikulam	Kerala	Alappuzha	9497987064	\N	shomrrklmalpy.pol@kerala.gov.in	\N	\N	\N	\N	0478	2862391	2026-02-27 02:48:31.900171
KL_PSD_ALP_0007	POLICE	Poochackal Police Station	poochackal	Kerala	Alappuzha	9497947284	\N	shopchklpalpy.pol@kerala.gov.in	\N	\N	\N	\N	0478	2522249	2026-02-27 02:48:31.900673
KL_PSD_ALP_0008	POLICE	Cherthala Police Station	cherthala	Kerala	Alappuzha	9497980291	\N	shoctapsalpy.pol@kerala.gov.in	\N	\N	\N	\N	0478	2813205	2026-02-27 02:48:31.901164
KL_PSD_ALP_0009	POLICE	Pattanakkad Police Station	pattanakkad	Kerala	Alappuzha	9497947283	\N	shoptnkdalpy.pol@kerala.gov.in	\N	\N	\N	\N	0478	2592210	2026-02-27 02:48:31.901663
KL_PSD_ALP_0010	POLICE	Kuthiathodu Police Station	kuthiathodu	Kerala	Alappuzha	9497987063	\N	shokthtdalpy.pol@kerala.gov.in	\N	\N	\N	\N	0478	2562239	2026-02-27 02:48:31.902151
KL_PSD_ALP_0011	POLICE	Aroor Police Station	aroor	Kerala	Alappuzha	9497980266	\N	shoarralpy.pol@kerala.gov.in	\N	\N	\N	\N	0478	2872044	2026-02-27 02:48:31.902641
KL_PSD_ALP_0012	POLICE	Trikkunnapuzha Police Station	trikkunnapuzha	Kerala	Alappuzha	9497980294	\N	shotrkzalp.pol@kerala.gov.in	\N	\N	\N	\N	0479	2482026	2026-02-27 02:48:31.903127
KL_PSD_EKM_0001	POLICE	Mattancherry Police Station	mattancherry	Kerala	Ernakulam	9497980432	\N	shomtryekm.pol@kerala.gov.in	\N	\N	\N	\N	0484	2224066	2026-02-27 02:48:31.903585
KL_PSD_EKM_0002	POLICE	Fort Kochi Coastal Police Station	fort kochi coastal	Kerala	Ernakulam	9497932848	\N	shocostalekm.pol@kerala.gov.in	\N	\N	\N	\N	0484	2215006	2026-02-27 02:48:31.90404
KL_PSD_EKM_0003	POLICE	Kochi Metro Police Station	kochi metro	Kerala	Ernakulam	9497962128	\N	shometroekm.pol@kerala.gov.in	\N	\N	\N	\N	0484	2956600	2026-02-27 02:48:31.904497
KL_PSD_EKM_0004	POLICE	Thoppumpady Police Station	thoppumpady	Kerala	Ernakulam	9497980423	\N	shotpdyekm.pol@kerala.gov.in	\N	\N	\N	\N	0484	2224033	2026-02-27 02:48:31.904993
KL_PSD_EKM_0005	POLICE	Palluruthy Police Station	palluruthy	Kerala	Ernakulam	9497980418	\N	shoplrtypsekm.pol@kerala.gov.in	\N	\N	\N	\N	0484	2232944	2026-02-27 02:48:31.905457
KL_PSD_EKM_0006	POLICE	Harbour Police Station	harbour	Kerala	Ernakulam	9497980408	\N	shohrbrekm.pol@kerala.gov.in	\N	\N	\N	\N	0484	2666005	2026-02-27 02:48:31.905907
KL_PSD_EKM_0007	POLICE	Fort Kochi Police Station	fort kochi	Kerala	Ernakulam	9497980406	\N	shofrtkchekm.pol@kerala.gov.in	\N	\N	\N	\N	0484	2215055	2026-02-27 02:48:31.90635
KL_PSD_EKM_0008	POLICE	Kannamali Police Station	kannamali	Kerala	Ernakulam	9497980416	\N	shoknlyekm.pol@kerala.gov.in	\N	\N	\N	\N	0484	2247461	2026-02-27 02:48:31.906837
KL_PSD_EKM_0009	POLICE	Panangad Police Station	panangad	Kerala	Ernakulam	9497980420	\N	shopanangdekm.pol@kerala.gov.in	\N	\N	\N	\N	0484	2700201	2026-02-27 02:48:31.907277
KL_PSD_EKM_0010	POLICE	Cheranalloor Police Station	cheranalloor	Kerala	Ernakulam	9497980400	\N	shocnlrekm.pol@kerala.gov.in	\N	\N	\N	\N	0484	2430227	2026-02-27 02:48:31.907718
KL_PSD_EKM_0011	POLICE	Eloor Police Station	eloor	Kerala	Ernakulam	9497980401	\N	shoeloorpsekm.pol@kerala.gov.in	\N	\N	\N	\N	0484	2546365	2026-02-27 02:48:31.908167
KL_PSD_EKM_0012	POLICE	Palarivattom Police Station	palarivattom	Kerala	Ernakulam	9497980425	\N	shoplrvtmekm.pol@kerala.gov.in	\N	\N	\N	\N	0484	2345850	2026-02-27 02:48:31.908639
KL_PSD_EKM_0013	POLICE	Ernakulam Town South Police Station	ernakulam town south	Kerala	Ernakulam	9497980405	\N	shotownspsekm.pol@kerala.gov.in	\N	\N	\N	\N	0484	2359350	2026-02-27 02:48:31.909085
KL_PSD_EKM_0014	POLICE	Kadavanthara Police Station	kadavanthara	Kerala	Ernakulam	9497980407	\N	shokdtrekm.pol@kerala.gov.in	\N	\N	\N	\N	0484	2207855	2026-02-27 02:48:31.909568
KL_PSD_EKM_0015	POLICE	Maradu Police Station	maradu	Kerala	Ernakulam	9497980421	\N	shomaradupsekm.pol@kerala.gov.in	\N	\N	\N	\N	0484	2705659	2026-02-27 02:48:31.910006
KL_PSD_EKM_0016	POLICE	Hill Palace Police Station	hill palace	Kerala	Ernakulam	9497980410	\N	shotrtrekm.pol@kerala.gov.in	\N	\N	\N	\N	0484	2780228	2026-02-27 02:48:31.910429
KL_PSD_EKM_0017	POLICE	Ambalamedu Police Station	ambalamedu	Kerala	Ernakulam	9497980399	\N	shoambmdpsekm.pol@kerala.gov.in	\N	\N	\N	\N	0484	2720491	2026-02-27 02:48:31.910885
KL_PSD_EKM_0018	POLICE	Udayamperoor Police Station	udayamperoor	Kerala	Ernakulam	9497980434	\N	shoudmprekm.pol@kerala.gov.in	\N	\N	\N	\N	0484	2794089	2026-02-27 02:48:31.911325
KL_PSD_EKM_0019	POLICE	Kalamassery Police Station	kalamassery	Kerala	Ernakulam	9497980412	\N	shoklsryekm.pol@kerala.gov.in	\N	\N	\N	\N	0484	2532050	2026-02-27 02:48:31.911782
KL_PSD_EKM_0020	POLICE	Thrikkakara Police Station	thrikkakara	Kerala	Ernakulam	9497980424	\N	shotrkrekm.pol@kerala.gov.in	\N	\N	\N	\N	0484	2428665	2026-02-27 02:48:31.912227
KL_PSD_EKM_0021	POLICE	Cyber Crime Police Station	cyber crime	Kerala	Ernakulam	9497947267	\N	cyberpskochi.pol@kerala.gov.in	\N	\N	\N	\N	0484	2956900	2026-02-27 02:48:31.912665
KL_PSD_EKM_0022	POLICE	Infopark Police Station	infopark	Kerala	Ernakulam	9497962051	\N	shoinfoprkekm.pol@kerala.gov.in	\N	\N	\N	\N	0484	2415400	2026-02-27 02:48:31.913106
KL_PSD_EKM_0023	POLICE	Ernakulam North (Kasaba) Police Station	ernakulam north kasaba	Kerala	Ernakulam	9497980402	\N	shoekmnpsekm.pol@kerala.gov.in	\N	\N	\N	\N	0484	2390280	2026-02-27 02:48:31.913556
KL_PSD_EKM_0024	POLICE	Traffic East Police Station	traffic east	Kerala	Ernakulam	9497987100	\N	shotraeekm.pol@kerala.gov.in	\N	\N	\N	\N	0484	2344852	2026-02-27 02:48:31.914605
KL_PSD_EKM_0025	POLICE	Ernakulam Central Police Station	ernakulam central	Kerala	Ernakulam	9497980427	\N	shocentralekm.pol@kerala.gov.in	\N	\N	\N	\N	0484	2394500	2026-02-27 02:48:31.915101
KL_PSD_EKM_0026	POLICE	Elamakkara Police Station	elamakkara	Kerala	Ernakulam	9497981235	\N	shoelamakaraekm.pol@kerala.gov.in	\N	\N	\N	\N	0484	2530700	2026-02-27 02:48:31.915555
KL_PSD_EKM_0027	POLICE	Vanitha Police Station	vanitha	Kerala	Ernakulam	9497980443	\N	shovnthekm.pol@kerala.gov.in	\N	\N	\N	\N	0484	2394250	2026-02-27 02:48:31.916166
KL_PSD_EKM_0028	POLICE	Mulavukad Police Station	mulavukad	Kerala	Ernakulam	9497980417	\N	shomvkdekm.pol@kerala.gov.in	\N	\N	\N	\N	0484	2750772	2026-02-27 02:48:31.916615
KL_PSD_EKM_0029	POLICE	Puthencruz Police Station	puthencruz	Kerala	Ernakulam	9497980492	\N	shoptcrzekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0484	2760264	2026-02-27 02:48:31.917052
KL_PSD_EKM_0030	POLICE	Ramamangalam Police Station	ramamangalam	Kerala	Ernakulam	9497980495	\N	shormgmekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0484	2277223	2026-02-27 02:48:31.917503
KL_PSD_EKM_0031	POLICE	Vazhakulam Police Station	vazhakulam	Kerala	Ernakulam	9497980499	\N	shovzklmekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0485	2260258	2026-02-27 02:48:31.918035
KL_PSD_EKM_0032	POLICE	Muvattupuzha Police Station	muvattupuzha	Kerala	Ernakulam	9497980503	\N	shompzekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0485	2832304	2026-02-27 02:48:31.918577
KL_PSD_EKM_0033	POLICE	Ayyampuzha Police Station	ayyampuzha	Kerala	Ernakulam	9497980464	\N	shoaympaekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0484	2696660	2026-02-27 02:48:31.919191
KL_PSD_EKM_0034	POLICE	Kalady Police Station	kalady	Kerala	Ernakulam	9497980468	\N	shokldyekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0484	2462360	2026-02-27 02:48:31.919697
KL_PSD_EKM_0035	POLICE	Kottappady Police Station	kottappady	Kerala	Ernakulam	9497980475	\N	shoktpdyekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0485	2843213	2026-02-27 02:48:31.920303
KL_PSD_EKM_0036	POLICE	Kuruppampady Police Station	kuruppampady	Kerala	Ernakulam	9497987121	\N	shokpdyekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0484	2591511	2026-02-27 02:48:31.920769
KL_PSD_EKM_0037	POLICE	Thadiyittaparamba Police Station	thadiyittaparamba	Kerala	Ernakulam	9497980496	\N	shotdpbekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0484	2682260	2026-02-27 02:48:31.921227
KL_PSD_EKM_0038	POLICE	Kunnathunadu Police Station	kunnathunadu	Kerala	Ernakulam	9497987118	\N	shoktduekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0484	2688260	2026-02-27 02:48:31.921687
KL_PSD_EKM_0039	POLICE	Kodanad Police Station	kodanad	Kerala	Ernakulam	9497980471	\N	shokdndekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0484	2649015	2026-02-27 02:48:31.922135
KL_PSD_EKM_0040	POLICE	Piravom Police Station	piravom	Kerala	Ernakulam	9497980490	\N	shoprvmekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0485	2242265	2026-02-27 02:48:31.922588
KL_PSD_EKM_0041	POLICE	Chottanikkara Police Station	chottanikkara	Kerala	Ernakulam	9497980517	\N	shoctkrekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0484	2712200	2026-02-27 02:48:31.923033
KL_PSD_EKM_0042	POLICE	Mulanthuruthy Police Station	mulanthuruthy	Kerala	Ernakulam	9497980480	\N	shomltyekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0484	2740262	2026-02-27 02:48:31.923488
KL_PSD_EKM_0043	POLICE	Koothattukulam Police Station	koothattukulam	Kerala	Ernakulam	9497980472	\N	shoktlmekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0485	2252323	2026-02-27 02:48:31.923942
KL_PSD_EKM_0044	POLICE	Perumbavoor Police Station	perumbavoor	Kerala	Ernakulam	9497980487	\N	shopbrekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0484	2529903	2026-02-27 02:48:31.924392
KL_PSD_EKM_0045	POLICE	Kuttampuzha Police Station	kuttampuzha	Kerala	Ernakulam	9497980479	\N	shokutpaekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0485	2588280	2026-02-27 02:48:31.924862
KL_PSD_EKM_0046	POLICE	Oonnukal Police Station	oonnukal	Kerala	Ernakulam	9497980486	\N	shoonklekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0485	2855253	2026-02-27 02:48:31.925291
KL_PSD_EKM_0047	POLICE	Kothamangalam Police Station	kothamangalam	Kerala	Ernakulam	9497980473	\N	shokmgmekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0485	2862328	2026-02-27 02:48:31.925746
KL_PSD_EKM_0048	POLICE	Pothanikadu Police Station	pothanikadu	Kerala	Ernakulam	9497947191	\N	shopotkdekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0485	2562031	2026-02-27 02:48:31.926236
KL_PSD_EKM_0049	POLICE	Kalloorkadu Police Station	kalloorkadu	Kerala	Ernakulam	9497987124	\N	shokrkdekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0485	2289235	2026-02-27 02:48:31.926693
KL_PSD_EKM_0050	POLICE	Edathala Police Station	edathala	Kerala	Ernakulam	9497975488	\N	shoedlaekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0484	2838550	2026-02-27 02:48:31.927154
KL_PSD_EKM_0051	POLICE	Aluva West Police Station	aluva west	Kerala	Ernakulam	9497990270	\N	shoawstpekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0484	2671101	2026-02-27 02:48:31.927686
KL_PSD_EKM_0052	POLICE	Aluva East Police Station	aluva east	Kerala	Ernakulam	9497980506	\N	shoalvekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0484	2624006	2026-02-27 02:48:31.928148
KL_PSD_EKM_0053	POLICE	Njarakkal Police Station	njarakkal	Kerala	Ernakulam	9497987119	\N	shonjklsekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0484	2495680	2026-02-27 02:48:31.928576
KL_PSD_EKM_0054	POLICE	Nedumbassery Police Station	nedumbassery	Kerala	Ernakulam	9497987128	\N	shonsyekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0484	2610611	2026-02-27 02:48:31.929001
KL_PSD_EKM_0055	POLICE	Chengamanad Police Station	chengamanad	Kerala	Ernakulam	9497980466	\N	shocgmdekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0484	2474057	2026-02-27 02:48:31.929426
KL_PSD_EKM_0056	POLICE	Angamaly Police Station	angamaly	Kerala	Ernakulam	9497980462	\N	shoagmlekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0484	2452328	2026-02-27 02:48:31.929871
KL_PSD_EKM_0057	POLICE	Munambam Police Station	munambam	Kerala	Ernakulam	9497980481	\N	shommbmekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0484	2488023	2026-02-27 02:48:31.930331
KL_PSD_EKM_0058	POLICE	Puthenvelikkara Police Station	puthenvelikkara	Kerala	Ernakulam	9497980494	\N	shoptkrekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0484	2487098	2026-02-27 02:48:31.930791
KL_PSD_EKM_0059	POLICE	Vadakkekara Police Station	vadakkekara	Kerala	Ernakulam	9497987117	\N	shovkkaekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0484	2482016	2026-02-27 02:48:31.931257
KL_PSD_EKM_0060	POLICE	Varapuzha Police Station	varapuzha	Kerala	Ernakulam	9497980498	\N	shovrpasekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0484	2513073	2026-02-27 02:48:31.931689
KL_PSD_EKM_0061	POLICE	North Paravoor Police Station	north paravoor	Kerala	Ernakulam	9497980484	\N	shonpvrpekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0484	2445525	2026-02-27 02:48:31.932117
KL_PSD_EKM_0062	POLICE	Binanipuram Police Station	binanipuram	Kerala	Ernakulam	9497980465	\N	shobnrmekmrl.pol@kerala.gov.in	\N	\N	\N	\N	0484	2607083	2026-02-27 02:48:31.932764
KL_PSD_IDK_0001	POLICE	Peruvanthanam Police Station	peruvanthanam	Kerala	Idukki	9497947164	\N	shopvnmpsidk.pol@kerala.gov.in	\N	\N	\N	\N	0486	9280347	2026-02-27 02:48:31.933202
KL_PSD_IDK_0002	POLICE	Upputhara Police Station	upputhara	Kerala	Idukki	9497947174	\N	shouptridk.pol@kerala.gov.in	\N	\N	\N	\N	0486	9244315	2026-02-27 02:48:31.933639
KL_PSD_IDK_0003	POLICE	Peerumedu Police Station	peerumedu	Kerala	Idukki	9497987097	\N	shopermdpsidk.pol@kerala.gov.in	\N	\N	\N	\N	0486	9232085	2026-02-27 02:48:31.934111
KL_PSD_IDK_0004	POLICE	Vandiperiyar Police Station	vandiperiyar	Kerala	Idukki	9497947166	\N	shovndpryridk.pol@kerala.gov.in	\N	\N	\N	\N	0486	9252244	2026-02-27 02:48:31.934558
KL_PSD_IDK_0005	POLICE	Kumily Police Station	kumily	Kerala	Idukki	9497987096	\N	shokumlypsidk.pol@kerala.gov.in	\N	\N	\N	\N	0486	9222049	2026-02-27 02:48:31.935014
KL_PSD_IDK_0006	POLICE	Vandanmedu Police Station	vandanmedu	Kerala	Idukki	9497947176	\N	shovnmdpsidk.pol@kerala.gov.in	\N	\N	\N	\N	0486	8277050	2026-02-27 02:48:31.935447
KL_PSD_IDK_0007	POLICE	Kattappana Police Station	kattappana	Kerala	Idukki	9497987095	\N	shoktpnpsidk.pol@kerala.gov.in	\N	\N	\N	\N	0486	8272263	2026-02-27 02:48:31.935816
KL_PSD_IDK_0008	POLICE	Mullapperiyar Police Station	mullapperiyar	Kerala	Idukki	9497980376	\N	shomullaperyrpsidk-ker@kerala.gov.in	\N	\N	\N	\N	\N	\N	2026-02-27 02:48:31.936193
KL_PSD_IDK_0009	POLICE	Vagamon Police Station	vagamon	Kerala	Idukki	9497975359	\N	shovagamonidk.pol@kerala.gov.in	\N	\N	\N	\N	0486	9248250	2026-02-27 02:48:31.936564
KL_PSD_IDK_0010	POLICE	Thankamony Police Station	thankamony	Kerala	Idukki	9497932354	\N	shothankamonypsidk.pol@kerala.gov.in	\N	\N	\N	\N	0486	8275600	2026-02-27 02:48:31.936928
KL_PSD_IDK_0011	POLICE	Muttom Police Station	muttom	Kerala	Idukki	9497932287	\N	shomuttompsidk.pol@kerala.gov.in	\N	\N	\N	\N	0486	2257777	2026-02-27 02:48:31.937294
KL_PSD_IDK_0012	POLICE	Cumbummettu Police Station	cumbummettu	Kerala	Idukki	9497947168	\N	shocbmntpsidk.pol@kerala.gov.in	\N	\N	\N	\N	0486	8279250	2026-02-27 02:48:31.937665
KL_PSD_IDK_0013	POLICE	Vanitha Police Station	vanitha	Kerala	Idukki	9497932415	\N	vanithapsidk.pol@kerala.gov.in	\N	\N	\N	\N	0486	2232203	2026-02-27 02:48:31.938417
KL_PSD_IDK_0014	POLICE	Cyber Crime Police Station	cyber crime	Kerala	Idukki	9497976030	\N	cyberpsidk.pol@kerala.gov.in	\N	\N	\N	\N	0486	2232319	2026-02-27 02:48:31.938829
KL_PSD_IDK_0015	POLICE	Udumbanchola Police Station	udumbanchola	Kerala	Idukki	9497947266	\N	shoudbnpsidk.pol@kerala.gov.in	\N	\N	\N	\N	\N	\N	2026-02-27 02:48:31.939209
KL_PSD_IDK_0016	POLICE	Karimkunnam Police Station	karimkunnam	Kerala	Idukki	9497947167	\N	shokmknmpsidk.pol@kerala.gov.in	\N	\N	\N	\N	0486	2242336	2026-02-27 02:48:31.939582
KL_PSD_IDK_0017	POLICE	Kanjar Police Station	kanjar	Kerala	Idukki	9497987088	\N	shokanjrpsidk.pol@kerala.gov.in	\N	\N	\N	\N	0486	2252034	2026-02-27 02:48:31.939952
KL_PSD_IDK_0018	POLICE	Karimannoor Police Station	karimannoor	Kerala	Idukki	9497947165	\N	shokmnrpsidk.pol@kerala.gov.in	\N	\N	\N	\N	0486	2262434	2026-02-27 02:48:31.940384
KL_PSD_IDK_0019	POLICE	Kaliyar Police Station	kaliyar	Kerala	Idukki	9497987087	\N	shoklridk.pol@kerala.gov.in	\N	\N	\N	\N	0486	2245334	2026-02-27 02:48:31.94077
KL_PSD_IDK_0020	POLICE	Thodupuzha Police Station	thodupuzha	Kerala	Idukki	9497987086	\N	shotdzapsidk.pol@kerala.gov.in	\N	\N	\N	\N	0486	2222494	2026-02-27 02:48:31.941148
KL_PSD_IDK_0021	POLICE	Kulamavu Police Station	kulamavu	Kerala	Idukki	9497980362	\N	shokulmvpsidk.pol@kerala.gov.in	\N	\N	\N	\N	0486	2259904	2026-02-27 02:48:31.941514
KL_PSD_IDK_0022	POLICE	Vellathooval Police Station	vellathooval	Kerala	Idukki	9497947163	\N	shoveltvalidk.pol@kerala.gov.in	\N	\N	\N	\N	0486	4276254	2026-02-27 02:48:31.941884
KL_PSD_IDK_0023	POLICE	Rajakkad Police Station	rajakkad	Kerala	Idukki	9497947170	\N	shorjkdpsidk.pol@kerala.gov.in	\N	\N	\N	\N	0486	8242325	2026-02-27 02:48:31.942415
KL_PSD_IDK_0024	POLICE	Adimaly Police Station	adimaly	Kerala	Idukki	9497987093	\N	shoadlyidk.pol@kerala.gov.in	\N	\N	\N	\N	0486	4222145	2026-02-27 02:48:31.942944
KL_PSD_IDK_0025	POLICE	Santhanpara Police Station	santhanpara	Kerala	Idukki	9497987092	\N	shostnprapsid.pol@kerala.gov.in	\N	\N	\N	\N	0486	8247211	2026-02-27 02:48:31.943458
KL_PSD_IDK_0026	POLICE	Devikulam Police Station	devikulam	Kerala	Idukki	9497947169	\N	shodvkmpsidk.pol@kerala.gov.in	\N	\N	\N	\N	0486	5264225	2026-02-27 02:48:31.943934
KL_PSD_IDK_0027	POLICE	Marayur Police Station	marayur	Kerala	Idukki	9497947172	\N	shomryrpsidk.pol@kerala.gov.in	\N	\N	\N	\N	0486	5252210	2026-02-27 02:48:31.944405
KL_PSD_IDK_0028	POLICE	Munnar Police Station	munnar	Kerala	Idukki	9497987091	\N	shomnrpsidk.pol@kerala.gov.in	\N	\N	\N	\N	0486	5230321	2026-02-27 02:48:31.944912
KL_PSD_IDK_0029	POLICE	Nedumkandam Police Station	nedumkandam	Kerala	Idukki	9497987094	\N	shondkndmsidk.pol@kerala.gov.in	\N	\N	\N	\N	0486	8232045	2026-02-27 02:48:31.945453
KL_PSD_IDK_0030	POLICE	Karimanal Police Station	karimanal	Kerala	Idukki	9497980369	\N	shokrmlidk.pol@kerala.gov.in	\N	\N	\N	\N	0485	2552278	2026-02-27 02:48:31.945995
KL_PSD_IDK_0031	POLICE	Kanjikuzhy Police Station	kanjikuzhy	Kerala	Idukki	9497987090	\N	shoknjkypsidk.pol@kerala.gov.in	\N	\N	\N	\N	0486	2239280	2026-02-27 02:48:31.946534
KL_PSD_IDK_0032	POLICE	Murikkassery Police Station	murikkassery	Kerala	Idukki	9497947175	\N	shomriksryidk.pol@kerala.gov.in	\N	\N	\N	\N	0486	8263250	2026-02-27 02:48:31.947077
KL_PSD_IDK_0033	POLICE	Idukki Police Station	idukki	Kerala	Idukki	9497987089	\N	shoidkpsidk.pol@kerala.gov.in	\N	\N	\N	\N	0486	2235229	2026-02-27 02:48:31.947613
KL_PSD_KNR_0001	POLICE	Dharmadam Police Station	dharmadam	Kerala	Kannur	9497947324	\N	shodmdmknr.pol@kerala.gov.in	\N	\N	\N	\N	0490	2348070	2026-02-27 02:48:31.948153
KL_PSD_KNR_0002	POLICE	Panoor Police Station	panoor	Kerala	Kannur	9497987209	\N	shopnrknr.pol@kerala.gov.in	\N	\N	\N	\N	0490	2316777	2026-02-27 02:48:31.948686
KL_PSD_KNR_0003	POLICE	Kathirur Police Station	kathirur	Kerala	Kannur	9497947251	\N	shokdrknr.pol@kerala.gov.in	\N	\N	\N	\N	0490	2305888	2026-02-27 02:48:31.949251
KL_PSD_KNR_0004	POLICE	Kannavam Police Station	kannavam	Kerala	Kannur	9497947272	\N	shokannavaknr.pol@kerala.gov.in	\N	\N	\N	\N	0490	2301100	2026-02-27 02:48:31.95015
KL_PSD_KNR_0005	POLICE	Kuthuparamba Police Station	kuthuparamba	Kerala	Kannur	9497987208	\N	shoktpbpsknr.pol@kerala.gov.in	\N	\N	\N	\N	0490	2361288	2026-02-27 02:48:31.9507
KL_PSD_KNR_0006	POLICE	New Mahe Police Station	new mahe	Kerala	Kannur	9497964007	\N	shonmaheknr.pol@kerala.gov.in	\N	\N	\N	\N	0490	2356688	2026-02-27 02:48:31.951418
KL_PSD_KNR_0007	POLICE	Mattannur Police Station	mattannur	Kerala	Kannur	9497987210	\N	shomtnrknr.pol@kerala.gov.in	\N	\N	\N	\N	0490	2471844	2026-02-27 02:48:31.951971
KL_PSD_KNR_0008	POLICE	Thalassery Police Station	thalassery	Kerala	Kannur	9497987207	\N	shotslrypsknr.pol@kerala.gov.in	\N	\N	\N	\N	0490	2323355	2026-02-27 02:48:31.952514
KL_PSD_KNR_0009	POLICE	Chockli Police Station	chockli	Kerala	Kannur	9497947252	\N	shocklknr.pol@kerala.gov.in	\N	\N	\N	\N	0490	2338223	2026-02-27 02:48:31.953069
KL_PSD_KNR_0010	POLICE	Kolavallur Police Station	kolavallur	Kerala	Kannur	9497947253	\N	shoklvlrpsknr.pol@kerala.gov.in	\N	\N	\N	\N	0490	2462025	2026-02-27 02:48:31.953709
KL_PSD_KNR_0011	POLICE	Azhikkal Coastal Police Station	azhikkal coastal	Kerala	Kannur	9497980880	\N	shoazklknr.pol@kerala.gov.in	\N	\N	\N	\N	0497	2774001	2026-02-27 02:48:31.954286
KL_PSD_KNR_0012	POLICE	Vanitha Police Station	vanitha	Kerala	Kannur	9497980895	\N	vanithapsknr.pol@kerala.gov.in	\N	\N	\N	\N	0497	2763240	2026-02-27 02:48:31.954863
KL_PSD_KNR_0013	POLICE	Thalassery Coastal Police Station	thalassery coastal	Kerala	Kannur	9497927789	\N	shocoastlknr.pol@kerala.gov.in	\N	\N	\N	\N	0490	2322100	2026-02-27 02:48:31.955393
KL_PSD_KNR_0014	POLICE	Pinarayi Police Station	pinarayi	Kerala	Kannur	9497980905	\N	shopnryknr.pol@kerala.gov.in	\N	\N	\N	\N	0490	2385100	2026-02-27 02:48:31.955913
KL_PSD_KNR_0015	POLICE	Cyber Crime Police Station	cyber crime	Kerala	Kannur	9497975778	\N	cyberpsknr.pol@kerala.gov.in	\N	\N	\N	\N	\N	\N	2026-02-27 02:48:31.956422
KL_PSD_KNR_0016	POLICE	Mayyil Police Station	mayyil	Kerala	Kannur	9497947256	\N	shomayilpsknr.pol@kerala.gov.in	\N	\N	\N	\N	0460	2274000	2026-02-27 02:48:31.957192
KL_PSD_KNR_0017	POLICE	Kannur Town Police Station	kannur town	Kerala	Kannur	9497987203	\N	shoknrtwnknr.pol@kerala.gov.in	\N	\N	\N	\N	0497	2763336	2026-02-27 02:48:31.957724
KL_PSD_KNR_0018	POLICE	Kannur City Police Station	kannur city	Kerala	Kannur	9497987204	\N	shoknrcityknr.pol@kerala.gov.in	\N	\N	\N	\N	0497	2731187	2026-02-27 02:48:31.95838
KL_PSD_KNR_0019	POLICE	Edakkad Police Station	edakkad	Kerala	Kannur	9497947254	\N	shoedkdknr.pol@kerala.gov.in	\N	\N	\N	\N	0497	2832022	2026-02-27 02:48:31.95891
KL_PSD_KNR_0020	POLICE	Chakkarakkal Police Station	chakkarakkal	Kerala	Kannur	9497947250	\N	shochkrklknr.pol@kerala.gov.in	\N	\N	\N	\N	0497	2851669	2026-02-27 02:48:31.959633
KL_PSD_KNR_0021	POLICE	Valapattanam Police Station	valapattanam	Kerala	Kannur	9497987205	\N	shovlptnmknr.pol@kerala.gov.in	\N	\N	\N	\N	0497	2777100	2026-02-27 02:48:31.960212
KL_PSD_KNR_0022	POLICE	Kannapuram Police Station	kannapuram	Kerala	Kannur	9497947318	\N	shoknprmpsknr.pol@kerala.gov.in	\N	\N	\N	\N	0497	2860244	2026-02-27 02:48:31.960715
KL_PSD_KNR_0023	POLICE	Thaliparamba Police Station	thaliparamba	Kerala	Kannur	9497987212	\N	shotprbpsknr.pol@kerala.gov.in	\N	\N	\N	\N	0460	2203100	2026-02-27 02:48:31.961178
KL_PSD_KNR_0024	POLICE	Cherupuzha Police Station	cherupuzha	Kerala	Kannur	9497947288	\N	shocherpzknr.pol@kerala.gov.in	\N	\N	\N	\N	0498	5242100	2026-02-27 02:48:31.961645
KL_PSD_KNR_0025	POLICE	Payangadi Police Station	payangadi	Kerala	Kannur	9497947258	\N	shopyngdipknr.pol@kerala.gov.in	\N	\N	\N	\N	0497	2870233	2026-02-27 02:48:31.962097
KL_PSD_KNR_0026	POLICE	Pariyaram Police Station	pariyaram	Kerala	Kannur	9497947257	\N	shomedcolknr.pol@kerala.gov.in	\N	\N	\N	\N	0497	2808100	2026-02-27 02:48:31.962544
KL_PSD_KNR_0027	POLICE	Payyannur Police Station	payyannur	Kerala	Kannur	9497987213	\N	shopayrpsknr.pol@kerala.gov.in	\N	\N	\N	\N	0498	5203091	2026-02-27 02:48:31.962993
KL_PSD_KNR_0028	POLICE	Peringome Police Station	peringome	Kerala	Kannur	9497947259	\N	shoprgnmknr.pol@kerala.gov.in	\N	\N	\N	\N	0498	5236232	2026-02-27 02:48:31.963439
KL_PSD_KNR_0029	POLICE	Alakkode Police Station	alakkode	Kerala	Kannur	9497987214	\N	shoalkdknr.pol@kerala.gov.in	\N	\N	\N	\N	0460	2255255	2026-02-27 02:48:31.963908
KL_PSD_KNR_0030	POLICE	Kudiyanmala Police Station	kudiyanmala	Kerala	Kannur	9497947321	\N	shokdnmlaknr.pol@kerala.gov.in	\N	\N	\N	\N	0460	2218240	2026-02-27 02:48:31.964361
KL_PSD_KNR_0031	POLICE	Sreekandapuram Police Station	sreekandapuram	Kerala	Kannur	9497987215	\N	shosdpmpsknr.pol@kerala.gov.in	\N	\N	\N	\N	0460	2230216	2026-02-27 02:48:31.965008
KL_PSD_KNR_0032	POLICE	Payyavoor Police Station	payyavoor	Kerala	Kannur	9497980875	\N	shopyvrknr.pol@kerala.gov.in	\N	\N	\N	\N	0460	2210130	2026-02-27 02:48:31.965495
KL_PSD_KNR_0033	POLICE	Karikottakari Police Station	karikottakari	Kerala	Kannur	9497947322	\N	shokriktkrknr.pol@kerala.gov.in	\N	\N	\N	\N	0490	2454520	2026-02-27 02:48:31.965999
KL_PSD_KNR_0034	POLICE	Iritty Police Station	iritty	Kerala	Kannur	9497987206	\N	shoirityknr.pol@kerala.gov.in	\N	\N	\N	\N	0490	2491221	2026-02-27 02:48:31.966444
KL_PSD_KNR_0035	POLICE	Ulikkal Police Station	ulikkal	Kerala	Kannur	9497980886	\N	shoulklknr.pol@kerala.gov.in	\N	\N	\N	\N	0460	2228121	2026-02-27 02:48:31.96694
KL_PSD_KNR_0036	POLICE	Aralam Police Station	aralam	Kerala	Kannur	9497947255	\N	shoarlmknr.pol@kerala.gov.in	\N	\N	\N	\N	0490	2454540	2026-02-27 02:48:31.967421
KL_PSD_KNR_0037	POLICE	Peravoor Police Station	peravoor	Kerala	Kannur	9497987211	\N	shopervrpsknr.pol@kerala.gov.in	\N	\N	\N	\N	0490	2444453	2026-02-27 02:48:31.967912
KL_PSD_KNR_0038	POLICE	Muzhakkunnu Police Station	muzhakkunnu	Kerala	Kannur	9497947328	\N	shomzkmknr.pol@kerala.gov.in	\N	\N	\N	\N	0490	2458200	2026-02-27 02:48:31.968452
KL_PSD_KNR_0039	POLICE	Irikkur Police Station	irikkur	Kerala	Kannur	9497980850	\N	shoirkrknr.pol@kerala.gov.in	\N	\N	\N	\N	0460	2257100	2026-02-27 02:48:31.968939
KL_PSD_KSD_0001	POLICE	Railway Police Station Kasaragod	railway kasaragod	Kerala	Kasaragod	\N	\N	\N	\N	\N	\N	\N	0499	4223030	2026-02-27 02:48:31.969472
KL_PSD_KSD_0002	POLICE	Bekal Police Station	bekal	Kerala	Kasaragod	9497980916	\N	shobekalpsksd.pol@kerala.gov.in	\N	\N	\N	\N	0467	2236224	2026-02-27 02:48:31.969943
KL_PSD_KSD_0003	POLICE	Ambalathara Police Station	ambalathara	Kerala	Kasaragod	9497947275	\N	shoambltraksd.pol@kerala.gov.in	\N	\N	\N	\N	0467	2243200	2026-02-27 02:48:31.970384
KL_PSD_KSD_0004	POLICE	Vellarikundu Police Station	vellarikundu	Kerala	Kasaragod	9497980931	\N	shovlrikndksd.pol@kerala.gov.in	\N	\N	\N	\N	0467	2242300	2026-02-27 02:48:31.970813
KL_PSD_KSD_0005	POLICE	Chittarikal Police Station	chittarikal	Kerala	Kasaragod	9497947274	\N	shochtrklksd.pol@kerala.gov.in	\N	\N	\N	\N	0467	2221054	2026-02-27 02:48:31.971441
KL_PSD_KSD_0006	POLICE	Rajapuram Police Station	rajapuram	Kerala	Kasaragod	9497947264	\N	shorjpmksd.pol@kerala.gov.in	\N	\N	\N	\N	0467	2224029	2026-02-27 02:48:31.971857
KL_PSD_KSD_0007	POLICE	Nileswar Police Station	nileswar	Kerala	Kasaragod	9497980928	\N	shonlswrmpksd.pol@kerala.gov.in	\N	\N	\N	\N	0467	2280240	2026-02-27 02:48:31.97227
KL_PSD_KSD_0008	POLICE	Cheemeni Police Station	cheemeni	Kerala	Kasaragod	9497947273	\N	shocheemenksd.pol@kerala.gov.in	\N	\N	\N	\N	0467	2250220	2026-02-27 02:48:31.972678
KL_PSD_KSD_0009	POLICE	Chandera Police Station	chandera	Kerala	Kasaragod	9497947262	\N	shochanderksd.pol@kerala.gov.in	\N	\N	\N	\N	0467	2210242	2026-02-27 02:48:31.973093
KL_PSD_KSD_0010	POLICE	Hosdurg Police Station	hosdurg	Kerala	Kasaragod	9497980921	\N	shohdgksd.pol@kerala.gov.in	\N	\N	\N	\N	0467	2204229	2026-02-27 02:48:31.973633
KL_PSD_KSD_0011	POLICE	Coastal Police Station Kumbla	coastal kumbla	Kerala	Kasaragod	9497970226	\N	shokmbcstksd.pol@kerala.gov.in	\N	\N	\N	\N	0499	8241100	2026-02-27 02:48:31.974123
KL_PSD_KSD_0012	POLICE	Coastal Police Station Trikaripur	coastal trikaripur	Kerala	Kasaragod	9497970217	\N	shotkprcostlksd.pol@kerala.gov.in	\N	\N	\N	\N	0499	4287123	2026-02-27 02:48:31.974641
KL_PSD_KSD_0013	POLICE	Vanitha Police Station Kasaragod	vanitha kasaragod	Kerala	Kasaragod	9497990344	\N	\N	\N	\N	\N	\N	0499	4231166	2026-02-27 02:48:31.975128
KL_PSD_KSD_0014	POLICE	Kasaragod Police Station	kasaragod	Kerala	Kasaragod	9497980934	\N	shoksdps.pol@kerala.gov.in	\N	\N	\N	\N	04994	230100	2026-02-27 02:48:31.975605
KL_PSD_KSD_0015	POLICE	Coastal Police Station Thalangara	coastal thalangara	Kerala	Kasaragod	9497970297	\N	shotlgraksd.pol@kerala.gov.in	\N	\N	\N	\N	04994	224800	2026-02-27 02:48:31.976084
KL_PSD_KSD_0016	POLICE	Vidhyanagar Police Station	vidhyanagar	Kerala	Kasaragod	9497990343	\N	shovidhyangrpsksd.pol@kerala.gov.in	\N	\N	\N	\N	04994	256766	2026-02-27 02:48:31.976572
KL_PSD_KSD_0017	POLICE	Badiadukka Police Station	badiadukka	Kerala	Kasaragod	9497947260	\N	shobddkksd.pol@kerala.gov.in	\N	\N	\N	\N	04998	284033	2026-02-27 02:48:31.97706
KL_PSD_KSD_0018	POLICE	Kumbla Police Station	kumbla	Kerala	Kasaragod	9497980924	\N	shokblaksd.pol@kerala.gov.in	\N	\N	\N	\N	04998	8213037	2026-02-27 02:48:31.977533
KL_PSD_KSD_0019	POLICE	Manjeswar Police Station	manjeswar	Kerala	Kasaragod	9497947263	\N	shomnjsrmksd.pol@kerala.gov.in	\N	\N	\N	\N	04998	272640	2026-02-27 02:48:31.977981
KL_PSD_KSD_0020	POLICE	Adhur Police Station	adhur	Kerala	Kasaragod	9497980913	\N	shoadhurpsksd.pol@kerala.gov.in	\N	\N	\N	\N	04994	260024	2026-02-27 02:48:31.978419
KL_PSD_KSD_0021	POLICE	Bedakom Police Station	bedakom	Kerala	Kasaragod	9497947261	\N	shobdkmksd.pol@kerala.gov.in	\N	\N	\N	\N	04994	205238	2026-02-27 02:48:31.978859
KL_PSD_KLM_0001	POLICE	Karunagapally Police Station	karunagapally	Kerala	Kollam	9497987035	\N	shokpyklm.pol@kerala.gov.in	\N	\N	\N	\N	0476	2620233	2026-02-27 02:48:31.979327
KL_PSD_KLM_0002	POLICE	Traffic Police Station Kollam	traffic kollam	Kerala	Kollam	9497930863	\N	shotrklm.pol@kerala.gov.in	\N	\N	\N	\N	0474	2745298	2026-02-27 02:48:31.979768
KL_PSD_KLM_0003	POLICE	Vanitha Police Station Kollam	vanitha kollam	Kerala	Kollam	9497960632	\N	sivanithaps.pol@kerala.gov.in	\N	\N	\N	\N	0474	2764579	2026-02-27 02:48:31.980206
KL_PSD_KLM_0004	POLICE	Neendakara Coastal Police Station	neendakara coastal	Kerala	Kollam	9497987044	\N	shocostalklm.pol@kerala.gov.in	\N	\N	\N	\N	0476	2685200	2026-02-27 02:48:31.980646
KL_PSD_KLM_0005	POLICE	Kottiyam Police Station	kottiyam	Kerala	Kollam	9497987033	\N	shokottiymklm.pol@kerala.gov.in	\N	\N	\N	\N	0474	2530100	2026-02-27 02:48:31.981089
KL_PSD_KLM_0006	POLICE	Chathannoor Police Station	chathannoor	Kerala	Kollam	9497947130	\N	shoctnrklm.pol@kerala.gov.in	\N	\N	\N	\N	0474	2593250	2026-02-27 02:48:31.981584
KL_PSD_KLM_0007	POLICE	Paravoor Police Station	paravoor	Kerala	Kollam	9497987032	\N	shoparvoorklm.pol@kerala.gov.in	\N	\N	\N	\N	0474	2512344	2026-02-27 02:48:31.982026
KL_PSD_KLM_0008	POLICE	Parippally Police Station	parippally	Kerala	Kollam	9497947128	\N	shoprplypsklm.pol@kerala.gov.in	\N	\N	\N	\N	0474	2572065	2026-02-27 02:48:31.982461
KL_PSD_KLM_0009	POLICE	Anchalummoodu Police Station	anchalummoodu	Kerala	Kollam	9497947134	\N	shoanmdklm.pol@kerala.gov.in	\N	\N	\N	\N	0474	2552682	2026-02-27 02:48:31.982896
KL_PSD_KLM_0010	POLICE	Ochira Police Station	ochira	Kerala	Kollam	9497947133	\N	shooachklm.pol@kerala.gov.in	\N	\N	\N	\N	0476	2690233	2026-02-27 02:48:31.983327
KL_PSD_KLM_0011	POLICE	Chavara Police Station	chavara	Kerala	Kollam	9497987037	\N	shochvraklm.pol@kerala.gov.in	\N	\N	\N	\N	0476	2680029	2026-02-27 02:48:31.983795
KL_PSD_KLM_0012	POLICE	Thekkumbhagam Police Station	thekkumbhagam	Kerala	Kollam	9497947132	\N	shocvrsklm.pol@kerala.gov.in	\N	\N	\N	\N	0476	2872550	2026-02-27 02:48:31.98423
KL_PSD_KLM_0013	POLICE	Kannanalloor Police Station	kannanalloor	Kerala	Kollam	9497947265	\N	shokanklm.pol@kerala.gov.in	\N	\N	\N	\N	0474	2566366	2026-02-27 02:48:31.984662
KL_PSD_KLM_0014	POLICE	Sakthikulangara Police Station	sakthikulangara	Kerala	Kollam	9497947131	\N	shoskthiklm.pol@kerala.gov.in	\N	\N	\N	\N	0474	2770966	2026-02-27 02:48:31.985107
KL_PSD_KLM_0015	POLICE	Kollam East Police Station	kollam east	Kerala	Kollam	9497987030	\N	shoklmeklm.pol@kerala.gov.in	\N	\N	\N	\N	0474	2742072	2026-02-27 02:48:31.985553
KL_PSD_KLM_0016	POLICE	Pallithottam Police Station	pallithottam	Kerala	Kollam	9497947129	\N	shopltmklm.pol@kerala.gov.in	\N	\N	\N	\N	0474	2742042	2026-02-27 02:48:31.985993
KL_PSD_KLM_0017	POLICE	Cyber Crime Police Station Kollam	cyber crime kollam	Kerala	Kollam	9497960566	\N	cyberpsklm.pol@kerala.gov.in	\N	\N	\N	\N	\N	\N	2026-02-27 02:48:31.986414
KL_PSD_KLM_0018	POLICE	Eravipuram Police Station	eravipuram	Kerala	Kollam	9497980216	\N	shoervpmpsklm.pol@kerala.gov.in	\N	\N	\N	\N	0474	2723626	2026-02-27 02:48:31.986985
KL_PSD_KLM_0019	POLICE	Kilikolloor Police Station	kilikolloor	Kerala	Kollam	9497947126	\N	shokklrklm.pol@kerala.gov.in	\N	\N	\N	\N	0474	2711155	2026-02-27 02:48:31.987372
KL_PSD_KLM_0020	POLICE	Kollam West Police Station	kollam west	Kerala	Kollam	9497987031	\N	shoklmwklm.pol@kerala.gov.in	\N	\N	\N	\N	0474	2795086	2026-02-27 02:48:31.98781
KL_PSD_KLM_0021	POLICE	East Kallada Police Station	east kallada	Kerala	Kollam	9497947139	\N	shoekldaklmrl.pol@kerala.gov.in	\N	\N	\N	\N	0474	2585240	2026-02-27 02:48:31.988291
KL_PSD_KLM_0022	POLICE	Thenmala Police Station	thenmala	Kerala	Kollam	9497947138	\N	shothenklmrl.pol@kerala.gov.in	\N	\N	\N	\N	0475	2344550	2026-02-27 02:48:31.988799
KL_PSD_KLM_0023	POLICE	Eroor Police Station	eroor	Kerala	Kollam	9497947135	\N	shoerrklmrl.pol@kerala.gov.in	\N	\N	\N	\N	0475	2273204	2026-02-27 02:48:31.989433
KL_PSD_KLM_0024	POLICE	Pooyappally Police Station	pooyappally	Kerala	Kollam	9497947136	\N	shopylyklmrl.pol@kerala.gov.in	\N	\N	\N	\N	0474	2462043	2026-02-27 02:48:31.990003
KL_PSD_KLM_0025	POLICE	Cyber Crime Police Station Kollam Rural	cyber crime kollam rural	Kerala	Kollam	9497907673	\N	cyberpsklmrl.pol@kerala.gov.in	\N	\N	\N	\N	0474	2966794	2026-02-27 02:48:31.990476
KL_PSD_KLM_0026	POLICE	Achankovil Police Station	achankovil	Kerala	Kollam	9497960654	\N	shoakvlklmrl.pol@kerala.gov.in	\N	\N	\N	\N	0475	2342300	2026-02-27 02:48:31.99093
KL_PSD_KLM_0027	POLICE	Chithara Police Station	chithara	Kerala	Kollam	9497960609	\N	shochraklmrl.pol@kerala.gov.in	\N	\N	\N	\N	0474	2440011	2026-02-27 02:48:31.99139
KL_PSD_KLM_0028	POLICE	Punalur Police Station	punalur	Kerala	Kollam	9497987038	\N	shopnlrklmrl.pol@kerala.gov.in	\N	\N	\N	\N	0474	2222700	2026-02-27 02:48:31.991885
KL_PSD_KLM_0029	POLICE	Anchal Police Station	anchal	Kerala	Kollam	9497987042	\N	shoanchlklmrl.pol@kerala.gov.in	\N	\N	\N	\N	0475	2273366	2026-02-27 02:48:31.992359
KL_PSD_KLM_0030	POLICE	Ezhukone Police Station	ezhukone	Kerala	Kollam	9497987043	\N	shoehknpklmrl.pol@kerala.gov.in	\N	\N	\N	\N	0474	2482088	2026-02-27 02:48:31.992807
KL_PSD_KLM_0031	POLICE	Kadakkal Police Station	kadakkal	Kerala	Kollam	9497987040	\N	shokdklpklmrl.pol@kerala.gov.in	\N	\N	\N	\N	0474	2422033	2026-02-27 02:48:31.993251
KL_PSD_KLM_0032	POLICE	Kottarakkara Police Station	kottarakkara	Kerala	Kollam	9497987039	\N	shokkzpsklmrl.pol@kerala.gov.in	\N	\N	\N	\N	0474	2454629	2026-02-27 02:48:31.99373
KL_PSD_KLM_0033	POLICE	Kulathupuzha Police Station	kulathupuzha	Kerala	Kollam	9497987041	\N	shoktzpsklmrl.pol@kerala.gov.in	\N	\N	\N	\N	0475	2317529	2026-02-27 02:48:31.994177
KL_PSD_KLM_0034	POLICE	Kundara Police Station	kundara	Kerala	Kollam	9497987034	\N	shokdrklmrl.pol@kerala.gov.in	\N	\N	\N	\N	0474	2547239	2026-02-27 02:48:31.994623
KL_PSD_KLM_0035	POLICE	Sooranadu Police Station	sooranadu	Kerala	Kollam	9497947277	\N	shosorndklmrl.pol@kerala.gov.in	\N	\N	\N	\N	0476	2851208	2026-02-27 02:48:31.995007
KL_PSD_KLM_0036	POLICE	Sasthamkotta Police Station	sasthamkotta	Kerala	Kollam	9497987036	\N	shostktklmrl.pol@kerala.gov.in	\N	\N	\N	\N	0476	2830355	2026-02-27 02:48:31.995444
KL_PSD_KLM_0037	POLICE	Chadayamangalam Police Station	chadayamangalam	Kerala	Kollam	9497947137	\N	shocglmklmrl.pol@kerala.gov.in	\N	\N	\N	\N	0474	2475311	2026-02-27 02:48:31.995884
KL_PSD_KLM_0038	POLICE	Kunnikkode Police Station	kunnikkode	Kerala	Kollam	9497947141	\N	shokunkdklmrl.pol@kerala.gov.in	\N	\N	\N	\N	0475	2322095	2026-02-27 02:48:31.996274
KL_PSD_KLM_0039	POLICE	Pathanapuram Police Station	pathanapuram	Kerala	Kollam	9497990338	\N	shopprmklmrl.pol@kerala.gov.in	\N	\N	\N	\N	0475	2352200	2026-02-27 02:48:31.996714
KL_PSD_KLM_0040	POLICE	Puthoor Police Station	puthoor	Kerala	Kollam	9497947140	\N	shoptorklmrl.pol@kerala.gov.in	\N	\N	\N	\N	0474	2419100	2026-02-27 02:48:31.997151
KL_PSD_KTM_0001	POLICE	Erattupetta Police Station	erattupetta	Kerala	Kottayam	9497980316	\N	shoetptpsktm.pol@kerala.gov.in	\N	\N	\N	\N	0482	2272228	2026-02-27 02:48:31.997589
KL_PSD_KTM_0002	POLICE	Kanjirappally Police Station	kanjirappally	Kerala	Kottayam	9497980323	\N	shokjpypsktm.pol@kerala.gov.in	\N	\N	\N	\N	04828	202800	2026-02-27 02:48:31.997979
KL_PSD_KTM_0003	POLICE	Marangattupally Police Station	marangattupally	Kerala	Kottayam	9497980334	\N	shomglyktm.pol@kerala.gov.in	\N	\N	\N	\N	0482	2251065	2026-02-27 02:48:31.998452
KL_PSD_KTM_0004	POLICE	Ramapuram Police Station	ramapuram	Kerala	Kottayam	9497980342	\N	shorprmktm.pol@kerala.gov.in	\N	\N	\N	\N	0482	2260252	2026-02-27 02:48:31.998901
KL_PSD_KTM_0005	POLICE	Kidangoor Police Station	kidangoor	Kerala	Kottayam	9497980325	\N	shokgorktm.pol@kerala.gov.in	\N	\N	\N	\N	0482	2254195	2026-02-27 02:48:31.99934
KL_PSD_KTM_0006	POLICE	Pala Police Station	pala	Kerala	Kottayam	9497980337	\N	shopalapsktm.pol@kerala.gov.in	\N	\N	\N	\N	0482	2212334	2026-02-27 02:48:31.999723
KL_PSD_KTM_0007	POLICE	Manarcad Police Station	manarcad	Kerala	Kottayam	9497947161	\N	shomnkrdpsktm.pol@kerala.gov.in	\N	\N	\N	\N	0481	2370288	2026-02-27 02:48:32.00016
KL_PSD_KTM_0008	POLICE	Pampady Police Station	pampady	Kerala	Kottayam	9497980340	\N	shoppdyktm.pol@kerala.gov.in	\N	\N	\N	\N	0481	2505322	2026-02-27 02:48:32.000599
KL_PSD_KTM_0009	POLICE	Pallikkathode Police Station	pallikkathode	Kerala	Kottayam	9497947155	\N	shoplktdktm.pol@kerala.gov.in	\N	\N	\N	\N	0481	2551066	2026-02-27 02:48:32.000979
KL_PSD_KTM_0010	POLICE	Ponkunnam Police Station	ponkunnam	Kerala	Kottayam	9497980341	\N	shopknmpsktm.pol@kerala.gov.in	\N	\N	\N	\N	04828	221240	2026-02-27 02:48:32.00136
KL_PSD_KTM_0011	POLICE	Mundakkayam Police Station	mundakkayam	Kerala	Kottayam	9497947154	\N	shomdkympsktm.pol@kerala.gov.in	\N	\N	\N	\N	04828	272317	2026-02-27 02:48:32.001692
KL_PSD_KTM_0012	POLICE	Kuravilangadu Police Station	kuravilangadu	Kerala	Kottayam	9497980331	\N	shokrvlgdktm.pol@kerala.gov.in	\N	\N	\N	\N	0482	2230323	2026-02-27 02:48:32.002074
KL_PSD_KTM_0013	POLICE	Melukavu Police Station	melukavu	Kerala	Kottayam	9497980335	\N	shomlkvupsktm.pol@kerala.gov.in	\N	\N	\N	\N	0482	2219058	2026-02-27 02:48:32.002406
KL_PSD_KTM_0014	POLICE	Velloor Police Station	velloor	Kerala	Kottayam	9497980345	\N	shovlrktm.pol@kerala.gov.in	\N	\N	\N	\N	04829	257160	2026-02-27 02:48:32.002964
KL_PSD_KTM_0015	POLICE	Kaduthuruthy Police Station	kaduthuruthy	Kerala	Kottayam	9497980322	\N	shoktrtpsktm.pol@kerala.gov.in	\N	\N	\N	\N	04829	282323	2026-02-27 02:48:32.003302
KL_PSD_KTM_0016	POLICE	Thalayolaparambu Police Station	thalayolaparambu	Kerala	Kottayam	9497947152	\N	shotlpbktm.pol@kerala.gov.in	\N	\N	\N	\N	04829	239200	2026-02-27 02:48:32.003636
KL_PSD_KTM_0017	POLICE	Vaikom Police Station	vaikom	Kerala	Kottayam	9497980347	\N	shovkmktm.pol@kerala.gov.in	\N	\N	\N	\N	04829	231330	2026-02-27 02:48:32.003967
KL_PSD_KTM_0018	POLICE	Thidanadu Police Station	thidanadu	Kerala	Kottayam	9497980343	\N	shotidndpsktm.pol@kerala.gov.in	\N	\N	\N	\N	04828	235295	2026-02-27 02:48:32.004295
KL_PSD_KTM_0019	POLICE	Kumarakom Police Station	kumarakom	Kerala	Kottayam	9497947159	\N	shokmkamktm.pol@kerala.gov.in	\N	\N	\N	\N	0481	2524339	2026-02-27 02:48:32.004674
KL_PSD_KTM_0020	POLICE	Kottayam Traffic Police Station	kottayam traffic	Kerala	Kottayam	9497980353	\N	shotrktm.pol@kerala.gov.in	\N	\N	\N	\N	0481	2581578	2026-02-27 02:48:32.005044
KL_PSD_KTM_0021	POLICE	Kottayam West Police Station	kottayam west	Kerala	Kottayam	9497980328	\N	shoktymwstktm.pol@kerala.gov.in	\N	\N	\N	\N	0481	2567210	2026-02-27 02:48:32.005389
KL_PSD_KTM_0022	POLICE	Kottayam East Police Station	kottayam east	Kerala	Kottayam	9497980326	\N	shoktymestktm.pol@kerala.gov.in	\N	\N	\N	\N	0481	2560333	2026-02-27 02:48:32.005791
KL_PSD_KTM_0023	POLICE	Erumely Police Station	erumely	Kerala	Kottayam	9497980317	\N	shoemlyktm.pol@kerala.gov.in	\N	\N	\N	\N	04828	210233	2026-02-27 02:48:32.006141
KL_PSD_KTM_0024	POLICE	Manimala Police Station	manimala	Kerala	Kottayam	9497947156	\N	shomnlaktm.pol@kerala.gov.in	\N	\N	\N	\N	04828	247141	2026-02-27 02:48:32.00652
KL_PSD_KTM_0025	POLICE	Karukachal Police Station	karukachal	Kerala	Kottayam	9497947158	\N	shokrhllpsktm.pol@kerala.gov.in	\N	\N	\N	\N	0481	2485126	2026-02-27 02:48:32.006868
KL_PSD_KTM_0026	POLICE	Vakathanam Police Station	vakathanam	Kerala	Kottayam	9497987074	\N	shovktnmpsktm.pol@kerala.gov.in	\N	\N	\N	\N	0481	2462296	2026-02-27 02:48:32.007217
KL_PSD_KTM_0027	POLICE	Thrikkodithanam Police Station	thrikkodithanam	Kerala	Kottayam	9497947153	\N	shotriktnmktm.pol@kerala.gov.in	\N	\N	\N	\N	0481	2440200	2026-02-27 02:48:32.007569
KL_PSD_KTM_0028	POLICE	Chingavanam Police Station	chingavanam	Kerala	Kottayam	9497947162	\N	shochvnmpsktm.pol@kerala.gov.in	\N	\N	\N	\N	0481	2430587	2026-02-27 02:48:32.007934
KL_PSD_KTM_0029	POLICE	Changanassery Police Station	changanassery	Kerala	Kottayam	9497980349	\N	shocgrypsktm.pol@kerala.gov.in	\N	\N	\N	\N	0481	2420100	2026-02-27 02:48:32.008282
KL_PSD_KTM_0030	POLICE	Gandhinagar Police Station	gandhinagar	Kerala	Kottayam	9497947157	\N	shogandingrps.pol@kerala.gov.in	\N	\N	\N	\N	0481	2597210	2026-02-27 02:48:32.00867
KL_PSD_KTM_0031	POLICE	Ettumanoor Police Station	ettumanoor	Kerala	Kottayam	9497980318	\N	shoetmnrpsktm.pol@kerala.gov.in	\N	\N	\N	\N	0481	2535517	2026-02-27 02:48:32.009029
KL_PSD_KTM_0032	POLICE	Ayarkunnam Police Station	ayarkunnam	Kerala	Kottayam	9497980346	\N	shoayrkmpsktm.pol@kerala.gov.in	\N	\N	\N	\N	0481	2546660	2026-02-27 02:48:32.009382
KL_PSD_KTM_0033	POLICE	Vanitha Police Station Kottayam	vanitha kottayam	Kerala	Kottayam	9497961697	\N	shovnthapsktm.pol@kerala.gov.in	\N	\N	\N	\N	\N	\N	2026-02-27 02:48:32.00976
KL_PSD_KKD_0001	POLICE	Elathur Coastal Police Station	elathur coastal	Kerala	Kozhikode	9497987183	\N	shoelcstkkd.pol@kerala.gov.in	\N	\N	\N	\N	\N	\N	2026-02-27 02:48:32.010124
KL_PSD_KKD_0002	POLICE	Elathur Police Station	elathur	Kerala	Kozhikode	9497947232	\N	shoelthrkkd.pol@kerala.gov.in	\N	\N	\N	\N	0495	2462045	2026-02-27 02:48:32.010459
KL_PSD_KKD_0003	POLICE	Vellayil Police Station	vellayil	Kerala	Kozhikode	9497947237	\N	shovellaylkkd.pol@kerala.gov.in	\N	\N	\N	\N	0495	2384799	2026-02-27 02:48:32.010786
KL_PSD_KKD_0004	POLICE	Chevayur Police Station	chevayur	Kerala	Kozhikode	9497987182	\N	shochevyurkkd.pol@kerala.gov.in	\N	\N	\N	\N	0495	2371403	2026-02-27 02:48:32.01111
KL_PSD_KKD_0005	POLICE	Cyber Police Station Kozhikode City	cyber kozhikode city	Kerala	Kozhikode	9497987184	\N	cyberpskkd.pol@kerala.gov.in	\N	\N	\N	\N	0495	2970400	2026-02-27 02:48:32.011502
KL_PSD_KKD_0006	POLICE	Kunnamangalam Police Station	kunnamangalam	Kerala	Kozhikode	9497947230	\N	shokglmkkd.pol@kerala.gov.in	\N	\N	\N	\N	0495	2800256	2026-02-27 02:48:32.011954
KL_PSD_KKD_0007	POLICE	Coastal Police Station Beypore	coastal beypore	Kerala	Kozhikode	9497987175	\N	shobprkkd.pol@kerala.gov.in	\N	\N	\N	\N	0495	2471003	2026-02-27 02:48:32.012311
KL_PSD_KKD_0008	POLICE	Vanitha Police Station Kozhikode	vanitha kozhikode	Kerala	Kozhikode	9497963644	\N	shovnthskkd.pol@kerala.gov.in	\N	\N	\N	\N	0495	2724070	2026-02-27 02:48:32.012653
KL_PSD_KKD_0009	POLICE	Pantheerankavu Police Station	pantheerankavu	Kerala	Kozhikode	9497947287	\N	shopkavukkd.pol@kerala.gov.in	\N	\N	\N	\N	\N	\N	2026-02-27 02:48:32.012986
KL_PSD_KKD_0010	POLICE	Chemmangad Police Station	chemmangad	Kerala	Kozhikode	9497947229	\N	shochmngdpkkd.pol@kerala.gov.in	\N	\N	\N	\N	0495	2304178	2026-02-27 02:48:32.013314
KL_PSD_KKD_0011	POLICE	Kozhikode Town Police Station	kozhikode town	Kerala	Kozhikode	9497987177	\N	shotownpskkd.pol@kerala.gov.in	\N	\N	\N	\N	0495	2366177	2026-02-27 02:48:32.013668
KL_PSD_KKD_0012	POLICE	Nadakkavu Police Station	nadakkavu	Kerala	Kozhikode	9497987181	\N	shonakvkkd.pol@kerala.gov.in	\N	\N	\N	\N	0495	2767344	2026-02-27 02:48:32.014
KL_PSD_KKD_0013	POLICE	Kasaba Police Station	kasaba	Kerala	Kozhikode	9497987178	\N	shokasabakkd.pol@kerala.gov.in	\N	\N	\N	\N	0495	2722286	2026-02-27 02:48:32.014531
KL_PSD_KKD_0014	POLICE	Panniankara Police Station	panniankara	Kerala	Kozhikode	9497947236	\N	shopykrkkd.pol@kerala.gov.in	\N	\N	\N	\N	0495	2320860	2026-02-27 02:48:32.014866
KL_PSD_KKD_0015	POLICE	Nallalam Police Station	nallalam	Kerala	Kozhikode	9497987179	\N	shonallmkkd.pol@kerala.gov.in	\N	\N	\N	\N	0495	2420643	2026-02-27 02:48:32.015192
KL_PSD_KKD_0016	POLICE	Feroke Police Station	feroke	Kerala	Kozhikode	9497980708	\N	shoferokekkd.pol@kerala.gov.in	\N	\N	\N	\N	0495	2482230	2026-02-27 02:48:32.015522
KL_PSD_KKD_0017	POLICE	Beypore Police Station	beypore	Kerala	Kozhikode	9497947234	\N	shobyrkkd.pol@kerala.gov.in	\N	\N	\N	\N	0495	2414002	2026-02-27 02:48:32.015845
KL_PSD_KKD_0018	POLICE	Marad Police Station	marad	Kerala	Kozhikode	9497947233	\N	shomaradpskkd.pol@kerala.gov.in	\N	\N	\N	\N	0495	2418200	2026-02-27 02:48:32.016167
KL_PSD_KKD_0019	POLICE	Medical College Police Station	medical college	Kerala	Kozhikode	9497987180	\N	shomedcolkkd.pol@kerala.gov.in	\N	\N	\N	\N	0495	2357644	2026-02-27 02:48:32.016494
KL_PSD_KKD_0020	POLICE	Mavoor Police Station	mavoor	Kerala	Kozhikode	9497947235	\N	shomavoorkkd.pol@kerala.gov.in	\N	\N	\N	\N	0495	2883124	2026-02-27 02:48:32.016824
KL_PSD_KKD_0021	POLICE	Thottilpalam Police Station	thottilpalam	Kerala	Kozhikode	9497980794	\N	shottlmkkdrl.pol@kerala.gov.in	\N	\N	\N	\N	0496	2565890	2026-02-27 02:48:32.017149
KL_PSD_KKD_0022	POLICE	Perambra Police Station	perambra	Kerala	Kozhikode	9497987190	\N	shoprmbrapsdl.pol@kerala.gov.in	\N	\N	\N	\N	0496	2611475	2026-02-27 02:48:32.017501
KL_PSD_KKD_0023	POLICE	Peruvannamuzhi Police Station	peruvannamuzhi	Kerala	Kozhikode	9497980791	\N	shoprzykkdrl.pol@kerala.gov.in	\N	\N	\N	\N	0496	2668234	2026-02-27 02:48:32.017832
KL_PSD_KKD_0024	POLICE	Koorachundu Police Station	koorachundu	Kerala	Kozhikode	9497981142	\N	shokcndkkdrl.pol@kerala.gov.in	\N	\N	\N	\N	0496	2660222	2026-02-27 02:48:32.018161
KL_PSD_KKD_0025	POLICE	Thamarassery Police Station	thamarassery	Kerala	Kozhikode	9497980792	\N	shotrspskkdrl.pol@kerala.gov.in	\N	\N	\N	\N	0495	2220040	2026-02-27 02:48:32.018486
KL_PSD_KKD_0026	POLICE	Thiruvambady Police Station	thiruvambady	Kerala	Kozhikode	9497987191	\N	shotmbdkkdrl.pol@kerala.gov.in	\N	\N	\N	\N	0495	2252038	2026-02-27 02:48:32.018816
KL_PSD_KKD_0027	POLICE	Kodenchery Police Station	kodenchery	Kerala	Kozhikode	9497947244	\N	shokncrykkdrl.pol@kerala.gov.in	\N	\N	\N	\N	0495	2236236	2026-02-27 02:48:32.019143
KL_PSD_KKD_0028	POLICE	Koduvally Police Station	koduvally	Kerala	Kozhikode	9497987192	\N	shokdvlykkdrl.pol@kerala.gov.in	\N	\N	\N	\N	0495	2210213	2026-02-27 02:48:32.019467
KL_PSD_KKD_0029	POLICE	Mukkom Police Station	mukkom	Kerala	Kozhikode	9497980785	\N	shomukkmkkdrl.pol@kerala.gov.in	\N	\N	\N	\N	0495	2297133	2026-02-27 02:48:32.019793
KL_PSD_KKD_0030	POLICE	Balussery Police Station	balussery	Kerala	Kozhikode	9497987194	\N	shoblsrykkdrl.pol@kerala.gov.in	\N	\N	\N	\N	0496	2642040	2026-02-27 02:48:32.020165
KL_PSD_KKD_0031	POLICE	Kakkur Police Station	kakkur	Kerala	Kozhikode	9497980779	\N	shokakkukkdrl.pol@kerala.gov.in	\N	\N	\N	\N	0495	2260233	2026-02-27 02:48:32.020584
KL_PSD_KKD_0032	POLICE	Payyoli Police Station	payyoli	Kerala	Kozhikode	9497987187	\N	shopylikkdrl.pol@kerala.gov.in	\N	\N	\N	\N	0496	2602034	2026-02-27 02:48:32.020921
KL_PSD_KKD_0033	POLICE	Vatakara Police Station	vatakara	Kerala	Kozhikode	9497987186	\N	shovdkrapkdrl.pol@kerala.gov.in	\N	\N	\N	\N	0496	2524206	2026-02-27 02:48:32.021274
KL_PSD_KKD_0034	POLICE	Edachery Police Station	edachery	Kerala	Kozhikode	9497980777	\N	shoedcrykkdrl.pol@kerala.gov.in	\N	\N	\N	\N	0496	2547022	2026-02-27 02:48:32.021637
KL_PSD_KKD_0035	POLICE	Chombala Police Station	chombala	Kerala	Kozhikode	9497980802	\N	shochmblapkdl.pol@kerala.gov.in	\N	\N	\N	\N	0496	2504600	2026-02-27 02:48:32.021967
KL_PSD_KKD_0036	POLICE	Kuttyadi Police Station	kuttyadi	Kerala	Kozhikode	9497987189	\N	shoktydikkdrl.pol@kerala.gov.in	\N	\N	\N	\N	0496	2597100	2026-02-27 02:48:32.02229
KL_PSD_KKD_0037	POLICE	Meppayur Police Station	meppayur	Kerala	Kozhikode	9497980784	\N	shommayurpdrl.pol@kerala.gov.in	\N	\N	\N	\N	0496	2676220	2026-02-27 02:48:32.022612
KL_PSD_KKD_0038	POLICE	Koyilandy Police Station	koyilandy	Kerala	Kozhikode	9497987193	\N	shoklndykkdrl.pol@kerala.gov.in	\N	\N	\N	\N	0496	2620296	2026-02-27 02:48:32.022936
KL_PSD_KKD_0039	POLICE	Atholi Police Station	atholi	Kerala	Kozhikode	9497980774	\N	shoatholkkdrl.pol@kerala.gov.in	\N	\N	\N	\N	0496	2672233	2026-02-27 02:48:32.023259
KL_PSD_KKD_0040	POLICE	Nadapuram Police Station	nadapuram	Kerala	Kozhikode	9497987188	\N	shondprmkkdrl.pol@kerala.gov.in	\N	\N	\N	\N	0496	2550225	2026-02-27 02:48:32.02358
KL_PSD_KKD_0041	POLICE	Valayam Police Station	valayam	Kerala	Kozhikode	9497980795	\N	shovlymkkdrl.pol@kerala.gov.in	\N	\N	\N	\N	0496	2460699	2026-02-27 02:48:32.023902
KL_PSD_MLP_0001	POLICE	Pookkottumpadam Police Station	pookkottumpadam	Kerala	Malappuram	9497963223	\N	shopktpdmpsmpm.pol@kerala.gov.in	\N	\N	\N	\N	04931	260181	2026-02-27 02:48:32.024226
KL_PSD_MLP_0002	POLICE	Karuvarakundu Police Station	karuvarakundu	Kerala	Malappuram	9497980657	\N	shokrkdpsmpm.pol@kerala.gov.in	\N	\N	\N	\N	04931	280210	2026-02-27 02:48:32.024554
KL_PSD_MLP_0003	POLICE	Ponnani Police Station	ponnani	Kerala	Malappuram	9497980679	\N	shoponnanimpm.pol@kerala.gov.in	\N	\N	\N	\N	0494	2666037	2026-02-27 02:48:32.024905
KL_PSD_MLP_0004	POLICE	Perumpadappu Police Station	perumpadappu	Kerala	Malappuram	9497947227	\N	shoprmpdpumpm.pol@kerala.gov.in	\N	\N	\N	\N	0494	2670259	2026-02-27 02:48:32.025229
KL_PSD_MLP_0005	POLICE	Perinthalmanna Police Station	perinthalmanna	Kerala	Malappuram	9497980675	\N	shoptmampm.pol@kerala.gov.in	\N	\N	\N	\N	04933	227231	2026-02-27 02:48:32.025556
KL_PSD_MLP_0006	POLICE	Parappanangadi Police Station	parappanangadi	Kerala	Malappuram	9497947225	\N	shoppgdmpm.pol@kerala.gov.in	\N	\N	\N	\N	0494	2410260	2026-02-27 02:48:32.025883
KL_PSD_MLP_0007	POLICE	Pandikad Police Station	pandikad	Kerala	Malappuram	9497980673	\N	shopdkdmpm.pol@kerala.gov.in	\N	\N	\N	\N	0483	2783222	2026-02-27 02:48:32.026209
KL_PSD_MLP_0008	POLICE	Nilambur Police Station	nilambur	Kerala	Malappuram	9497980671	\N	shonlbrpsmpm.pol@kerala.gov.in	\N	\N	\N	\N	04931	220241	2026-02-27 02:48:32.026532
KL_PSD_MLP_0009	POLICE	Melattur Police Station	melattur	Kerala	Malappuram	9497980670	\N	shomltrmpm.pol@kerala.gov.in	\N	\N	\N	\N	04933	278221	2026-02-27 02:48:32.026856
KL_PSD_MLP_0010	POLICE	Malappuram Police Station	malappuram	Kerala	Malappuram	9497980664	\N	shompmpsmpm.pol@kerala.gov.in	\N	\N	\N	\N	0483	2734966	2026-02-27 02:48:32.027177
KL_PSD_MLP_0011	POLICE	Kondotty Police Station	kondotty	Kerala	Malappuram	9497980659	\N	shokndtypsmpm.pol@kerala.gov.in	\N	\N	\N	\N	0483	2712041	2026-02-27 02:48:32.027702
KL_PSD_MLP_0012	POLICE	Vanitha Police Station	vanitha	Kerala	Malappuram	9497922580	\N	shovnthpsmpm.pol@kerala.gov.in	\N	\N	\N	\N	0483	2734830	2026-02-27 02:48:32.028258
KL_PSD_MLP_0013	POLICE	Vengara Police Station	vengara	Kerala	Malappuram	9497980689	\N	shovgrmpm.pol@kerala.gov.in	\N	\N	\N	\N	0494	2450210	2026-02-27 02:48:32.028598
KL_PSD_MLP_0014	POLICE	Wandoor Police Station	wandoor	Kerala	Malappuram	9497987172	\N	showndrmpm.pol@kerala.gov.in	\N	\N	\N	\N	04931	247027	2026-02-27 02:48:32.028938
KL_PSD_MLP_0015	POLICE	Pothukal Police Station	pothukal	Kerala	Malappuram	9497980692	\N	shopothukampm.pol@kerala.gov.in	\N	\N	\N	\N	04931	241520	2026-02-27 02:48:32.029278
KL_PSD_MLP_0016	POLICE	Vazhikadavu Police Station	vazhikadavu	Kerala	Malappuram	9497963388	\N	shovzdvpsmpm.pol@kerala.gov.in	\N	\N	\N	\N	0493	1275233	2026-02-27 02:48:32.029605
KL_PSD_MLP_0017	POLICE	Vazhakkad Police Station	vazhakkad	Kerala	Malappuram	9497947219	\N	shovzkdmpm.pol@kerala.gov.in	\N	\N	\N	\N	0483	2725212	2026-02-27 02:48:32.02993
KL_PSD_MLP_0018	POLICE	Valanchery Police Station	valanchery	Kerala	Malappuram	9497980687	\N	shovlchypsmpm.pol@kerala.gov.in	\N	\N	\N	\N	0494	2644343	2026-02-27 02:48:32.030255
KL_PSD_MLP_0019	POLICE	Tirurangadi Police Station	tirurangadi	Kerala	Malappuram	9497980685	\N	shotirgdipmpm.pol@kerala.gov.in	\N	\N	\N	\N	0494	2460331	2026-02-27 02:48:32.030583
KL_PSD_MLP_0020	POLICE	Tirur Police Station	tirur	Kerala	Malappuram	9497980683	\N	shotirurpsmpm.pol@kerala.gov.in	\N	\N	\N	\N	0494	2422046	2026-02-27 02:48:32.030934
KL_PSD_MLP_0021	POLICE	Thenjipalam Police Station	thenjipalam	Kerala	Malappuram	9497947228	\N	shothplmpsmpm.pol@kerala.gov.in	\N	\N	\N	\N	0494	2400260	2026-02-27 02:48:32.031259
KL_PSD_MLP_0022	POLICE	Tanur Police Station	tanur	Kerala	Malappuram	9497981332	\N	shotanurpsmpm.pol@kerala.gov.in	\N	\N	\N	\N	0494	2440221	2026-02-27 02:48:32.031583
KL_PSD_MLP_0023	POLICE	Edakkara Police Station	edakkara	Kerala	Malappuram	9497980654	\N	shoedakkarmpm.pol@kerala.gov.in	\N	\N	\N	\N	0493	1275222	2026-02-27 02:48:32.031907
KL_PSD_MLP_0024	POLICE	Manjeri Police Station	manjeri	Kerala	Malappuram	9497987165	\N	shomjrmpm.pol@kerala.gov.in	\N	\N	\N	\N	0483	2766852	2026-02-27 02:48:32.03223
KL_PSD_MLP_0025	POLICE	Kottakkal Police Station	kottakkal	Kerala	Malappuram	9497947226	\N	shoktklmpm.pol@kerala.gov.in	\N	\N	\N	\N	0483	2742253	2026-02-27 02:48:32.032557
KL_PSD_MLP_0026	POLICE	Kuttipuram Police Station	kuttipuram	Kerala	Malappuram	9497947223	\N	shokutprmmpm.pol@kerala.gov.in	\N	\N	\N	\N	0494	2608250	2026-02-27 02:48:32.032881
KL_PSD_MLP_0027	POLICE	Kolathur Police Station	kolathur	Kerala	Malappuram	9497947221	\N	shokolathumpm.pol@kerala.gov.in	\N	\N	\N	\N	04933	203244	2026-02-27 02:48:32.033211
KL_PSD_MLP_0028	POLICE	Changaramkulam Police Station	changaramkulam	Kerala	Malappuram	9497947224	\N	shocgklmmpm.pol@kerala.gov.in	\N	\N	\N	\N	0494	2650437	2026-02-27 02:48:32.033785
KL_PSD_MLP_0029	POLICE	Areekode Police Station	areekode	Kerala	Malappuram	9497980660	\N	shoareacodmpm.pol@kerala.gov.in	\N	\N	\N	\N	0483	2850222	2026-02-27 02:48:32.034251
KL_PSD_MLP_0030	POLICE	Kalpakanchery Police Station	kalpakanchery	Kerala	Malappuram	9497947220	\N	shokkcympm.pol@kerala.gov.in	\N	\N	\N	\N	0494	2547022	2026-02-27 02:48:32.034651
KL_PSD_MLP_0031	POLICE	Kalikavu Police Station	kalikavu	Kerala	Malappuram	9497947290	\N	shokalikavmpm.pol@kerala.gov.in	\N	\N	\N	\N	04931	257222	2026-02-27 02:48:32.035085
KL_PSD_MLP_0032	POLICE	Edavanna Police Station	edavanna	Kerala	Malappuram	9497947289	\N	shoedavannmpm.pol@kerala.gov.in	\N	\N	\N	\N	0483	2700268	2026-02-27 02:48:32.035477
KL_PSD_MLP_0033	POLICE	Karipur Police Station	karipur	Kerala	Malappuram	9497922542	\N	shokprmpm.pol@kerala.gov.in	\N	\N	\N	\N	0483	2712598	2026-02-27 02:48:32.035863
KL_PSD_PKD_0001	POLICE	Padagiri Police Station	padagiri	Kerala	Palakkad	9497941918	\N	shopdgripspkd.pol@kerala.gov.in	\N	\N	\N	\N	04923	246237	2026-02-27 02:48:32.036256
KL_PSD_PKD_0002	POLICE	Cherpulassery Police Station	cherpulassery	Kerala	Palakkad	9497987158	\N	shocrplsrypkd.pol@kerala.gov.in	\N	\N	\N	\N	0466	2282235	2026-02-27 02:48:32.036848
KL_PSD_PKD_0003	POLICE	Chalissery Police Station	chalissery	Kerala	Palakkad	9497947215	\N	shoclsypkd.pol@kerala.gov.in	\N	\N	\N	\N	0466	2256254	2026-02-27 02:48:32.037378
KL_PSD_PKD_0004	POLICE	Thrithala Police Station	thrithala	Kerala	Palakkad	9497947311	\N	shottlapkd.pol@kerala.gov.in	\N	\N	\N	\N	0466	2272004	2026-02-27 02:48:32.037752
KL_PSD_PKD_0005	POLICE	Pattambi Police Station	pattambi	Kerala	Palakkad	9497980625	\N	shoptmbipspkd.pol@kerala.gov.in	\N	\N	\N	\N	0466	2212224	2026-02-27 02:48:32.038145
KL_PSD_PKD_0006	POLICE	Shornur Police Station	shornur	Kerala	Palakkad	9497947218	\N	shosrrpkd.pol@kerala.gov.in	\N	\N	\N	\N	0466	2222406	2026-02-27 02:48:32.0385
KL_PSD_PKD_0007	POLICE	Ottappalam Police Station	ottappalam	Kerala	Palakkad	9497987156	\N	shootpmpkd.pol@kerala.gov.in	\N	\N	\N	\N	0466	2244325	2026-02-27 02:48:32.038846
KL_PSD_PKD_0008	POLICE	Sreekrishnapuram Police Station	sreekrishnapuram	Kerala	Palakkad	9497941923	\N	shoskppkd.pol@kerala.gov.in	\N	\N	\N	\N	0466	2960172	2026-02-27 02:48:32.039195
KL_PSD_PKD_0009	POLICE	Nenmara Police Station	nenmara	Kerala	Palakkad	9497987155	\N	shonmrpkd.pol@kerala.gov.in	\N	\N	\N	\N	04923	243399	2026-02-27 02:48:32.039572
KL_PSD_PKD_0010	POLICE	Parambikulam Police Station	parambikulam	Kerala	Palakkad	9497941912	\N	shopklmpspkd.pol@kerala.gov.in	\N	\N	\N	\N	04253	277224	2026-02-27 02:48:32.039917
KL_PSD_PKD_0011	POLICE	Kollengode Police Station	kollengode	Kerala	Palakkad	9497980610	\N	shoklgdpspkd.pol@kerala.gov.in	\N	\N	\N	\N	0492	3262329	2026-02-27 02:48:32.040265
KL_PSD_PKD_0012	POLICE	Mangalam Dam Police Station	mangalam dam	Kerala	Palakkad	9497941937	\N	shomldmpkd.pol@kerala.gov.in	\N	\N	\N	\N	0492	2262100	2026-02-27 02:48:32.040611
KL_PSD_PKD_0013	POLICE	Vadakkenchery Police Station	vadakkenchery	Kerala	Palakkad	9497987153	\N	shovdcypspkd.pol@kerala.gov.in	\N	\N	\N	\N	0492	2255100	2026-02-27 02:48:32.040963
KL_PSD_PKD_0014	POLICE	Pudur Police Station	pudur	Kerala	Palakkad	9497980599	\N	shopudurpkd.pol@kerala.gov.in	\N	\N	\N	\N	\N	\N	2026-02-27 02:48:32.041289
KL_PSD_PKD_0015	POLICE	Vanitha Police Station Palakkad	vanitha palakkad	Kerala	Palakkad	\N	\N	shovnthpspkd.pol@kerala.gov.in	\N	\N	\N	\N	\N	\N	2026-02-27 02:48:32.041621
KL_PSD_PKD_0016	POLICE	Meenakshipuram Police Station	meenakshipuram	Kerala	Palakkad	9497987364	\N	shomkpurampspkd.pol@kerala.gov.in	\N	\N	\N	\N	0492	3234100	2026-02-27 02:48:32.041945
KL_PSD_PKD_0017	POLICE	Kuzhalmannam Police Station	kuzhalmannam	Kerala	Palakkad	9497987152	\N	shokzlmnmpkd.pol@kerala.gov.in	\N	\N	\N	\N	0492	2272032	2026-02-27 02:48:32.042458
KL_PSD_PKD_0018	POLICE	Sholayar Police Station	sholayar	Kerala	Palakkad	9497941934	\N	shoshlyrpspkd.pol@kerala.gov.in	\N	\N	\N	\N	0492	209007	2026-02-27 02:48:32.042789
KL_PSD_PKD_0019	POLICE	Agali Police Station	agali	Kerala	Palakkad	9497987160	\N	shoagalipspkd.pol@kerala.gov.in	\N	\N	\N	\N	04924	254222	2026-02-27 02:48:32.043135
KL_PSD_PKD_0020	POLICE	Kalladikkode Police Station	kalladikkode	Kerala	Palakkad	9497947310	\N	shokalladikodpkd.pol@kerala.gov.in	\N	\N	\N	\N	0492	4246103	2026-02-27 02:48:32.043454
KL_PSD_PKD_0021	POLICE	Nattukal Police Station	nattukal	Kerala	Palakkad	9497987363	\N	shonatklpspkd.pol@kerala.gov.in	\N	\N	\N	\N	04924	236250	2026-02-27 02:48:32.043812
KL_PSD_PKD_0022	POLICE	Mannarkkad Police Station	mannarkkad	Kerala	Palakkad	9497987159	\N	shomnkdpspkd.pol@kerala.gov.in	\N	\N	\N	\N	0492	4222290	2026-02-27 02:48:32.04416
KL_PSD_PKD_0023	POLICE	Town South Police Station	town south	Kerala	Palakkad	9497987146	\N	shotownspspkd.pol@kerala.gov.in	\N	\N	\N	\N	0491	2537368	2026-02-27 02:48:32.044513
KL_PSD_PKD_0024	POLICE	Traffic Police Station Palakkad	traffic palakkad	Kerala	Palakkad	9497980644	\N	shotrpkd.pol@kerala.gov.in	\N	\N	\N	\N	0491	2504725	2026-02-27 02:48:32.044875
KL_PSD_PKD_0025	POLICE	Kozhinjampara Police Station	kozhinjampara	Kerala	Palakkad	9497941950	\N	shokozparapkd.pol@kerala.gov.in	\N	\N	\N	\N	04923	272224	2026-02-27 02:48:32.045238
KL_PSD_PKD_0026	POLICE	Kottayi Police Station	kottayi	Kerala	Palakkad	9497941933	\N	shoktypkd.pol@kerala.gov.in	\N	\N	\N	\N	0492	2285501	2026-02-27 02:48:32.045593
KL_PSD_PKD_0027	POLICE	Alathur Police Station	alathur	Kerala	Palakkad	9497987151	\N	shoatrpkd.pol@kerala.gov.in	\N	\N	\N	\N	0492	2222323	2026-02-27 02:48:32.045946
KL_PSD_PKD_0028	POLICE	Kongad Police Station	kongad	Kerala	Palakkad	9497947216	\N	shokongdpspkd.pol@kerala.gov.in	\N	\N	\N	\N	0491	2845230	2026-02-27 02:48:32.046298
KL_PSD_PKD_0029	POLICE	Malampuzha Police Station	malampuzha	Kerala	Palakkad	9497941931	\N	shomlpzpkd.pol@kerala.gov.in	\N	\N	\N	\N	0491	2815284	2026-02-27 02:48:32.046649
KL_PSD_PKD_0030	POLICE	Hemambika Nagar Police Station	hemambika nagar	Kerala	Palakkad	9497980606	\N	shohbngrpspkd.pol@kerala.gov.in	\N	\N	\N	\N	0491	2555208	2026-02-27 02:48:32.047023
KL_PSD_PKD_0031	POLICE	Pudunagaram Police Station	pudunagaram	Kerala	Palakkad	9497947217	\N	shopdngrmppkd.pol@kerala.gov.in	\N	\N	\N	\N	04923	252255	2026-02-27 02:48:32.04738
KL_PSD_PKD_0032	POLICE	Chittur Police Station	chittur	Kerala	Palakkad	9497987149	\N	shoctrpkd.pol@kerala.gov.in	\N	\N	\N	\N	04923	88722338	2026-02-27 02:48:32.047729
KL_PSD_PKD_0033	POLICE	Walayar Police Station	walayar	Kerala	Palakkad	9497947214	\N	showlrpkd.pol@kerala.gov.in	\N	\N	\N	\N	0491	2862264	2026-02-27 02:48:32.048076
KL_PSD_PKD_0034	POLICE	Kasaba Police Station	kasaba	Kerala	Palakkad	9497987148	\N	shoksbapspkd.pol@kerala.gov.in	\N	\N	\N	\N	0491	2566148	2026-02-27 02:48:32.048571
KL_PSD_PKD_0035	POLICE	Mankara Police Station	mankara	Kerala	Palakkad	9497941939	\N	shomkrpkd.pol@kerala.gov.in	\N	\N	\N	\N	0491	2872222	2026-02-27 02:48:32.048926
KL_PSD_PKD_0036	POLICE	Town North Police Station	town north	Kerala	Palakkad	9497987147	\N	shotownnpspkd.pol@kerala.gov.in	\N	\N	\N	\N	0491	2502375	2026-02-27 02:48:32.049279
KL_PSD_PTA_0001	POLICE	Pulikeezhu Police Station	pulikeezhu	Kerala	Pathanamthitta	9497947150	\N	shoplkhupspta.pol@kerala.gov.in	\N	\N	\N	\N	0469	2610149	2026-02-27 02:48:32.04964
KL_PSD_PTA_0002	POLICE	Enath Police Station	enath	Kerala	Pathanamthitta	9497947142	\N	shoenathupta.pol@kerala.gov.in	\N	\N	\N	\N	04734	211800	2026-02-27 02:48:32.049993
KL_PSD_PTA_0003	POLICE	Pandalam Police Station	pandalam	Kerala	Pathanamthitta	9497987051	\N	shopndlmpspta.pol@kerala.gov.in	\N	\N	\N	\N	04734	252222	2026-02-27 02:48:32.050345
KL_PSD_PTA_0004	POLICE	Kodumon Police Station	kodumon	Kerala	Pathanamthitta	9497947143	\N	shokdmnpta.pol@kerala.gov.in	\N	\N	\N	\N	04734	285229	2026-02-27 02:48:32.050698
KL_PSD_PTA_0005	POLICE	Cyber Crime Police Station	cyber crime	Kerala	Pathanamthitta	9497908169	\N	cyberpspta.pol@kerala.gov.in	\N	\N	\N	\N	\N	\N	2026-02-27 02:48:32.051073
KL_PSD_PTA_0006	POLICE	Konni Police Station	konni	Kerala	Pathanamthitta	9497987052	\N	shoknipspta.pol@kerala.gov.in	\N	\N	\N	\N	0468	2242236	2026-02-27 02:48:32.051455
KL_PSD_PTA_0007	POLICE	Koodal Police Station	koodal	Kerala	Pathanamthitta	9497947149	\N	shokoodalpta.pol@kerala.gov.in	\N	\N	\N	\N	04734	270100	2026-02-27 02:48:32.051947
KL_PSD_PTA_0008	POLICE	Thannithodu Police Station	thannithodu	Kerala	Pathanamthitta	9497947147	\N	shothntdupta.pol@kerala.gov.in	\N	\N	\N	\N	0468	2382253	2026-02-27 02:48:32.052304
KL_PSD_PTA_0009	POLICE	Thiruvalla Police Station	thiruvalla	Kerala	Pathanamthitta	9497987053	\N	shotrvlapspta.pol@kerala.gov.in	\N	\N	\N	\N	0469	2600100	2026-02-27 02:48:32.052649
KL_PSD_PTA_0010	POLICE	Keezhvaipur Police Station	keezhvaipur	Kerala	Pathanamthitta	9497987054	\N	shokzvprpta.pol@kerala.gov.in	\N	\N	\N	\N	0469	2682226	2026-02-27 02:48:32.053
KL_PSD_PTA_0011	POLICE	Perumpetty Police Station	perumpetty	Kerala	Pathanamthitta	9497947145	\N	shoprmptyppta.pol@kerala.gov.in	\N	\N	\N	\N	0469	2696262	2026-02-27 02:48:32.053341
KL_PSD_PTA_0012	POLICE	Ranni Police Station	ranni	Kerala	Pathanamthitta	9497980255	\N	shorannypspta.pol@kerala.gov.in	\N	\N	\N	\N	04735	227626	2026-02-27 02:48:32.053671
KL_PSD_PTA_0013	POLICE	Vechoochira Police Station	vechoochira	Kerala	Pathanamthitta	9497947148	\N	shovechpchira.pol@kerala.gov.in	\N	\N	\N	\N	04735	265226	2026-02-27 02:48:32.054001
KL_PSD_PTA_0014	POLICE	Perunad Police Station	perunad	Kerala	Pathanamthitta	9497987056	\N	shoprndupspta.pol@kerala.gov.in	\N	\N	\N	\N	04735	240211	2026-02-27 02:48:32.054361
KL_PSD_PTA_0015	POLICE	Sannidhanam Police Station	sannidhanam	Kerala	Pathanamthitta	\N	\N	\N	\N	\N	\N	\N	04735	202014	2026-02-27 02:48:32.054686
KL_PSD_PTA_0016	POLICE	Malayalappuzha Police Station	malayalappuzha	Kerala	Pathanamthitta	9497980253	\N	shompzhapspta.pol@kerala.gov.in	\N	\N	\N	\N	0468	2300333	2026-02-27 02:48:32.055071
KL_PSD_PTA_0017	POLICE	Vanitha Police Station	vanitha	Kerala	Pathanamthitta	9497907963	\N	showpspta.pol@kerala.gov.in	\N	\N	\N	\N	04682	272100	2026-02-27 02:48:32.055402
KL_PSD_PTA_0018	POLICE	Elavumthitta Police Station	elavumthitta	Kerala	Pathanamthitta	9497908584	\N	shoelvmthpta.pol@kerala.gov.in	\N	\N	\N	\N	0468	2259300	2026-02-27 02:48:32.055727
KL_PSD_PTA_0019	POLICE	Adoor Police Station	adoor	Kerala	Pathanamthitta	9497987050	\N	shoadoorpspta.pol@kerala.gov.in	\N	\N	\N	\N	04734	224829	2026-02-27 02:48:32.056061
KL_PSD_PTA_0020	POLICE	Pathanamthitta Police Station	pathanamthitta	Kerala	Pathanamthitta	9497987046	\N	shoptapspta.pol@kerala.gov.in	\N	\N	\N	\N	0468	2222226	2026-02-27 02:48:32.056393
KL_PSD_PTA_0021	POLICE	Aranmula Police Station	aranmula	Kerala	Pathanamthitta	9497987047	\N	shoarnmlpspta.pol@kerala.gov.in	\N	\N	\N	\N	0468	2318100	2026-02-27 02:48:32.056904
KL_PSD_PTA_0022	POLICE	Koipuram Police Station	koipuram	Kerala	Pathanamthitta	9497947146	\N	shokoprmpspta.pol@kerala.gov.in	\N	\N	\N	\N	0469	2660246	2026-02-27 02:48:32.057458
KL_PSD_PTA_0023	POLICE	Chittar Police Station	chittar	Kerala	Pathanamthitta	9497980228	\N	shoctrpta.pol@kerala.gov.in	\N	\N	\N	\N	04735	255226	2026-02-27 02:48:32.057804
KL_PSD_PTA_0024	POLICE	Moozhiyar Police Station	moozhiyar	Kerala	Pathanamthitta	9497947144	\N	shomzyrpspta.pol@kerala.gov.in	\N	\N	\N	\N	04735	279190	2026-02-27 02:48:32.058134
KL_PSD_PTA_0025	POLICE	Pampa Police Station	pampa	Kerala	Pathanamthitta	9497980229	\N	shopampapspta.pol@kerala.gov.in	\N	\N	\N	\N	04735	203412	2026-02-27 02:48:32.058462
KL_PSD_TVM_0001	POLICE	Cantonment Police Station	cantonment	Kerala	Thiruvananthapuram	9497987000	\N	shoctmntpstvm.pol@kerala.gov.in	\N	\N	\N	\N	0471	2330248	2026-02-27 02:48:32.058836
KL_PSD_TVM_0002	POLICE	Vanitha Police Station WSI	vanitha wsi	Kerala	Thiruvananthapuram	9497980097	\N	shovnthtvm.pol@kerala.gov.in	\N	\N	\N	\N	0471	2321555	2026-02-27 02:48:32.059164
KL_PSD_TVM_0003	POLICE	Museum Police Station	museum	Kerala	Thiruvananthapuram	9497987006	\N	shomsmtvm.pol@kerala.gov.in	\N	\N	\N	\N	0471	2315096	2026-02-27 02:48:32.059498
KL_PSD_TVM_0004	POLICE	Peroorkada Police Station	peroorkada	Kerala	Thiruvananthapuram	9497987005	\N	shoprkdapstvm.pol@kerala.gov.in	\N	\N	\N	\N	0471	2433243	2026-02-27 02:48:32.059927
KL_PSD_TVM_0005	POLICE	Vanchiyoor Police Station	vanchiyoor	Kerala	Thiruvananthapuram	9497980031	\N	shovchyrpstvm.pol@kerala.gov.in	\N	\N	\N	\N	0471	2461129	2026-02-27 02:48:32.060348
KL_PSD_TVM_0006	POLICE	Vattiyoorkavu Police Station	vattiyoorkavu	Kerala	Thiruvananthapuram	9497947105	\N	shovtyktvm.pol@kerala.gov.in	\N	\N	\N	\N	0471	2360690	2026-02-27 02:48:32.060775
KL_PSD_TVM_0007	POLICE	Karamana Police Station	karamana	Kerala	Thiruvananthapuram	9497947120	\N	shokarmanatvm.pol@kerala.gov.in	\N	\N	\N	\N	0471	2343534	2026-02-27 02:48:32.061189
KL_PSD_TVM_0008	POLICE	Nemom Police Station	nemom	Kerala	Thiruvananthapuram	9497987011	\N	shonemompstvm.pol@kerala.gov.in	\N	\N	\N	\N	0471	2390223	2026-02-27 02:48:32.061669
KL_PSD_TVM_0009	POLICE	Vizhinjam Police Station	vizhinjam	Kerala	Thiruvananthapuram	9497987012	\N	shovzjmtvm.pol@kerala.gov.in	\N	\N	\N	\N	0471	2480245	2026-02-27 02:48:32.062228
KL_PSD_TVM_0010	POLICE	Poojappura Police Station	poojappura	Kerala	Thiruvananthapuram	9497947100	\N	shopjprapstvm.pol@kerala.gov.in	\N	\N	\N	\N	0471	2350266	2026-02-27 02:48:32.062655
KL_PSD_TVM_0011	POLICE	Thampanoor Police Station	thampanoor	Kerala	Thiruvananthapuram	9497987013	\N	shotmpnrpstvm.pol@kerala.gov.in	\N	\N	\N	\N	0471	2326543	2026-02-27 02:48:32.063103
KL_PSD_TVM_0012	POLICE	Fort Police Station	fort	Kerala	Thiruvananthapuram	9497987010	\N	shofortpstvm.pol@kerala.gov.in	\N	\N	\N	\N	0471	2461105	2026-02-27 02:48:32.063503
KL_PSD_TVM_0013	POLICE	Valiyathura Police Station	valiyathura	Kerala	Thiruvananthapuram	9497947104	\N	shovltrapstvm.pol@kerala.gov.in	\N	\N	\N	\N	0471	2501833	2026-02-27 02:48:32.063899
KL_PSD_TVM_0014	POLICE	Poonthura Police Station	poonthura	Kerala	Thiruvananthapuram	9497987009	\N	shopntrtvm.pol@kerala.gov.in	\N	\N	\N	\N	0471	2380777	2026-02-27 02:48:32.064294
KL_PSD_TVM_0015	POLICE	Thiruvallam Police Station	thiruvallam	Kerala	Thiruvananthapuram	9497947103	\N	shotvlmtvm.pol@kerala.gov.in	\N	\N	\N	\N	0471	2381148	2026-02-27 02:48:32.064689
KL_PSD_TVM_0016	POLICE	Kovalam Police Station	kovalam	Kerala	Thiruvananthapuram	9497947102	\N	shokvlmtvm.pol@kerala.gov.in	\N	\N	\N	\N	0471	2480255	2026-02-27 02:48:32.06509
KL_PSD_TVM_0017	POLICE	Kazhakuttam Police Station	kazhakuttam	Kerala	Thiruvananthapuram	9497987018	\N	shokzkmtvm.pol@kerala.gov.in	\N	\N	\N	\N	0471	2418320	2026-02-27 02:48:32.065492
KL_PSD_TVM_0018	POLICE	Thumba Police Station	thumba	Kerala	Thiruvananthapuram	9497947106	\N	shothmbtvm.pol@kerala.gov.in	\N	\N	\N	\N	0471	2563754	2026-02-27 02:48:32.065893
KL_PSD_TVM_0019	POLICE	Medical College Police Station	medical college	Kerala	Thiruvananthapuram	9497987008	\N	shomedcoltvm.pol@kerala.gov.in	\N	\N	\N	\N	0471	2443145	2026-02-27 02:48:32.066295
KL_PSD_TVM_0020	POLICE	Sreekariyam Police Station	sreekariyam	Kerala	Thiruvananthapuram	9497947101	\N	shoskmtvm.pol@kerala.gov.in	\N	\N	\N	\N	0471	2592100	2026-02-27 02:48:32.066697
KL_PSD_TVM_0021	POLICE	Mannanthala Police Station	mannanthala	Kerala	Thiruvananthapuram	9497980047	\N	shomtlatvm.pol@kerala.gov.in	\N	\N	\N	\N	0471	2543100	2026-02-27 02:48:32.067112
KL_PSD_TVM_0022	POLICE	Pettah Police Station	pettah	Kerala	Thiruvananthapuram	9497947107	\N	shoptthtvm.pol@kerala.gov.in	\N	\N	\N	\N	0471	2743195	2026-02-27 02:48:32.067547
KL_PSD_TVM_0023	POLICE	Cyber Police Station Thiruvananthapuram	cyber thiruvananthapuram	Kerala	Thiruvananthapuram	\N	\N	cyberps.pol@kerala.gov.in	\N	\N	\N	\N	0471	2322090	2026-02-27 02:48:32.067957
KL_PSD_TVM_0024	POLICE	Coastal Police Station Vizhinjam	coastal vizhinjam	Kerala	Thiruvananthapuram	9497987478	\N	shovizhtvm.pol@kerala.gov.in	\N	\N	\N	\N	0471	2487200	2026-02-27 02:48:32.068355
KL_PSD_TVMRL_0001	POLICE	Vellarada Police Station	vellarada	Kerala	Thiruvananthapuram Rural	9497980138	\N	shovlrdatvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0471	2242023	2026-02-27 02:48:32.068714
KL_PSD_TVMRL_0002	POLICE	Vithura Police Station	vithura	Kerala	Thiruvananthapuram Rural	9497947124	\N	shovtratvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0472	2856243	2026-02-27 02:48:32.069051
KL_PSD_TVMRL_0003	POLICE	Ponmudi Police Station	ponmudi	Kerala	Thiruvananthapuram Rural	9497980131	\N	shopnditvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0472	2890222	2026-02-27 02:48:32.069391
KL_PSD_TVMRL_0004	POLICE	Malayinkeezh Police Station	malayinkeezh	Kerala	Thiruvananthapuram Rural	9497980115	\N	shomkzhtvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0471	2282023	2026-02-27 02:48:32.069725
KL_PSD_TVMRL_0005	POLICE	Vilappilssala Police Station	vilappilssala	Kerala	Thiruvananthapuram Rural	9497947122	\N	shovlpltvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0471	2289060	2026-02-27 02:48:32.070063
KL_PSD_TVMRL_0006	POLICE	Kattakada Police Station	kattakada	Kerala	Thiruvananthapuram Rural	9497980110	\N	shoktkdatvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0471	2290223	2026-02-27 02:48:32.070396
KL_PSD_TVMRL_0007	POLICE	Maranallor Police Station	maranallor	Kerala	Thiruvananthapuram Rural	9497947115	\N	shomrnlrtvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0471	2299100	2026-02-27 02:48:32.070729
KL_PSD_TVMRL_0008	POLICE	Neyyattinkara Police Station	neyyattinkara	Kerala	Thiruvananthapuram Rural	9497947112	\N	shontktvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0471	2222222	2026-02-27 02:48:32.071121
KL_PSD_TVMRL_0009	POLICE	Balaramapuram Police Station	balaramapuram	Kerala	Thiruvananthapuram Rural	9497980103	\N	shoblpmtvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0471	2400366	2026-02-27 02:48:32.071638
KL_PSD_TVMRL_0010	POLICE	Naruvamoodu Police Station	naruvamoodu	Kerala	Thiruvananthapuram Rural	9497947127	\N	shonaruvamdtvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0471	2399377	2026-02-27 02:48:32.071976
KL_PSD_TVMRL_0011	POLICE	Marayamuttom Police Station	marayamuttom	Kerala	Thiruvananthapuram Rural	9497975106	\N	shomarayamtmtvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0471	2277255	2026-02-27 02:48:32.072305
KL_PSD_TVMRL_0012	POLICE	Palode Police Station	palode	Kerala	Thiruvananthapuram Rural	9497980127	\N	shopalodtvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0472	2840260	2026-02-27 02:48:32.072635
KL_PSD_TVMRL_0013	POLICE	Aryancode Police Station	aryancode	Kerala	Thiruvananthapuram Rural	9497947109	\N	shoarncdtvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0471	2256223	2026-02-27 02:48:32.072967
KL_PSD_TVMRL_0014	POLICE	Poovar Police Station	poovar	Kerala	Thiruvananthapuram Rural	9497980132	\N	shopvrtvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0471	2211100	2026-02-27 02:48:32.073304
KL_PSD_TVMRL_0015	POLICE	Kanjiramkulam Police Station	kanjiramkulam	Kerala	Thiruvananthapuram Rural	9497947117	\N	shokklmtvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0471	2261100	2026-02-27 02:48:32.073671
KL_PSD_TVMRL_0016	POLICE	Parassala Police Station	parassala	Kerala	Thiruvananthapuram Rural	9497980129	\N	shopslatvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0471	2202023	2026-02-27 02:48:32.074022
KL_PSD_TVMRL_0017	POLICE	Pozhiyoor Police Station	pozhiyoor	Kerala	Thiruvananthapuram Rural	9497947121	\N	shopzryrtvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0471	2212100	2026-02-27 02:48:32.074406
KL_PSD_TVMRL_0018	POLICE	Nagaroor Police Station	nagaroor	Kerala	Thiruvananthapuram Rural	9497980010	\N	shongrtvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0470	2678100	2026-02-27 02:48:32.074834
KL_PSD_TVMRL_0019	POLICE	Venjaramoodu Police Station	venjaramoodu	Kerala	Thiruvananthapuram Rural	9497980140	\N	shovjmdtvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0472	2872023	2026-02-27 02:48:32.075304
KL_PSD_TVMRL_0020	POLICE	Varkala Police Station	varkala	Kerala	Thiruvananthapuram Rural	9497980135	\N	shovrktvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0470	2602333	2026-02-27 02:48:32.075839
KL_PSD_TVMRL_0021	POLICE	Kallambalam Police Station	kallambalam	Kerala	Thiruvananthapuram Rural	9497947118	\N	shokblmtvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0470	2692066	2026-02-27 02:48:32.07673
KL_PSD_TVMRL_0022	POLICE	Ayiroor Police Station	ayiroor	Kerala	Thiruvananthapuram Rural	9497947110	\N	shoayroorpstvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0470	2666100	2026-02-27 02:48:32.077467
KL_PSD_TVMRL_0023	POLICE	Kadakkavoor Police Station	kadakkavoor	Kerala	Thiruvananthapuram Rural	9497980106	\N	shokdkvrtvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0470	2656629	2026-02-27 02:48:32.078198
KL_PSD_TVMRL_0024	POLICE	Anchuthengu Police Station	anchuthengu	Kerala	Thiruvananthapuram Rural	9497980100	\N	shoatgutvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0470	2656641	2026-02-27 02:48:32.078961
KL_PSD_TVMRL_0025	POLICE	Kadinamkulam Police Station	kadinamkulam	Kerala	Thiruvananthapuram Rural	9497947113	\N	shokmkmtvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0471	2750265	2026-02-27 02:48:32.079778
KL_PSD_TVMRL_0026	POLICE	Mangalapuram Police Station	mangalapuram	Kerala	Thiruvananthapuram Rural	9497947114	\N	shomgpmtvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0471	2420275	2026-02-27 02:48:32.080572
KL_PSD_TVMRL_0027	POLICE	Pothencode Police Station	pothencode	Kerala	Thiruvananthapuram Rural	9497960428	\N	shoptnkdtvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0471	2716100	2026-02-27 02:48:32.081354
KL_PSD_TVMRL_0028	POLICE	Vattappara Police Station	vattappara	Kerala	Thiruvananthapuram Rural	9497947123	\N	shovtpratvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0472	2585055	2026-02-27 02:48:32.081938
KL_PSD_TVMRL_0029	POLICE	Chirayinkeezhu Police Station	chirayinkeezhu	Kerala	Thiruvananthapuram Rural	9497980105	\N	shockzhtvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0470	2640380	2026-02-27 02:48:32.082463
KL_PSD_TVMRL_0030	POLICE	Pangode Police Station	pangode	Kerala	Thiruvananthapuram Rural	9497947125	\N	shopngdtvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0472	2869223	2026-02-27 02:48:32.082955
KL_PSD_TVMRL_0031	POLICE	Pallickal Police Station	pallickal	Kerala	Thiruvananthapuram Rural	9497947116	\N	shoplkaltvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0470	2682026	2026-02-27 02:48:32.083444
KL_PSD_TVMRL_0032	POLICE	Attingal Police Station	attingal	Kerala	Thiruvananthapuram Rural	9497980145	\N	shoatnlptvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0470	2622444	2026-02-27 02:48:32.083962
KL_PSD_TVMRL_0033	POLICE	Nedumangad Police Station	nedumangad	Kerala	Thiruvananthapuram Rural	9497980118	\N	shondmgdtvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0472	2802400	2026-02-27 02:48:32.084518
KL_PSD_TVMRL_0034	POLICE	Valiyamala Police Station	valiyamala	Kerala	Thiruvananthapuram Rural	9497980134	\N	shovlmlatvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0471	2567557	2026-02-27 02:48:32.085032
KL_PSD_TVMRL_0035	POLICE	Aruvikkara Police Station	aruvikkara	Kerala	Thiruvananthapuram Rural	9497947119	\N	shoarvikratvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0472	2887100	2026-02-27 02:48:32.085535
KL_PSD_TVMRL_0036	POLICE	Aryanad Police Station	aryanad	Kerala	Thiruvananthapuram Rural	9497980101	\N	shoayndtvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0472	2852033	2026-02-27 02:48:32.086015
KL_PSD_TVMRL_0037	POLICE	Neyyardam Police Station	neyyardam	Kerala	Thiruvananthapuram Rural	9497980122	\N	shonyrdmtvmrl.pol@kerala.gov.in	\N	\N	\N	\N	0471	2272266	2026-02-27 02:48:32.086487
KL_PSD_TSRRL_0001	POLICE	Chalakudy Police Station	chalakudy	Kerala	Thrissur Rural	9497987141	\N	shoclkdyptsrl.pol@kerala.gov.in	\N	\N	\N	\N	0480	2708331	2026-02-27 02:48:32.086947
KL_PSD_TSRRL_0002	POLICE	Varandarappilly Police Station	varandarappilly	Kerala	Thrissur Rural	9497947213	\N	shovplytsrrl.pol@kerala.gov.in	\N	\N	\N	\N	0480	2760150	2026-02-27 02:48:32.087447
KL_PSD_TSRRL_0003	POLICE	Pudukkad Police Station	pudukkad	Kerala	Thrissur Rural	9497987133	\N	shopdkdtsrrl.pol@kerala.gov.in	\N	\N	\N	\N	0480	2751336	2026-02-27 02:48:32.087888
KL_PSD_TSRRL_0004	POLICE	Mala Police Station	mala	Kerala	Thrissur Rural	9497987142	\N	shomalpstsrrl.pol@kerala.gov.in	\N	\N	\N	\N	0480	2695005	2026-02-27 02:48:32.088328
KL_PSD_TSRRL_0005	POLICE	Koraty Police Station	koraty	Kerala	Thrissur Rural	9497947210	\N	shokrtytsrrl.pol@kerala.gov.in	\N	\N	\N	\N	0480	2732593	2026-02-27 02:48:32.088775
KL_PSD_TSRRL_0006	POLICE	Malakkapara Police Station	malakkapara	Kerala	Thrissur Rural	9497980547	\N	shomlkprtsrrl.pol@kerala.gov.in	\N	\N	\N	\N	0425	3237262	2026-02-27 02:48:32.089212
KL_PSD_TSRRL_0007	POLICE	Athirappilly Police Station	athirappilly	Kerala	Thrissur Rural	9497980569	\N	shoappytsrrl.pol@kerala.gov.in	\N	\N	\N	\N	0480	2769004	2026-02-27 02:48:32.089645
KL_PSD_TSRRL_0008	POLICE	Kodakara Police Station	kodakara	Kerala	Thrissur Rural	9497962533	\N	shokdkrtsrrl.pol@kerala.gov.in	\N	\N	\N	\N	0480	2720287	2026-02-27 02:48:32.090086
KL_PSD_TSRRL_0009	POLICE	Vatanappilly Police Station	vatanappilly	Kerala	Thrissur Rural	9497947204	\N	shovnlytsrrl.pol@kerala.gov.in	\N	\N	\N	\N	0487	2607540	2026-02-27 02:48:32.090534
KL_PSD_TSRRL_0010	POLICE	Valappad Police Station	valappad	Kerala	Thrissur Rural	9497987144	\N	shovlpdtsrrl.pol@kerala.gov.in	\N	\N	\N	\N	0487	2391236	2026-02-27 02:48:32.091173
KL_PSD_TSRRL_0011	POLICE	Kodungallur Police Station	kodungallur	Kerala	Thrissur Rural	9497987143	\N	shokdglrtsrrl.pol@kerala.gov.in	\N	\N	\N	\N	0480	2800621	2026-02-27 02:48:32.091622
KL_PSD_TSRRL_0012	POLICE	Vellikulangara Police Station	vellikulangara	Kerala	Thrissur Rural	9497947211	\N	shovlgrtsrrl.pol@kerala.gov.in	\N	\N	\N	\N	0480	2740542	2026-02-27 02:48:32.092063
KL_PSD_TSRRL_0013	POLICE	Coastal Police Station Azheekode	coastal azheekode	Kerala	Thrissur Rural	9497980647	\N	\N	\N	\N	\N	\N	0480	2815100	2026-02-27 02:48:32.092587
KL_PSD_TSRRL_0014	POLICE	Vanitha Police Station	vanitha	Kerala	Thrissur Rural	9497918576	\N	\N	\N	\N	\N	\N	0480	2830050	2026-02-27 02:48:32.093041
KL_PSD_TSRRL_0015	POLICE	Irinjalakuda Police Station	irinjalakuda	Kerala	Thrissur Rural	9497987139	\N	shoijkdtsrrl.pol@kerala.gov.in	\N	\N	\N	\N	0480	2825228	2026-02-27 02:48:32.093468
KL_PSD_TSRRL_0016	POLICE	Kaipamangalam Police Station	kaipamangalam	Kerala	Thrissur Rural	9497980540	\N	shokpmtsrrl.pol@kerala.gov.in	\N	\N	\N	\N	0480	2847878	2026-02-27 02:48:32.093905
KL_PSD_TSRRL_0017	POLICE	Aloor Police Station	aloor	Kerala	Thrissur Rural	9497941830	\N	sialrpstsrrl.pol.pol@kerala.gov.in	\N	\N	\N	\N	0480	2725100	2026-02-27 02:48:32.094342
KL_PSD_TSRRL_0018	POLICE	Kattoor Police Station	kattoor	Kerala	Thrissur Rural	9497947203	\N	shoktrtsrrl.pol@kerala.gov.in	\N	\N	\N	\N	0480	2877590	2026-02-27 02:48:32.094783
KL_PSD_TSRRL_0019	POLICE	Cherpu Police Station	cherpu	Kerala	Thrissur Rural	9497947205	\N	shochrpstsrrl.pol@kerala.gov.in	\N	\N	\N	\N	0487	2340220	2026-02-27 02:48:32.095228
KL_PSD_TSRRL_0020	POLICE	Anthikad Police Station	anthikad	Kerala	Thrissur Rural	9497987140	\N	shoatkdtsrrl.pol@kerala.gov.in	\N	\N	\N	\N	0480	2626042	2026-02-27 02:48:32.095661
KL_PSD_TSRRL_0021	POLICE	Mathilakom Police Station	mathilakom	Kerala	Thrissur Rural	9497947212	\N	shomtlkmtsrrl.pol@kerala.gov.in	\N	\N	\N	\N	0480	2850257	2026-02-27 02:48:32.096104
KL_PSD_TSRRL_0022	POLICE	Cyber Police Station Thrissur Rural	cyber thrissur rural	Kerala	Thrissur Rural	9497919291	\N	cyberpstsrrl.pol@kerala.gov.in	\N	\N	\N	\N	0480	2950059	2026-02-27 02:48:32.096543
KL_PSD_TSR_0001	POLICE	Peramangalam Police Station	peramangalam	Kerala	Thrissur City	9497980557	\N	shopglmtsr.pol@kerala.gov.in	\N	\N	\N	\N	0487	2307237	2026-02-27 02:48:32.097009
KL_PSD_TSR_0002	POLICE	Thrissur Medical College Police Station	thrissur medical college	Kerala	Thrissur City	9497980592	\N	shomedtsr.pol@kerala.gov.in	\N	\N	\N	\N	0487	2202434	2026-02-27 02:48:32.097448
KL_PSD_TSR_0003	POLICE	Vanitha Police Station Thrissur	vanitha thrissur	Kerala	Thrissur City	9497980594	\N	shovnthtsr.pol@kerala.gov.in	\N	\N	\N	\N	0487	2420720	2026-02-27 02:48:32.097897
KL_PSD_TSR_0004	POLICE	Viyyur Police Station	viyyur	Kerala	Thrissur City	9497947202	\N	shovyrtsr.pol@kerala.gov.in	\N	\N	\N	\N	0487	2327502	2026-02-27 02:48:32.098331
KL_PSD_TSR_0005	POLICE	Guruvayur Police Station	guruvayur	Kerala	Thrissur City	9497962797	\N	shogvyrtsr.pol@kerala.gov.in	\N	\N	\N	\N	04885	230100	2026-02-27 02:48:32.098763
KL_PSD_TSR_0006	POLICE	Cyber Police Station Thrissur	cyber thrissur	Kerala	Thrissur City	9497947269	\N	\N	\N	\N	\N	\N	0487	2952050	2026-02-27 02:48:32.099202
KL_PSD_TSR_0007	POLICE	Kunnamkulam Police Station	kunnamkulam	Kerala	Thrissur City	9497987134	\N	shoknklmtsrrl.pol@kerala.gov.in	\N	\N	\N	\N	04885	222211	2026-02-27 02:48:32.099668
KL_PSD_TSR_0008	POLICE	Erumappetty Police Station	erumappetty	Kerala	Thrissur City	9497980532	\N	shoerptytsrrl.pol@kerala.gov.in	\N	\N	\N	\N	04885	273002	2026-02-27 02:48:32.100112
KL_PSD_TSR_0009	POLICE	Chavakkad Police Station	chavakkad	Kerala	Thrissur City	9497987135	\N	shocvkdpstsrl.pol@kerala.gov.in	\N	\N	\N	\N	0487	2507352	2026-02-27 02:48:32.10055
KL_PSD_TSR_0010	POLICE	Vadakkekkad Police Station	vadakkekkad	Kerala	Thrissur City	9497947206	\N	shovdkkdtsrrl.pol@kerala.gov.in	\N	\N	\N	\N	0487	2542390	2026-02-27 02:48:32.100988
KL_PSD_TSR_0011	POLICE	Wadakkanchery Police Station	wadakkanchery	Kerala	Thrissur City	9497987137	\N	shovdcytsrrl.pol@kerala.gov.in	\N	\N	\N	\N	04884	236223	2026-02-27 02:48:32.1015
KL_PSD_TSR_0012	POLICE	Cheruthuruthy Police Station	cheruthuruthy	Kerala	Thrissur City	9497980531	\N	shocttytsrrl.pol@kerala.gov.in	\N	\N	\N	\N	04884	262401	2026-02-27 02:48:32.102001
KL_PSD_TSR_0013	POLICE	Chelakkara Police Station	chelakkara	Kerala	Thrissur City	9497987138	\N	shoclkratsrrl.pol@kerala.gov.in	\N	\N	\N	\N	04884	252034	2026-02-27 02:48:32.102454
KL_PSD_TSR_0014	POLICE	Pazhayannur Police Station	pazhayannur	Kerala	Thrissur City	9497947208	\N	shopznrtsrrl.pol@kerala.gov.in	\N	\N	\N	\N	04884	227250	2026-02-27 02:48:32.102891
KL_PSD_TSR_0015	POLICE	Munakkakadavu Coastal Police Station	munakkakadavu coastal	Kerala	Thrissur City	9497941832	\N	cstlmnkdvtsrrl.pol@kerala.gov.in	\N	\N	\N	\N	0487	2530115	2026-02-27 02:48:32.10333
KL_PSD_TSR_0016	POLICE	Ollur Police Station	ollur	Kerala	Thrissur City	9497980552	\N	siollurpstsr.pol@kerala.gov.in	\N	\N	\N	\N	0487	2459420	2026-02-27 02:48:32.103744
KL_PSD_TSR_0017	POLICE	Town East Police Station	town east	Kerala	Thrissur City	9497980574	\N	shotownesttsr.pol@kerala.gov.in	\N	\N	\N	\N	0487	2424192	2026-02-27 02:48:32.104123
KL_PSD_TSR_0018	POLICE	Town West Police Station	town west	Kerala	Thrissur City	9497980560	\N	shotownwsttsr.pol@kerala.gov.in	\N	\N	\N	\N	0487	2363608	2026-02-27 02:48:32.1045
KL_PSD_TSR_0019	POLICE	Pavaratty Police Station	pavaratty	Kerala	Thrissur City	9497947201	\N	shopvtytsr.pol@kerala.gov.in	\N	\N	\N	\N	0487	2263000	2026-02-27 02:48:32.104879
KL_PSD_TSR_0020	POLICE	Nedupuzha Police Station	nedupuzha	Kerala	Thrissur City	9497947198	\N	shonpzatsr.pol@kerala.gov.in	\N	\N	\N	\N	0487	2447511	2026-02-27 02:48:32.105261
KL_PSD_TSR_0021	POLICE	Mannuthy Police Station	mannuthy	Kerala	Thrissur City	9497947268	\N	shomannuthtsr.pol@kerala.gov.in	\N	\N	\N	\N	0487	2370280	2026-02-27 02:48:32.105848
KL_PSD_TSR_0022	POLICE	Peechi Police Station	peechi	Kerala	Thrissur City	9497947200	\N	shopchitsr.pol@kerala.gov.in	\N	\N	\N	\N	0487	2284040	2026-02-27 02:48:32.106258
KL_PSD_WYD_0001	POLICE	Noolpuzha Police Station	noolpuzha	Kerala	Wayanad	9497935233	\N	noolpuzhaps.pol@kerala.gov.in	\N	\N	\N	\N	04936	263400	2026-02-27 02:48:32.106636
KL_PSD_WYD_0002	POLICE	Mananthavady Police Station	mananthavady	Kerala	Wayanad	9497987199	\N	shomtvypswynd.pol@kerala.gov.in	\N	\N	\N	\N	04935	240232	2026-02-27 02:48:32.107014
KL_PSD_WYD_0003	POLICE	Thirunelly Police Station	thirunelly	Kerala	Wayanad	9497980824	\N	shotrnlywynd.pol@kerala.gov.in	\N	\N	\N	\N	04935	210264	2026-02-27 02:48:32.10739
KL_PSD_WYD_0004	POLICE	Thalapuzha Police Station	thalapuzha	Kerala	Wayanad	9497947334	\N	shothlpzawynd.pol@kerala.gov.in	\N	\N	\N	\N	04935	256262	2026-02-27 02:48:32.107766
KL_PSD_WYD_0005	POLICE	Vellamunda Police Station	vellamunda	Kerala	Wayanad	9497947248	\N	shovlmndawynd.pol@kerala.gov.in	\N	\N	\N	\N	04935	230332	2026-02-27 02:48:32.108143
KL_PSD_WYD_0006	POLICE	Sulthan Bathery Police Station	sulthan bathery	Kerala	Wayanad	9497987200	\N	shosbthwynd.pol@kerala.gov.in	\N	\N	\N	\N	04936	220400	2026-02-27 02:48:32.108518
KL_PSD_WYD_0007	POLICE	Ambalavayal Police Station	ambalavayal	Kerala	Wayanad	9497947249	\N	shoambvylwynd.pol@kerala.gov.in	\N	\N	\N	\N	04936	260436	2026-02-27 02:48:32.108907
KL_PSD_WYD_0008	POLICE	Pulpally Police Station	pulpally	Kerala	Wayanad	9497987201	\N	shopplywynd.pol@kerala.gov.in	\N	\N	\N	\N	04936	240294	2026-02-27 02:48:32.109243
KL_PSD_WYD_0009	POLICE	Kenichira Police Station	kenichira	Kerala	Wayanad	9497947333	\N	shokenchpswyd.pol@kerala.gov.in	\N	\N	\N	\N	04936	211545	2026-02-27 02:48:32.109626
KL_PSD_WYD_0010	POLICE	Cyber Crime Police Station Wayanad	cyber crime wayanad	Kerala	Wayanad	9497947336	\N	cyberpswynd.pol@kerala.gov.in	\N	\N	\N	\N	04936	205525	2026-02-27 02:48:32.110031
KL_PSD_WYD_0011	POLICE	Kalpetta Police Station	kalpetta	Kerala	Wayanad	9497987196	\N	shokptpswynd.pol@kerala.gov.in	\N	\N	\N	\N	04936	202400	2026-02-27 02:48:32.110411
KL_PSD_WYD_0012	POLICE	Meppadi Police Station	meppadi	Kerala	Wayanad	9497947271	\N	shomeppadwynd.pol@kerala.gov.in	\N	\N	\N	\N	0493	6282433	2026-02-27 02:48:32.110788
KL_PSD_WYD_0013	POLICE	Meenangadi Police Station	meenangadi	Kerala	Wayanad	9497987197	\N	shomnngdiwynd.pol@kerala.gov.in	\N	\N	\N	\N	04936	247204	2026-02-27 02:48:32.111189
KL_PSD_WYD_0014	POLICE	Kambalakkad Police Station	kambalakkad	Kerala	Wayanad	9497947247	\N	shokmblkdwynd.pol@kerala.gov.in	\N	\N	\N	\N	04936	286635	2026-02-27 02:48:32.111563
KL_PSD_WYD_0015	POLICE	Panamaram Police Station	panamaram	Kerala	Wayanad	9497947332	\N	shopanamaramwynd.pol@kerala.gov.in	\N	\N	\N	\N	04935	222200	2026-02-27 02:48:32.111943
KL_PSD_WYD_0016	POLICE	Vythiri Police Station	vythiri	Kerala	Wayanad	9497987198	\N	shovythirwynd.pol@kerala.gov.in	\N	\N	\N	\N	04936	255225	2026-02-27 02:48:32.112319
KL_PSD_WYD_0017	POLICE	Padinjarethara Police Station	padinjarethara	Kerala	Wayanad	9497980819	\N	shopdjwynd.pol@kerala.gov.in	\N	\N	\N	\N	04936	273401	2026-02-27 02:48:32.112697
KL_PHC_TVM_0001	HOSPITAL	PHC Palace Dispensary, Kowdiar	phc palace dispensary kowdiar	Kerala	Thiruvananthapuram	0471-2433758	\N	mogpdk@hotmail.com	PHC	GOVERNMENT	Govt. Palace Dispensary - Kawdiar, Kowdiar Garden, Kawdiar	695003	\N	\N	2026-02-27 02:48:32.116279
KL_PHC_TVM_0002	HOSPITAL	Family Health Centre Karamana	karamana	Kerala	Thiruvananthapuram	0471-2344935	\N	phckaramana@gmail.com	PHC	GOVERNMENT	Primary Health Centre - Karamana	695002	\N	\N	2026-02-27 02:48:32.117574
KL_PHC_TVM_0003	HOSPITAL	Family Health Centre Ulloor	ulloor	Kerala	Thiruvananthapuram	8943263477	\N	ulloorphc@gmail.com	PHC	GOVERNMENT	Primary Health Centre - Ulloor, Pongumoodu	695016	\N	\N	2026-02-27 02:48:32.11804
KL_PHC_TVM_0004	HOSPITAL	Family Health Centre Bharathannoor	bharathannoor	Kerala	Thiruvananthapuram	9745744418	\N	phcbharathannoor@ymail.com	PHC	GOVERNMENT	PHC Bharathannoor, Bharathannoor P.O	695609	\N	\N	2026-02-27 02:48:32.118564
KL_PHC_TVM_0005	HOSPITAL	Family Health Centre Kizhuvilam	kizhuvilam	Kerala	Thiruvananthapuram	0470-2794688	\N	kizhuvillamphc@gmail.com	PHC	GOVERNMENT	Primary Health Centre - Kizhuvilam, Kurakkada P.O, Vakkom	695104	\N	\N	2026-02-27 02:48:32.119071
KL_PHC_TVM_0006	HOSPITAL	Family Health Centre Perumpazhuthoor	perumpazhuthoor	Kerala	Thiruvananthapuram	0471-2222183	\N	phcperumpazhuthoor@gmail.com	PHC	GOVERNMENT	FHC Perumpazhuthoor, Olathanni	695121	\N	\N	2026-02-27 02:48:32.119583
KL_PHC_TVM_0007	HOSPITAL	Family Health Centre Kanjiramkulam	kanjiramkulam	Kerala	Thiruvananthapuram	0471-2263505	\N	kanjiramkulamphc10@gmail.com	PHC	GOVERNMENT	PHC Kanjiramkulam, Kaivanvila, Kanjiramkulam P.O	695524	\N	\N	2026-02-27 02:48:32.1201
KL_PHC_TVM_0008	HOSPITAL	Family Health Centre Navaikulam	navaikulam	Kerala	Thiruvananthapuram	0470-2694300	\N	phcnavaikulam@gmail.com	PHC	GOVERNMENT	Primary Health Centre - Navaikulam, Navaikulam P.O	695603	\N	\N	2026-02-27 02:48:32.120614
KL_PHC_TVM_0009	HOSPITAL	Family Health Centre Kalliyoor	kalliyoor	Kerala	Thiruvananthapuram	0471-2405401	\N	phckalliyoor@gmail.com	PHC	GOVERNMENT	Primary Health Centre - Kalliyoor	695042	\N	\N	2026-02-27 02:48:32.121128
KL_PHC_TVM_0010	HOSPITAL	Family Health Centre Vellayani	vellayani	Kerala	Thiruvananthapuram	0471-2382209	\N	phcvellayani@gmail.com	PHC	GOVERNMENT	Primary Health Centre - Vellayani, Vellayani P.O	695522	\N	\N	2026-02-27 02:48:32.121631
KL_PHC_TVM_0011	HOSPITAL	Family Health Centre Manchavilakom	manchavilakom	Kerala	Thiruvananthapuram	0471-2200071	\N	manchavilakomphc@gmail.com	PHC	GOVERNMENT	Family Health Centre - Manchavilakom, Manchavilakom P.O	695523	\N	\N	2026-02-27 02:48:32.12219
KL_PHC_TVM_0012	HOSPITAL	Family Health Centre Parasuvaikkal	parasuvaikkal	Kerala	Thiruvananthapuram	0471-2200071	\N	phcparasuvaikkall@gmail.com	PHC	GOVERNMENT	PHC Parasuvaikkal, Parasuvaikkal P.O	695124	\N	\N	2026-02-27 02:48:32.122698
KL_PHC_TVM_0013	HOSPITAL	Family Health Centre Nagaroor	nagaroor	Kerala	Thiruvananthapuram	0470-2678656	\N	phcnagaroor@gmail.com	PHC	GOVERNMENT	Primary Health Centre - Nagaroor	695601	\N	\N	2026-02-27 02:48:32.123258
KL_PHC_TVM_0014	HOSPITAL	Family Health Centre Malayadi	malayadi	Kerala	Thiruvananthapuram	0471-2891800	\N	phcmalayadi1@gmail.com	PHC	GOVERNMENT	Primary Health Centre - Malayadi, Vinobanikethan P.O	695542	\N	\N	2026-02-27 02:48:32.123855
KL_PHC_TVM_0015	HOSPITAL	Family Health Centre Pozhiyoor	pozhiyoor	Kerala	Thiruvananthapuram	0471-2213345	\N	pozhiyoorphc2010@gmail.com	PHC	GOVERNMENT	Family Health Centre - Pozhiyoor	695513	\N	\N	2026-02-27 02:48:32.124366
KL_PHC_TVM_0016	HOSPITAL	Family Health Centre Thiruvallom	thiruvallom	Kerala	Thiruvananthapuram	0471-2485788	\N	phcthiruvallom@gmail.com	PHC	GOVERNMENT	Primary Health Centre - Thiruvallom	695027	\N	\N	2026-02-27 02:48:32.124831
KL_PHC_TVM_0017	HOSPITAL	Family Health Centre Kunnathukal	kunnathukal	Kerala	Thiruvananthapuram	0471-2117077	\N	kklphc@gmail.com	PHC	GOVERNMENT	Family Health Centre - Kunnathukal, Kunnathukal P.O	695504	\N	\N	2026-02-27 02:48:32.125491
KL_PHC_TVM_0018	HOSPITAL	Family Health Centre Tholicode	tholicode	Kerala	Thiruvananthapuram	0472-2878580	\N	phctholicode@yahoo.co.in	PHC	GOVERNMENT	Family Health Centre - Tholicode	695547	\N	\N	2026-02-27 02:48:32.125961
KL_PHC_TVM_0019	HOSPITAL	Family Health Centre Edava	edava	Kerala	Thiruvananthapuram	0470-2661040	\N	edavaphc@gmail.com	PHC	GOVERNMENT	FHC Edava, Edava P.O	695311	\N	\N	2026-02-27 02:48:32.126426
KL_PHC_TVM_0020	HOSPITAL	Family Health Centre Vettoor	vettoor	Kerala	Thiruvananthapuram	0470-2612651	\N	vettoorphc@gmail.com	PHC	GOVERNMENT	Family Health Centre - Vettoor, Melvettoor P.O	695312	\N	\N	2026-02-27 02:48:32.126878
KL_PHC_TVM_0021	HOSPITAL	Family Health Centre Thonippara	thonippara	Kerala	Thiruvananthapuram	0470-2667177	\N	phcthonippara@gmail.com	PHC	GOVERNMENT	Family Health Centre - Thonippara, Hariharapuram P.O	695310	\N	\N	2026-02-27 02:48:32.127361
KL_PHC_TVM_0022	HOSPITAL	Family Health Centre Madavoor	madavoor	Kerala	Thiruvananthapuram	0470-2681532	\N	madavoorphc@gmail.com	PHC	GOVERNMENT	Family Health Centre - Madavoor, Puliyoorkonam P.O	695604	\N	\N	2026-02-27 02:48:32.127833
KL_PHC_TVM_0023	HOSPITAL	Family Health Centre Pangappara	pangappara	Kerala	Thiruvananthapuram	0471-2418038	\N	mchunitpangapparatvpm@gmail.com	PHC	GOVERNMENT	Family Health Centre - Pangappara, Pangappara	695581	\N	\N	2026-02-27 02:48:32.128338
KL_PHC_TVM_0024	HOSPITAL	Family Health Centre Chettivilakam	chettivilakam	Kerala	Thiruvananthapuram	0471-2730404	\N	phcchettivilakam@gmail.com	PHC	GOVERNMENT	Family Health Centre Chettivilakam	695043	\N	\N	2026-02-27 02:48:32.129011
KL_PHC_TVM_0025	HOSPITAL	Family Health Centre Chenkal	chenkal	Kerala	Thiruvananthapuram	0471-2236622	\N	phcchenkal@gmail.com	PHC	GOVERNMENT	Family Health Centre Chenkal, Chenkal P.O	695134	\N	\N	2026-02-27 02:48:32.12967
KL_PHC_TVM_0026	HOSPITAL	Family Health Centre Kulathoor	kulathoor	Kerala	Thiruvananthapuram	0471-2209551	\N	phckulathoor.2209551@gmail.com	PHC	GOVERNMENT	Family Health Centre Kulathoor, Uchakada P.O, Neyyattinkara	695506	\N	\N	2026-02-27 02:48:32.130221
KL_PHC_TVM_0027	HOSPITAL	Family Health Centre Karode	karode	Kerala	Thiruvananthapuram	0471-2218561	\N	phckarode@gmail.com	PHC	GOVERNMENT	Family Health Centre Karode	695506	\N	\N	2026-02-27 02:48:32.130786
KL_PHC_TVM_0028	HOSPITAL	Family Health Centre Chembooru	chembooru	Kerala	Thiruvananthapuram	0471-2257755	\N	phcchemboor@gmail.com	PHC	GOVERNMENT	PHC Chembooru, Ottasekharamangalam P.O	695125	\N	\N	2026-02-27 02:48:32.131498
KL_PHC_TVM_0029	HOSPITAL	Family Health Centre Kollayil	kollayil	Kerala	Thiruvananthapuram	0471-2234355	\N	phckollayil@gmail.com	PHC	GOVERNMENT	FHC Kollayil, Dhanuvachapuram P.O	695503	\N	\N	2026-02-27 02:48:32.132271
KL_PHC_TVM_0030	HOSPITAL	Family Health Centre Amboori	amboori	Kerala	Thiruvananthapuram	0471-2246193	\N	phcamboori@gmail.com	PHC	GOVERNMENT	Family Health Centre Amboori, Mayam P.O	695505	\N	\N	2026-02-27 02:48:32.133098
KL_PHC_TVM_0031	HOSPITAL	Family Health Centre Kallikkad (New)	kallikkad new	Kerala	Thiruvananthapuram	\N	\N	kallikkadnewphc@gmail.com	PHC	GOVERNMENT	Family Health Centre Kallikkad, Neyyardam P.O	695572	\N	\N	2026-02-27 02:48:32.134163
KL_PHC_TVM_0032	HOSPITAL	Family Health Centre Uzhamalakkal	uzhamalakkal	Kerala	Thiruvananthapuram	0472-2899677	\N	phcuzhamalakkal@gmail.com	PHC	GOVERNMENT	Family Health Centre Uzhamalakkal, Puthukulangara P.O	695541	\N	\N	2026-02-27 02:48:32.134728
KL_PHC_TVM_0033	HOSPITAL	Family Health Centre Kuttichal	kuttichal	Kerala	Thiruvananthapuram	0472-2854871	\N	phckuttichal@gmail.com	PHC	GOVERNMENT	Family Health Centre Kuttichal, Paruthipally P.O	695574	\N	\N	2026-02-27 02:48:32.135254
KL_PHC_TVM_0034	HOSPITAL	Family Health Centre Kallikkadu (Old)	kallikkadu old	Kerala	Thiruvananthapuram	0471-2273739	\N	phcvrkv@gmail.com	PHC	GOVERNMENT	Family Health Centre - Kallikkadu (Old), Veeranakavu	695572	\N	\N	2026-02-27 02:48:32.135757
KL_PHC_TVM_0035	HOSPITAL	Primary Health Centre Mukkola (Vizhinjam New)	mukkola vizhinjam new	Kerala	Thiruvananthapuram	8111871072	\N	phcmukkola@gmail.com	PHC	GOVERNMENT	Family Health Centre Vizhinjam (New), Mukkola, Mulloor P.O	695521	\N	\N	2026-02-27 02:48:32.136258
KL_PHC_TVM_0036	HOSPITAL	Family Health Centre Veli	veli	Kerala	Thiruvananthapuram	0471-2704618	\N	veliphc@gmail.com	PHC	GOVERNMENT	Family Health Centre - Veli, Valiyaveli P.O	695021	\N	\N	2026-02-27 02:48:32.136786
KL_PHC_TVM_0037	HOSPITAL	Family Health Centre Mudakkal	mudakkal	Kerala	Thiruvananthapuram	0470-2637475	\N	phcmudakkal@gmail.com	PHC	GOVERNMENT	Family Health Centre - Mudakkal, Elampa P.O	695103	\N	\N	2026-02-27 02:48:32.137282
KL_PHC_TVM_0038	HOSPITAL	Family Health Centre Perumathura	perumathura	Kerala	Thiruvananthapuram	0471-2426533	\N	perumathuraphc@gmail.com	PHC	GOVERNMENT	Family Health Centre - Perumathura, Ottapana P.O	695303	\N	\N	2026-02-27 02:48:32.137802
KL_PHC_TVM_0039	HOSPITAL	Family Health Centre Puthukurichi	puthukurichi	Kerala	Thiruvananthapuram	0471-2426562	\N	puthukurichyphc@gmail.com	PHC	GOVERNMENT	Family Health Centre - Puthukurichi	695303	\N	\N	2026-02-27 02:48:32.13829
KL_PHC_TVM_0040	HOSPITAL	Family Health Centre Mangalapuram	mangalapuram	Kerala	Thiruvananthapuram	0471-2424100	\N	phcentremangalapuram@gmail.com	PHC	GOVERNMENT	Family Health Centre - Mangalapuram, Thonnakkal P.O	695317	\N	\N	2026-02-27 02:48:32.13878
KL_PHC_TVM_0041	HOSPITAL	Family Health Centre Peringammala	peringammala	Kerala	Thiruvananthapuram	0472-2846310	\N	phcperingammala@yahoo.in	PHC	GOVERNMENT	Family Health Centre - Peringammala	695563	\N	\N	2026-02-27 02:48:32.139265
KL_PHC_TVM_0042	HOSPITAL	Family Health Centre Anakudi	anakudi	Kerala	Thiruvananthapuram	0472-2837790	\N	phcanakudy@yahoo.com	PHC	GOVERNMENT	Family Health Centre - Anakudi, Anakudi P.O	695606	\N	\N	2026-02-27 02:48:32.139814
KL_PHC_TVM_0043	HOSPITAL	Family Health Centre Pullampara	pullampara	Kerala	Thiruvananthapuram	0472-2828047	\N	phcpullampara@gmail.com	PHC	GOVERNMENT	Family Health Centre - Pullampara, Pullampara P.O	695607	\N	\N	2026-02-27 02:48:32.140308
KL_PHC_TVM_0044	HOSPITAL	Family Health Centre Panavoor	panavoor	Kerala	Thiruvananthapuram	0472-2865449	\N	phcpanavoor@gmail.com	PHC	GOVERNMENT	Family Health Centre - Panavoor, Panavoor P.O	695568	\N	\N	2026-02-27 02:48:32.140762
KL_PHC_TVM_0045	HOSPITAL	Family Health Centre Anad	anad	Kerala	Thiruvananthapuram	0472-2802375	\N	phcanad@gmail.com	PHC	GOVERNMENT	Family Health Centre - Anad	695541	\N	\N	2026-02-27 02:48:32.141259
KL_PHC_TVM_0046	HOSPITAL	Family Health Centre Adayamon	adayamon	Kerala	Thiruvananthapuram	9546671297	\N	adayamonphc@gmail.com	PHC	GOVERNMENT	Family Health Centre Adayamon, Adayamon P.O	695614	\N	\N	2026-02-27 02:48:32.141761
KL_PHC_TVM_0047	HOSPITAL	Family Health Centre Karavaram	karavaram	Kerala	Thiruvananthapuram	0470-2691700	\N	phckaravaram@gmail.com	PHC	GOVERNMENT	Family Health Centre - Karavaram	695605	\N	\N	2026-02-27 02:48:32.142273
KL_PHC_TVM_0048	HOSPITAL	Family Health Centre Pulimath	pulimath	Kerala	Thiruvananthapuram	0472-2861070	\N	phcpulimath@gmail.com	PHC	GOVERNMENT	Family Health Centre Pulimath, Kattumpuram P.O	695608	\N	\N	2026-02-27 02:48:32.142814
KL_PHC_TVM_0049	HOSPITAL	Family Health Centre Cherunniyoor	cherunniyoor	Kerala	Thiruvananthapuram	8281151124	\N	crnyrphc@gmail.com	PHC	GOVERNMENT	FHC Cherunniyoor, Cherunniyoor P.O	695142	\N	\N	2026-02-27 02:48:32.143333
KL_PHC_TVM_0050	HOSPITAL	Family Health Centre Vilavoorkkal	vilavoorkkal	Kerala	Thiruvananthapuram	0471-2284080	\N	phcvil@gmail.com	PHC	GOVERNMENT	Family Health Centre Vilavoorkkal, Pottayil	695573	\N	\N	2026-02-27 02:48:32.143889
KL_PHC_TVM_0051	HOSPITAL	Family Health Centre Maranalloor	maranalloor	Kerala	Thiruvananthapuram	0471-2298524	\N	phcmaranalloor@gmail.com	PHC	GOVERNMENT	Family Health Centre Maranalloor, Koovalassery P.O	695512	\N	\N	2026-02-27 02:48:32.144412
KL_PHC_TVM_0052	HOSPITAL	Family Health Centre Vembayam	vembayam	Kerala	Thiruvananthapuram	0472-2834833	\N	phcvembayam@gmail.com	PHC	GOVERNMENT	Family Health Centre Vembayam, Vettinad, Konchira P.O	695615	\N	\N	2026-02-27 02:48:32.144895
KL_PHC_TVM_0053	HOSPITAL	Family Health Centre Manickal	manickal	Kerala	Thiruvananthapuram	0472-2583433	\N	phcmanikal@gmail.com	PHC	GOVERNMENT	Family Health Centre Manickal, Koliyakkod	695607	\N	\N	2026-02-27 02:48:32.145405
KL_PHC_TVM_0054	HOSPITAL	Family Health Centre Ottoor	ottoor	Kerala	Thiruvananthapuram	0470-2612842	\N	ottoorphc@gmail.com	PHC	GOVERNMENT	Family Health Centre Ottoor, Vadasserikonam P.O	\N	\N	\N	2026-02-27 02:48:32.145887
KL_PHC_TVM_0055	HOSPITAL	Family Health Centre Vattiyoorkavu	vattiyoorkavu	Kerala	Thiruvananthapuram	0471-2364187	\N	phcvattiyoorkavu@yahoo.in	PHC	GOVERNMENT	Family Health Centre Vattiyoorkavu, Kulasekharam P.O	695013	\N	\N	2026-02-27 02:48:32.146418
KL_PHC_TVM_0056	HOSPITAL	Block Family Health Centre Vamanapuram	block vamanapuram	Kerala	Thiruvananthapuram	0472-2835810	\N	phcvamanapuram@gmail.com	PHC	GOVERNMENT	Block Family Health Centre - Vamanapuram, Vamanapuram P.O	695606	\N	\N	2026-02-27 02:48:32.147246
KL_PHC_TVM_0057	HOSPITAL	Family Health Centre Kadakampally	kadakampally	Kerala	Thiruvananthapuram	0471-2743392	\N	phckadakampalli@gmail.com	PHC	GOVERNMENT	Family Health Centre Kadakampally, Anayara P.O	695029	\N	\N	2026-02-27 02:48:32.147723
KL_PHC_TVM_0058	HOSPITAL	Family Health Centre Paraniyam	paraniyam	Kerala	Thiruvananthapuram	0471-2263786	\N	paraniyamphc123@gmail.com	PHC	GOVERNMENT	Family Health Centre Paraniyam	695525	\N	\N	2026-02-27 02:48:32.148231
KL_PHC_TVM_0059	HOSPITAL	Family Health Centre Chemmaruthy	chemmaruthy	Kerala	Thiruvananthapuram	0470-2612862	\N	cmyphc@gmail.com	PHC	GOVERNMENT	Family Health Centre Chemmaruthy, Panayara P.O	695145	\N	\N	2026-02-27 02:48:32.148819
KL_PHC_TVM_0060	HOSPITAL	Family Health Centre Poozhanad	poozhanad	Kerala	Thiruvananthapuram	0471-2257575	\N	phcpoozhanad@gmail.com	PHC	GOVERNMENT	Family Health Centre Poozhanad, Poozhanad P.O	695125	\N	\N	2026-02-27 02:48:32.149287
KL_PHC_TVM_0061	HOSPITAL	Primary Health Centre Kattakkada (New Amachal)	kattakkada new amachal	Kerala	Thiruvananthapuram	0471-2293475	\N	phcamachal@yahoo.in	PHC	GOVERNMENT	Family Health Centre - Kattakkada (New), Amachal P.O	695572	\N	\N	2026-02-27 02:48:32.149747
KL_PHC_TVM_0062	HOSPITAL	Family Health Centre Thonnakkal	thonnakkal	Kerala	Thiruvananthapuram	0471-2709898	\N	phcthonnakkal@gmail.com	PHC	GOVERNMENT	Family Health Centre Thonnakkal, Vengode, Kudavoor P.O	695313	\N	\N	2026-02-27 02:48:32.150207
KL_PHC_TVM_0063	HOSPITAL	Family Health Centre Aruvikkara	aruvikkara	Kerala	Thiruvananthapuram	0472-2886274	\N	phcaruvikkara@gmail.com	PHC	GOVERNMENT	Family Health Centre Aruvikkara, Aruvikkara P.O	695564	\N	\N	2026-02-27 02:48:32.150653
KL_PHC_TVM_0064	HOSPITAL	Family Health Centre Karakulam	karakulam	Kerala	Thiruvananthapuram	0472-2587700	\N	karakulamphc@gmail.com	PHC	GOVERNMENT	Family Health Centre Karakulam, Vattappara P.O	695028	\N	\N	2026-02-27 02:48:32.151125
KL_PHC_TVM_0065	HOSPITAL	Family Health Centre Kilimanoor	kilimanoor	Kerala	Thiruvananthapuram	0470-2651313	\N	phckilimanoor@gmail.com	PHC	GOVERNMENT	Family Health Centre Kilimanoor	695614	\N	\N	2026-02-27 02:48:32.151573
KL_PHC_TVM_0066	HOSPITAL	Family Health Centre Pallichal	pallichal	Kerala	Thiruvananthapuram	0471-2400367	\N	phcpallichal@gmail.com	PHC	GOVERNMENT	Family Health Centre Pallichal, Balaramapuram	695501	\N	\N	2026-02-27 02:48:32.152049
KL_PHC_TVM_0067	HOSPITAL	Family Health Centre Balaramapuram	balaramapuram	Kerala	Thiruvananthapuram	0471-2402209	\N	phcbalaramapuram@gmail.com	PHC	GOVERNMENT	Family Health Centre - Balaramapuram	695501	\N	\N	2026-02-27 02:48:32.1525
KL_PHC_TVM_0068	HOSPITAL	Family Health Centre Keezhattingal	keezhattingal	Kerala	Thiruvananthapuram	0470-2621131	\N	phckeezhatingal@gmail.com	PHC	GOVERNMENT	Family Health Centre Keezhattingal, Vilayilmoola	695306	\N	\N	2026-02-27 02:48:32.152983
KL_PHC_TVM_0069	HOSPITAL	Family Health Centre Kottukal	kottukal	Kerala	Thiruvananthapuram	0471-2269070	\N	mophckottukal@gmail.com	PHC	GOVERNMENT	Family Health Centre Kottukal, Kottukal P.O	695501	\N	\N	2026-02-27 02:48:32.153429
KL_PHC_TVM_0070	HOSPITAL	Family Health Centre Jagathy	jagathy	Kerala	Thiruvananthapuram	9995891252	\N	gdjagathy@gmail.com	PHC	GOVERNMENT	Family Health Centre Jagathy, Kochar Road, Jagathy	695014	\N	\N	2026-02-27 02:48:32.153868
KL_PHC_KLM_0001	HOSPITAL	Family Health Centre Madathara	madathara	Kerala	Kollam	0474-2440004	\N	phcmadathara@gmail.com	PHC	GOVERNMENT	FHC Madathara, Madathara P.O	691541	\N	\N	2026-02-27 02:48:32.154344
KL_PHC_KLM_0002	HOSPITAL	Family Health Centre Munroe Island	munroe island	Kerala	Kollam	0474-2543448	\N	munroeph@gmail.com	PHC	GOVERNMENT	FHC Munroe Island, Munroe Island	691502	\N	\N	2026-02-27 02:48:32.155088
KL_PHC_KLM_0003	HOSPITAL	Family Health Centre Parippally	parippally	Kerala	Kollam	0474-2575112	\N	phcparippally@gmail.com	PHC	GOVERNMENT	24x7 PHC Parippally, Parippally P.O	691574	\N	\N	2026-02-27 02:48:32.155573
KL_PHC_KLM_0004	HOSPITAL	Family Health Centre Thazhava	thazhava	Kerala	Kollam	0476-2665210	\N	thazhavaprimary.helth.centre@gmail.com	PHC	GOVERNMENT	FHC Thazhava, S.R.P M P.O, Thazhava	690539	\N	\N	2026-02-27 02:48:32.156114
KL_PHC_KLM_0005	HOSPITAL	Primary Health Centre Achenkovil	achenkovil	Kerala	Kollam	\N	\N	phcachenkovil@gmail.com	PHC	GOVERNMENT	PHC Achenkovil	689696	\N	\N	2026-02-27 02:48:32.15669
KL_PHC_KLM_0006	HOSPITAL	Family Health Centre Adichanalloor	adichanalloor	Kerala	Kollam	9544964887	\N	phcadichanalloor@gmail.com	PHC	GOVERNMENT	Family Health Centre Adichanalloor, Mylakkad P.O	691571	\N	\N	2026-02-27 02:48:32.157164
KL_PHC_KLM_0007	HOSPITAL	Family Health Centre Alappadu	alappadu	Kerala	Kollam	0476-2826336	\N	alappadphc@gmail.com	PHC	GOVERNMENT	FHC Alappadu, Cheriazheekal P.O, Karunagappally	690573	\N	\N	2026-02-27 02:48:32.157627
KL_PHC_KLM_0008	HOSPITAL	Family Health Centre Alayamon	alayamon	Kerala	Kollam	0475-2270472	\N	phcalayamon@gmail.com	PHC	GOVERNMENT	FHC Alayamon, Karukone, Anchal P.O	691306	\N	\N	2026-02-27 02:48:32.158086
KL_PHC_KLM_0009	HOSPITAL	Family Health Centre Aryankavu	aryankavu	Kerala	Kollam	0475-2345020	\N	phcaryankavu@gmail.com	PHC	GOVERNMENT	FHC Aryankavu, Kazhuthurutty P.O	691309	\N	\N	2026-02-27 02:48:32.158518
KL_PHC_KLM_0010	HOSPITAL	Family Health Centre Azheekal	azheekal	Kerala	Kollam	0476-2311106	\N	fhcazheekal@gmail.com	PHC	GOVERNMENT	FHC Azheekal	690547	\N	\N	2026-02-27 02:48:32.159025
KL_PHC_KLM_0011	HOSPITAL	Family Health Centre Chirakkara	chirakkara	Kerala	Kollam	0474-2518686	\N	phcchirakkara@gmail.com	PHC	GOVERNMENT	PHC Chirakkara, Chirakkarathazham P.O	691578	\N	\N	2026-02-27 02:48:32.159468
KL_PHC_KLM_0012	HOSPITAL	Primary Health Centre East Kallada	east kallada	Kerala	Kollam	0474-2586688	\N	eastkph@gmail.com	PHC	GOVERNMENT	PHC East Kallada, East Kallada P.O	691502	\N	\N	2026-02-27 02:48:32.159909
KL_PHC_KLM_0013	HOSPITAL	Primary Health Centre Edamulackal	edamulackal	Kerala	Kollam	9446528033	\N	phcedamulackal88@gmail.com	PHC	GOVERNMENT	PHC Edamulackal, Thadicadu P.O, Anchal	691306	\N	\N	2026-02-27 02:48:32.160369
KL_PHC_KLM_0014	HOSPITAL	Family Health Centre Elamadu	elamadu	Kerala	Kollam	0474-2968389	\N	phcelamadu1@gmail.com	PHC	GOVERNMENT	FHC Elamadu, Elamadu P.O	691533	\N	\N	2026-02-27 02:48:32.160813
KL_PHC_KLM_0015	HOSPITAL	Family Health Centre Eravipuram	eravipuram	Kerala	Kollam	0474-2725514	\N	phceravipuram@gmail.com	PHC	GOVERNMENT	FHC Eravipuram, Valathungal P.O	691011	\N	\N	2026-02-27 02:48:32.161247
KL_PHC_KLM_0016	HOSPITAL	Family Health Centre Ezhukone	ezhukone	Kerala	Kollam	0474-2484737	\N	phcezhukone@yahoo.com	PHC	GOVERNMENT	FHC Ezhukone, Ezhukone P.O	691507	\N	\N	2026-02-27 02:48:32.161706
KL_PHC_KLM_0017	HOSPITAL	Primary Health Centre Pavithreswaram (Ezhukone)	pavithreswaram ezhukone	Kerala	Kollam	\N	\N	fhcezhukonepavithreswaram@gmail.com	PHC	GOVERNMENT	FHC Ezhukone Pavithreswaram, Karuvelil P.O	691505	\N	\N	2026-02-27 02:48:32.162155
KL_PHC_KLM_0018	HOSPITAL	Family Health Centre Ittiva	ittiva	Kerala	Kollam	0474-2439289	\N	ittivaphc@gmail.com	PHC	GOVERNMENT	FHC Ittiva, Cherukulam P.O, Chunda	691306	\N	\N	2026-02-27 02:48:32.16259
KL_PHC_KLM_0019	HOSPITAL	Family Health Centre Karavaloor	karavaloor	Kerala	Kollam	0475-2964411	\N	fhckaravaloor@gmail.com	PHC	GOVERNMENT	FHC Karavaloor, Karavaloor P.O	691333	\N	\N	2026-02-27 02:48:32.163031
KL_PHC_KLM_0020	HOSPITAL	Family Health Centre Kilikolloor	kilikolloor	Kerala	Kollam	0474-2707988	\N	phckili@gmail.com	PHC	GOVERNMENT	FHC Kilikolloor, Mangad P.O	691015	\N	\N	2026-02-27 02:48:32.163668
KL_PHC_KLM_0021	HOSPITAL	Primary Health Centre Kottamkara	kottamkara	Kerala	Kollam	0474-2710545	\N	kottamkaraklm@gmail.com	PHC	GOVERNMENT	PHC Kottamkara, Thattarkonam P.O	691005	\N	\N	2026-02-27 02:48:32.164114
KL_PHC_KLM_0022	HOSPITAL	Primary Health Centre Kummil	kummil	Kerala	Kollam	0474-2448880	\N	phckummil@gmail.com	PHC	GOVERNMENT	PHC Kummil, Kummil P.O	691536	\N	\N	2026-02-27 02:48:32.164569
KL_PHC_KLM_0023	HOSPITAL	Family Health Centre Kunnathoor	kunnathoor	Kerala	Kollam	0476-2858181	\N	phckunnathoor@gmail.com	PHC	GOVERNMENT	FHC Kunnathoor, Puthanambalam P.O	691553	\N	\N	2026-02-27 02:48:32.165013
KL_PHC_KLM_0024	HOSPITAL	Family Health Centre Mancode (Chithara)	mancode chithara	Kerala	Kollam	0474-2427211	\N	mophcmancode@gmail.com	PHC	GOVERNMENT	FHC Mancode, Chithara, Mancode P.O	691559	\N	\N	2026-02-27 02:48:32.165458
KL_PHC_KLM_0025	HOSPITAL	Family Health Centre Mancode (Pathanapuram)	mancode pathanapuram	Kerala	Kollam	0475-2379970	\N	phcmancoduptpm@gmail.com	PHC	GOVERNMENT	FHC Mancode, Pathanapuram	691559	\N	\N	2026-02-27 02:48:32.165905
KL_PHC_KLM_0026	HOSPITAL	Family Health Centre Melila	melila	Kerala	Kollam	0474-2404296	\N	melilaphc@gmail.com	PHC	GOVERNMENT	FHC Melila, Melila P.O	691538	\N	\N	2026-02-27 02:48:32.166345
KL_PHC_KLM_0027	HOSPITAL	Primary Health Centre Mylom	mylom	Kerala	Kollam	0474-2663232	\N	phcmylom@gmail.com	PHC	GOVERNMENT	PHC Mylom, Kottathala P.O, Kottarakkara	691507	\N	\N	2026-02-27 02:48:32.166801
KL_PHC_KLM_0028	HOSPITAL	Family Health Centre Neduvathur	neduvathur	Kerala	Kollam	0474-2045400	\N	phcneduvathoor@gmail.com	PHC	GOVERNMENT	FHC Neduvathur, Pullamala, Anakkottoor P.O	691505	\N	\N	2026-02-27 02:48:32.167219
KL_PHC_KLM_0029	HOSPITAL	Primary Health Centre Pattazhy	pattazhy	Kerala	Kollam	0475-2397799	\N	phcpattazhi@gmail.com	PHC	GOVERNMENT	Primary Health Centre Pattazhy, Pattazhy P.O	691522	\N	\N	2026-02-27 02:48:32.167633
KL_PHC_KLM_0030	HOSPITAL	Primary Health Centre Pattazhy Vadakkekkara	pattazhy vadakkekkara	Kerala	Kollam	0475-2355441	\N	pvadakkekaraphc@gmail.com	PHC	GOVERNMENT	PHC Pattazhy Vadakkekkara, Pattazhy Vadakkekkara P.O	691556	\N	\N	2026-02-27 02:48:32.168114
KL_PHC_KLM_0031	HOSPITAL	Family Health Centre Perayam	perayam	Kerala	Kollam	0474-2580330	\N	perayamph@gmail.com	PHC	GOVERNMENT	FHC Perayam, Kumbalam P.O	\N	\N	\N	2026-02-27 02:48:32.168564
KL_PHC_KLM_0032	HOSPITAL	Family Health Centre Perinad	perinad	Kerala	Kollam	0474-2548111	\N	fhcperinad@gmail.com	PHC	GOVERNMENT	FHC Perinad, Vellimon P.O	691511	\N	\N	2026-02-27 02:48:32.169036
KL_PHC_KLM_0033	HOSPITAL	Family Health Centre Piravanthoor	piravanthoor	Kerala	Kollam	0475-2231234	\N	phcpiravanthoor@gmail.com	PHC	GOVERNMENT	FHC Piravanthoor, Vettithitta P.O	689696	\N	\N	2026-02-27 02:48:32.169469
KL_PHC_KLM_0034	HOSPITAL	Family Health Centre Pooyappally	pooyappally	Kerala	Kollam	0474-2992111	\N	fhcpooyappally@gmail.com	PHC	GOVERNMENT	FHC Pooyappally, Pooyappally P.O	691537	\N	\N	2026-02-27 02:48:32.169862
KL_PHC_KLM_0035	HOSPITAL	Primary Health Centre Poruvazhy	poruvazhy	Kerala	Kollam	0476-2820100	\N	poruvazhyphc@gmail.com	PHC	GOVERNMENT	PHC Poruvazhy, Edakkadu P.O	691552	\N	\N	2026-02-27 02:48:32.170238
KL_PHC_KLM_0036	HOSPITAL	Family Health Centre Pozhikkara	pozhikkara	Kerala	Kollam	0474-2512299	\N	phcpozhikkara@gmail.com	PHC	GOVERNMENT	Family Health Centre Pozhikkara, Paravur	691301	\N	\N	2026-02-27 02:48:32.170609
KL_PHC_KLM_0037	HOSPITAL	Family Health Centre Sakthikulangara	sakthikulangara	Kerala	Kollam	0474-2772388	\N	shakthikulangaraphcklm@gmail.com	PHC	GOVERNMENT	FHC Sakthikulangara, Sakthikulangara P.O	691581	\N	\N	2026-02-27 02:48:32.171003
KL_PHC_KLM_0038	HOSPITAL	Family Health Centre Sooranad South	sooranad south	Kerala	Kollam	0476-2907955	\N	phcsooranadusouth@gmail.com	PHC	GOVERNMENT	Family Health Centre Sooranad South, Patharam P.O	690522	\N	\N	2026-02-27 02:48:32.171379
KL_PHC_KLM_0039	HOSPITAL	Family Health Centre Thalachira	thalachira	Kerala	Kollam	0474-2408666	\N	thalachiraphc@gmail.com	PHC	GOVERNMENT	Family Health Centre Thalachira, Vettikkavala P.O	691538	\N	\N	2026-02-27 02:48:32.171752
KL_PHC_KLM_0040	HOSPITAL	Primary Health Centre Thalavoor	thalavoor	Kerala	Kollam	0475-2328424	\N	phctlv@gmail.com	PHC	GOVERNMENT	Primary Health Centre Thalavoor, Thalavoor P.O	691508	\N	\N	2026-02-27 02:48:32.172137
KL_PHC_KLM_0041	HOSPITAL	Family Health Centre Thevalakkara	thevalakkara	Kerala	Kollam	0476-2877933	\N	phctvk2011@gmail.com	PHC	GOVERNMENT	Family Health Centre Thevalakkara	690524	\N	\N	2026-02-27 02:48:32.172505
KL_PHC_KLM_0042	HOSPITAL	Primary Health Centre Thodiyoor	thodiyoor	Kerala	Kollam	0476-2666287	\N	phcthodiyoor@gmail.com	PHC	GOVERNMENT	PHC Thodiyoor, Edakkulangara, PV North	690544	\N	\N	2026-02-27 02:48:32.172922
KL_PHC_KLM_0043	HOSPITAL	Family Health Centre Thrikkaruva	thrikkaruva	Kerala	Kollam	0474-2704440	\N	phcthrikkaruva@gmail.com	PHC	GOVERNMENT	FHC Thrikkaruva, Prakkulam Road, Kanjaveli	691602	\N	\N	2026-02-27 02:48:32.173803
KL_PHC_KLM_0044	HOSPITAL	Family Health Centre Thrikkovilvattom	thrikkovilvattom	Kerala	Kollam	0474-2504880	\N	phcthrikovilvattom@gmail.com	PHC	GOVERNMENT	FHC Thrikkovilvattom, Kannalloor P.O	691576	\N	\N	2026-02-27 02:48:32.174352
KL_PHC_KLM_0045	HOSPITAL	Family Health Centre Vallikkavu	vallikkavu	Kerala	Kollam	0476-2896126	\N	vallikavu.phc@gmail.com	PHC	GOVERNMENT	Family Health Centre Vallikkavu, Clappana P.O	690525	\N	\N	2026-02-27 02:48:32.174887
KL_PHC_KLM_0046	HOSPITAL	Family Health Centre West Kallada	west kallada	Kerala	Kollam	0476-2967004	\N	phcwestkallada1@gmail.com	PHC	GOVERNMENT	FHC West Kallada, West Kallada P.O	691500	\N	\N	2026-02-27 02:48:32.1754
KL_PHC_KLM_0047	HOSPITAL	Primary Health Centre Yeroor	yeroor	Kerala	Kollam	0475-2202166	\N	phcyeroor2022@gmail.com	PHC	GOVERNMENT	PHC Yeroor, Bharatheepuram P.O	691312	\N	\N	2026-02-27 02:48:32.175908
KL_PHC_KLM_0048	HOSPITAL	Family Health Centre Chadayamangalam	chadayamangalam	Kerala	Kollam	0474-2917402	\N	phcchadayamangalam@gmail.com	PHC	GOVERNMENT	Family Health Centre Chadayamangalam, Chadayamangalam P.O	691534	\N	\N	2026-02-27 02:48:32.17642
KL_PHC_KLM_0049	HOSPITAL	Family Health Centre Chathannoor	chathannoor	Kerala	Kollam	0474-2595959	\N	phcchathannoor@gmail.com	PHC	GOVERNMENT	Family Health Centre Chathannoor, Chathannoor P.O	691572	\N	\N	2026-02-27 02:48:32.176933
KL_PHC_KLM_0050	HOSPITAL	Family Health Centre Chavara	chavara	Kerala	Kollam	0476-2686882	\N	phcchavara@gmail.com	PHC	GOVERNMENT	Family Health Centre Chavara, Mukundapuram P.O	691585	\N	\N	2026-02-27 02:48:32.177444
KL_PHC_KLM_0051	HOSPITAL	Family Health Centre Elampalloor	elampalloor	Kerala	Kollam	0474-2547361	\N	elampalloorfhc@gmail.com	PHC	GOVERNMENT	Family Health Centre Elampalloor, Perumpuzha P.O	691504	\N	\N	2026-02-27 02:48:32.177956
KL_PHC_KLM_0052	HOSPITAL	Family Health Centre K.S. Puram	ks puram	Kerala	Kollam	0474-2621495	\N	phc.kspuram@gmail.com	PHC	GOVERNMENT	Family Health Centre K.S. Puram, Kattilkadavu P.O, Puthiyakavu	690542	\N	\N	2026-02-27 02:48:32.178488
KL_PHC_KLM_0053	HOSPITAL	Family Health Centre Perumon	perumon	Kerala	Kollam	0474-2550470	\N	panayamph@gmail.com	PHC	GOVERNMENT	Family Health Centre Perumon, Inchavila P.O, Perinad	691601	\N	\N	2026-02-27 02:48:32.179004
KL_PHC_KLM_0054	HOSPITAL	Primary Health Centre Sreenarayana Puram	sreenarayana puram	Kerala	Kollam	0474-2950297	\N	snpuramphc@gmail.com	PHC	GOVERNMENT	PHC Sreenarayana Puram	\N	\N	\N	2026-02-27 02:48:32.179503
KL_PHC_KLM_0055	HOSPITAL	Family Health Centre Thenmala	thenmala	Kerala	Kollam	7907974938	\N	phcthenmala@gmail.com	PHC	GOVERNMENT	Family Health Centre Thenmala	691308	\N	\N	2026-02-27 02:48:32.180274
KL_PHC_KLM_0056	HOSPITAL	Family Health Centre Ummannoor	ummannoor	Kerala	Kollam	0474-2493900	\N	fhcummannoor@gmail.com	PHC	GOVERNMENT	Family Health Centre Ummannoor, Ummannoor P.O	691520	\N	\N	2026-02-27 02:48:32.180789
KL_PHC_KLM_0057	HOSPITAL	Family Health Centre Veliyam	veliyam	Kerala	Kollam	0474-2494345	\N	fhcveliyam@gmail.com	PHC	GOVERNMENT	FHC Veliyam, Chepra P.O	691520	\N	\N	2026-02-27 02:48:32.181272
KL_PHC_KLM_0058	HOSPITAL	Family Health Centre Vilakkudy	vilakkudy	Kerala	Kollam	0475-2325900	\N	phcvilakkudy@gmail.com	PHC	GOVERNMENT	FHC Vilakkudy, Kunnicode P.O	691508	\N	\N	2026-02-27 02:48:32.18174
KL_PHC_PTA_0001	HOSPITAL	Primary Health Centre Kottanadu	kottanadu	Kerala	Pathanamthitta	0469-2775925	\N	phckottanadu@gmail.com	PHC	GOVERNMENT	Primary Health Centre Kottanadu, Kottanadu P.O	689615	\N	\N	2026-02-27 02:48:32.182209
KL_PHC_PTA_0002	HOSPITAL	Primary Health Centre Thottapuzhassery	thottapuzhassery	Kerala	Pathanamthitta	0469-2671950	\N	thottapuzhasseryphc@gmail.com	PHC	GOVERNMENT	PHC Thottapuzhassery, Kuriannoor P.O	689550	\N	\N	2026-02-27 02:48:32.182679
KL_PHC_PTA_0003	HOSPITAL	Primary Health Centre Vallicodu	vallicodu	Kerala	Pathanamthitta	9037700569	\N	phcvallikode@gmail.com	PHC	GOVERNMENT	PHC Vallicodu, Vallicode P.O	689648	\N	\N	2026-02-27 02:48:32.183144
KL_PHC_PTA_0004	HOSPITAL	Primary Health Centre Malayalapuzha	malayalapuzha	Kerala	Pathanamthitta	0468-2301100	\N	phcmalayalapuzha@gmail.com	PHC	GOVERNMENT	PHC Malayalapuzha, Eram P.O, Potheepad	689664	\N	\N	2026-02-27 02:48:32.183661
KL_PHC_PTA_0005	HOSPITAL	Family Health Centre Pramadom	pramadom	Kerala	Pathanamthitta	0468-2306524	\N	phcpramadom@gmail.com	PHC	GOVERNMENT	FHC Pramadom, V Kottayam P.O	689656	\N	\N	2026-02-27 02:48:32.184106
KL_PHC_PTA_0006	HOSPITAL	Primary Health Centre Pandalam Thekkekara	pandalam thekkekara	Kerala	Pathanamthitta	04734-223617	\N	phcpandalamthekku@gmail.com	PHC	GOVERNMENT	PHC Pandalam Thekkekara, Thattayil P.O	691525	\N	\N	2026-02-27 02:48:32.184569
KL_PHC_PTA_0007	HOSPITAL	Primary Health Centre Mallappuzhassery	mallappuzhassery	Kerala	Pathanamthitta	9847533203	\N	phcmalla@gmail.com	PHC	GOVERNMENT	PHC Mallappuzhassery, Punnacadu P.O	689652	\N	\N	2026-02-27 02:48:32.185078
KL_PHC_PTA_0008	HOSPITAL	Primary Health Centre Manjinikkara	manjinikkara	Kerala	Pathanamthitta	9495549794	\N	manjanikkaraphc@gmail.com	PHC	GOVERNMENT	PHC Manjinikkara, Mathoor P.O	689647	\N	\N	2026-02-27 02:48:32.185537
KL_PHC_PTA_0009	HOSPITAL	Primary Health Centre Kadapra	kadapra	Kerala	Pathanamthitta	9495144242	\N	phckadapra@gmail.com	PHC	GOVERNMENT	PHC Kadapra, Parumala	689626	\N	\N	2026-02-27 02:48:32.185995
KL_PHC_PTA_0010	HOSPITAL	Family Health Centre Nedumpuram	nedumpuram	Kerala	Pathanamthitta	8136886657	\N	phcnedumpuram@gmail.com	PHC	GOVERNMENT	FHC Nedumpuram, Podiyadi P.O	689110	\N	\N	2026-02-27 02:48:32.186419
KL_PHC_PTA_0011	HOSPITAL	Primary Health Centre Kuttapuzha	kuttapuzha	Kerala	Pathanamthitta	9946441407	\N	phckuttapuzha@gmail.com	PHC	GOVERNMENT	PHC Kuttapuzha, Chumathra, Kuttapuzha P.O	689103	\N	\N	2026-02-27 02:48:32.186827
KL_PHC_PTA_0012	HOSPITAL	Primary Health Centre Ranny Angady	ranny angady	Kerala	Pathanamthitta	04735-200750	\N	phcrannyangady@gmail.com	PHC	GOVERNMENT	PHC Ranny Angady, Nellikamon P.O	689674	\N	\N	2026-02-27 02:48:32.187237
KL_PHC_PTA_0013	HOSPITAL	Primary Health Centre Angamoozhy	angamoozhy	Kerala	Pathanamthitta	9447111149	\N	angamoozhiphc@gmail.com	PHC	GOVERNMENT	PHC Angamoozhy, Angamoozhy P.O	689662	\N	\N	2026-02-27 02:48:32.187649
KL_PHC_PTA_0014	HOSPITAL	Primary Health Centre Nilakkal	nilakkal	Kerala	Pathanamthitta	8590161202	\N	nilakkalphc@gmail.com	PHC	GOVERNMENT	PHC Nilakkal, Pampa Thriveni P.O	689662	\N	\N	2026-02-27 02:48:32.188075
KL_PHC_PTA_0015	HOSPITAL	Primary Health Centre Chandanappally	chandanappally	Kerala	Pathanamthitta	9495835755	\N	phcchandanapally@gmail.com	PHC	GOVERNMENT	PHC Chandanappally, Chandanappally P.O, Kodumon	689648	\N	\N	2026-02-27 02:48:32.188487
KL_PHC_PTA_0016	HOSPITAL	Primary Health Centre Koipuram	koipuram	Kerala	Pathanamthitta	0469-2660056	\N	koipuramphc@gmail.com	PHC	GOVERNMENT	PHC Koipuram, Koipuram P.O, Nellickel	689531	\N	\N	2026-02-27 02:48:32.188891
KL_PHC_PTA_0017	HOSPITAL	Family Health Centre Kulanada	kulanada	Kerala	Pathanamthitta	04734-262277	\N	phckulanada1@gmail.com	PHC	GOVERNMENT	Family Health Centre Kulanada, Kulanada P.O	689503	\N	\N	2026-02-27 02:48:32.189297
KL_PHC_PTA_0018	HOSPITAL	Family Health Centre Mezhuveli	mezhuveli	Kerala	Pathanamthitta	9496102848	\N	mezhuveliphc@gmail.com	PHC	GOVERNMENT	FHC Mezhuveli, Ullannoor P.O	689503	\N	\N	2026-02-27 02:48:32.189701
KL_PHC_PTA_0019	HOSPITAL	Family Health Centre Omalloor	omalloor	Kerala	Pathanamthitta	9447793139	\N	phcomalloor@gmail.com	PHC	GOVERNMENT	FHC Omalloor, Pannyali, Omalloor P.O	689647	\N	\N	2026-02-27 02:48:32.190108
KL_PHC_PTA_0020	HOSPITAL	Family Health Centre Kadammanitta	kadammanitta	Kerala	Pathanamthitta	9446022318	\N	phckadammanitta@gmail.com	PHC	GOVERNMENT	FHC Kadammanitta, Kallali Junction, Kadammanitta P.O	689649	\N	\N	2026-02-27 02:48:32.190545
KL_PHC_PTA_0021	HOSPITAL	Primary Health Centre Thelliyoor	thelliyoor	Kerala	Pathanamthitta	6282693105	\N	thelliyoorphc@gmail.com	PHC	GOVERNMENT	PHC Thelliyoor, Thelliyoor P.O	689544	\N	\N	2026-02-27 02:48:32.190942
KL_PHC_PTA_0022	HOSPITAL	Family Health Centre Cherukole	cherukole	Kerala	Pathanamthitta	04735-245673	\N	phccherukole@gmail.com	PHC	GOVERNMENT	FHC Cherukole, Vayalathala P.O, Ranni	689672	\N	\N	2026-02-27 02:48:32.191354
KL_PHC_PTA_0023	HOSPITAL	Primary Health Centre Naranamoozhy	naranamoozhy	Kerala	Pathanamthitta	04735-271244	\N	phcnaranammoozhy@gmail.com	PHC	GOVERNMENT	FHC Naranamoozhy, Naranamoozhy P.O	689711	\N	\N	2026-02-27 02:48:32.191777
KL_PHC_PTA_0024	HOSPITAL	Primary Health Centre Ranni Pazhavangadi	ranni pazhavangadi	Kerala	Pathanamthitta	\N	\N	phcpazhavangadi99@gmail.com	PHC	GOVERNMENT	PHC Ranni Pazhavangadi, Makkappuzha P.O, Ranni	689676	\N	\N	2026-02-27 02:48:32.192204
KL_PHC_PTA_0025	HOSPITAL	Primary Health Centre Erathu	erathu	Kerala	Pathanamthitta	04734-223472	\N	phcerathu1@gmail.com	PHC	GOVERNMENT	PHC Erathu, Manakkala P.O	691551	\N	\N	2026-02-27 02:48:32.192609
KL_PHC_PTA_0026	HOSPITAL	Family Health Centre Ezhamkulam	ezhamkulam	Kerala	Pathanamthitta	9446852621	\N	ezhamkulamphc@gmail.com	PHC	GOVERNMENT	FHC Ezhamkulam, Kaithaparambu P.O, Enathu (Via)	691526	\N	\N	2026-02-27 02:48:32.193056
KL_PHC_PTA_0027	HOSPITAL	Primary Health Centre Kadampanad	kadampanad	Kerala	Pathanamthitta	9497306744	\N	kadampanadphc@gmail.com	PHC	GOVERNMENT	PHC Kadampanad, Kadampanad South P.O	691553	\N	\N	2026-02-27 02:48:32.193509
KL_PHC_PTA_0028	HOSPITAL	Primary Health Centre Koodal	koodal	Kerala	Pathanamthitta	9847033362	\N	phckoodal388@gmail.com	PHC	GOVERNMENT	PHC Koodal, Koodal P.O	691524	\N	\N	2026-02-27 02:48:32.193949
KL_PHC_PTA_0029	HOSPITAL	Primary Health Centre Kokkathodu	kokkathodu	Kerala	Pathanamthitta	0468-2242428	\N	kokkathoduphc@gmail.com	PHC	GOVERNMENT	PHC Kokkathodu, Kokkathodu P.O	689691	\N	\N	2026-02-27 02:48:32.194369
KL_PHC_PTA_0030	HOSPITAL	Family Health Centre Mylapra	mylapra	Kerala	Pathanamthitta	9526620920	\N	phcmylapra@gmail.com	PHC	GOVERNMENT	FHC Mylapra, Mekkozhoor P.O	689678	\N	\N	2026-02-27 02:48:32.194825
KL_PHC_PTA_0031	HOSPITAL	Family Health Centre Seethathode	seethathode	Kerala	Pathanamthitta	8281885755	\N	seethathodephc@gmail.com	PHC	GOVERNMENT	FHC Seethathode, Seethathode P.O	689667	\N	\N	2026-02-27 02:48:32.195183
KL_PHC_PTA_0032	HOSPITAL	Primary Health Centre Puramattom	puramattom	Kerala	Pathanamthitta	\N	\N	phcpuramattom@gmail.com	PHC	GOVERNMENT	PHC Puramattom, Puramattom P.O	689543	\N	\N	2026-02-27 02:48:32.195725
KL_PHC_PTA_0033	HOSPITAL	Family Health Centre Kaviyoor	kaviyoor	Kerala	Pathanamthitta	0469-2618413	\N	phckaviyoor@gmail.com	PHC	GOVERNMENT	FHC Kaviyoor, Kaviyoor P.O	689582	\N	\N	2026-02-27 02:48:32.196078
KL_PHC_PTA_0034	HOSPITAL	Family Health Centre Anicadu	anicadu	Kerala	Pathanamthitta	0469-2686567	\N	fhcanicadu@gmail.com	PHC	GOVERNMENT	FHC Anicadu, Vaipur P.O	689588	\N	\N	2026-02-27 02:48:32.196453
KL_PHC_PTA_0035	HOSPITAL	Family Health Centre Kuttoor	kuttoor	Kerala	Pathanamthitta	9496273113	\N	phckuttoor@gmail.com	PHC	GOVERNMENT	FHC Kuttoor, Kuttoor P.O	689106	\N	\N	2026-02-27 02:48:32.1968
KL_PHC_PTA_0036	HOSPITAL	Family Health Centre Chenneerkara	chenneerkara	Kerala	Pathanamthitta	0468-2259965	\N	chennerkaraphc@gmail.com	PHC	GOVERNMENT	FHC Chenneerkara, Elavumthitta P.O	689625	\N	\N	2026-02-27 02:48:32.197144
KL_PHC_PTA_0037	HOSPITAL	Family Health Centre Thannithode	thannithode	Kerala	Pathanamthitta	0468-2382020	\N	tndphc@gmail.com	PHC	GOVERNMENT	FHC Thannithode, Thannithode P.O	689699	\N	\N	2026-02-27 02:48:32.19749
KL_PHC_PTA_0038	HOSPITAL	Family Health Centre Pandalam	pandalam	Kerala	Pathanamthitta	04734-256090	\N	pandalamphc@gmail.com	PHC	GOVERNMENT	FHC Pandalam, Pandalam P.O	689501	\N	\N	2026-02-27 02:48:32.197835
KL_PHC_PTA_0039	HOSPITAL	Family Health Centre Othera	othera	Kerala	Pathanamthitta	0469-2656505	\N	otheraphc@gmail.com	PHC	GOVERNMENT	FHC Othera, East Othera P.O, Thiruvalla	689546	\N	\N	2026-02-27 02:48:32.198187
KL_PHC_PTA_0040	HOSPITAL	Family Health Centre Pallickal	pallickal	Kerala	Pathanamthitta	04734-289890	\N	phcpallickal@gmail.com	PHC	GOVERNMENT	FHC Pallickal, Anayadi P.O, Adoor	690561	\N	\N	2026-02-27 02:48:32.198531
KL_PHC_PTA_0041	HOSPITAL	Family Health Centre Kottangal	kottangal	Kerala	Pathanamthitta	0469-2696139	\N	phckottangal@gmail.com	PHC	GOVERNMENT	FHC Kottangal, Kottangal P.O	686547	\N	\N	2026-02-27 02:48:32.198876
KL_PHC_PTA_0042	HOSPITAL	Family Health Centre Niranam	niranam	Kerala	Pathanamthitta	9656362433	\N	mophcniranampa@gmail.com	PHC	GOVERNMENT	FHC Niranam, Niranam P.O, Thiruvalla	689621	\N	\N	2026-02-27 02:48:32.199257
KL_PHC_PTA_0043	HOSPITAL	Family Health Centre Vadasserikkara	vadasserikkara	Kerala	Pathanamthitta	04735-251773	\N	phcvadasserikkara@gmail.com	PHC	GOVERNMENT	FHC Vadasserikkara, Vadasserikkara P.O	689662	\N	\N	2026-02-27 02:48:32.199603
KL_PHC_ALP_0001	HOSPITAL	Family Health Centre Mannancherry	mannancherry	Kerala	Alappuzha	0477-2292008	\N	phcmannancherry@gmail.com	PHC	GOVERNMENT	FHC Mannancherry, North Aryad P.O	688538	\N	\N	2026-02-27 02:48:32.199979
KL_PHC_ALP_0002	HOSPITAL	Primary Health Centre Kodamthuruth	kodamthuruth	Kerala	Alappuzha	0478-2565944	\N	mokodamthuruthphc@gmail.com	PHC	GOVERNMENT	PHC Kodamthuruth, Kuthiyathode P.O, Cherthala	688533	\N	\N	2026-02-27 02:48:32.200327
KL_PHC_ALP_0003	HOSPITAL	Primary Health Centre Cheppad	cheppad	Kerala	Alappuzha	0479-2400911	\N	arogyakendramcheppad@gmail.com	PHC	GOVERNMENT	Primary Health Centre Cheppad	690507	\N	\N	2026-02-27 02:48:32.200671
KL_PHC_ALP_0004	HOSPITAL	Primary Health Centre Muttar	muttar	Kerala	Alappuzha	0477-2707732	\N	muttarphc@gmail.com	PHC	GOVERNMENT	Primary Health Centre Muttar, Mithrakary P.O	689595	\N	\N	2026-02-27 02:48:32.201011
KL_PHC_ALP_0005	HOSPITAL	Primary Health Centre Budhanoor	budhanoor	Kerala	Alappuzha	9947211870	\N	phcbudhanor@gmail.com	PHC	GOVERNMENT	PHC Budhanoor, Peringilippuram, Ennakkad P.O	689624	\N	\N	2026-02-27 02:48:32.201612
KL_PHC_ALP_0006	HOSPITAL	Primary Health Centre Kumarapuram	kumarapuram	Kerala	Alappuzha	0479-2995215	\N	kumaraphc@gmail.com	PHC	GOVERNMENT	PHC Kumarapuram, Harippad	690548	\N	\N	2026-02-27 02:48:32.201988
KL_PHC_ALP_0007	HOSPITAL	Primary Health Centre Haripad	haripad	Kerala	Alappuzha	0479-2404641	\N	moharipadphc@gmail.com	PHC	GOVERNMENT	PHC Haripad, Haripad	690514	\N	\N	2026-02-27 02:48:32.202336
KL_PHC_ALP_0008	HOSPITAL	Primary Health Centre Pallipad	pallipad	Kerala	Alappuzha	0479-2409096	\N	mophcpallipad@gmail.com	PHC	GOVERNMENT	PHC Pallipad, Pallipad P.O	690512	\N	\N	2026-02-27 02:48:32.202678
KL_PHC_ALP_0009	HOSPITAL	Family Health Centre Cherthala South	cherthala south	Kerala	Alappuzha	0478-2572533	\N	mocherthalasouthphc@gmail.com	PHC	GOVERNMENT	FHC Cherthala South, Arthungal P.O	688530	\N	\N	2026-02-27 02:48:32.203028
KL_PHC_ALP_0010	HOSPITAL	Family Health Centre Vayalar	vayalar	Kerala	Alappuzha	0478-259827	\N	mophcvayalar@gmail.com	PHC	GOVERNMENT	FHC Vayalar, Vayalar P.O, Cherthala	688536	\N	\N	2026-02-27 02:48:32.203374
KL_PHC_ALP_0011	HOSPITAL	Family Health Centre Pallithode	pallithode	Kerala	Alappuzha	0478-2562590	\N	phcpallithode@gmail.com	PHC	GOVERNMENT	FHC Pallithode, Pallithode P.O	688540	\N	\N	2026-02-27 02:48:32.203718
KL_PHC_ALP_0012	HOSPITAL	Family Health Centre Vallikunnam	vallikunnam	Kerala	Alappuzha	0479-2338300	\N	vallikunnamphc@gmail.com	PHC	GOVERNMENT	Thoppil Bhasi Memorial Govt FHC Vallikunnam	690501	\N	\N	2026-02-27 02:48:32.204064
KL_PHC_ALP_0013	HOSPITAL	Family Health Centre Nooranad	nooranad	Kerala	Alappuzha	0479-2375958	\N	phcnooranad@gmail.com	PHC	GOVERNMENT	Family Health Centre Nooranad, Padanilam P.O	690529	\N	\N	2026-02-27 02:48:32.204406
KL_PHC_ALP_0014	HOSPITAL	Family Health Centre Chettikulangara	chettikulangara	Kerala	Alappuzha	6238585981	\N	chettikulangaraphc@gmail.com	PHC	GOVERNMENT	FHC Chettikulangara, Chettikulangara P.O	690106	\N	\N	2026-02-27 02:48:32.204755
KL_PHC_ALP_0015	HOSPITAL	Primary Health Centre Thakazhy	thakazhy	Kerala	Alappuzha	0477-2275900	\N	phcthakazhy@gmail.com	PHC	GOVERNMENT	PHC Thakazhy, Thakazhy P.O	688562	\N	\N	2026-02-27 02:48:32.205099
KL_PHC_ALP_0016	HOSPITAL	Family Health Centre Cheriyanad	cheriyanad	Kerala	Alappuzha	9846448482	\N	phccheriyanad@live.com	PHC	GOVERNMENT	Family Health Centre Cheriyanad, Cheriyanad P.O, Chengannur	689511	\N	\N	2026-02-27 02:48:32.205466
KL_PHC_ALP_0017	HOSPITAL	Primary Health Centre Karthikappally	karthikappally	Kerala	Alappuzha	0479-2482509	\N	phckarthikappally@gmail.com	PHC	GOVERNMENT	PHC Karthikappally, Mahadevukadu P.O	690515	\N	\N	2026-02-27 02:48:32.205813
KL_PHC_ALP_0018	HOSPITAL	Primary Health Centre Karuvatta	karuvatta	Kerala	Alappuzha	0479-2491934	\N	karuvattaphc@gmail.com	PHC	GOVERNMENT	Primary Health Centre Karuvatta	690517	\N	\N	2026-02-27 02:48:32.206158
KL_PHC_ALP_0019	HOSPITAL	Family Health Centre Aryad	aryad	Kerala	Alappuzha	0477-2249070	\N	aryadphcalpy@gmail.com	PHC	GOVERNMENT	FHC Aryad, South Aryad, Avalookkunnu P.O	688006	\N	\N	2026-02-27 02:48:32.206516
KL_PHC_ALP_0020	HOSPITAL	Family Health Centre Thottappally	thottappally	Kerala	Alappuzha	0477-2297369	\N	phcthottapally@gmail.com	PHC	GOVERNMENT	Family Health Centre Thottappally, Thottappally P.O, Ambalappuzha	688561	\N	\N	2026-02-27 02:48:32.206858
KL_PHC_ALP_0021	HOSPITAL	Primary Health Centre Purakkad	purakkad	Kerala	Alappuzha	0477-2270798	\N	phcpurakkad@gmail.com	PHC	GOVERNMENT	PHC Purakkad, Purakkad P.O, Ambalappuzha	688561	\N	\N	2026-02-27 02:48:32.207203
KL_PHC_ALP_0022	HOSPITAL	Family Health Centre Punnapra South	punnapra south	Kerala	Alappuzha	0477-2280161	\N	phcpunnapara@gmail.com	PHC	GOVERNMENT	Family Health Centre Punnapra South, Punnapra P.O	688004	\N	\N	2026-02-27 02:48:32.207546
KL_PHC_ALP_0023	HOSPITAL	Family Health Centre Ambalappuzha North	ambalappuzha north	Kerala	Alappuzha	9496547820	\N	phcambalappuzhanorth@gmail.com	PHC	GOVERNMENT	Family Health Centre Ambalappuzha North	688005	\N	\N	2026-02-27 02:48:32.207897
KL_PHC_ALP_0024	HOSPITAL	Family Health Centre Mararikulam North	mararikulam north	Kerala	Alappuzha	0478-2968600	\N	momararinorth@gmail.com	PHC	GOVERNMENT	Family Health Centre Mararikulam North, Kannichukulangara P.O, Cherthala	688530	\N	\N	2026-02-27 02:48:32.208497
KL_PHC_ALP_0025	HOSPITAL	Primary Health Centre Vallethode	vallethode	Kerala	Alappuzha	0478-2561465	\N	phcvallethode@gmail.com	PHC	GOVERNMENT	Primary Health Centre Vallethode	\N	\N	\N	2026-02-27 02:48:32.209001
KL_PHC_ALP_0026	HOSPITAL	Family Health Centre Panavally	panavally	Kerala	Alappuzha	0478-2524299	\N	mopanavally2021@gmail.com	PHC	GOVERNMENT	Family Health Centre Panavally	\N	\N	\N	2026-02-27 02:48:32.209358
KL_PHC_ALP_0027	HOSPITAL	Family Health Centre Thuravoor South	thuravoor south	Kerala	Alappuzha	0478-2565662	\N	thuravoorsouthphc@gmail.com	PHC	GOVERNMENT	FHC Thuravoor South, Thuravoor P.O, Cherthala	688532	\N	\N	2026-02-27 02:48:32.209712
KL_PHC_ALP_0028	HOSPITAL	Primary Health Centre Kadakkarappally	kadakkarappally	Kerala	Alappuzha	0478-2812692	\N	phckadakkarappally@gmail.com	PHC	GOVERNMENT	PHC Kadakkarappally, Kadakkarappally P.O, Cherthala	688529	\N	\N	2026-02-27 02:48:32.210136
KL_PHC_ALP_0029	HOSPITAL	Family Health Centre Thamarakulam	thamarakulam	Kerala	Alappuzha	0479-2370310	\N	phcthamarakulam@gmail.com	PHC	GOVERNMENT	Family Health Centre Thamarakulam, Thamarakulam P.O	690530	\N	\N	2026-02-27 02:48:32.210635
KL_PHC_ALP_0030	HOSPITAL	Family Health Centre Thazhakkara	thazhakkara	Kerala	Alappuzha	0479-2967370	\N	phcthazhakkara@gmail.com	PHC	GOVERNMENT	Family Health Centre Thazhakkara, Eravankkara P.O, Mavelikkara	690102	\N	\N	2026-02-27 02:48:32.211091
KL_PHC_ALP_0031	HOSPITAL	Family Health Centre Bharanicavu	bharanicavu	Kerala	Alappuzha	0479-2961829	\N	mophcbharanicavu@gmail.com	PHC	GOVERNMENT	Family Health Centre Bharanicavu, Pallickal (NM) P.O	690503	\N	\N	2026-02-27 02:48:32.211519
KL_PHC_ALP_0032	HOSPITAL	Family Health Centre Krishnapuram	krishnapuram	Kerala	Alappuzha	0479-2438154	\N	mophckrishnapuram@gmail.com	PHC	GOVERNMENT	FHC Krishnapuram, Kappil East P.O	690533	\N	\N	2026-02-27 02:48:32.21193
KL_PHC_ALP_0033	HOSPITAL	Family Health Centre Devikulangara	devikulangara	Kerala	Alappuzha	0476-2698686	\N	moicphcdvk@gmail.com	PHC	GOVERNMENT	FHC Devikulangara, Puthupally P.O	690547	\N	\N	2026-02-27 02:48:32.212352
KL_PHC_ALP_0034	HOSPITAL	Primary Health Centre Pathiyoor	pathiyoor	Kerala	Alappuzha	0479-2436120	\N	mo.phc.pathiyoor@gmail.com	PHC	GOVERNMENT	PHC Pathiyoor, Keerikkad P.O	690508	\N	\N	2026-02-27 02:48:32.212742
KL_PHC_ALP_0035	HOSPITAL	Family Health Centre Kavalam	kavalam	Kerala	Alappuzha	0477-2968182	\N	kavalamphc2@gmail.com	PHC	GOVERNMENT	FHC Kavalam, Kavalam P.O	688506	\N	\N	2026-02-27 02:48:32.213221
KL_PHC_ALP_0036	HOSPITAL	Family Health Centre Veeyapuram	veeyapuram	Kerala	Alappuzha	0479-2318533	\N	phcveeyapuram@gmail.com	PHC	GOVERNMENT	FHC Veeyapuram, Veeyapuram P.O	690514	\N	\N	2026-02-27 02:48:32.2136
KL_PHC_ALP_0037	HOSPITAL	Family Health Centre Ramankary	ramankary	Kerala	Alappuzha	0477-2707731	\N	phcramankary@gmail.com	PHC	GOVERNMENT	FHC Ramankary, Urukkary P.O	689595	\N	\N	2026-02-27 02:48:32.213954
KL_PHC_ALP_0038	HOSPITAL	Family Health Centre Kuppapuram	kuppapuram	Kerala	Alappuzha	0477-2176462	\N	phc.kuppapuram@yahoo.com	PHC	GOVERNMENT	FHC Kuppapuram, Kainakary P.O	688001	\N	\N	2026-02-27 02:48:32.214305
KL_PHC_ALP_0039	HOSPITAL	Primary Health Centre Venmony	venmony	Kerala	Alappuzha	0479-2354998	\N	venmonyphc2gmail.com	PHC	GOVERNMENT	PHC Venmony, Venmony P.O	689509	\N	\N	2026-02-27 02:48:32.21465
KL_PHC_ALP_0040	HOSPITAL	Family Health Centre Eramallikkara	eramallikkara	Kerala	Alappuzha	0479-2427002	\N	phcermallikkara@gmail.com	PHC	GOVERNMENT	FHC Eramallikkara, Eramallikkara P.O, Chengannur	689109	\N	\N	2026-02-27 02:48:32.215003
KL_PHC_ALP_0041	HOSPITAL	Family Health Centre Puliyoor	puliyoor	Kerala	Alappuzha	0479-2466555	\N	phcpuliyoor@gmail.com	PHC	GOVERNMENT	FHC Puliyoor, Puliyoor P.O, Chengannur	689510	\N	\N	2026-02-27 02:48:32.215377
KL_PHC_ALP_0042	HOSPITAL	Primary Health Centre Mulakkuzha	mulakkuzha	Kerala	Alappuzha	9496092215	\N	phcmulakkuzha@gmail.com	PHC	GOVERNMENT	PHC Mulakkuzha, Areekkara P.O, Chengannur	689505	\N	\N	2026-02-27 02:48:32.215722
KL_PHC_ALP_0043	HOSPITAL	Primary Health Centre Kadampoor	kadampoor	Kerala	Alappuzha	0479-2466815	\N	phckadampooralpy@gmail.com	PHC	GOVERNMENT	PHC Kadampoor, Budhanoor P.O	689510	\N	\N	2026-02-27 02:48:32.216065
KL_PHC_ALP_0044	HOSPITAL	Primary Health Centre Chingoli	chingoli	Kerala	Alappuzha	9610716401	\N	chingoliphc@gmail.com	PHC	GOVERNMENT	PHC Chingoli, Chingoli P.O	690532	\N	\N	2026-02-27 02:48:32.216409
KL_PHC_ALP_0045	HOSPITAL	Family Health Centre Ezhupunna	ezhupunna	Kerala	Alappuzha	0478-2877699	\N	ezhupunnaphc@yahoo.in	PHC	GOVERNMENT	FHC Ezhupunna, Sreenarayanapuram, Ezhupunna P.O, Cherthala	688537	\N	\N	2026-02-27 02:48:32.216755
KL_PHC_ALP_0046	HOSPITAL	Family Health Centre Kalavoor	kalavoor	Kerala	Alappuzha	0478-2860979	\N	fhckalavoor@gmail.com	PHC	GOVERNMENT	FHC Kalavoor, Kalavoor P.O	688522	\N	\N	2026-02-27 02:48:32.217101
KL_PHC_ALP_0047	HOSPITAL	Family Health Centre Aroor	aroor	Kerala	Alappuzha	0478-2874192	\N	phcaroor@gmail.com	PHC	GOVERNMENT	FHC Aroor, Aroor P.O, Cherthala	688534	\N	\N	2026-02-27 02:48:32.217446
KL_PHC_ALP_0048	HOSPITAL	Family Health Centre Vettackal	vettackal	Kerala	Alappuzha	0478-2592193	\N	fhcvettackal@gmail.com	PHC	GOVERNMENT	FHC Vettackal, Vettackal P.O, Cherthala	688529	\N	\N	2026-02-27 02:48:32.217789
KL_PHC_ALP_0049	HOSPITAL	Family Health Centre Arattupuzha	arattupuzha	Kerala	Alappuzha	0479-2488201	\N	mophcarattupuzha@gmail.com	PHC	GOVERNMENT	FHC Arattupuzha, Arattupuzha P.O	690515	\N	\N	2026-02-27 02:48:32.21814
KL_PHC_ALP_0050	HOSPITAL	Family Health Centre Kandalloor	kandalloor	Kerala	Alappuzha	0479-2430365	\N	phckandalor@gmail.com	PHC	GOVERNMENT	FHC Kandalloor, Puthiyavila P.O	690531	\N	\N	2026-02-27 02:48:32.218484
KL_PHC_ALP_0051	HOSPITAL	Family Health Centre Pallippuram	pallippuram	Kerala	Alappuzha	0478-2553972	\N	mophcpallipuram@gmail.com	PHC	GOVERNMENT	FHC Pallippuram, K R Puram P.O, Cherthala	688541	\N	\N	2026-02-27 02:48:32.218849
KL_PHC_ALP_0052	HOSPITAL	Family Health Centre Kanjikuzhy	kanjikuzhy	Kerala	Alappuzha	0477-2980700	\N	mokanjikuzhyphc@gmail.com	PHC	GOVERNMENT	FHC Kanjikuzhy, Varanam P.O, Cherthala	688555	\N	\N	2026-02-27 02:48:32.219195
KL_PHC_ALP_0053	HOSPITAL	Family Health Centre Punnapra North	punnapra north	Kerala	Alappuzha	0477-2266538	\N	phcpunnapranorth@gmail.com	PHC	GOVERNMENT	FHC Punnapra North, Vadackal P.O	688003	\N	\N	2026-02-27 02:48:32.219543
KL_PHC_ALP_0054	HOSPITAL	Family Health Centre Palamel	palamel	Kerala	Alappuzha	0479-2386242	\N	phcpalamel@gmail.com	PHC	GOVERNMENT	FHC Palamel, Ulavakkad, Nooranad P.O	690504	\N	\N	2026-02-27 02:48:32.219888
KL_PHC_ALP_0055	HOSPITAL	Family Health Centre Chennithala	chennithala	Kerala	Alappuzha	0479-2323897	\N	phcchennithala@gmail.com	PHC	GOVERNMENT	Family Health Centre Chennithala, Chennithala P.O, Mavelikara	690105	\N	\N	2026-02-27 02:48:32.220231
KL_PHC_ALP_0056	HOSPITAL	Family Health Centre Neelamperoor	neelamperoor	Kerala	Alappuzha	0477-2746200	\N	phcneelamperoor@gmail.com	PHC	GOVERNMENT	FHC Neelamperoor, Narakathara, Kavalam P.O	688506	\N	\N	2026-02-27 02:48:32.220579
KL_PHC_ALP_0057	HOSPITAL	Family Health Centre Thalavady	thalavady	Kerala	Alappuzha	0477-2210940	\N	thalavadyphc@gmail.com	PHC	GOVERNMENT	FHC Thalavady, Thalavady P.O	689572	\N	\N	2026-02-27 02:48:32.220923
KL_PHC_ALP_0058	HOSPITAL	Family Health Centre Ala	ala	Kerala	Alappuzha	9446552533	\N	mophcala2011@gmail.com	PHC	GOVERNMENT	FHC Ala, Pennukkara P.O, Chengannur	689520	\N	\N	2026-02-27 02:48:32.221274
KL_PHC_ALP_0059	HOSPITAL	Family Health Centre Cheruthana	cheruthana	Kerala	Alappuzha	0479-2318455	\N	cheruthanaphc@gmail.com	PHC	GOVERNMENT	FHC Cheruthana, Ayaparambu P.O, Cheruthana	690517	\N	\N	2026-02-27 02:48:32.221617
KL_PHC_ALP_0060	HOSPITAL	Government Fisheries Hospital Pallana	government fisheries hospital pallana	Kerala	Alappuzha	0477-2297644	\N	gfhpallana@gmail.com	PHC	GOVERNMENT	Govt. Fisheries Hospital Pallana	690515	\N	\N	2026-02-27 02:48:32.222007
KL_PHC_ALP_0061	HOSPITAL	Government Fisheries Dispensary Arattupuzha	government fisheries dispensary arattupuzha	Kerala	Alappuzha	0479-2488200	\N	gfdarattupuzha@gmail.com	PHC	GOVERNMENT	GFD Arattupuzha, Valiyazheekkal P.O, Tharayilkadavu	\N	\N	\N	2026-02-27 02:48:32.222615
KL_PHC_KTM_0001	HOSPITAL	Family Health Centre Mundankunnu	mundankunnu	Kerala	Kottayam	0481-2551201	\N	phcmundankunnu@gmail.com	PHC	GOVERNMENT	FHC Mundankunnu, Manalunkal P.O	686503	\N	\N	2026-02-27 02:48:32.223014
KL_PHC_KTM_0002	HOSPITAL	Family Health Centre Karoor	karoor	Kerala	Kottayam	04822-262893	\N	phckaroor@gmail.com	PHC	GOVERNMENT	FHC Karoor, Payappar P.O, Anthiyalam	686651	\N	\N	2026-02-27 02:48:32.223378
KL_PHC_KTM_0003	HOSPITAL	Family Health Centre Kozhuvanal	kozhuvanal	Kerala	Kottayam	04822-269367	\N	phckozhuvanal@gmail.com	PHC	GOVERNMENT	FHC Kozhuvanal, Mevada P.O	686573	\N	\N	2026-02-27 02:48:32.223737
KL_PHC_KTM_0004	HOSPITAL	Family Health Centre T V Puram	t v puram	Kerala	Kottayam	04829-211789	\N	mophctvpuram@gmail.com	PHC	GOVERNMENT	FHC T V Puram, T V Puram P.O, Vaikom	686606	\N	\N	2026-02-27 02:48:32.224125
KL_PHC_KTM_0005	HOSPITAL	Family Health Centre Nedumkunnam	nedumkunnam	Kerala	Kottayam	0481-2417534	\N	phcndm@gmail.com	PHC	GOVERNMENT	FHC Nedumkunnam, Nedumkunnam P.O	686542	\N	\N	2026-02-27 02:48:32.224492
KL_PHC_KTM_0006	HOSPITAL	Family Health Centre GVR Poonjar	gvr poonjar	Kerala	Kottayam	04822-273638	\N	gvrpoonjar@gmail.com	PHC	GOVERNMENT	FHC GVR Poonjar, Poonjar P.O	686581	\N	\N	2026-02-27 02:48:32.224862
KL_PHC_KTM_0007	HOSPITAL	Family Health Centre Thalanadu	thalanadu	Kerala	Kottayam	\N	\N	phcthalanadu@gmail.com	PHC	GOVERNMENT	FHC Thalanadu, Thalanadu P.O	686580	\N	\N	2026-02-27 02:48:32.225258
KL_PHC_KTM_0008	HOSPITAL	Primary Health Centre Thidanadu	thidanadu	Kerala	Kottayam	04828-236888	\N	mophcthidanadu@gmail.com	PHC	GOVERNMENT	PHC Thidanadu, Thidanadu P.O	686123	\N	\N	2026-02-27 02:48:32.22581
KL_PHC_KTM_0009	HOSPITAL	Family Health Centre Thalappalam	thalappalam	Kerala	Kottayam	04822-239345	\N	phcthalappalam@gmail.com	PHC	GOVERNMENT	FHC Thalappalam, Narianganam P.O	686579	\N	\N	2026-02-27 02:48:32.22633
KL_PHC_KTM_0010	HOSPITAL	Family Health Centre Teekoy	teekoy	Kerala	Kottayam	04822-281502	\N	mophcteekoy@gmail.com	PHC	GOVERNMENT	FHC Teekoy, Teekoy P.O	686580	\N	\N	2026-02-27 02:48:32.227452
KL_PHC_KTM_0011	HOSPITAL	Family Health Centre Kalaketty	kalaketty	Kerala	Kottayam	04828-295616	\N	mophckalaketty@gmail.com	PHC	GOVERNMENT	FHC Kalaketty, Kalaketty P.O	686508	\N	\N	2026-02-27 02:48:32.227883
KL_PHC_KTM_0012	HOSPITAL	Family Health Centre Karikkattoor	karikkattoor	Kerala	Kottayam	04828-246560	\N	phckarikkattoor@gmail.com	PHC	GOVERNMENT	FHC Karikkattoor, Ponthenpuzha P.O	686544	\N	\N	2026-02-27 02:48:32.228269
KL_PHC_KTM_0013	HOSPITAL	Family Health Centre Parathanam	parathanam	Kerala	Kottayam	04828-296001	\N	mophcparathanam@gmail.com	PHC	GOVERNMENT	FHC Parathanam, Parathanam P.O	686514	\N	\N	2026-02-27 02:48:32.228683
KL_PHC_KTM_0014	HOSPITAL	Family Health Centre Peruva	peruva	Kerala	Kottayam	\N	\N	peruvaphc@gmail.com	PHC	GOVERNMENT	FHC Peruva, Peruva P.O	686610	\N	\N	2026-02-27 02:48:32.229096
KL_PHC_KTM_0015	HOSPITAL	Family Health Centre Kaduthuruthy	kaduthuruthy	Kerala	Kottayam	04829-253030	\N	phckaduthuruthy@gmail.com	PHC	GOVERNMENT	FHC Kaduthuruthy, Ayamkudy P.O	686613	\N	\N	2026-02-27 02:48:32.229503
KL_PHC_KTM_0016	HOSPITAL	Family Health Centre Vazhappally	vazhappally	Kerala	Kottayam	\N	\N	mophcvazhapally@yahoo.in	PHC	GOVERNMENT	FHC Vazhappally, Cheeranchira P.O	686106	\N	\N	2026-02-27 02:48:32.229913
KL_PHC_KTM_0017	HOSPITAL	Family Health Centre Manarcadu	manarcadu	Kerala	Kottayam	0481-2371288	\N	phcmanarcadu@gmail.com	PHC	GOVERNMENT	FHC Manarcadu, Manarcadu P.O	686019	\N	\N	2026-02-27 02:48:32.230318
KL_PHC_KTM_0018	HOSPITAL	Family Health Centre Poonjar	poonjar	Kerala	Kottayam	04822-274994	\N	mophcpoonjar@gmail.com	PHC	GOVERNMENT	FHC Poonjar, Poonjar Thekkekkara P.O	686582	\N	\N	2026-02-27 02:48:32.230728
KL_PHC_KTM_0019	HOSPITAL	Family Health Centre Marangattupilly	marangattupilly	Kerala	Kottayam	04822-250400	\N	phcmgply@gmail.com	PHC	GOVERNMENT	FHC Marangattupilly, Marangattupilly P.O	686635	\N	\N	2026-02-27 02:48:32.231164
KL_PHC_KTM_0020	HOSPITAL	KMC Family Health Centre Ettumanoor	kmc ettumanoor	Kerala	Kottayam	0481-2535573	\N	kmchetr@gmail.com	PHC	GOVERNMENT	KMC FHC Ettumanoor, Ettumanoor P.O	686631	\N	\N	2026-02-27 02:48:32.231581
KL_PHC_KTM_0021	HOSPITAL	Family Health Centre Athirampuzha	athirampuzha	Kerala	Kottayam	0481-2730095	\N	phcathirampuzha1@gmail.com	PHC	GOVERNMENT	FHC Athirampuzha, Athirampuzha P.O	686562	\N	\N	2026-02-27 02:48:32.231968
KL_PHC_KTM_0022	HOSPITAL	Family Health Centre Aymanam	aymanam	Kerala	Kottayam	0481-2516149	\N	phcaymanam@ymail.com	PHC	GOVERNMENT	FHC Aymanam, Valyad	686015	\N	\N	2026-02-27 02:48:32.232343
KL_PHC_KTM_0023	HOSPITAL	Family Health Centre Parampuzha	parampuzha	Kerala	Kottayam	0481-2770829	\N	parampuzhaphc829@gmail.com	PHC	GOVERNMENT	FHC Parampuzha, Parampuzha	686004	\N	\N	2026-02-27 02:48:32.232716
KL_PHC_KTM_0024	HOSPITAL	Primary Health Centre Thrikkodithanam	thrikkodithanam	Kerala	Kottayam	0481-2445470	\N	moicphctkdm@gmail.com	PHC	GOVERNMENT	PHC Thrikkodithanam, Kottamury P.O, Changanasserry	686105	\N	\N	2026-02-27 02:48:32.23309
KL_PHC_KTM_0025	HOSPITAL	Family Health Centre Meenadom	meenadom	Kerala	Kottayam	0481-2556648	\N	phcmeenadom@gmail.com	PHC	GOVERNMENT	FHC Meenadom, Meenadom P.O	686516	\N	\N	2026-02-27 02:48:32.233469
KL_PHC_KTM_0026	HOSPITAL	Family Health Centre Puthuppally	puthuppally	Kerala	Kottayam	0481-2353250	\N	phcputhuppally2014@gmail.com	PHC	GOVERNMENT	FHC Puthuppally, Puthuppally P.O	686011	\N	\N	2026-02-27 02:48:32.233842
KL_PHC_KTM_0027	HOSPITAL	Family Health Centre Onamthuruthu	onamthuruthu	Kerala	Kottayam	0481-2712511	\N	onamthuruth@gmail.com	PHC	GOVERNMENT	FHC Onamthuruthu, Onamthuruthu P.O	686602	\N	\N	2026-02-27 02:48:32.234215
KL_PHC_KTM_0028	HOSPITAL	Family Health Centre Nattakom	nattakom	Kerala	Kottayam	0481-2362299	\N	fhcnattakom@gmail.com	PHC	GOVERNMENT	FHC Nattakom, Mariyappally P.O	686013	\N	\N	2026-02-27 02:48:32.234584
KL_PHC_KTM_0029	HOSPITAL	Family Health Centre Kadanad	kadanad	Kerala	Kottayam	04822-247747	\N	phckadanad@gmail.com	PHC	GOVERNMENT	FHC Kadanad, Kadanad P.O	686653	\N	\N	2026-02-27 02:48:32.234981
KL_PHC_KTM_0030	HOSPITAL	Family Health Centre Mutholy	mutholy	Kerala	Kottayam	04822-206346	\N	phcmutholy@gmail.com	PHC	GOVERNMENT	FHC Mutholy, Mutholy P.O, Pala	686573	\N	\N	2026-02-27 02:48:32.235321
KL_PHC_KTM_0031	HOSPITAL	Family Health Centre Moonnilavu	moonnilavu	Kerala	Kottayam	04822-293963	\N	phcmoonnilavu@gmail.com	PHC	GOVERNMENT	FHC Moonnilavu, Moonnilavu P.O	686586	\N	\N	2026-02-27 02:48:32.23566
KL_PHC_KTM_0032	HOSPITAL	Primary Health Centre Maravanthuruthu	maravanthuruthu	Kerala	Kottayam	04829-236756	\N	phcmaravanthuruthu@gmail.com	PHC	GOVERNMENT	PHC Maravanthuruthu, Maravanthuruthu P.O	686608	\N	\N	2026-02-27 02:48:32.236194
KL_PHC_KTM_0033	HOSPITAL	Family Health Centre Udyanapuram	udyanapuram	Kerala	Kottayam	04829-225213	\N	mo.udayanapuram@gmail.com	PHC	GOVERNMENT	FHC Udyanapuram, Padinjarekkara P.O	686146	\N	\N	2026-02-27 02:48:32.236543
KL_PHC_KTM_0034	HOSPITAL	Family Health Centre Thalayazham	thalayazham	Kerala	Kottayam	04829-224814	\N	phcthalayazham@gmail.com	PHC	GOVERNMENT	FHC Thalayazham, Thalayazham P.O	686607	\N	\N	2026-02-27 02:48:32.236889
KL_PHC_KTM_0035	HOSPITAL	Family Health Centre Parathodu	parathodu	Kerala	Kottayam	04828-270773	\N	phcparathodu@gmail.com	PHC	GOVERNMENT	FHC Parathodu, Edakunnam P.O	686512	\N	\N	2026-02-27 02:48:32.23723
KL_PHC_KTM_0036	HOSPITAL	Primary Health Centre Koruthodu	koruthodu	Kerala	Kottayam	04828-280104	\N	phckoruthode@gmail.com	PHC	GOVERNMENT	PHC Koruthodu, Koruthodu P.O	686513	\N	\N	2026-02-27 02:48:32.237567
KL_PHC_KTM_0037	HOSPITAL	Family Health Centre Vellavoor	vellavoor	Kerala	Kottayam	04812-496789	\N	phcvellavoor@gmail.com	PHC	GOVERNMENT	FHC Vellavoor, Vellavoor P.O	686541	\N	\N	2026-02-27 02:48:32.237906
KL_PHC_KTM_0038	HOSPITAL	Family Health Centre Vizhickathodu	vizhickathodu	Kerala	Kottayam	04828-231159	\N	phcvizhickathodu@gmail.com	PHC	GOVERNMENT	FHC Vizhickathodu, Vizhickathodu P.O	686518	\N	\N	2026-02-27 02:48:32.238243
KL_PHC_KTM_0039	HOSPITAL	Family Health Centre Pallickathodu	pallickathodu	Kerala	Kottayam	9447573077	\N	pallickathoduphc@gmail.com	PHC	GOVERNMENT	FHC Pallickathodu, Pallickathodu P.O	686503	\N	\N	2026-02-27 02:48:32.238611
KL_PHC_KTM_0040	HOSPITAL	Family Health Centre Kanakkary	kanakkary	Kerala	Kottayam	0481-2532063	\N	phckanakkari@gmail.com	PHC	GOVERNMENT	FHC Kanakkary, Kalathoor P.O	686633	\N	\N	2026-02-27 02:48:32.238948
KL_PHC_KTM_0041	HOSPITAL	Family Health Centre Kattampak	kattampak	Kerala	Kottayam	04829-265340	\N	phckattampak@gmail.com	PHC	GOVERNMENT	FHC Kattampak, Kattampak P.O	686612	\N	\N	2026-02-27 02:48:32.239284
KL_PHC_KTM_0042	HOSPITAL	Family Health Centre Kallara	kallara	Kerala	Kottayam	04829-290277	\N	phckallaravaikom@gmail.com	PHC	GOVERNMENT	FHC Kallara (Vaikom), South Kallara P.O	686611	\N	\N	2026-02-27 02:48:32.239621
KL_PHC_KTM_0043	HOSPITAL	Family Health Centre Velloor	velloor	Kerala	Kottayam	04829-257705	\N	mophcvelloor@gmail.com	PHC	GOVERNMENT	FHC Velloor, Mevelloor P.O	\N	\N	\N	2026-02-27 02:48:32.240037
KL_PHC_KTM_0044	HOSPITAL	Family Health Centre Paippad	paippad	Kerala	Kottayam	0481-2446927	\N	mophcpaippadu@gmail.com	PHC	GOVERNMENT	FHC Paippad, Nalukody P.O, Changanasserry	686548	\N	\N	2026-02-27 02:48:32.240381
KL_PHC_KTM_0045	HOSPITAL	Primary Health Centre Brahmamangalam	brahmamangalam	Kerala	Kottayam	04829-274427	\N	mo.brahmamangalam@gmail.com	PHC	GOVERNMENT	PHC Brahmamangalam, Brahmamangalam P.O, Vaikom	686605	\N	\N	2026-02-27 02:48:32.24072
KL_PHC_KTM_0046	HOSPITAL	Family Health Centre Erattupetta	erattupetta	Kerala	Kottayam	04822-277425	\N	medicalofficerphcetpa@yahoo.co.in	PHC	GOVERNMENT	FHC Erattupetta, Aruvithura P.O	686122	\N	\N	2026-02-27 02:48:32.241054
KL_PHC_KTM_0047	HOSPITAL	Family Health Centre Manimala	manimala	Kerala	Kottayam	\N	\N	phcmanimala@gmail.com	PHC	GOVERNMENT	FHC Manimala, Karikkattoor P.O	686544	\N	\N	2026-02-27 02:48:32.241391
KL_PHC_KTM_0048	HOSPITAL	Family Health Centre Madappally	madappally	Kerala	Kottayam	04812-472745	\N	mophcmadappally@gmail.com	PHC	GOVERNMENT	FHC Madappally, Madappally P.O	686546	\N	\N	2026-02-27 02:48:32.241731
KL_PHC_KTM_0049	HOSPITAL	Family Health Centre Kooroppada	kooroppada	Kerala	Kottayam	0481-2701435	\N	phckooropada@gmail.com	PHC	GOVERNMENT	FHC Kooroppada	\N	\N	\N	2026-02-27 02:48:32.242087
KL_PHC_KTM_0050	HOSPITAL	Family Health Centre Thiruvarppu	thiruvarppu	Kerala	Kottayam	0481-2382066	\N	thiruvarppuphc@gmail.com	PHC	GOVERNMENT	FHC Thiruvarppu, Kiliroor North P.O	686020	\N	\N	2026-02-27 02:48:32.242421
KL_PHC_KTM_0051	HOSPITAL	Primary Health Centre Panachikkadu	panachikkadu	Kerala	Kottayam	0481-2433604	\N	fhcpanachikkad@gmail.com	PHC	GOVERNMENT	PHC Panachikkadu, Channanikkadu P.O	686533	\N	\N	2026-02-27 02:48:32.242759
KL_PHC_KTM_0052	HOSPITAL	Family Health Centre Meenachil	meenachil	Kerala	Kottayam	04822-238036	\N	phcmeenachil@gmail.com	PHC	GOVERNMENT	FHC Meenachil, Kizhaparayar P.O	686578	\N	\N	2026-02-27 02:48:32.243094
KL_PHC_KTM_0053	HOSPITAL	Family Health Centre Vazhoor	vazhoor	Kerala	Kottayam	0481-2454888	\N	phcvazhoor@gmail.com	PHC	GOVERNMENT	FHC Vazhoor, Vazhoor P.O	686504	\N	\N	2026-02-27 02:48:32.24343
KL_PHC_KTM_0054	HOSPITAL	Family Health Centre Veliyannoor	veliyannoor	Kerala	Kottayam	04822-245716	\N	fhcveliyannoor2022@gmail.com	PHC	GOVERNMENT	FHC Veliyannoor	686634	\N	\N	2026-02-27 02:48:32.243761
KL_PHC_KTM_0055	HOSPITAL	Family Health Centre Kuruppanthara	kuruppanthara	Kerala	Kottayam	04829-244050	\N	phckuruppanthara@gmail.com	PHC	GOVERNMENT	FHC Kuruppanthara, Manjoor P.O	686603	\N	\N	2026-02-27 02:48:32.244099
KL_PHC_IDK_0001	HOSPITAL	Family Health Centre Kanthalloor	kanthalloor	Kerala	Idukki	04865-246487	\N	kanthalloorphc@gmail.com	PHC	GOVERNMENT	FHC Kanthalloor, Kanthalloor P.O	685620	\N	\N	2026-02-27 02:48:32.244434
KL_PHC_IDK_0002	HOSPITAL	Family Health Centre Santhanpara	santhanpara	Kerala	Idukki	04868-247747	\N	medicalofficer747@gmail.com	PHC	GOVERNMENT	FHC Santhanpara, Santhanpara P.O	685519	\N	\N	2026-02-27 02:48:32.244769
KL_PHC_IDK_0003	HOSPITAL	Family Health Centre Vannappuram	vannappuram	Kerala	Idukki	04862-247787	\N	phcvpm@gmail.com	PHC	GOVERNMENT	FHC Vannappuram, Vannappuram P.O	685607	\N	\N	2026-02-27 02:48:32.24511
KL_PHC_IDK_0004	HOSPITAL	Family Health Centre Kallarvattayar	kallarvattayar	Kerala	Idukki	04864-278718	\N	phckallar@gmail.com	PHC	GOVERNMENT	FHC Kallarvattayar, Kallarvattayar P.O	685565	\N	\N	2026-02-27 02:48:32.245492
KL_PHC_IDK_0005	HOSPITAL	Primary Health Centre Mankulam	mankulam	Kerala	Idukki	04864-218906	\N	mankulamphc@yahoo.in	PHC	GOVERNMENT	PHC Mankulam, Mankulam P.O	685565	\N	\N	2026-02-27 02:48:32.245828
KL_PHC_IDK_0006	HOSPITAL	Family Health Centre KP Colony	kp colony	Kerala	Idukki	04868-221504	\N	phckallar@gmail.com	PHC	GOVERNMENT	FHC KP Colony, Kallar P.O	685552	\N	\N	2026-02-27 02:48:32.24616
KL_PHC_IDK_0007	HOSPITAL	Family Health Centre Manakkadu	manakkadu	Kerala	Idukki	04862-202009	\N	phcmanakad@gmail.com	PHC	GOVERNMENT	FHC Manakkadu, Puthupariyaram P.O	685608	\N	\N	2026-02-27 02:48:32.246493
KL_PHC_IDK_0008	HOSPITAL	Family Health Centre Chakkupallam	chakkupallam	Kerala	Idukki	04868-282260	\N	phcchakkupallam@gmail.com	PHC	GOVERNMENT	FHC Chakkupallam, Anakkara P.O	685512	\N	\N	2026-02-27 02:48:32.246833
KL_PHC_IDK_0009	HOSPITAL	Family Health Centre Edavetty	edavetty	Kerala	Idukki	04862-221076	\N	phcedavetty@gmail.com	PHC	GOVERNMENT	FHC Edavetty, Marthoma, Edavetty	685588	\N	\N	2026-02-27 02:48:32.247173
KL_PHC_IDK_0010	HOSPITAL	Family Health Centre Poomala	poomala	Kerala	Idukki	04862-294185	\N	phcpoomala@gmail.com	PHC	GOVERNMENT	FHC Poomala, Koovakandom P.O	685588	\N	\N	2026-02-27 02:48:32.24751
KL_PHC_IDK_0011	HOSPITAL	Family Health Centre Poochapra	poochapra	Kerala	Idukki	04862-294164	\N	phcpoochapra@gmail.com	PHC	GOVERNMENT	FHC Poochapra, Devarupara P.O	685588	\N	\N	2026-02-27 02:48:32.24784
KL_PHC_IDK_0012	HOSPITAL	Family Health Centre Rajakumary	rajakumary	Kerala	Idukki	04868-292191	\N	phcrky@gmail.com	PHC	GOVERNMENT	FHC Rajakumary, Kulapparachal P.O, Kuruvilacity	685619	\N	\N	2026-02-27 02:48:32.248174
KL_PHC_IDK_0013	HOSPITAL	Family Health Centre Karimannoor	karimannoor	Kerala	Idukki	04862-261230	\N	fhckarimannoor@gmail.com	PHC	GOVERNMENT	FHC Karimannoor, Karimannoor P.O	685581	\N	\N	2026-02-27 02:48:32.248749
KL_PHC_IDK_0014	HOSPITAL	Family Health Centre Kodikulam	kodikulam	Kerala	Idukki	04862-265123	\N	phckodikkulam@yahoo.com	PHC	GOVERNMENT	FHC Kodikulam, Kodikulam P.O	685582	\N	\N	2026-02-27 02:48:32.249198
KL_PHC_IDK_0015	HOSPITAL	Family Health Centre Kamakshy	kamakshy	Kerala	Idukki	8606822623	\N	medicalofficerfhckamashy@gmail.com	PHC	GOVERNMENT	FHC Kamakshy, Kamakshy P.O	685515	\N	\N	2026-02-27 02:48:32.2496
KL_PHC_IDK_0016	HOSPITAL	Family Health Centre Kumily	kumily	Kerala	Idukki	04869-222978	\N	kumilyphc@gmail.com	PHC	GOVERNMENT	FHC Kumily, Kumily P.O	685509	\N	\N	2026-02-27 02:48:32.249996
KL_PHC_IDK_0017	HOSPITAL	Family Health Centre Arakulam	arakulam	Kerala	Idukki	04862-253399	\N	arakulamphc@gmail.com	PHC	GOVERNMENT	FHC Arakulam, Arakulam P.O	685591	\N	\N	2026-02-27 02:48:32.250397
KL_PHC_IDK_0018	HOSPITAL	Family Health Centre Pampadumpara	pampadumpara	Kerala	Idukki	04868-232285	\N	phcbpampadumpara@gmail.com	PHC	GOVERNMENT	FHC Pampadumpara, Pampadumpara P.O	685553	\N	\N	2026-02-27 02:48:32.250797
KL_PHC_IDK_0019	HOSPITAL	Family Health Centre Senapathy	senapathy	Kerala	Idukki	9447210985	\N	mophcsenapathy@gmail.com	PHC	GOVERNMENT	FHC Senapathy, Aruvilamchal P.O	685619	\N	\N	2026-02-27 02:48:32.251197
KL_PHC_IDK_0020	HOSPITAL	Family Health Centre Chembakappara	chembakappara	Kerala	Idukki	04868-230312	\N	phcchempakappara@gmail.com	PHC	GOVERNMENT	FHC Chembakappara, Chembakappara P.O	685514	\N	\N	2026-02-27 02:48:32.251599
KL_PHC_IDK_0021	HOSPITAL	Family Health Centre Thattakuzha	thattakuzha	Kerala	Idukki	04862-272267	\N	phcthattakuzha@gmail.com	PHC	GOVERNMENT	FHC Thattakuzha, Thattakuzha P.O	685581	\N	\N	2026-02-27 02:48:32.251997
KL_PHC_IDK_0022	HOSPITAL	Family Health Centre Alakkode	alakkode	Kerala	Idukki	04862-275151	\N	phc.alakod@gmail.com	PHC	GOVERNMENT	FHC Alakkode, Kalayanthai P.O	685566	\N	\N	2026-02-27 02:48:32.252393
KL_PHC_IDK_0023	HOSPITAL	Family Health Centre Kumaramangalam	kumaramangalam	Kerala	Idukki	04862-200889	\N	phckumaramangalam@gmail.com	PHC	GOVERNMENT	FHC Kumaramangalam, Kumaramangalam P.O	685608	\N	\N	2026-02-27 02:48:32.252797
KL_PHC_IDK_0024	HOSPITAL	Family Health Centre Deviar Colony	deviar colony	Kerala	Idukki	04864-272601	\N	mophcdvcy@gmail.com	PHC	GOVERNMENT	FHC Deviar Colony, Valara P.O	685561	\N	\N	2026-02-27 02:48:32.253198
KL_PHC_IDK_0025	HOSPITAL	Family Health Centre Vellathooval	vellathooval	Kerala	Idukki	04864-277167	\N	phcvellathooval@gmail.com	PHC	GOVERNMENT	FHC Vellathooval, Vellathooval P.O	685563	\N	\N	2026-02-27 02:48:32.253665
KL_PHC_IDK_0026	HOSPITAL	Family Health Centre Chinnakanal	chinnakanal	Kerala	Idukki	04868-249406	\N	phcchinnakanal@gmail.com	PHC	GOVERNMENT	FHC Chinnakanal, Chinnakanal P.O	685618	\N	\N	2026-02-27 02:48:32.254053
KL_PHC_IDK_0027	HOSPITAL	Family Health Centre Bison Valley	bison valley	Kerala	Idukki	9495311987	\N	phcblly@gmail.com	PHC	GOVERNMENT	FHC Bison Valley, Bison Valley P.O	685565	\N	\N	2026-02-27 02:48:32.254448
KL_PHC_IDK_0028	HOSPITAL	Family Health Centre Ayyappancovil	ayyappancovil	Kerala	Idukki	04869-244742	\N	phcayyappancoil@gmail.com	PHC	GOVERNMENT	FHC Ayyappancovil, K Chappath P.O	685505	\N	\N	2026-02-27 02:48:32.254837
KL_PHC_IDK_0029	HOSPITAL	Family Health Centre Elappara	elappara	Kerala	Idukki	04869-242556	\N	phcelappara@gmail.com	PHC	GOVERNMENT	FHC Elappara, Elappara P.O	685501	\N	\N	2026-02-27 02:48:32.25523
KL_PHC_IDK_0030	HOSPITAL	Family Health Centre Kokkayar	kokkayar	Kerala	Idukki	9645504952	\N	mokokkayar@gmail.com	PHC	GOVERNMENT	FHC Kokkayar, Meloram P.O	685532	\N	\N	2026-02-27 02:48:32.255612
KL_PHC_IDK_0031	HOSPITAL	Family Health Centre Vazhathopu	vazhathopu	Kerala	Idukki	04862-235186	\N	vazhathopephc@ymail.com	PHC	GOVERNMENT	FHC Vazhathopu, Maniyaramkudy P.O, Lakshamkavala	685602	\N	\N	2026-02-27 02:48:32.256001
KL_PHC_IDK_0032	HOSPITAL	Family Health Centre Kudayathoor	kudayathoor	Kerala	Idukki	04862-275295	\N	mophckudayathoor@gmail.com	PHC	GOVERNMENT	FHC Kudayathoor, Kudayathoor P.O	685590	\N	\N	2026-02-27 02:48:32.256389
KL_PHC_IDK_0033	HOSPITAL	Family Health Centre Vattavada	vattavada	Kerala	Idukki	04865-214431	\N	phcvattavada@gmail.com	PHC	GOVERNMENT	FHC Vattavada, Koviloorm P.O	685615	\N	\N	2026-02-27 02:48:32.256775
KL_PHC_IDK_0034	HOSPITAL	Family Health Centre Kanchiyar	kanchiyar	Kerala	Idukki	04868-271810	\N	phckanchiyar@gmail.com	PHC	GOVERNMENT	FHC Kanchiyar, Kanchiyar P.O	685511	\N	\N	2026-02-27 02:48:32.257182
KL_PHC_IDK_0035	HOSPITAL	Family Health Centre Udumbanchola	udumbanchola	Kerala	Idukki	04868-296523	\N	phc.udumbanchola@gmail.com	PHC	GOVERNMENT	FHC Udumbanchola, Udumbanchola P.O	685554	\N	\N	2026-02-27 02:48:32.257763
KL_PHC_IDK_0036	HOSPITAL	Family Health Centre Karimkunnam	karimkunnam	Kerala	Idukki	04862-243310	\N	phckarimkunnam@gmail.com	PHC	GOVERNMENT	FHC Karimkunnam, Karimkunnam P.O	685586	\N	\N	2026-02-27 02:48:32.258335
KL_PHC_IDK_0037	HOSPITAL	Family Health Centre Mariyapuram	mariyapuram	Kerala	Idukki	04862-236851	\N	phcmariyapuram@gmail.com	PHC	GOVERNMENT	FHC Mariyapuram, Mariyapuram P.O	685602	\N	\N	2026-02-27 02:48:32.258962
KL_PHC_IDK_0038	HOSPITAL	Family Health Centre Konnathady	konnathady	Kerala	Idukki	04868-262560	\N	phckonnathady@gmail.com	PHC	GOVERNMENT	FHC Konnathady	\N	\N	\N	2026-02-27 02:48:32.259528
KL_PHC_IDK_0039	HOSPITAL	Family Health Centre Peruvanthanam	peruvanthanam	Kerala	Idukki	9400899480	\N	phcperuvanthanam@gmail.com	PHC	GOVERNMENT	FHC Peruvanthanam, Peruvanthanam P.O	685532	\N	\N	2026-02-27 02:48:32.26019
KL_PHC_IDK_0040	HOSPITAL	Family Health Centre Edamalakudy	edamalakudy	Kerala	Idukki	9809207373	\N	phcchattamunnar@gmail.com	PHC	GOVERNMENT	FHC Edamalakudy, Munnar P.O	685612	\N	\N	2026-02-27 02:48:32.26105
KL_PHC_IDK_0041	HOSPITAL	Primary Health Centre Chattamunnar	chattamunnar	Kerala	Idukki	8281489138	\N	fhcidamalakudy@gmail.com	PHC	GOVERNMENT	PHC Chattamunnar, Thalayar P.O	685614	\N	\N	2026-02-27 02:48:32.261679
KL_PHC_EKM_0001	HOSPITAL	Family Health Centre Ayyampilly	ayyampilly	Kerala	Ernakulam	0484-2488396	\N	phcayyampilly@gmail.com	PHC	GOVERNMENT	FHC Ayyampilly, Ayyampilly P.O	682501	\N	\N	2026-02-27 02:48:32.262194
KL_PHC_EKM_0002	HOSPITAL	Family Health Centre Mulavukad	mulavukad	Kerala	Ernakulam	0484-2750677	\N	fhcmulavukad@gmail.com	PHC	GOVERNMENT	FHC Mulavukad, Mulavukad P.O	682504	\N	\N	2026-02-27 02:48:32.262703
KL_PHC_EKM_0003	HOSPITAL	Primary Health Centre Pizhala	pizhala	Kerala	Ernakulam	0484-2430894	\N	phcpizhala@gmail.com	PHC	GOVERNMENT	PHC Pizhala, Pizhala P.O	682027	\N	\N	2026-02-27 02:48:32.26316
KL_PHC_EKM_0004	HOSPITAL	Family Health Centre Keezhmad	keezhmad	Kerala	Ernakulam	9961887043	\N	mokeezhmad@gmail.com	PHC	GOVERNMENT	FHC Keezhmad, Erumathala P.O	683112	\N	\N	2026-02-27 02:48:32.263666
KL_PHC_EKM_0005	HOSPITAL	Family Health Centre Arakunnam	arakunnam	Kerala	Ernakulam	0484-2748335	\N	phcentrearakkunnam@gmail.com	PHC	GOVERNMENT	FHC Arakunnam, Arakunnam P.O	682313	\N	\N	2026-02-27 02:48:32.264094
KL_PHC_EKM_0006	HOSPITAL	Family Health Centre Panangad	panangad	Kerala	Ernakulam	0484-2703535	\N	phcpanangad@gmail.com	PHC	GOVERNMENT	FHC Panangad, Panangad P.O	682506	\N	\N	2026-02-27 02:48:32.264501
KL_PHC_EKM_0007	HOSPITAL	Family Health Centre Nettoor	nettoor	Kerala	Ernakulam	0484-2700010	\N	phcnettoor@gmail.com	PHC	GOVERNMENT	FHC Nettoor, Nettoor P.O	682040	\N	\N	2026-02-27 02:48:32.264911
KL_PHC_EKM_0008	HOSPITAL	Family Health Centre Rayamangalam	rayamangalam	Kerala	Ernakulam	0484-2651144	\N	phcrayamangalam@gmail.com	PHC	GOVERNMENT	FHC Rayamangalam, Rayamangalam P.O	683544	\N	\N	2026-02-27 02:48:32.265523
KL_PHC_EKM_0009	HOSPITAL	Family Health Centre Thuravoor	thuravoor	Kerala	Ernakulam	0484-2967117	\N	phcthuravoor@gmail.com	PHC	GOVERNMENT	FHC Thuravoor, Thuravoor P.O, Angamaly	683572	\N	\N	2026-02-27 02:48:32.265967
KL_PHC_EKM_0010	HOSPITAL	Family Health Centre Pindimana	pindimana	Kerala	Ernakulam	0485-2572852	\N	pindimanaphc@gmail.com	PHC	GOVERNMENT	FHC Pindimana, Pindimana	686692	\N	\N	2026-02-27 02:48:32.26638
KL_PHC_EKM_0011	HOSPITAL	Family Health Centre Palakuzha	palakuzha	Kerala	Ernakulam	0485-2253429	\N	mophcpalakuzha@gmail.com	PHC	GOVERNMENT	FHC Palakuzha, Palakuzha P.O	686662	\N	\N	2026-02-27 02:48:32.266787
KL_PHC_EKM_0012	HOSPITAL	Family Health Centre Elanji	elanji	Kerala	Ernakulam	0485-2259080	\N	mophcelanji@gmail.com	PHC	GOVERNMENT	FHC Elanji, Elanji P.O	686665	\N	\N	2026-02-27 02:48:32.267186
KL_PHC_EKM_0013	HOSPITAL	Family Health Centre Chittattukara	chittattukara	Kerala	Ernakulam	0484-2446919	\N	mophcchittattukara@gmail.com	PHC	GOVERNMENT	FHC Chittattukara, Alamthuruth, Vadakkekkara P.O	683522	\N	\N	2026-02-27 02:48:32.267592
KL_PHC_EKM_0014	HOSPITAL	Family Health Centre Kadavoor	kadavoor	Kerala	Ernakulam	9446216608	\N	kadavoorphc@gmail.com	PHC	GOVERNMENT	FHC Kadavoor, Kadavoor P.O	686671	\N	\N	2026-02-27 02:48:32.267995
KL_PHC_EKM_0015	HOSPITAL	Family Health Centre Binanipuram	binanipuram	Kerala	Ernakulam	0484-2559022	\N	phcbinanipuram@gmail.com	PHC	GOVERNMENT	FHC Binanipuram, Edayar P.O, Aluva	683502	\N	\N	2026-02-27 02:48:32.2684
KL_PHC_EKM_0016	HOSPITAL	Family Health Centre Eloor	eloor	Kerala	Ernakulam	0484-2545533	\N	eloorphcekm@gmail.com	PHC	GOVERNMENT	FHC Eloor, Udyogamandal P.O	683501	\N	\N	2026-02-27 02:48:32.268799
KL_PHC_EKM_0017	HOSPITAL	Family Health Centre Manjalloor	manjalloor	Kerala	Ernakulam	0485-2260851	\N	phcmanjalloor@gmail.com	PHC	GOVERNMENT	FHC Manjalloor, Vazhakulam P.O	686670	\N	\N	2026-02-27 02:48:32.269202
KL_PHC_EKM_0018	HOSPITAL	Family Health Centre Valakom	valakom	Kerala	Ernakulam	0485-2208900	\N	phcvalakom@gmail.com	PHC	GOVERNMENT	FHC Valakom, Mekkadampu P.O	682316	\N	\N	2026-02-27 02:48:32.269597
KL_PHC_EKM_0019	HOSPITAL	Family Health Centre Kumarapuram	kumarapuram	Kerala	Ernakulam	0484-2680058	\N	phckumarapuram@gmail.com	PHC	GOVERNMENT	FHC Kumarapuram, Kumarapuram	683565	\N	\N	2026-02-27 02:48:32.270017
KL_PHC_EKM_0020	HOSPITAL	Family Health Centre Thiruvaniyoor	thiruvaniyoor	Kerala	Ernakulam	0484-2733760	\N	phcthiroo@gmail.com	PHC	GOVERNMENT	FHC Thiruvaniyoor, Thiruvaniyoor P.O	682308	\N	\N	2026-02-27 02:48:32.270443
KL_PHC_EKM_0021	HOSPITAL	Primary Health Centre Thrippunithura (RVPD)	thrippunithura rvpd	Kerala	Ernakulam	0484-2784845	\N	rvpdmekkara@gmail.com	PHC	GOVERNMENT	PHC Thrippunithura (RVPD), Mekkara, Thrippunithura	682301	\N	\N	2026-02-27 02:48:32.270901
KL_PHC_EKM_0022	HOSPITAL	Family Health Centre Udayamperoor	udayamperoor	Kerala	Ernakulam	0484-2794430	\N	govt.fisherieshospital@gmail.com	PHC	GOVERNMENT	FHC Udayamperoor, Udayamperoor P.O	682307	\N	\N	2026-02-27 02:48:32.271406
KL_PHC_EKM_0023	HOSPITAL	Family Health Centre Vallarpadam	vallarpadam	Kerala	Ernakulam	0484-2751025	\N	phcvallrpadam@gmail.com	PHC	GOVERNMENT	FHC Vallarpadam, Panambukad, Vallarpadam P.O	682504	\N	\N	2026-02-27 02:48:32.271796
KL_PHC_EKM_0024	HOSPITAL	Primary Health Centre Puthuvyppu	puthuvyppu	Kerala	Ernakulam	8606277702	\N	phcputhuvyppu@gmail.com	PHC	GOVERNMENT	PHC Puthuvyppu, Puthuvyppu P.O	682508	\N	\N	2026-02-27 02:48:32.272187
KL_PHC_EKM_0025	HOSPITAL	Family Health Centre Edavanakad	edavanakad	Kerala	Ernakulam	0484-2992023	\N	phcedavanakad@gmail.com	PHC	GOVERNMENT	FHC Edavanakad, Edavanakad P.O	682502	\N	\N	2026-02-27 02:48:32.272559
KL_PHC_EKM_0026	HOSPITAL	Primary Health Centre Thrikkakara	thrikkakara	Kerala	Ernakulam	9495221331	\N	phcthrikkakara@gmail.com	PHC	GOVERNMENT	PHC Thrikkakara	682021	\N	\N	2026-02-27 02:48:32.272947
KL_PHC_EKM_0027	HOSPITAL	Family Health Centre Kalamassery	kalamassery	Kerala	Ernakulam	0484-2966695	\N	kalamasseryphc@gmail.com	PHC	GOVERNMENT	FHC Kalamassery, HMT Junction, Kalamassery	683104	\N	\N	2026-02-27 02:48:32.273321
KL_PHC_EKM_0028	HOSPITAL	Family Health Centre Choornikkara	choornikkara	Kerala	Ernakulam	0484-2625440	\N	choornikkaraphcoffice@gmail.com	PHC	GOVERNMENT	FHC Choornikkara, Thaikkattukara P.O	683106	\N	\N	2026-02-27 02:48:32.273699
KL_PHC_EKM_0029	HOSPITAL	Family Health Centre Edathala	edathala	Kerala	Ernakulam	0484-2838842	\N	edathalaphc00@gmail.com	PHC	GOVERNMENT	FHC Edathala, Edathala P.O	683561	\N	\N	2026-02-27 02:48:32.274096
KL_PHC_EKM_0030	HOSPITAL	Primary Health Centre Chottanikkara	chottanikkara	Kerala	Ernakulam	0484-2961389	\N	phcchottanikkara@gmail.com	PHC	GOVERNMENT	PHC Chottanikkara, Eruvelil, Chottanikkara	682312	\N	\N	2026-02-27 02:48:32.27447
KL_PHC_EKM_0031	HOSPITAL	Primary Health Centre Thottoor	thottoor	Kerala	Ernakulam	8848089141	\N	phcthottoor@gmail.com	PHC	GOVERNMENT	PHC Thottoor, Kaipattoor P.O, Edakkattuvayal	682313	\N	\N	2026-02-27 02:48:32.27485
KL_PHC_EKM_0032	HOSPITAL	Family Health Centre Thiruvankulam	thiruvankulam	Kerala	Ernakulam	0484-2783856	\N	phcthiruvankulam@gmail.com	PHC	GOVERNMENT	FHC Thiruvankulam, Thiruvankulam P.O	682307	\N	\N	2026-02-27 02:48:32.275228
KL_PHC_EKM_0033	HOSPITAL	Primary Health Centre Valanthakad	valanthakad	Kerala	Ernakulam	9496368528	\N	phcvalanthakad@gmail.com	PHC	GOVERNMENT	PHC Valanthakad, Maradu P.O	682304	\N	\N	2026-02-27 02:48:32.275604
KL_PHC_EKM_0034	HOSPITAL	Primary Health Centre Asamannoor	asamannoor	Kerala	Ernakulam	0484-2659451	7907458059	phcasamannoor@gmail.com	PHC	GOVERNMENT	PHC Asamannoor, Asamannoor P.O	683549	\N	\N	2026-02-27 02:48:32.275987
KL_PHC_EKM_0035	HOSPITAL	Family Health Centre Mudakuzha	mudakuzha	Kerala	Ernakulam	0484-2643519	\N	mudakuzhaphc@gmail.com	PHC	GOVERNMENT	FHC Mudakuzha, Mudakuzha P.O	683546	\N	\N	2026-02-27 02:48:32.276359
KL_PHC_EKM_0036	HOSPITAL	Family Health Centre Palissery	palissery	Kerala	Ernakulam	9048960602	\N	phcpalissery@gmail.com	PHC	GOVERNMENT	FHC Palissery, Ezhattumugham P.O	683577	\N	\N	2026-02-27 02:48:32.276731
KL_PHC_EKM_0037	HOSPITAL	Primary Health Centre Mookkannoor	mookkannoor	Kerala	Ernakulam	9539390980	\N	phcmookanur@gmail.com	PHC	GOVERNMENT	PHC Mookkannoor, Mookkannoor P.O	683577	\N	\N	2026-02-27 02:48:32.277109
KL_PHC_EKM_0038	HOSPITAL	Family Health Centre Ayyampuzha	ayyampuzha	Kerala	Ernakulam	0484-2696825	\N	phc.ayyampuzha@gmail.com	PHC	GOVERNMENT	FHC Ayyampuzha, Chully P.O	683581	\N	\N	2026-02-27 02:48:32.277488
KL_PHC_EKM_0039	HOSPITAL	Family Health Centre Cheruvattor	cheruvattor	Kerala	Ernakulam	0485-2979133	\N	mo.cheruvattoorphc@gmail.com	PHC	GOVERNMENT	FHC Cheruvattor, Cheruvattor P.O, Kothamangalam	686691	\N	\N	2026-02-27 02:48:32.277885
KL_PHC_EKM_0040	HOSPITAL	Family Health Centre Kottappady	kottappady	Kerala	Ernakulam	0485-2842100	\N	kottappadyphc@gmail.com	PHC	GOVERNMENT	FHC Kottappady, Kottappady P.O, Kothamangalam	686691	\N	\N	2026-02-27 02:48:32.27827
KL_PHC_EKM_0041	HOSPITAL	Family Health Centre Punnekkad	punnekkad	Kerala	Ernakulam	0485-2572857	\N	phcpunnekad@gmail.com	PHC	GOVERNMENT	FHC Punnekkad, Keerampara P.O	686681	\N	\N	2026-02-27 02:48:32.278643
KL_PHC_EKM_0042	HOSPITAL	Primary Health Centre Kandakkadavu	kandakkadavu	Kerala	Ernakulam	9497830568	\N	phckandakkadavu@gmail.com	PHC	GOVERNMENT	PHC Kandakkadavu, Kandakkadavu P.O	682008	\N	\N	2026-02-27 02:48:32.27902
KL_PHC_EKM_0043	HOSPITAL	Family Health Centre Alangad	alangad	Kerala	Ernakulam	0484-2512711	\N	phcalangad@gmail.com	PHC	GOVERNMENT	FHC Alangad, Karigamthuruth, Kongorpilly P.O	863518	\N	\N	2026-02-27 02:48:32.279399
KL_PHC_EKM_0044	HOSPITAL	Primary Health Centre Kadungalloor	kadungalloor	Kerala	Ernakulam	0484-2605349	\N	phckadungallur@gmail.com	PHC	GOVERNMENT	PHC Kadungalloor, Kadungalloor P.O, Aluva	683110	\N	\N	2026-02-27 02:48:32.279945
KL_PHC_EKM_0045	HOSPITAL	Family Health Centre Avoly	avoly	Kerala	Ernakulam	9495060461	\N	phcavoly@gmail.com	PHC	GOVERNMENT	FHC Avoly, Avoly P.O	686670	\N	\N	2026-02-27 02:48:32.280325
KL_PHC_EKM_0046	HOSPITAL	Primary Health Centre Ayavana	ayavana	Kerala	Ernakulam	0485-2282044	\N	phcayavana@gmail.com	PHC	GOVERNMENT	PHC Ayavana, Ayavana P.O	686673	\N	\N	2026-02-27 02:48:32.280697
KL_PHC_EKM_0047	HOSPITAL	Family Health Centre Marady	marady	Kerala	Ernakulam	0485-2963805	\N	phcmarady@gmail.com	PHC	GOVERNMENT	FHC Marady, South Marady P.O, Mannathoor Road	686673	\N	\N	2026-02-27 02:48:32.281074
KL_PHC_EKM_0048	HOSPITAL	Family Health Centre Kunnukara	kunnukara	Kerala	Ernakulam	0484-2573087	\N	phckunnukara@gmail.com	PHC	GOVERNMENT	FHC Kunnukara, Kunnukara P.O	683578	\N	\N	2026-02-27 02:48:32.281448
KL_PHC_EKM_0049	HOSPITAL	Primary Health Centre Nedumbassery	nedumbassery	Kerala	Ernakulam	0484-2476678	\N	phcnedumbassery@gmail.com	PHC	GOVERNMENT	PHC Nedumbassery, Karakkattukunnu	683589	\N	\N	2026-02-27 02:48:32.281846
KL_PHC_EKM_0050	HOSPITAL	Family Health Centre Parakkadavu	parakkadavu	Kerala	Ernakulam	0484-2926780	\N	phcparakkadavu@gmail.com	PHC	GOVERNMENT	FHC Parakkadavu, Kodussery, Vattaparambu P.O	683579	\N	\N	2026-02-27 02:48:32.282219
KL_PHC_EKM_0051	HOSPITAL	Primary Health Centre Pattimattom	pattimattom	Kerala	Ernakulam	0484-2716010	\N	phcpattimattom@gmail.com	PHC	GOVERNMENT	PHC Pattimattom, Pattimattom P.O	683562	\N	\N	2026-02-27 02:48:32.28261
KL_PHC_EKM_0052	HOSPITAL	Primary Health Centre Poothrikka	poothrikka	Kerala	Ernakulam	0484-2766118	\N	phcpoothrikka@gmail.com	PHC	GOVERNMENT	PHC Poothrikka, Poothrikka P.O	682308	\N	\N	2026-02-27 02:48:32.282982
KL_PHC_EKM_0053	HOSPITAL	Family Health Centre Maneed	maneed	Kerala	Ernakulam	9447659058	\N	phcmaneed@gmail.com	PHC	GOVERNMENT	FHC Maneed, Maneed P.O	686664	\N	\N	2026-02-27 02:48:32.283357
KL_PHC_EKM_0054	HOSPITAL	Family Health Centre Malayattoor	malayattoor	Kerala	Ernakulam	9447134638	\N	malayatturphc@gmail.com	PHC	GOVERNMENT	FHC Malayattoor, Malayattoor P.O	683587	\N	\N	2026-02-27 02:48:32.283726
KL_PHC_EKM_0055	HOSPITAL	Primary Health Centre Kanjoor	kanjoor	Kerala	Ernakulam	0484-2466110	\N	phckanjoor@gmail.com	PHC	GOVERNMENT	PHC Kanjoor, Kanjoor P.O	683575	\N	\N	2026-02-27 02:48:32.284102
KL_PHC_EKM_0056	HOSPITAL	Family Health Centre Okkal	okkal	Kerala	Ernakulam	0484-2649148	\N	mophcokkal@gmail.com	PHC	GOVERNMENT	FHC Okkal, Edavoor, Edavoor P.O	683544	\N	\N	2026-02-27 02:48:32.284473
KL_PHC_EKM_0057	HOSPITAL	Family Health Centre Chellanam	chellanam	Kerala	Ernakulam	0484-2245001	\N	phcchellanam@gmail.com	PHC	GOVERNMENT	FHC Chellanam, Near Malikaparambu Bus Stop, Chellanam P.O	682008	\N	\N	2026-02-27 02:48:32.284873
KL_PHC_EKM_0058	HOSPITAL	Family Health Centre Cheranalloor	cheranalloor	Kerala	Ernakulam	0484-2961605	\N	cheranalloorbphc@gmail.com	PHC	GOVERNMENT	FHC Cheranalloor	682034	\N	\N	2026-02-27 02:48:32.28525
KL_PHC_EKM_0059	HOSPITAL	Family Health Centre Chowara	chowara	Kerala	Ernakulam	0484-2600025	\N	phcchowara@gmail.com	PHC	GOVERNMENT	FHC Chowara, Chowara, Sreemoolanagaram P.O	683580	\N	\N	2026-02-27 02:48:32.285643
KL_PHC_EKM_0060	HOSPITAL	Family Health Centre Eroor	eroor	Kerala	Ernakulam	0484-2781637	\N	mophceroor@gmail.com	PHC	GOVERNMENT	FHC Eroor, Labour Junction, Eroor P.O, Thrippunithura	682306	\N	\N	2026-02-27 02:48:32.286048
KL_PHC_EKM_0061	HOSPITAL	Family Health Centre Gothuruth	gothuruth	Kerala	Ernakulam	0484-2484059	\N	moicphcgoth@gmail.com	PHC	GOVERNMENT	FHC Gothuruth, Gothuruth P.O	683516	\N	\N	2026-02-27 02:48:32.286419
KL_PHC_EKM_0062	HOSPITAL	Family Health Centre Kakkanad	kakkanad	Kerala	Ernakulam	0484-2428487	\N	phckakkanad@gmail.com	PHC	GOVERNMENT	Kusumagiri P.O, Kakkanad	682030	\N	\N	2026-02-27 02:48:32.28679
KL_PHC_EKM_0063	HOSPITAL	Family Health Centre Karumalloor	karumalloor	Kerala	Ernakulam	9539775290	\N	phckarumalloor@gmail.com	PHC	GOVERNMENT	FHC Karumalloor, Karumalloor P.O	683511	\N	\N	2026-02-27 02:48:32.287163
KL_PHC_EKM_0064	HOSPITAL	Family Health Centre Kodanad	kodanad	Kerala	Ernakulam	9020411789	\N	phckodanad@gmail.com	PHC	GOVERNMENT	FHC Kodanad, Kodanad P.O	683544	\N	\N	2026-02-27 02:48:32.287533
KL_PHC_EKM_0065	HOSPITAL	Family Health Centre Kuttampuzha	kuttampuzha	Kerala	Ernakulam	9747940640	\N	phckuttampuzha@gmail.com	PHC	GOVERNMENT	FHC Kuttampuzha, Kuttampuzha P.O	686681	\N	\N	2026-02-27 02:48:32.28791
KL_PHC_EKM_0066	HOSPITAL	Family Health Centre Manjapra	manjapra	Kerala	Ernakulam	9447578367	\N	phcmanjapra@gmail.com	PHC	GOVERNMENT	FHC Manjapra, Manjapra P.O	683581	\N	\N	2026-02-27 02:48:32.288283
KL_PHC_EKM_0067	HOSPITAL	Family Health Centre Mazhuvannoor	mazhuvannoor	Kerala	Ernakulam	0484-2769653	\N	mazhuvannoorphc@gmail.com	PHC	GOVERNMENT	FHC Mazhuvannoor, Near Mazhuvannoor Panchayath Office, South Airapuram P.O	683541	\N	\N	2026-02-27 02:48:32.288652
KL_PHC_EKM_0068	HOSPITAL	Family Health Centre Nayarambalam	nayarambalam	Kerala	Ernakulam	9895052189	\N	phcnayarambalam@gmail.com	PHC	GOVERNMENT	FHC Nayarambalam, Nayarambalam P.O	682509	\N	\N	2026-02-27 02:48:32.289023
KL_PHC_EKM_0069	HOSPITAL	Family Health Centre Paipra	paipra	Kerala	Ernakulam	9847080707	\N	phcpaipra@gmail.com	PHC	GOVERNMENT	FHC Paipra, Thrikkalathur P.O, Muvattupuzha	683541	\N	\N	2026-02-27 02:48:32.289409
KL_PHC_EKM_0070	HOSPITAL	Family Health Centre Thirumarady	thirumarady	Kerala	Ernakulam	0485-2877300	\N	thirumaradyphcmedicalofficer@gmail.com	PHC	GOVERNMENT	FHC Thirumarady, Thirumarady P.O	686662	\N	\N	2026-02-27 02:48:32.289805
KL_PHC_EKM_0071	HOSPITAL	Family Health Centre Vazhakulam	vazhakulam	Kerala	Ernakulam	9605454529	\N	phcvazhakulam@gmail.com	PHC	GOVERNMENT	FHC Vazhakulam, AM Road, Marampilly	683105	\N	\N	2026-02-27 02:48:32.290176
KL_PHC_TSR_0001	HOSPITAL	Family Health Centre Arimpur	arimpur	Kerala	Thrissur	0487-2313634	\N	phcarimbur@gmail.com	PHC	GOVERNMENT	Family Health Centre Arimpur, Arimpur P.O	680620	\N	\N	2026-02-27 02:48:32.290547
KL_PHC_TSR_0002	HOSPITAL	Family Health Centre Varavoor	varavoor	Kerala	Thrissur	04884-280708	\N	phcvaravoor@gmail.com	PHC	GOVERNMENT	FHC Varavoor, Varavoor P.O	680585	\N	\N	2026-02-27 02:48:32.290894
KL_PHC_TSR_0003	HOSPITAL	Family Health Centre Ramavarmapuram	ramavarmapuram	Kerala	Thrissur	0487-2331030	\N	gdrasmavarmapuram@gmail.com	PHC	GOVERNMENT	FHC Ramavarmapuram, Viyyur, Near Power House	680009	\N	\N	2026-02-27 02:48:32.291484
KL_PHC_TSR_0004	HOSPITAL	Family Health Centre Porathissery	porathissery	Kerala	Thrissur	0480-2823936	\N	phcporathissery@gmail.com	PHC	GOVERNMENT	PHC Porathissery, Porathissery P.O	680125	\N	\N	2026-02-27 02:48:32.291892
KL_PHC_TSR_0005	HOSPITAL	Primary Health Centre Choondal	choondal	Kerala	Thrissur	\N	\N	choondalphc@gmail.com	PHC	GOVERNMENT	PHC Choondal, Chiranellur	680501	\N	\N	2026-02-27 02:48:32.292268
KL_PHC_TSR_0006	HOSPITAL	Primary Health Centre Kandanassery	kandanassery	Kerala	Thrissur	04885-230435	\N	kandanasseryphc@gmail.com	PHC	GOVERNMENT	PHC Kandanassery, Post Mattom	680602	\N	\N	2026-02-27 02:48:32.292642
KL_PHC_TSR_0007	HOSPITAL	Primary Health Centre Mathilakam	mathilakam	Kerala	Thrissur	0480-2641250	\N	phcmathilakam@gmail.com	PHC	GOVERNMENT	Primary Health Centre Mathilakam P.O	680685	\N	\N	2026-02-27 02:48:32.292996
KL_PHC_TSR_0008	HOSPITAL	Primary Health Centre Ollukkara	ollukkara	Kerala	Thrissur	0487-2372010	\N	phcollukkara@gmail.com	PHC	GOVERNMENT	Krishnapuram, Ollukkara	680655	\N	\N	2026-02-27 02:48:32.293341
KL_PHC_TSR_0009	HOSPITAL	Primary Health Centre Avanoor	avanoor	Kerala	Thrissur	0487-2206799	\N	phcavanoor@gmail.com	PHC	GOVERNMENT	Primary Health Centre Avanoor, Medical College P.O	680596	\N	\N	2026-02-27 02:48:32.293683
KL_PHC_TSR_0010	HOSPITAL	Primary Health Centre Koorkanchery	koorkanchery	Kerala	Thrissur	0487-2448256	\N	phckoorkanchery@gmail.com	PHC	GOVERNMENT	Primary Health Centre Koorkanchery, Nedupuzha P.O	680007	\N	\N	2026-02-27 02:48:32.294021
KL_PHC_TSR_0011	HOSPITAL	Primary Health Centre Avinisserry	avinisserry	Kerala	Thrissur	0487-2346898	\N	phcavinisery@gmail.com	PHC	GOVERNMENT	Primary Health Centre Avinisserry, Palissery P.O	680027	\N	\N	2026-02-27 02:48:32.294363
KL_PHC_TSR_0012	HOSPITAL	Primary Health Centre Mundathikodu	mundathikodu	Kerala	Thrissur	8301075047	\N	mundathikodephc@gmail.com	PHC	GOVERNMENT	Primary Health Centre Mundathikodu, Puthuruthy P.O	680623	\N	\N	2026-02-27 02:48:32.294703
KL_PHC_TSR_0013	HOSPITAL	Primary Health Centre Pavaratty	pavaratty	Kerala	Thrissur	0487-2642684	\N	phcpavaratty.hlth@kerala.gov.in	PHC	GOVERNMENT	Primary Health Centre Pavaratty, Maruthayur P.O	680507	\N	\N	2026-02-27 02:48:32.295195
KL_PHC_TSR_0014	HOSPITAL	Family Health Centre Mupliyam	mupliyam	Kerala	Thrissur	0480-2781846	\N	phcmupliyam@gmail.com	PHC	GOVERNMENT	Family Health Centre Mupliyam, Mupliyam P.O	680312	\N	\N	2026-02-27 02:48:32.29556
KL_PHC_TSR_0015	HOSPITAL	Primary Health Centre Alagappanagar	alagappanagar	Kerala	Thrissur	0480-2755124	\N	phcalagappanagar@gmail.com	PHC	GOVERNMENT	Primary Health Centre Alagappanagar, Vattanathra P.O	680302	\N	\N	2026-02-27 02:48:32.295904
KL_PHC_TSR_0016	HOSPITAL	Family Health Centre Aloor	aloor	Kerala	Thrissur	0480-2960483	\N	\N	PHC	GOVERNMENT	Family Health Centre Aloor, Aloor P.O	680683	\N	\N	2026-02-27 02:48:32.296254
KL_PHC_TSR_0017	HOSPITAL	Family Health Centre Mambra	mambra	Kerala	Thrissur	0480-2963169	\N	phcmambra@gmail.com	PHC	GOVERNMENT	Family Health Centre Mambra, Mambra P.O	680308	\N	\N	2026-02-27 02:48:32.296588
KL_PHC_TSR_0018	HOSPITAL	Family Health Centre Vellangallur	vellangallur	Kerala	Thrissur	0480-2718465	\N	phcvellangallur@gmail.com	PHC	GOVERNMENT	FHC Vellangallur P.O	680662	\N	\N	2026-02-27 02:48:32.296926
KL_PHC_TSR_0019	HOSPITAL	Family Health Centre Kakkad	kakkad	Kerala	Thrissur	0480-2718465	\N	phckakkad@gmail.com	PHC	GOVERNMENT	FHC Kakkad, Kadukutty P.O, Kathikudam	680308	\N	\N	2026-02-27 02:48:32.297284
KL_PHC_TSR_0020	HOSPITAL	Family Health Centre Kodakara	kodakara	Kerala	Thrissur	0480-2721551	\N	phckodakara@gmail.com	PHC	GOVERNMENT	FHC Kodakara, Kodakara P.O	680684	\N	\N	2026-02-27 02:48:32.297619
KL_PHC_TSR_0021	HOSPITAL	Family Health Centre Pamboor	pamboor	Kerala	Thrissur	0487-2387133	\N	bphcpamboor@gmail.com	PHC	GOVERNMENT	FHC Pamboor, Valiyaparambu, Kuttur P.O	680013	\N	\N	2026-02-27 02:48:32.297957
KL_PHC_TSR_0022	HOSPITAL	Family Health Centre Kondazhy	kondazhy	Kerala	Thrissur	04884-286753	\N	phckondazhy@gmail.com	PHC	GOVERNMENT	Kondazhy P.O	679106	\N	\N	2026-02-27 02:48:32.29832
KL_PHC_TSR_0023	HOSPITAL	Family Health Centre Panjal	panjal	Kerala	Thrissur	04884-250606	\N	phcpanjal@gmail.com	PHC	GOVERNMENT	Family Health Centre Panjal, Killimangalam P.O	680591	\N	\N	2026-02-27 02:48:32.298658
KL_PHC_TSR_0024	HOSPITAL	Family Health Centre Pattikkad	pattikkad	Kerala	Thrissur	0487-2282127	\N	phcpattikkad@gmail.com	PHC	GOVERNMENT	FHC Pattikkad, Pattikkad P.O	680652	\N	\N	2026-02-27 02:48:32.299026
KL_PHC_TSR_0025	HOSPITAL	Family Health Centre Nadathara	nadathara	Kerala	Thrissur	0487-2316522	\N	nadatharaphc@gmail.com	PHC	GOVERNMENT	P.O Kozhukully, Thrissur	680751	\N	\N	2026-02-27 02:48:32.299465
KL_PHC_TSR_0026	HOSPITAL	Family Health Centre Vaniyampara	vaniyampara	Kerala	Thrissur	0487-2687700	\N	phcvpara@gmail.com	PHC	GOVERNMENT	NH 544, Near Punjab National Bank, Vaniyampara	680652	\N	\N	2026-02-27 02:48:32.299904
KL_PHC_TSR_0430	HOSPITAL	FHC Madakkathara	fhc madakkathara	Kerala	Thrissur	0487-2693930	\N	mophcm@gmail.com	PHC	GOVERNMENT	Kundukadu Post, Karuvankad	680028	\N	\N	2026-02-27 02:48:32.300309
KL_PHC_TSR_0431	HOSPITAL	FHC Ayyanthole	fhc ayyanthole	Kerala	Thrissur	0487-2360306	\N	phcayyanthole@gmail.com	PHC	GOVERNMENT	Pullazhi P.O	680012	\N	\N	2026-02-27 02:48:32.300658
KL_PHC_TSR_0432	HOSPITAL	FHC Engandiyur	fhc engandiyur	Kerala	Thrissur	0487-2292216	\N	phcengandiyur@gmail.com	PHC	GOVERNMENT	Kundaliyur P.O	680616	\N	\N	2026-02-27 02:48:32.301042
KL_PHC_TSR_0433	HOSPITAL	FHC Orumanayoor	fhc orumanayoor	Kerala	Thrissur	0487-2503024	\N	phcorumanayur@gmail.com	PHC	GOVERNMENT	Orumanayoor P.O	680512	\N	\N	2026-02-27 02:48:32.301556
KL_PHC_TSR_0434	HOSPITAL	FHC Pookode	fhc pookode	Kerala	Thrissur	0487-2554200	\N	phcpkd@gmail.com	PHC	GOVERNMENT	Thamarayoor P.O	680505	\N	\N	2026-02-27 02:48:32.302013
KL_PHC_TSR_0435	HOSPITAL	FHC Andathodu	fhc andathodu	Kerala	Thrissur	0487-2542363	\N	phcandathode@gmail.com	PHC	GOVERNMENT	Andathodu P.O	679564	\N	\N	2026-02-27 02:48:32.302398
KL_PHC_TSR_0436	HOSPITAL	FHC Parappukkara	fhc parappukkara	Kerala	Thrissur	0480-2963996	\N	phcparappukkara@gmail.com	PHC	GOVERNMENT	Panthallur, Nellayi P.O	680305	\N	\N	2026-02-27 02:48:32.302769
KL_PHC_TSR_0437	HOSPITAL	FHC Vallachira	fhc vallachira	Kerala	Thrissur	0487-2342114	\N	moincharge@gmail.com	PHC	GOVERNMENT	Vallachira P.O	680562	\N	\N	2026-02-27 02:48:32.303169
KL_PHC_TSR_0438	HOSPITAL	FHC Kuzhur	fhc kuzhur	Kerala	Thrissur	\N	\N	phckuzhur@yahoo.in	PHC	GOVERNMENT	Irinikulam P.O	680734	\N	\N	2026-02-27 02:48:32.303539
KL_PHC_TSR_0439	HOSPITAL	FHC Methala	fhc methala	Kerala	Thrissur	\N	\N	phcmethala@gmail.com	PHC	GOVERNMENT	Methala P.O	680669	\N	\N	2026-02-27 02:48:32.30415
KL_PHC_TSR_0440	HOSPITAL	FHC Chowannur	fhc chowannur	Kerala	Thrissur	04885-223288	\N	chowannurphc@gmail.com	PHC	GOVERNMENT	Chowannur P.O	680519	\N	\N	2026-02-27 02:48:32.304536
KL_PHC_TSR_0441	HOSPITAL	FHC Perumbilavu	fhc perumbilavu	Kerala	Thrissur	04885-284009	\N	phcperumpilavu@gmail.com	PHC	GOVERNMENT	Thippilassery P.O	680519	\N	\N	2026-02-27 02:48:32.304913
KL_PHC_TSR_0442	HOSPITAL	FHC Arthat	fhc arthat	Kerala	Thrissur	04885-296349	\N	phcarthat@gmail.com	PHC	GOVERNMENT	Chittanjoor P.O	680523	\N	\N	2026-02-27 02:48:32.305286
KL_PHC_TSR_0443	HOSPITAL	FHC Porkulam	fhc porkulam	Kerala	Thrissur	04885-223561	\N	phcporkulamporkulam@gmail.com	PHC	GOVERNMENT	Porkulam P.O	680542	\N	\N	2026-02-27 02:48:32.305682
KL_PHC_TSR_0444	HOSPITAL	FHC Kadangode	fhc kadangode	Kerala	Thrissur	04885-299440	\N	phckadangode@gmail.com	PHC	GOVERNMENT	Vellarakkad P.O	680584	\N	\N	2026-02-27 02:48:32.306052
KL_PHC_TSR_0445	HOSPITAL	FHC Thaikkad	fhc thaikkad	Kerala	Thrissur	0487-2557526	\N	phcthaikkad@gmail.com	PHC	GOVERNMENT	Brahmakulam P.O	680104	\N	\N	2026-02-27 02:48:32.306421
KL_PHC_TSR_0446	HOSPITAL	FHC Kaipamangalam	fhc kaipamangalam	Kerala	Thrissur	0480-2845566	\N	kaipamangalamphc@gmail.com	PHC	GOVERNMENT	Koorikuzhy P.O	680681	\N	\N	2026-02-27 02:48:32.306799
KL_PHC_TSR_0447	HOSPITAL	FHC Chamakala	fhc chamakala	Kerala	Thrissur	0480-2835672	\N	phcchamakala@gmail.com	PHC	GOVERNMENT	Chamakala P.O	680687	\N	\N	2026-02-27 02:48:32.307175
KL_PHC_TSR_0448	HOSPITAL	PHC Padinjare Vemballoor	phc padinjare vemballoor	Kerala	Thrissur	0480-2854118	\N	phcp.vemballor@gmail.com	PHC	GOVERNMENT	P. Vemballur P.O	680671	\N	\N	2026-02-27 02:48:32.307545
KL_PHC_TSR_0449	HOSPITAL	FHC Edavilangu	fhc edavilangu	Kerala	Thrissur	0480-2815506	\N	phcedavilange@gmail.com	PHC	GOVERNMENT	Edavilangu P.O	680671	\N	\N	2026-02-27 02:48:32.308077
KL_PHC_TSR_0450	HOSPITAL	FHC Nalukettu	fhc nalukettu	Kerala	Thrissur	0480-2730136	\N	phcnalukettu@gmail.com	PHC	GOVERNMENT	Nalukettu P.O	680308	\N	\N	2026-02-27 02:48:32.308454
KL_PHC_TSR_0451	HOSPITAL	FHC Meloor	fhc meloor	Kerala	Thrissur	0480-2739735	\N	phcmeloor@gmail.com	PHC	GOVERNMENT	Kunnappilly P.O, Meloor	680311	\N	\N	2026-02-27 02:48:32.308831
KL_PHC_TSR_0452	HOSPITAL	FHC Vettilappara	fhc vettilappara	Kerala	Thrissur	0480-2769181	\N	phcvettilapara@gmail.com	PHC	GOVERNMENT	Near Ex-Serviceman Colony, Vettilappara P.O	680721	\N	\N	2026-02-27 02:48:32.309226
KL_PHC_TSR_0453	HOSPITAL	FHC Poomala	fhc poomala	Kerala	Thrissur	0487-2203288	\N	poomalaphc@gmail.com	PHC	GOVERNMENT	Parambai, Poomala	680581	\N	\N	2026-02-27 02:48:32.309594
KL_PHC_TSR_0454	HOSPITAL	FHC Adat	fhc adat	Kerala	Thrissur	\N	\N	phcadat@gmail.com	PHC	GOVERNMENT	Puranattukara P.O	680551	\N	\N	2026-02-27 02:48:32.309963
KL_PHC_TSR_0455	HOSPITAL	FHC Nattika	fhc nattika	Kerala	Thrissur	0487-2393153	\N	nattikaphc@gmail.com	PHC	GOVERNMENT	Nattika Beach Road	680566	\N	\N	2026-02-27 02:48:32.310338
KL_PHC_TSR_0456	HOSPITAL	FHC Mullurkkara	fhc mullurkkara	Kerala	Thrissur	04884-271918	\N	phcmullurkara@gmail.com	PHC	GOVERNMENT	Mullurkkara P.O	680583	\N	\N	2026-02-27 02:48:32.310706
KL_PHC_TSR_0457	HOSPITAL	FHC Kuthampully	fhc kuthampully	Kerala	Thrissur	04884-296745	\N	phckuthampully@gmail.com	PHC	GOVERNMENT	Kaniyarkode Post, Thiruvilwamala	680594	\N	\N	2026-02-27 02:48:32.311083
KL_PHC_TSR_0458	HOSPITAL	FHC Thonoorkara	fhc thonoorkara	Kerala	Thrissur	04884-250828	\N	phcthonoorkara@gmail.com	PHC	GOVERNMENT	Thonoorkara P.O	680586	\N	\N	2026-02-27 02:48:32.311457
KL_PHC_TSR_0459	HOSPITAL	PHC Vallathol Nagar	phc vallathol nagar	Kerala	Thrissur	04884-264264	\N	phcvnagar@gmail.com	PHC	GOVERNMENT	Cheruthuruthy P.O	679531	\N	\N	2026-02-27 02:48:32.311827
KL_PHC_TSR_0460	HOSPITAL	FHC Elavally	fhc elavally	Kerala	Thrissur	0487-2645117	\N	phcelavally@gmail.com	PHC	GOVERNMENT	Elavally South P.O	680511	\N	\N	2026-02-27 02:48:32.312193
KL_PHC_TSR_0461	HOSPITAL	FHC Thrikkur	fhc thrikkur	Kerala	Thrissur	0487-2351560	\N	phcthrikkur@gmail.com	PHC	GOVERNMENT	Thrikkur P.O	680306	\N	\N	2026-02-27 02:48:32.312558
KL_PHC_TSR_0462	HOSPITAL	FHC Varandarappilly	fhc varandarappilly	Kerala	Thrissur	0480-2762464	\N	phcvaranthrappilly@gmail.com	PHC	GOVERNMENT	Velupadam P.O	680303	\N	\N	2026-02-27 02:48:32.312953
KL_PHC_TSR_0463	HOSPITAL	FHC Padiyur	fhc padiyur	Kerala	Thrissur	0480-2642608	\N	phcpadiyoor@gmail.com	PHC	GOVERNMENT	Padiyur P.O	680688	\N	\N	2026-02-27 02:48:32.313329
KL_PHC_TSR_0464	HOSPITAL	FHC Velookkara	fhc velookkara	Kerala	Thrissur	0480-2867488	\N	phcvelookkara@gmail.com	PHC	GOVERNMENT	Velookkara P.O	680662	\N	\N	2026-02-27 02:48:32.313702
KL_PHC_TSR_0465	HOSPITAL	FHC Desamangalam	fhc desamangalam	Kerala	Thrissur	04884-280346	\N	fhcdesamangalam@gmail.com	PHC	GOVERNMENT	Desamangalam P.O	679123	\N	\N	2026-02-27 02:48:32.314069
KL_PHC_TSR_0466	HOSPITAL	FHC Punnayur	fhc punnayur	Kerala	Thrissur	0487-2616542	\N	\N	PHC	GOVERNMENT	Edakkazhiyur P.O	680515	\N	\N	2026-02-27 02:48:32.314465
KL_PHC_TSR_0467	HOSPITAL	FHC Karalam	fhc karalam	Kerala	Thrissur	0480-2887810	\N	karalamphc@gmail.com	PHC	GOVERNMENT	Karalam P.O	680711	\N	\N	2026-02-27 02:48:32.314839
KL_PHC_TSR_0468	HOSPITAL	FHC Poyya	fhc poyya	Kerala	Thrissur	0480-2893131	\N	poyyaphc@gmail.com	PHC	GOVERNMENT	Poyya P.O	683594	\N	\N	2026-02-27 02:48:32.315207
KL_PHC_TSR_0469	HOSPITAL	FHC Koolimuttom	fhc koolimuttom	Kerala	Thrissur	0480-2642724	\N	phckoolimuttam@gmail.com	PHC	GOVERNMENT	Koolimuttom P.O	680691	\N	\N	2026-02-27 02:48:32.315578
KL_PHC_TSR_0470	HOSPITAL	FHC Pariyaram	fhc pariyaram	Kerala	Thrissur	0480-2748329	\N	phcpariyaram@gmail.com	PHC	GOVERNMENT	Kuttikkad P.O	680724	\N	\N	2026-02-27 02:48:32.315944
KL_PHC_TSR_0471	HOSPITAL	FHC Puthur	fhc puthur	Kerala	Thrissur	0487-2688865	\N	phcputhur@gmail.com	PHC	GOVERNMENT	Vettukad P.O	680014	\N	\N	2026-02-27 02:48:32.316313
KL_PHC_TSR_0472	HOSPITAL	FHC Vilvattom	fhc vilvattom	Kerala	Thrissur	0487-2694535	\N	bphcvilvattom@gmail.com	PHC	GOVERNMENT	Vilvattom	680631	\N	\N	2026-02-27 02:48:32.316726
KL_PHC_TSR_0473	HOSPITAL	FHC Mundoor	fhc mundoor	Kerala	Thrissur	0487-2214522	\N	mundurphc@gmail.com	PHC	GOVERNMENT	Mundur P.O	680541	\N	\N	2026-02-27 02:48:32.317235
KL_PHC_TSR_0474	HOSPITAL	FHC Paralam	fhc paralam	Kerala	Thrissur	0487-2277960	\N	phcparalam@gmail.com	PHC	GOVERNMENT	Ammadam P.O	680563	\N	\N	2026-02-27 02:48:32.317627
KL_PHC_TSR_0475	HOSPITAL	FHC Velur	fhc velur	Kerala	Thrissur	04885-288885	\N	phcvelur@gmail.com	PHC	GOVERNMENT	Velur Bazar P.O	680501	\N	\N	2026-02-27 02:48:32.317995
KL_PHC_TSR_0476	HOSPITAL	FHC Thekkumkara	fhc thekkumkara	Kerala	Thrissur	04884-267594	\N	phcthekkumkara@gmail.com	PHC	GOVERNMENT	Manalithara P.O, Veerolippadam	680589	\N	\N	2026-02-27 02:48:32.318363
KL_PHC_TSR_0477	HOSPITAL	FHC Elanadu	fhc elanadu	Kerala	Thrissur	04884-288574	\N	phcelanad2009@gmail.com	PHC	GOVERNMENT	Elanad P.O	680586	\N	\N	2026-02-27 02:48:32.318911
KL_PHC_TSR_0478	HOSPITAL	FHC Manalur	fhc manalur	Kerala	Thrissur	0487-2626001	\N	fhcmanalur@gmail.com	PHC	GOVERNMENT	Karamukku, Kandassamkadavu P.O	680613	\N	\N	2026-02-27 02:48:32.31929
KL_PHC_TSR_0479	HOSPITAL	FHC Thalikulam	fhc thalikulam	Kerala	Thrissur	0487-2604510	\N	thalikulamphc@gmail.com	PHC	GOVERNMENT	Thalikulam P.O	680569	\N	\N	2026-02-27 02:48:32.319666
KL_PHC_TSR_0480	HOSPITAL	FHC Venkitengu	fhc venkitengu	Kerala	Thrissur	0487-2262345	\N	phc.vkg@gmail.com	PHC	GOVERNMENT	Padoor P.O	680524	\N	\N	2026-02-27 02:48:32.320036
KL_PHC_TSR_0481	HOSPITAL	FWC Nenmanikkara	fwc nenmanikkara	Kerala	Thrissur	0480-2752048	\N	phcnenmanikkara@gmail.com	PHC	GOVERNMENT	Chittissery P.O	680301	\N	\N	2026-02-27 02:48:32.32041
KL_PHC_TSR_0482	HOSPITAL	FHC Poomangalam	fhc poomangalam	Kerala	Thrissur	0480-2962996	\N	phphcpoomangalam@gmail.com	PHC	GOVERNMENT	Aripalam P.O	680688	\N	\N	2026-02-27 02:48:32.320783
KL_PHC_PLKD_0483	HOSPITAL	PHC Melamuri	phc melamuri	Kerala	Palakkad	0491-2541880	\N	phcmelamuri@gmail.com	PHC	GOVERNMENT	Vadakkanthara P.O	678012	\N	\N	2026-02-27 02:48:32.321121
KL_PHC_PLKD_0484	HOSPITAL	PHC Thachampara	phc thachampara	Kerala	Palakkad	\N	\N	phcthachampara@gmail.com	PHC	GOVERNMENT	Palakkayam P.O, Mannarkkad	678591	\N	\N	2026-02-27 02:48:32.321462
KL_PHC_PLKD_0485	HOSPITAL	FHC Thachanattukara	fhc thachanattukara	Kerala	Palakkad	04924-237522	\N	phctkra@yahoo.in	PHC	GOVERNMENT	Nattukal P.O	678583	\N	\N	2026-02-27 02:48:32.321803
KL_PHC_PLKD_0486	HOSPITAL	PHC Lakkidi	phc lakkidi	Kerala	Palakkad	0466-2965958	\N	phclakkidi@gmail.com	PHC	GOVERNMENT	Mangalam P.O	679301	\N	\N	2026-02-27 02:48:32.322137
KL_PHC_PLKD_0487	HOSPITAL	PHC Ananganadi	phc ananganadi	Kerala	Palakkad	0466-2242400	\N	phcananganadi@gmail.com	PHC	GOVERNMENT	Pathamkulam P.O	679522	\N	\N	2026-02-27 02:48:32.322471
KL_PHC_PLKD_0488	HOSPITAL	PHC Nagalassery	phc nagalassery	Kerala	Palakkad	0466-2960687	\N	phcnagalassery@gmail.com	PHC	GOVERNMENT	Peringode P.O	679535	\N	\N	2026-02-27 02:48:32.322809
KL_PHC_PLKD_0489	HOSPITAL	PHC Thirumittacode	phc thirumittacode	Kerala	Palakkad	0466-2259794	\N	phcthirumittacode@gmail.com	PHC	GOVERNMENT	Chazhayittiri	679535	\N	\N	2026-02-27 02:48:32.323143
KL_PHC_PLKD_0490	HOSPITAL	PHC Kottappuram	phc kottappuram	Kerala	Palakkad	\N	\N	mophckottappuram@gmail.com	PHC	GOVERNMENT	Kottappuram P.O	679513	\N	\N	2026-02-27 02:48:32.323488
KL_PHC_PLKD_0491	HOSPITAL	PHC Kodumbu	phc kodumbu	Kerala	Palakkad	0491-2570630	\N	phckodumbu@gmail.com	PHC	GOVERNMENT	Kallingal, Kodumbu	678552	\N	\N	2026-02-27 02:48:32.323842
KL_PHC_PLKD_0492	HOSPITAL	PHC Pudunagaram	phc pudunagaram	Kerala	Palakkad	0492-3296930	\N	pudunagaramphc@gmail.com	PHC	GOVERNMENT	Pudunagaram	678503	\N	\N	2026-02-27 02:48:32.324174
KL_PHC_PLKD_0493	HOSPITAL	PHC Parambikulam	phc parambikulam	Kerala	Palakkad	9496547266	\N	phcparambikulam@gmail.com	PHC	GOVERNMENT	Parambikulam P.O	678661	\N	\N	2026-02-27 02:48:32.32451
KL_PHC_PLKD_0494	HOSPITAL	PHC Polpully	phc polpully	Kerala	Palakkad	0491-2971341	\N	phcpolpully@gmail.com	PHC	GOVERNMENT	Vettamkulam, Polpully	678552	\N	\N	2026-02-27 02:48:32.324849
KL_PHC_PLKD_0495	HOSPITAL	PHC Kulukkallur	phc kulukkallur	Kerala	Palakkad	0466-2216956	\N	mophckulukkallur@gmail.com	PHC	GOVERNMENT	Thathanampully P.O	679337	\N	\N	2026-02-27 02:48:32.325182
KL_PHC_PLKD_0496	HOSPITAL	PHC Thiruvegappura	phc thiruvegappura	Kerala	Palakkad	\N	\N	phcthiruvegappura@gmail.com	PHC	GOVERNMENT	Kaippuram P.O	679308	\N	\N	2026-02-27 02:48:32.325519
KL_PHC_PLKD_0497	HOSPITAL	PHC Vilayur	phc vilayur	Kerala	Palakkad	0466-2315062	\N	vilayurphc@gmail.com	PHC	GOVERNMENT	Vilayur West P.O	679309	\N	\N	2026-02-27 02:48:32.325851
KL_PHC_PLKD_0498	HOSPITAL	PHC Pirayiri	phc pirayiri	Kerala	Palakkad	0491-2509016	\N	phcpirayiri@gmail.com	PHC	GOVERNMENT	Kodunthirapully	678004	\N	\N	2026-02-27 02:48:32.326185
KL_PHC_PLKD_0499	HOSPITAL	PHC Melarcode	phc melarcode	Kerala	Palakkad	04922-244077	\N	melarcode.phc@gmail.com	PHC	GOVERNMENT	Melarcode P.O	678703	\N	\N	2026-02-27 02:48:32.326526
KL_PHC_PLKD_0500	HOSPITAL	PHC Nelliyampathy	phc nelliyampathy	Kerala	Palakkad	04923-246456	\N	nelliyampathyphc@gmail.com	PHC	GOVERNMENT	Kaikatty, Nelliyampathy P.O	678508	\N	\N	2026-02-27 02:48:32.326856
KL_PHC_PLKD_0501	HOSPITAL	FHC Sholayur	fhc sholayur	Kerala	Palakkad	04924-254034	\N	fhcsholayur@gmail.com	PHC	GOVERNMENT	Sholayur P.O, Agali Via	678581	\N	\N	2026-02-27 02:48:32.327221
KL_PHC_PLKD_0502	HOSPITAL	FHC Elambulassery	fhc elambulassery	Kerala	Palakkad	\N	\N	phcelambulassery@gmail.com	PHC	GOVERNMENT	Elambulassery P.O	678595	\N	\N	2026-02-27 02:48:32.327552
KL_PHC_PLKD_0503	HOSPITAL	FHC Keralassery	fhc keralassery	Kerala	Palakkad	0491-2841070	\N	phckeralasserypkd@gmail.com	PHC	GOVERNMENT	Keralassery P.O	678641	\N	\N	2026-02-27 02:48:32.327888
KL_PHC_PLKD_0504	HOSPITAL	FHC Pallippuram	fhc pallippuram	Kerala	Palakkad	0466-2969756	\N	phcpallippuram@gmail.com	PHC	GOVERNMENT	Pallippuram P.O	679305	\N	\N	2026-02-27 02:48:32.328379
KL_PHC_PLKD_0505	HOSPITAL	FHC Peringottukurussi	fhc peringottukurussi	Kerala	Palakkad	04922-217340	\N	mophcperingottukurssi@gmail.com	PHC	GOVERNMENT	Pilappulli, Peringottukurussi	678573	\N	\N	2026-02-27 02:48:32.328717
KL_PHC_PLKD_0506	HOSPITAL	FHC Kavassery	fhc kavassery	Kerala	Palakkad	8075105199	\N	fhckavassery@gmail.com	PHC	GOVERNMENT	Padur P.O	678543	\N	\N	2026-02-27 02:48:32.329057
KL_PHC_PLKD_0507	HOSPITAL	FHC Kunissery	fhc kunissery	Kerala	Palakkad	0492-2293900	\N	phckunisery@gmail.com	PHC	GOVERNMENT	Kunissery P.O	678681	\N	\N	2026-02-27 02:48:32.329397
KL_PHC_PLKD_0508	HOSPITAL	FHC Kappur	fhc kappur	Kerala	Palakkad	9895962934	\N	kappurphc@gmail.com	PHC	GOVERNMENT	Kappur P.O	679551	\N	\N	2026-02-27 02:48:32.329757
KL_PHC_PLKD_0509	HOSPITAL	FHC Kumbidi	fhc kumbidi	Kerala	Palakkad	9446330323	\N	phckumbidi@gmail.com	PHC	GOVERNMENT	Kumbidi P.O	679553	\N	\N	2026-02-27 02:48:32.330095
KL_PHC_PLKD_0510	HOSPITAL	FHC Pattithara	fhc pattithara	Kerala	Palakkad	0466-2374080	\N	phcpattithara@gmail.com	PHC	GOVERNMENT	Kottappadam P.O	679534	\N	\N	2026-02-27 02:48:32.33045
KL_PHC_PLKD_0511	HOSPITAL	FHC Peruvemba	fhc peruvemba	Kerala	Palakkad	9746094910	\N	fhcperuvemba@gmail.com	PHC	GOVERNMENT	Peruvemba P.O	\N	\N	\N	2026-02-27 02:48:32.330795
KL_PHC_PLKD_0512	HOSPITAL	FHC Vannamada	fhc vannamada	Kerala	Palakkad	0492-3272585	\N	phcvannamada@gmail.com	PHC	GOVERNMENT	Vannamada P.O	678101	\N	\N	2026-02-27 02:48:32.331128
KL_PHC_PLKD_0513	HOSPITAL	FHC Nallepilly	fhc nallepilly	Kerala	Palakkad	0492-3282739	\N	mophcnpy@gmail.com	PHC	GOVERNMENT	Nallepilly P.O	678553	\N	\N	2026-02-27 02:48:32.331464
KL_PHC_PLKD_0514	HOSPITAL	FHC Perumatty	fhc perumatty	Kerala	Palakkad	0492-3296433	\N	phcperumatty12@gmail.com	PHC	GOVERNMENT	Kannimari P.O	678534	\N	\N	2026-02-27 02:48:32.331802
KL_PHC_PLKD_0515	HOSPITAL	PHC Elevanchery	phc elevanchery	Kerala	Palakkad	0492-3276167	\N	phcelevanchery@gmail.com	PHC	GOVERNMENT	Kizhakkemuri, Elevanchery	678508	\N	\N	2026-02-27 02:48:32.332133
KL_PHC_PLKD_0516	HOSPITAL	FHC Ayalur	fhc ayalur	Kerala	Palakkad	0492-3244773	\N	phcayalur@gmail.com	PHC	GOVERNMENT	Ayalur, Thiruvazhiyad	678510	\N	\N	2026-02-27 02:48:32.332515
KL_PHC_PLKD_0517	HOSPITAL	FHC Vadavannur	fhc vadavannur	Kerala	Palakkad	9562292933	\N	phcvadavannur@gmail.com	PHC	GOVERNMENT	Vadavannur	678504	\N	\N	2026-02-27 02:48:32.332867
KL_PHC_PLKD_0518	HOSPITAL	PHC Muthuthala	phc muthuthala	Kerala	Palakkad	9446230105	\N	phcmuthuthala@gmail.com	PHC	GOVERNMENT	Muthuthala	679303	\N	\N	2026-02-27 02:48:32.333222
KL_PHC_PLKD_0519	HOSPITAL	FHC Pallassana	fhc pallassana	Kerala	Palakkad	8129543698	\N	pallassanaphc@gmail.com	PHC	GOVERNMENT	Pallassana	678505	\N	\N	2026-02-27 02:48:32.333571
KL_PHC_PLKD_0520	HOSPITAL	FHC Thenkurissi	fhc thenkurissi	Kerala	Palakkad	\N	\N	mophcthenkurussi@gmail.com	PHC	GOVERNMENT	Pazhathara, Thenkurissi	678671	\N	\N	2026-02-27 02:48:32.333946
KL_PHC_PLKD_0521	HOSPITAL	FHC Kannadi	fhc kannadi	Kerala	Palakkad	04922-273566	\N	phckannadi2@gmail.com	PHC	GOVERNMENT	Kannadi P.O	678701	\N	\N	2026-02-27 02:48:32.334291
KL_PHC_PLKD_0522	HOSPITAL	FHC Muthalamada	fhc muthalamada	Kerala	Palakkad	9037946669	\N	medicalofficermmda@gmail.com	PHC	GOVERNMENT	Chulliyarmedu, Muthalamada P.O	678507	\N	\N	2026-02-27 02:48:32.334637
KL_PHC_PLKD_0523	HOSPITAL	FHC Puthucode	fhc puthucode	Kerala	Palakkad	9562400406	\N	fhcputhucode@gmail.com	PHC	GOVERNMENT	Chandapura, Puthucode P.O	678687	\N	\N	2026-02-27 02:48:32.334992
KL_PHC_PLKD_0524	HOSPITAL	FHC Anakkatty	fhc anakkatty	Kerala	Palakkad	8921984800	\N	phcanakkatty@gmail.com	PHC	GOVERNMENT	Mattathukkad P.O, Attappady	678581	\N	\N	2026-02-27 02:48:32.33534
KL_PHC_PLKD_0525	HOSPITAL	FHC Kottoppadam	fhc kottoppadam	Kerala	Palakkad	9495216784	\N	fhckottopadam@gmail.com	PHC	GOVERNMENT	Kottoppadam P.O	678583	\N	\N	2026-02-27 02:48:32.335688
KL_PHC_PLKD_0526	HOSPITAL	FHC Thenkara	fhc thenkara	Kerala	Palakkad	9497086551	\N	phcthenkara@gmail.com	PHC	GOVERNMENT	Thenkara P.O, Mannarkkad	678582	\N	\N	2026-02-27 02:48:32.336044
KL_PHC_PLKD_0527	HOSPITAL	FHC Kanjirapuzha	fhc kanjirapuzha	Kerala	Palakkad	8547937828	\N	mophckpuzha@gmail.com	PHC	GOVERNMENT	Kanjirapuzha P.O, Mannarkkad	678591	\N	\N	2026-02-27 02:48:32.33654
KL_PHC_PLKD_0528	HOSPITAL	FHC Karakurissi	fhc karakurissi	Kerala	Palakkad	04924-249301	\N	phckarakurissi@gmail.com	PHC	GOVERNMENT	Karakurissi P.O	678595	\N	\N	2026-02-27 02:48:32.336891
KL_PHC_PLKD_0529	HOSPITAL	FHC Mannur	fhc mannur	Kerala	Palakkad	0491-2873400	\N	phcmannurpkd@gmail.com	PHC	GOVERNMENT	Mannur P.O	678642	\N	\N	2026-02-27 02:48:32.337235
KL_PHC_PLKD_0530	HOSPITAL	FHC Perur	fhc perur	Kerala	Palakkad	9744460011	\N	kelappanphcperur@gmail.com	PHC	GOVERNMENT	Gandhi Seva Sadan P.O	679302	\N	\N	2026-02-27 02:48:32.337603
KL_PHC_PLKD_0531	HOSPITAL	FHC Pookkottukavu	fhc pookkottukavu	Kerala	Palakkad	0466-2961216	\N	phcpkv@gmail.com	PHC	GOVERNMENT	Pookkottukavu, Kadambur P.O	679515	\N	\N	2026-02-27 02:48:32.337949
KL_PHC_PLKD_0532	HOSPITAL	FHC Vaniyamkulam	fhc vaniyamkulam	Kerala	Palakkad	0466-2227511	\N	phcvkm@gmail.com	PHC	GOVERNMENT	Vaniyamkulam P.O	679522	\N	\N	2026-02-27 02:48:32.338429
KL_PHC_PLKD_0533	HOSPITAL	FHC Vellinezhy	fhc vellinezhy	Kerala	Palakkad	0466-2933362	\N	fhcvellinezhi@gmail.com	PHC	GOVERNMENT	Thirunarayanapuram P.O, Thiruvazhiyode Via	679514	\N	\N	2026-02-27 02:48:32.338759
KL_PHC_PLKD_0534	HOSPITAL	FHC Thrikkadeeri	fhc thrikkadeeri	Kerala	Palakkad	0466-2962385	\N	mothrikkadeeri@gmail.com	PHC	GOVERNMENT	Thrikkadeeri P.O	679502	\N	\N	2026-02-27 02:48:32.339306
KL_PHC_PLKD_0535	HOSPITAL	FHC Marutharoad	fhc marutharoad	Kerala	Palakkad	0491-2536866	\N	phcmarutharoad@gmail.com	PHC	GOVERNMENT	Kottekkad P.O	678732	\N	\N	2026-02-27 02:48:32.339685
KL_PHC_PLKD_0536	HOSPITAL	FHC Puthussery	fhc puthussery	Kerala	Palakkad	0491-2567470	\N	mophcputhussery@gmail.com	PHC	GOVERNMENT	Pudussery, Kanjikkode	678621	\N	\N	2026-02-27 02:48:32.340035
KL_PHC_PLKD_0537	HOSPITAL	FHC Mundur	fhc mundur	Kerala	Palakkad	0491-2963050	\N	mophcmundur@yahoo.in	PHC	GOVERNMENT	Mundur	678592	\N	\N	2026-02-27 02:48:32.340381
KL_PHC_PLKD_0538	HOSPITAL	FHC Akathethara	fhc akathethara	Kerala	Palakkad	0491-2554935	\N	mophcakathethara@gmail.com	PHC	GOVERNMENT	Akathethara	678008	\N	\N	2026-02-27 02:48:32.340733
KL_PHC_PLKD_0539	HOSPITAL	FHC Malampuzha	fhc malampuzha	Kerala	Palakkad	0491-2816011	\N	mophcmalampuzha@gmail.com	PHC	GOVERNMENT	Malampuzha	678651	\N	\N	2026-02-27 02:48:32.341058
KL_PHC_PLKD_0540	HOSPITAL	FHC Vallappuzha	fhc vallappuzha	Kerala	Palakkad	0466-2966366	\N	phcvallapuzha@gmail.com	PHC	GOVERNMENT	Cherukode P.O, Vallappuzha	679336	\N	\N	2026-02-27 02:48:32.341378
KL_PHC_PLKD_0541	HOSPITAL	PHC Kottayi	phc kottayi	Kerala	Palakkad	04922-285606	\N	mophckottayi@gmail.com	PHC	GOVERNMENT	Kottayi P.O	678572	\N	\N	2026-02-27 02:48:32.341698
KL_PHC_PLKD_0542	HOSPITAL	FHC Kannambra	fhc kannambra	Kerala	Palakkad	04922-267147	\N	phckannambra@gmail.com	PHC	GOVERNMENT	Kannambra	678686	\N	\N	2026-02-27 02:48:32.342015
KL_PHC_PLKD_0543	HOSPITAL	FHC Pudur	fhc pudur	Kerala	Palakkad	\N	\N	phcpudur@gmail.com	PHC	GOVERNMENT	Pudur	678581	\N	\N	2026-02-27 02:48:32.342331
KL_PHC_PLKD_0544	HOSPITAL	FHC Kumaramputhur	fhc kumaramputhur	Kerala	Palakkad	\N	\N	phckumaramputhur@gmail.com	PHC	GOVERNMENT	Payyanedam P.O	678583	\N	\N	2026-02-27 02:48:32.342656
KL_PHC_PLKD_0545	HOSPITAL	FHC Sreekrishnapuram	fhc sreekrishnapuram	Kerala	Palakkad	0466-2261744	\N	phcskp@gmail.com	PHC	GOVERNMENT	Sreekrishnapuram P.O	679513	\N	\N	2026-02-27 02:48:32.343011
KL_PHC_PLKD_0546	HOSPITAL	FHC Kollengode	fhc kollengode	Kerala	Palakkad	04923-264352	\N	mophckollengod@gmail.com	PHC	GOVERNMENT	Near Kollengode Bus Stand, Kollengode P.O	678506	\N	\N	2026-02-27 02:48:32.343361
KL_PHC_PLKD_0547	HOSPITAL	FHC Kalladikode	fhc kalladikode	Kerala	Palakkad	0492-4296135	\N	mophcklkd@gmail.com	PHC	GOVERNMENT	Kalladikode P.O	678596	\N	\N	2026-02-27 02:48:32.343716
KL_PHC_PLKD_0548	HOSPITAL	FHC Nellaya	fhc nellaya	Kerala	Palakkad	0466-2382011	\N	phcnellaya@gmail.com	PHC	GOVERNMENT	Marayamangalam P.O	679335	\N	\N	2026-02-27 02:48:32.344065
KL_PHC_PLKD_0549	HOSPITAL	FHC Kumaranellur	fhc kumaranellur	Kerala	Palakkad	0466-2277053	\N	phckumaranallur@gmail.com	PHC	GOVERNMENT	Kumaranellur P.O	679552	\N	\N	2026-02-27 02:48:32.344413
KL_PHC_PLKD_0550	HOSPITAL	FHC Adakkaputhur	fhc adakkaputhur	Kerala	Palakkad	0466-2285676	\N	fhcadakkaputhur@gmail.com	PHC	GOVERNMENT	Adakkaputhur P.O	679503	\N	\N	2026-02-27 02:48:32.344763
KL_PHC_PLKD_0551	HOSPITAL	FHC Puduppariyaram	fhc puduppariyaram	Kerala	Palakkad	0491-2554675	\N	puduppariyaramfhc@gmail.com	PHC	GOVERNMENT	Near Krishnan Kovil, Puduppariyaram	678731	\N	\N	2026-02-27 02:48:32.345084
KL_PHC_PLKD_0552	HOSPITAL	FHC Ongallur	fhc ongallur	Kerala	Palakkad	0466-2234665	\N	phcongallur@gmail.com	PHC	GOVERNMENT	Kalladipatta P.O, Pattambi	679313	\N	\N	2026-02-27 02:48:32.345402
KL_PHC_PLKD_0553	HOSPITAL	FHC Kuthanur	fhc kuthanur	Kerala	Palakkad	04922-288145	\N	mophckuthanur@gmail.com	PHC	GOVERNMENT	Kuthanur P.O	678721	\N	\N	2026-02-27 02:48:32.345718
KL_PHC_PLKD_0554	HOSPITAL	FHC Mathur	fhc mathur	Kerala	Palakkad	0492-2291333	\N	mophcmathur@gmail.com	PHC	GOVERNMENT	Mathur	678571	\N	\N	2026-02-27 02:48:32.346059
KL_PHC_PLKD_0555	HOSPITAL	FHC Ozhalapathy	fhc ozhalapathy	Kerala	Palakkad	0491-2970032	\N	ozhalapathyphc@gmail.com	PHC	GOVERNMENT	Ozhalapathy	678557	\N	\N	2026-02-27 02:48:32.346419
KL_PHC_PLKD_0556	HOSPITAL	FHC Mankara	fhc mankara	Kerala	Palakkad	0491-2874970	\N	fhcmankara2019@gmail.com	PHC	GOVERNMENT	Mankara	678613	\N	\N	2026-02-27 02:48:32.346766
KL_PHC_PLKD_0557	HOSPITAL	FHC Kizhakkancherry	fhc kizhakkancherry	Kerala	Palakkad	\N	\N	phckizhakkancherry@gmail.com	PHC	GOVERNMENT	Moolamcode	678684	\N	\N	2026-02-27 02:48:32.347112
KL_PHC_PLKD_0558	HOSPITAL	FHC Vandazhi	fhc vandazhi	Kerala	Palakkad	0492-2296795	\N	phcvandazhy@gmail.com	PHC	GOVERNMENT	Vandazhi P.O	678706	\N	\N	2026-02-27 02:48:32.347608
KL_PHC_MLP_0559	HOSPITAL	24x7 PHC Aliparamba	24x7 phc aliparamba	Kerala	Malappuram	04933-234350	\N	alipparambaphc@gmail.com	PHC	GOVERNMENT	Aliparamba P.O	679357	\N	\N	2026-02-27 02:48:32.34796
KL_PHC_MLP_0560	HOSPITAL	24x7 PHC Anakkayam	24x7 phc anakkayam	Kerala	Malappuram	0483-2781393	\N	medicalofficerphcanakkayam@gmail.com	PHC	GOVERNMENT	Kadambode P.O	676121	\N	\N	2026-02-27 02:48:32.348365
KL_PHC_MLP_0561	HOSPITAL	24x7 PHC Valanchery	24x7 phc valanchery	Kerala	Malappuram	0494-2646374	\N	mophcvalanchery@gmail.com	PHC	GOVERNMENT	Marankunnu, Valanchery P.O	676552	\N	\N	2026-02-27 02:48:32.348801
KL_PHC_MLP_0562	HOSPITAL	24x7 PHC Pallikkal	24x7 phc pallikkal	Kerala	Malappuram	0494-2401661	\N	mopallikal@yahoo.com	PHC	GOVERNMENT	Pallikkal P.O, Kondotty	673636	\N	\N	2026-02-27 02:48:32.349154
KL_PHC_MLP_0563	HOSPITAL	PHC Amarambalam	phc amarambalam	Kerala	Malappuram	04931-261600	\N	mophcamarambalam@gmail.com	PHC	GOVERNMENT	Kavalamukkatta P.O	679332	\N	\N	2026-02-27 02:48:32.349516
KL_PHC_MLP_0564	HOSPITAL	PHC Kurumbalangode	phc kurumbalangode	Kerala	Malappuram	04931-208408	\N	mophckurumbalangode@gmail.com	PHC	GOVERNMENT	Kurumbalangode P.O	679334	\N	\N	2026-02-27 02:48:32.349862
KL_PHC_MLP_0565	HOSPITAL	PHC Chathalloor	phc chathalloor	Kerala	Malappuram	0483-2216655	\N	phcchathallur@gmail.com	PHC	GOVERNMENT	Chathalloor P.O	676541	\N	\N	2026-02-27 02:48:32.350202
KL_PHC_MLP_0566	HOSPITAL	PHC Kodur	phc kodur	Kerala	Malappuram	0483-2800200	\N	phckodur@gmail.com	PHC	GOVERNMENT	Kodur P.O	676504	\N	\N	2026-02-27 02:48:32.350516
KL_PHC_MLP_0567	HOSPITAL	PHC Makkaraparamba	phc makkaraparamba	Kerala	Malappuram	04933-287311	\N	phcmakkaraparamba@gmail.com	PHC	GOVERNMENT	Makkaraparamba P.O	676507	\N	\N	2026-02-27 02:48:32.350826
KL_PHC_MLP_0568	HOSPITAL	PHC Perumpadappu	phc perumpadappu	Kerala	Malappuram	0494-2653660	\N	phcperumpadappu@gmail.com	PHC	GOVERNMENT	Cheruvallur P.O	679575	\N	\N	2026-02-27 02:48:32.351137
KL_PHC_MLP_0569	HOSPITAL	PHC Edappatta	phc edappatta	Kerala	Malappuram	04933-211300	\N	phcedappatta@gmail.com	PHC	GOVERNMENT	Pathirikkode P.O	679326	\N	\N	2026-02-27 02:48:32.351444
KL_PHC_MLP_0570	HOSPITAL	PHC Keezhattur	phc keezhattur	Kerala	Malappuram	04933-217100	\N	keezhatturphc@gmail.com	PHC	GOVERNMENT	Poonthanam, Pattikkadu Via	676521	\N	\N	2026-02-27 02:48:32.351755
KL_PHC_MLP_0571	HOSPITAL	PHC Vettathur	phc vettathur	Kerala	Malappuram	04933-247320	\N	mophcvettathur@gmail.com	PHC	GOVERNMENT	Thelakkad P.O	679325	\N	\N	2026-02-27 02:48:32.352063
KL_PHC_MLP_0572	HOSPITAL	PHC Kadalundinagaram	phc kadalundinagaram	Kerala	Malappuram	0494-2470840	\N	phckadalundinagaram@gmail.com	PHC	GOVERNMENT	Kadalundinagaram P.O	673314	\N	\N	2026-02-27 02:48:32.352371
KL_PHC_MLP_0573	HOSPITAL	PHC Muthuvalloor	phc muthuvalloor	Kerala	Malappuram	0483-2114580	\N	mophcmuthuvallur@gmail.com	PHC	GOVERNMENT	Vilayil P.O	673641	\N	\N	2026-02-27 02:48:32.352709
KL_PHC_MLP_0574	HOSPITAL	PHC Keezhuparamba	phc keezhuparamba	Kerala	Malappuram	0483-2858866	\N	mophckeezhuparamba@gmail.com	PHC	GOVERNMENT	Keezhuparamba P.O	673639	\N	\N	2026-02-27 02:48:32.353047
KL_PHC_MLP_0575	HOSPITAL	PHC Pookkottur	phc pookkottur	Kerala	Malappuram	0483-2774860	\N	mobphcpookkottur@gmail.com	PHC	GOVERNMENT	Pookkottur P.O	676517	\N	\N	2026-02-27 02:48:32.353395
KL_PHC_MLP_0576	HOSPITAL	PHC Nediyiruppu	phc nediyiruppu	Kerala	Malappuram	0483-2712161	\N	mophcnediyiruppu@gmail.com	PHC	GOVERNMENT	Chirayil P.O, Kondotty	673638	\N	\N	2026-02-27 02:48:32.353734
KL_PHC_MLP_0577	HOSPITAL	PHC Oorakam	phc oorakam	Kerala	Malappuram	0494-2670420	\N	mophcoorkam1@gmail.com	PHC	GOVERNMENT	Oorakam Melmuri P.O, Vengara	676519	\N	\N	2026-02-27 02:48:32.354047
KL_PHC_MLP_0578	HOSPITAL	PHC Athavanad	phc athavanad	Kerala	Malappuram	0494-2112594	\N	mophcathavanad@gmail.com	PHC	GOVERNMENT	Athavanadu P.O, Mettummal	676301	\N	\N	2026-02-27 02:48:32.354354
KL_PHC_MLP_0579	HOSPITAL	PHC Irimbiliyam	phc irimbiliyam	Kerala	Malappuram	0494-2638800	\N	mophcirimbiliam@gmail.com	PHC	GOVERNMENT	Valiyakunnu P.O	676552	\N	\N	2026-02-27 02:48:32.354659
KL_PHC_MLP_0580	HOSPITAL	PHC Ezhavathiruthy	phc ezhavathiruthy	Kerala	Malappuram	0494-2664701	\N	mophcezhuvathiruthy@gmail.com	PHC	GOVERNMENT	Ponnani P.O	679577	\N	\N	2026-02-27 02:48:32.354966
KL_PHC_MLP_0581	HOSPITAL	PHC Cheriyamundam	phc cheriyamundam	Kerala	Malappuram	0494-2589610	\N	mophccheriyamundam@gmail.com	PHC	GOVERNMENT	Parappunthadam, Cheriyamundam P.O	676106	\N	\N	2026-02-27 02:48:32.355275
KL_PHC_MLP_0582	HOSPITAL	PHC Kalpakanchery	phc kalpakanchery	Kerala	Malappuram	0494-2612500	\N	mphckalpakanchery@gmail.com	PHC	GOVERNMENT	Randathani P.O	676510	\N	\N	2026-02-27 02:48:32.355766
KL_PHC_MLP_0583	HOSPITAL	PHC Othukkungal	phc othukkungal	Kerala	Malappuram	0483-2838500	\N	othukkungalphc@gmail.com	PHC	GOVERNMENT	Othukkungal P.O	676528	\N	\N	2026-02-27 02:48:32.356127
KL_PHC_MLP_0584	HOSPITAL	PHC Thennala	phc thennala	Kerala	Malappuram	0494-2101770	\N	thennalaphcmo@yahoo.co.in	PHC	GOVERNMENT	Thennala P.O	676508	\N	\N	2026-02-27 02:48:32.356465
KL_PHC_MLP_0585	HOSPITAL	PHC Mampad	phc mampad	Kerala	Malappuram	04931-200288	\N	phcmampad@gmail.com	PHC	GOVERNMENT	Mampad P.O	676542	\N	\N	2026-02-27 02:48:32.356794
KL_PHC_MLP_0586	HOSPITAL	PHC Edarikode	phc edarikode	Kerala	Malappuram	0483-2118045	\N	mophcedarikodenew@gmail.com	PHC	GOVERNMENT	Puthuparambu P.O, Edarikode	676501	\N	\N	2026-02-27 02:48:32.357101
KL_PHC_MLP_0587	HOSPITAL	PHC Kannamangalam	phc kannamangalam	Kerala	Malappuram	0494-2490179	\N	kannamangalamphc@gmail.com	PHC	GOVERNMENT	Kannamangalam West P.O	676304	\N	\N	2026-02-27 02:48:32.357411
KL_PHC_MLP_0588	HOSPITAL	PHC Fisheries Koottayi	phc fisheries koottayi	Kerala	Malappuram	0494-2631888	\N	mophckoottayi@gmail.com	PHC	GOVERNMENT	Koottayi P.O, Kothaparamba	676562	\N	\N	2026-02-27 02:48:32.357726
KL_PHC_MLP_0589	HOSPITAL	FHC Pothukal	fhc pothukal	Kerala	Malappuram	04931-240318	\N	mophcpothukal@gmail.com	FHC	GOVERNMENT	Bhoodanam P.O	679334	\N	\N	2026-02-27 02:48:32.358037
KL_PHC_MLP_0590	HOSPITAL	FHC Kavannoor	fhc kavannoor	Kerala	Malappuram	0483-2869021	\N	phckavanur@gmail.com	FHC	GOVERNMENT	Kavannoor P.O	673639	\N	\N	2026-02-27 02:48:32.358371
KL_PHC_MLP_0591	HOSPITAL	FHC Palapetty	fhc palapetty	Kerala	Malappuram	0494-2678397	\N	phcpalapetty@gmail.com	FHC	GOVERNMENT	Palapetty P.O, Ponnani	679579	\N	\N	2026-02-27 02:48:32.358702
KL_PHC_MLP_0592	HOSPITAL	FHC Vazhakkad	fhc vazhakkad	Kerala	Malappuram	0483-2728683	\N	fhcvazhakkad@gmail.com	FHC	GOVERNMENT	Vazhakkad P.O, Cheruvayoor Via	673640	\N	\N	2026-02-27 02:48:32.359035
KL_PHC_MLP_0593	HOSPITAL	FHC Thevarkadappuram	fhc thevarkadappuram	Kerala	Malappuram	0494-2427155	\N	fhcthevarkadappuram@gmail.com	FHC	GOVERNMENT	Niramaruthur P.O	676109	\N	\N	2026-02-27 02:48:32.35937
KL_PHC_MLP_0594	HOSPITAL	FHC Karulai	fhc karulai	Kerala	Malappuram	04931-271160	\N	mochckarulai@gmail.com	FHC	GOVERNMENT	Karulai P.O	679330	\N	\N	2026-02-27 02:48:32.359716
KL_PHC_MLP_0595	HOSPITAL	FHC Nannambra	fhc nannambra	Kerala	Malappuram	0494-2483801	\N	phcnannambra@gmail.com	FHC	GOVERNMENT	Kodinji P.O	676309	\N	\N	2026-02-27 02:48:32.360043
KL_PHC_MLP_0596	HOSPITAL	PHC Perumannaklari	phc perumannaklari	Kerala	Malappuram	0483-2750388	\N	mophcperumannaklari@gmail.com	PHC	GOVERNMENT	Kuttipala P.O	676501	\N	\N	2026-02-27 02:48:32.360572
KL_PHC_MLP_0597	HOSPITAL	FHC Iringalloor	fhc iringalloor	Kerala	Malappuram	0494-2459309	\N	iringalloorphc@gmail.com	FHC	GOVERNMENT	Iringalloor P.O	676503	\N	\N	2026-02-27 02:48:32.360898
KL_PHC_MLP_0598	HOSPITAL	FHC Moorkkanad	fhc moorkkanad	Kerala	Malappuram	04933-202200	\N	phcmoorkkanad@gmail.com	FHC	GOVERNMENT	Kolathur P.O	679338	\N	\N	2026-02-27 02:48:32.361214
KL_PHC_MLP_0599	HOSPITAL	FHC Angadipuram	fhc angadipuram	Kerala	Malappuram	04933-218935	\N	mophcangadippuram@gmail.com	FHC	GOVERNMENT	Valambur P.O	679325	\N	\N	2026-02-27 02:48:32.361558
KL_PHC_MLP_0600	HOSPITAL	FHC Koottilangadi	fhc koottilangadi	Kerala	Malappuram	04933-241166	\N	koottilangadiphc@gmail.com	FHC	GOVERNMENT	Padinhattumuri P.O	676506	\N	\N	2026-02-27 02:48:32.361894
KL_PHC_MLP_0601	HOSPITAL	FHC Nannammukku	fhc nannammukku	Kerala	Malappuram	0494-2656654	\N	phcnannamukku@gmail.com	FHC	GOVERNMENT	Mookkuthala P.O	679574	\N	\N	2026-02-27 02:48:32.362242
KL_PHC_MLP_0602	HOSPITAL	FHC Veliyancode	fhc veliyancode	Kerala	Malappuram	0494-2677583	\N	mophcveliyancode@gmail.com	FHC	GOVERNMENT	Changadam Road, Veliyancode P.O	679579	\N	\N	2026-02-27 02:48:32.362558
KL_PHC_MLP_0603	HOSPITAL	FHC Marancherry (New)	fhc marancherry new	Kerala	Malappuram	0494-2676899	\N	bphcmarancherynew@gmail.com	FHC	GOVERNMENT	Parichakam, Marancherry P.O	679581	\N	\N	2026-02-27 02:48:32.362877
KL_PHC_MLP_0604	HOSPITAL	FHC Trippanachi	fhc trippanachi	Kerala	Malappuram	0483-2821460	\N	mofhctrippanachi@gmail.com	FHC	GOVERNMENT	Trippanachi P.O	673641	\N	\N	2026-02-27 02:48:32.363193
KL_PHC_MLP_0605	HOSPITAL	FHC Edakkara	fhc edakkara	Kerala	Malappuram	04931-276500	\N	mophcedakkara@gmail.com	FHC	GOVERNMENT	Edakkara P.O, Karunechi	679331	\N	\N	2026-02-27 02:48:32.363582
KL_PHC_MLP_0606	HOSPITAL	FHC Moothedam	fhc moothedam	Kerala	Malappuram	04931-272250	\N	mophcmoothedam@gmail.com	FHC	GOVERNMENT	Karapuram P.O	679331	\N	\N	2026-02-27 02:48:32.363917
KL_PHC_MLP_0607	HOSPITAL	FHC Kalady	fhc kalady	Kerala	Malappuram	0494-2122022	\N	mofhckaladi@gmail.com	FHC	GOVERNMENT	Kalady P.O	679582	\N	\N	2026-02-27 02:48:32.364399
KL_PHC_MLP_0608	HOSPITAL	FHC Koottayi	fhc koottayi	Kerala	Malappuram	0494-2631888	\N	mophckoottayi@gmail.com	FHC	GOVERNMENT	Vadikkal, Koottayi P.O	676562	\N	\N	2026-02-27 02:48:32.364722
KL_PHC_MLP_0609	HOSPITAL	FHC Triprangode	fhc triprangode	Kerala	Malappuram	0494-2564717	\N	mophctriprangode@gmail.com	FHC	GOVERNMENT	Triprangode P.O	676108	\N	\N	2026-02-27 02:48:32.365038
KL_PHC_MLP_0610	HOSPITAL	FHC Chaliyar	fhc chaliyar	Kerala	Malappuram	04931-206351	\N	mofhcchaliyar@gmail.com	FHC	GOVERNMENT	Eranhimangad P.O	679329	\N	\N	2026-02-27 02:48:32.365358
KL_PHC_MLP_0611	HOSPITAL	FHC Odakkayam	fhc odakkayam	Kerala	Malappuram	0483-2844500	\N	mophcodakkayam@gmail.com	FHC	GOVERNMENT	Poovathikkal P.O	673639	\N	\N	2026-02-27 02:48:32.365673
KL_PHC_MLP_0612	HOSPITAL	FHC Trikkalangode	fhc trikkalangode	Kerala	Malappuram	0483-2707447	\N	phcthrikkalangode@gmail.com	FHC	GOVERNMENT	Manhapatta	676123	\N	\N	2026-02-27 02:48:32.365985
KL_PHC_MLP_0613	HOSPITAL	FHC Elamkulam	fhc elamkulam	Kerala	Malappuram	04933-230156	\N	fhcelamkulam2019@gmail.com	FHC	GOVERNMENT	Kunakkavu P.O	679340	\N	\N	2026-02-27 02:48:32.366295
KL_PHC_MLP_0614	HOSPITAL	FHC Chemmalasseri	fhc chemmalasseri	Kerala	Malappuram	04933-269010	\N	mophcchemmalassery@yahoo.in	FHC	GOVERNMENT	Chemmalasseri P.O, Pulamanthole	679323	\N	\N	2026-02-27 02:48:32.36662
KL_PHC_MLP_0615	HOSPITAL	FHC Cherukavu	fhc cherukavu	Kerala	Malappuram	0483-2833680	\N	phccherukavu@gmail.com	FHC	GOVERNMENT	Puthukode P.O	673633	\N	\N	2026-02-27 02:48:32.366963
KL_PHC_MLP_0616	HOSPITAL	PHC Thalakkad	phc thalakkad	Kerala	Malappuram	0494-2425460	\N	mophcthalakkad@gmail.com	PHC	GOVERNMENT	BP Angadi P.O, Tirur	676102	\N	\N	2026-02-27 02:48:32.36729
KL_PHC_MLP_0617	HOSPITAL	PHC Marakkara	phc marakkara	Kerala	Malappuram	0494-2618888	\N	mophcmarakkara@gmail.com	PHC	GOVERNMENT	Kadampuzha P.O	676553	\N	\N	2026-02-27 02:48:32.367605
KL_PHC_MLP_0618	HOSPITAL	FHC Moonniyur	fhc moonniyur	Kerala	Malappuram	0494-2476709	\N	moonniyurphc@gmail.com	FHC	GOVERNMENT	Moonniyur P.O	676311	\N	\N	2026-02-27 02:48:32.367924
KL_PHC_MLP_0619	HOSPITAL	PHC Thenhipalam	phc thenhipalam	Kerala	Malappuram	0494-2434700	\N	thenhipalamphc2013@gmail.com	PHC	GOVERNMENT	Thenhipalam P.O	673636	\N	\N	2026-02-27 02:48:32.36824
KL_PHC_MLP_0620	HOSPITAL	FHC Ponmundam	fhc ponmundam	Kerala	Malappuram	0494-2588300	\N	phcponmundam@gmail.com	FHC	GOVERNMENT	Ponmundam P.O, Vyalaithur Via	676106	\N	\N	2026-02-27 02:48:32.374286
KL_PHC_MLP_0621	HOSPITAL	FHC Thanalur	fhc thanalur	Kerala	Malappuram	0494-2582700	\N	phctnlr@gmail.com	FHC	GOVERNMENT	Thanalur P.O, Chungam	676307	\N	\N	2026-02-27 02:48:32.374783
KL_PHC_MLP_0622	HOSPITAL	PHC Porur	phc porur	Kerala	Malappuram	04931-211630	\N	phcporur@gmail.com	PHC	GOVERNMENT	Cherukode, Porur P.O	679326	\N	\N	2026-02-27 02:48:32.3752
KL_PHC_MLP_0623	HOSPITAL	FHC Thiruvali	fhc thiruvali	Kerala	Malappuram	04931-248025	\N	phcthiruvali@gmail.com	FHC	GOVERNMENT	Punnapala P.O	679328	\N	\N	2026-02-27 02:48:32.375598
KL_PHC_MLP_0624	HOSPITAL	FHC Thuvvur	fhc thuvvur	Kerala	Malappuram	04931-284949	\N	phctuvvur@gmail.com	FHC	GOVERNMENT	Thuvvur P.O	679327	\N	\N	2026-02-27 02:48:32.375982
KL_PHC_MLP_0625	HOSPITAL	FHC Vazhikkadavu	fhc vazhikkadavu	Kerala	Malappuram	04931-278450	\N	phcvazhikkadavu@gmail.com	FHC	GOVERNMENT	Vazhikkadavu P.O	679331	\N	\N	2026-02-27 02:48:32.376377
KL_PHC_MLP_0626	HOSPITAL	FHC Pang	fhc pang	Kerala	Malappuram	04933-244380	\N	mophcpang@gmail.com	FHC	GOVERNMENT	Chendi P.O	679338	\N	\N	2026-02-27 02:48:32.376751
KL_PHC_MLP_0627	HOSPITAL	FHC Thazhekkode	fhc thazhekkode	Kerala	Malappuram	04933-252151	\N	tzkdphc@gmail.com	FHC	GOVERNMENT	Thazhekkode P.O	679341	\N	\N	2026-02-27 02:48:32.377129
KL_PHC_MLP_0628	HOSPITAL	FHC Athanikkal	fhc athanikkal	Kerala	Malappuram	0494-2473960	\N	mophcathanikkal@gmail.com	FHC	GOVERNMENT	Vallikkunnu North P.O	673314	\N	\N	2026-02-27 02:48:32.37751
KL_PHC_MLP_0629	HOSPITAL	FHC Edayur	fhc edayur	Kerala	Malappuram	0494-2648440	\N	mophcedayoor@gmail.com	FHC	GOVERNMENT	Vadakkumpuram P.O, CK Para, Valanchery Via	676552	\N	\N	2026-02-27 02:48:32.377881
KL_PHC_MLP_0630	HOSPITAL	FHC Thirunavaya	fhc thirunavaya	Kerala	Malappuram	0494-2600109	\N	medicalofficerthirunavaya@gmail.com	FHC	GOVERNMENT	Ananthavoor P.O, Pattarnadakkavu, Kuthukallu	676301	\N	\N	2026-02-27 02:48:32.378255
KL_PHC_MLP_0631	HOSPITAL	PHC Chokkad	phc chokkad	Kerala	Malappuram	04931-215200	\N	phcchokkad@gmail.com	PHC	GOVERNMENT	TK Colony P.O, Chokkad	679329	\N	\N	2026-02-27 02:48:32.378653
KL_PHC_MLP_0632	HOSPITAL	FHC Pandikkad	fhc pandikkad	Kerala	Malappuram	0483-2783166	\N	medicalofficerpandikkad@gmail.com	FHC	GOVERNMENT	Pandikkad P.O	676521	\N	\N	2026-02-27 02:48:32.37903
KL_PHC_MLP_0633	HOSPITAL	FHC Alancode	fhc alancode	Kerala	Malappuram	0494-2653750	\N	fhcalankodephc@gmail.com	FHC	GOVERNMENT	Nannammukku P.O	679575	\N	\N	2026-02-27 02:48:32.379431
KL_PHC_MLP_0634	HOSPITAL	PHC Parappanangadi	phc parappanangadi	Kerala	Malappuram	0494-2410709	\N	phcpgdi@gmail.com	PHC	GOVERNMENT	Parappanangadi P.O	676303	\N	\N	2026-02-27 02:48:32.379806
KL_PHC_MLP_0635	HOSPITAL	FHC Morayoor	fhc morayoor	Kerala	Malappuram	0483-2774300	\N	mophcmorayoor@gmail.com	FHC	GOVERNMENT	Morayoor P.O	673642	\N	\N	2026-02-27 02:48:32.3802
KL_PHC_MLP_0636	HOSPITAL	FHC Ponmala	fhc ponmala	Kerala	Malappuram	0483-2706300	\N	mophcponmala@gmail.com	FHC	GOVERNMENT	Chappangadi P.O	676503	\N	\N	2026-02-27 02:48:32.380767
KL_PHC_MLP_0637	HOSPITAL	FHC Pulikkal	fhc pulikkal	Kerala	Malappuram	0483-2790900	\N	phcpulikkal@gmail.com	FHC	GOVERNMENT	Pulikkal P.O	676106	\N	\N	2026-02-27 02:48:32.381142
KL_PHC_MLP_0638	HOSPITAL	FHC Vattamkulam	fhc vattamkulam	Kerala	Malappuram	0494-2689820	\N	mophcvattamkulam@gmail.com	FHC	GOVERNMENT	Vattamkulam P.O	679578	\N	\N	2026-02-27 02:48:32.381489
KL_PHC_MLP_0639	HOSPITAL	FHC Ozhoor	fhc ozhoor	Kerala	Malappuram	0494-2489126	\N	mophcozhur@gmail.com	FHC	GOVERNMENT	Omachapuzha P.O	676320	\N	\N	2026-02-27 02:48:32.38183
KL_PHC_MLP_0640	HOSPITAL	FHC A.R Nagar	fhc ar nagar	Kerala	Malappuram	0494-2494980	\N	mophcarnager@rediffmail.com	PHC	GOVERNMENT	Kuttur North P.O, A.R Nagar (Kunnumpuram)	676305	\N	\N	2026-02-27 02:48:32.382177
KL_PHC_MLP_0641	HOSPITAL	FHC Vazhayur	fhc vazhayur	Kerala	Malappuram	0483-2833687	\N	phcvazhayoor@gmail.com	FHC	GOVERNMENT	East Vazhayur P.O	673633	\N	\N	2026-02-27 02:48:32.382522
KL_PHC_MLP_0642	HOSPITAL	FHC Chelembra	fhc chelembra	Kerala	Malappuram	0483-2891880	\N	mophcchelembra@gmail.com	FHC	GOVERNMENT	Chelembra P.O	673634	\N	\N	2026-02-27 02:48:32.382865
KL_PHC_KKD_0643	HOSPITAL	FHC Mangaad	fhc mangaad	Kerala	Kozhikode	0496-2647565	\N	mangadphc@gmail.com	FHC	GOVERNMENT	Valliyoth Neroth Road, Sivapuram	673574	\N	\N	2026-02-27 02:48:32.383203
KL_PHC_KKD_0644	HOSPITAL	PHC Kakkayam	phc kakkayam	Kerala	Kozhikode	0496-2698191	\N	phckakkayam@gmail.com	PHC	GOVERNMENT	Balussery–Koottalida Road, Avitanallur	673614	\N	\N	2026-02-27 02:48:32.38355
KL_PHC_KKD_0645	HOSPITAL	FHC Vayalada	fhc vayalada	Kerala	Kozhikode	0496-2083017	\N	vayaladaphc@gmail.com	FHC	GOVERNMENT	Kanthalad, Vayalada	673615	\N	\N	2026-02-27 02:48:32.38392
KL_PHC_KKD_0646	HOSPITAL	FHC Koothali	fhc koothali	Kerala	Kozhikode	0496-2963462	\N	phckoothali@gmail.com	FHC	GOVERNMENT	Koothali	673526	\N	\N	2026-02-27 02:48:32.384259
KL_PHC_KKD_0647	HOSPITAL	FHC Avala	fhc avala	Kerala	Kozhikode	0496-2932322	\N	avalaphc.avala@gmail.com	FHC	GOVERNMENT	Avala	673524	\N	\N	2026-02-27 02:48:32.384598
KL_PHC_KKD_0648	HOSPITAL	FHC Velom	fhc velom	Kerala	Kozhikode	0496-2770880	\N	medphcvelom@gmail.com	FHC	GOVERNMENT	Velom	673507	\N	\N	2026-02-27 02:48:32.38494
KL_PHC_KKD_0649	HOSPITAL	FHC Kunduthodu	fhc kunduthodu	Kerala	Kozhikode	0496-2566004	\N	phckunduthode@gmail.com	FHC	GOVERNMENT	Kunduthodu, Kavilumpara	673513	\N	\N	2026-02-27 02:48:32.385292
KL_PHC_KKD_0650	HOSPITAL	FHC Kuruvattoor	fhc kuruvattoor	Kerala	Kozhikode	0495-2811900	\N	phckuruvattoor@gmail.com	FHC	GOVERNMENT	Kuruvattoor	673611	\N	\N	2026-02-27 02:48:32.385636
KL_PHC_KKD_0651	HOSPITAL	FHC Choolur	fhc choolur	Kerala	Kozhikode	0495-2801177	\N	phcchoolur@gmail.com	FHC	GOVERNMENT	Post NIT, Nechully, Poolacode	673601	\N	\N	2026-02-27 02:48:32.385978
KL_PHC_KKD_0652	HOSPITAL	FHC Kakkur	fhc kakkur	Kerala	Kozhikode	0495-2962063	\N	kakkurphc@gmail.com	FHC	GOVERNMENT	Narikkuni Road, Kakkur	673585	\N	\N	2026-02-27 02:48:32.386315
KL_PHC_KKD_0653	HOSPITAL	FHC Kizhakkoth	fhc kizhakkoth	Kerala	Kozhikode	0495-2201200	\N	phckizhakkoth@gmail.com	FHC	GOVERNMENT	Kizhakkoth	673572	\N	\N	2026-02-27 02:48:32.386659
KL_PHC_KKD_0654	HOSPITAL	FHC Thurayur	fhc thurayur	Kerala	Kozhikode	0496-2470366	\N	phcthurayur@gmail.com	FHC	GOVERNMENT	Thurayur	673522	\N	\N	2026-02-27 02:48:32.387
KL_PHC_KKD_0655	HOSPITAL	FHC Tuneri	fhc tuneri	Kerala	Kozhikode	0496-2557287	\N	phctuneri@gmail.com	FHC	GOVERNMENT	Tuneri	673505	\N	\N	2026-02-27 02:48:32.387368
KL_PHC_KKD_0656	HOSPITAL	PHC Nallalam	phc nallalam	Kerala	Kozhikode	0495-2422235	\N	phcnallalam@gmail.com	PHC	GOVERNMENT	Kolathara Road, Nallalam	673027	\N	\N	2026-02-27 02:48:32.38771
KL_PHC_KKD_0657	HOSPITAL	PHC Peruvayal	phc peruvayal	Kerala	Kozhikode	0495-2492922	\N	phcperuvayal@gmail.com	PHC	GOVERNMENT	Peruvayal	673008	\N	\N	2026-02-27 02:48:32.388049
KL_PHC_KKD_0658	HOSPITAL	FHC Meppayoor	fhc meppayoor	Kerala	Kozhikode	0496-2677505	\N	phcmeppayur@gmail.com	FHC	GOVERNMENT	Payyoli–Perambra Road, Meppayoor	673524	\N	\N	2026-02-27 02:48:32.388391
KL_PHC_KKD_0659	HOSPITAL	PHC Cheruppa	phc cheruppa	Kerala	Kozhikode	0495-2492045	\N	mchcheruppa@gmail.com	PHC	GOVERNMENT	Cheruppa	673661	\N	\N	2026-02-27 02:48:32.38873
KL_PHC_KKD_0660	HOSPITAL	FHC Beypore	fhc beypore	Kerala	Kozhikode	0495-2415303	\N	phcbeypore@gmail.com	FHC	GOVERNMENT	Thambi Road, Beypore	673015	\N	\N	2026-02-27 02:48:32.389074
KL_PHC_KKD_0661	HOSPITAL	FHC Kodiyathoor	fhc kodiyathoor	Kerala	Kozhikode	0495-2209399	\N	phckodiyathur@gmail.com	FHC	GOVERNMENT	Poyilil Road, South Kodiyathur	673602	\N	\N	2026-02-27 02:48:32.389413
KL_PHC_KKD_0662	HOSPITAL	FHC Thiruvambady	fhc thiruvambady	Kerala	Kozhikode	0495-2255775	\N	phctbdy@gmail.com	FHC	GOVERNMENT	Mukkam–Thiruvambady Road	673603	\N	\N	2026-02-27 02:48:32.389767
KL_PHC_KKD_0663	HOSPITAL	FHC Karassery	fhc karassery	Kerala	Kozhikode	0495-2297051	\N	phc.karassery@gmail.com	FHC	GOVERNMENT	Kumaranallur	673602	\N	\N	2026-02-27 02:48:32.390109
KL_PHC_KKD_0664	HOSPITAL	FHC Koodaranji	fhc koodaranji	Kerala	Kozhikode	0495-2255715	\N	koodaranhiphc@yahoo.com	FHC	GOVERNMENT	Koodaranji	673603	\N	\N	2026-02-27 02:48:32.390454
KL_PHC_KKD_0665	HOSPITAL	FHC Eramangalam	fhc eramangalam	Kerala	Kozhikode	0496-2705880	\N	phceramangalam@gmail.com	FHC	GOVERNMENT	Eramangalam	673001	\N	\N	2026-02-27 02:48:32.390816
KL_PHC_KKD_0666	HOSPITAL	FHC Panangad	fhc panangad	Kerala	Kozhikode	0496-2640066	\N	phcpanangadkkd@gmail.com	FHC	GOVERNMENT	Panangad	673612	\N	\N	2026-02-27 02:48:32.39132
KL_PHC_KKD_0667	HOSPITAL	FHC Kayanna	fhc kayanna	Kerala	Kozhikode	0496-2659568	\N	phckayanna@gmail.com	FHC	GOVERNMENT	Kayanna	673526	\N	\N	2026-02-27 02:48:32.391663
KL_PHC_KKD_0668	HOSPITAL	FHC Atholy	fhc atholy	Kerala	Kozhikode	0496-2674898	\N	phcentreatholi@gmail.com	FHC	GOVERNMENT	Atholi	673315	\N	\N	2026-02-27 02:48:32.392003
KL_PHC_KKD_0669	HOSPITAL	FHC Naduvannur	fhc naduvannur	Kerala	Kozhikode	0496-2930870	\N	phcnaduvannur@gmail.com	FHC	GOVERNMENT	Naduvannur	673614	\N	\N	2026-02-27 02:48:32.392345
KL_PHC_KKD_0670	HOSPITAL	FHC Changaroth	fhc changaroth	Kerala	Kozhikode	0496-2669055	\N	phcchangaroth@gmail.com	FHC	GOVERNMENT	Changaroth	\N	\N	\N	2026-02-27 02:48:32.392688
KL_PHC_KKD_0671	HOSPITAL	FHC Azhiyoor	fhc azhiyoor	Kerala	Kozhikode	0496-2963820	\N	phcazhiyur@gmail.com	FHC	GOVERNMENT	Azhiyur, Chombala P.O	673001	\N	\N	2026-02-27 02:48:32.393044
KL_PHC_KKD_0672	HOSPITAL	PHC Madappally	phc madappally	Kerala	Kozhikode	0496-2502170	\N	madappallyphc@gmail.com	PHC	GOVERNMENT	Main Road, Madappally	673102	\N	\N	2026-02-27 02:48:32.393389
KL_PHC_KKD_0673	HOSPITAL	FHC Chorode	fhc chorode	Kerala	Kozhikode	0496-2514844	\N	phcchorode@gmail.com	FHC	GOVERNMENT	Chorode	673106	\N	\N	2026-02-27 02:48:32.393759
KL_PHC_KKD_0674	HOSPITAL	FHC Peruvannamuzhy	fhc peruvannamuzhy	Kerala	Kozhikode	0496-2662002	\N	phcmoozhi@gmail.com	FHC	GOVERNMENT	Peruvannamuzhy Dam	673528	\N	\N	2026-02-27 02:48:32.394097
KL_PHC_KKD_0675	HOSPITAL	PHC Keezhariyur	phc keezhariyur	Kerala	Kozhikode	0496-2695818	\N	fhckeezhariyur@gmail.com	PHC	GOVERNMENT	Keezhariyur	673307	\N	\N	2026-02-27 02:48:32.39445
KL_PHC_KKD_0676	HOSPITAL	PHC Pannikottur	phc pannikottur	Kerala	Kozhikode	0496-2248760	\N	phcpannikkottur@gmail.com	PHC	GOVERNMENT	Pannikottur	\N	\N	\N	2026-02-27 02:48:32.394828
KL_PHC_KKD_0677	HOSPITAL	FHC Purameri	fhc purameri	Kerala	Kozhikode	0496-2581880	\N	phcpuramery@gmail.com	FHC	GOVERNMENT	Purameri	673503	\N	\N	2026-02-27 02:48:32.395169
KL_PHC_KKD_0678	HOSPITAL	FHC Narippatta	fhc narippatta	Kerala	Kozhikode	0496-2447383	\N	phcnarippatta@gmail.com	FHC	GOVERNMENT	Narippatta	673506	\N	\N	2026-02-27 02:48:32.395504
KL_PHC_KKD_0679	HOSPITAL	FHC Vanimel	fhc vanimel	Kerala	Kozhikode	0496-2562904	\N	phcvanimel@gmail.com	FHC	GOVERNMENT	Parappupara, Vanimel	673506	\N	\N	2026-02-27 02:48:32.395839
KL_PHC_KKD_0680	HOSPITAL	FHC Chekkiad	fhc chekkiad	Kerala	Kozhikode	0496-2963965	\N	fhcchekkiad@gmail.com	FHC	GOVERNMENT	Chekkiad	673509	\N	\N	2026-02-27 02:48:32.396167
KL_PHC_KKD_0681	HOSPITAL	FHC Maruthonkara	fhc maruthonkara	Kerala	Kozhikode	0496-2935530	\N	phcmaruthomkara@gmail.com	FHC	GOVERNMENT	Maruthonkara	673513	\N	\N	2026-02-27 02:48:32.396497
KL_PHC_KKD_0682	HOSPITAL	FHC Perumanna	fhc perumanna	Kerala	Kozhikode	0495-2966824	\N	phcperumanna@gmail.com	FHC	GOVERNMENT	Perumanna	673019	\N	\N	2026-02-27 02:48:32.396859
KL_PHC_KKD_0683	HOSPITAL	FHC Madavoor	fhc madavoor	Kerala	Kozhikode	0495-2244094	\N	momadavoor@gmail.com	FHC	GOVERNMENT	Madavoor	673585	\N	\N	2026-02-27 02:48:32.397196
KL_PHC_KKD_0684	HOSPITAL	PHC Kattippara	phc kattippara	Kerala	Kozhikode	0496-2270335	\N	phckattippara@gmail.com	PHC	GOVERNMENT	Madarimukku–Kattippara Road, Kedavur	673615	\N	\N	2026-02-27 02:48:32.397559
KL_PHC_KKD_0685	HOSPITAL	FHC Kolathur	fhc kolathur	Kerala	Kozhikode	0495-2456191	\N	phckolathur@gmail.com	FHC	GOVERNMENT	Kolathur	673315	\N	\N	2026-02-27 02:48:32.397894
KL_PHC_KKD_0686	HOSPITAL	FHC Puthiyappa	fhc puthiyappa	Kerala	Kozhikode	0495-2460100	\N	phcputhiyappa@gmail.com	FHC	GOVERNMENT	Puthiyangadi, Puthiyappa	673001	\N	\N	2026-02-27 02:48:32.398224
KL_PHC_KKD_0687	HOSPITAL	FHC Irivalloor	fhc irivalloor	Kerala	Kozhikode	0495-2260575	\N	iruvalloorphc@gmail.com	FHC	GOVERNMENT	Irivalloor P.O, Chelannur	673616	\N	\N	2026-02-27 02:48:32.398555
KL_PHC_KKD_0688	HOSPITAL	FHC Maniyoor	fhc maniyoor	Kerala	Kozhikode	0496-2537350	\N	\N	FHC	GOVERNMENT	Maniyur	673523	\N	\N	2026-02-27 02:48:32.398888
KL_PHC_KKD_0689	HOSPITAL	FHC Villiappally	fhc villiappally	Kerala	Kozhikode	0496-2534200	\N	phcvlpy@gmail.com	FHC	GOVERNMENT	Villiappalli	673542	\N	\N	2026-02-27 02:48:32.399223
KL_PHC_KKD_0690	HOSPITAL	FHC Moodadi	fhc moodadi	Kerala	Kozhikode	0496-2966150	\N	fhcmoodadi@gmail.com	FHC	GOVERNMENT	Moodadi	673307	\N	\N	2026-02-27 02:48:32.399556
KL_PHC_KKD_0691	HOSPITAL	FHC Chengottukavu	fhc chengottukavu	Kerala	Kozhikode	0496-2960564	\N	phcchengottukavu@gmail.com	FHC	GOVERNMENT	Edakkulam, Chengottukavu	673306	\N	\N	2026-02-27 02:48:32.399891
KL_PHC_KKD_0692	HOSPITAL	FHC Chaliyam	fhc chaliyam	Kerala	Kozhikode	0495-2470425	\N	chaliyamphc@gmail.com	FHC	GOVERNMENT	Chaliyam	673301	\N	\N	2026-02-27 02:48:32.400225
KL_PHC_KKD_0693	HOSPITAL	PHC Vellimadukunnu	phc vellimadukunnu	Kerala	Kozhikode	0495-2373713	\N	govtdispensaryngoqts@gmail.com	PHC	GOVERNMENT	Vellimadukunnu	673017	\N	\N	2026-02-27 02:48:32.400557
KL_PHC_KKD_0694	HOSPITAL	FHC Kunnamangalam	fhc kunnamangalam	Kerala	Kozhikode	0495-2965170	\N	mophckglm@gmail.com	FHC	GOVERNMENT	Kunnamangalam	673570	\N	\N	2026-02-27 02:48:32.401071
KL_PHC_KKD_0695	HOSPITAL	FHC Puthuppady	fhc puthuppady	Kerala	Kozhikode	0496-2234190	\N	phcputhuppadi@gmail.com	FHC	GOVERNMENT	Puthuppady	673573	\N	\N	2026-02-27 02:48:32.401411
KL_PHC_KKD_0696	HOSPITAL	FHC Ramanattukara	fhc ramanattukara	Kerala	Kozhikode	0495-2441600	\N	fhcramanattukara@gmail.com	FHC	GOVERNMENT	Ramanattukara	673632	\N	\N	2026-02-27 02:48:32.401744
KL_PHC_KKD_0697	HOSPITAL	FHC Vadakara	fhc vadakara	Kerala	Kozhikode	0496-2952122	\N	gfdvatakara@gmail.com	FHC	GOVERNMENT	Puvvadan Gate Road, Nalupurayil	673103	\N	\N	2026-02-27 02:48:32.402075
KL_PHC_KKD_0698	HOSPITAL	FHC Kottoor	fhc kottoor	Kerala	Kozhikode	0496-2656675	\N	medicalofficerktr@gmail.com	FHC	GOVERNMENT	Koottalida, Avidanallur	673614	\N	\N	2026-02-27 02:48:32.402412
KL_PHC_KKD_0699	HOSPITAL	FHC Nochad	fhc nochad	Kerala	Kozhikode	0496-2613344	\N	phcnochadu@gmail.com	FHC	GOVERNMENT	Nochad	673624	\N	\N	2026-02-27 02:48:32.402745
KL_PHC_KKD_0700	HOSPITAL	FHC Kayakkodi	fhc kayakkodi	Kerala	Kozhikode	0496-2587087	\N	phckayakkodi@gmail.com	FHC	GOVERNMENT	Thidangayullathara, Kayakkodi, Akkal P.O	673513	\N	\N	2026-02-27 02:48:32.403078
KL_PHC_KKD_0701	HOSPITAL	FHC Omassery	fhc omassery	Kerala	Kozhikode	0495-2282600	\N	phcomassery@gmail.com	FHC	GOVERNMENT	Omassery	673582	\N	\N	2026-02-27 02:48:32.403413
KL_PHC_KKD_0702	HOSPITAL	FHC Kakkodi	fhc kakkodi	Kerala	Kozhikode	0495-2265111	\N	kakkodiphc@gmail.com	FHC	GOVERNMENT	Kakkodi	673611	\N	\N	2026-02-27 02:48:32.403741
KL_PHC_KKD_0703	HOSPITAL	FHC Ayanchery	fhc ayanchery	Kerala	Kozhikode	0496-2966353	\N	phcayancheri@gmail.com	FHC	GOVERNMENT	Ayanchery	673544	\N	\N	2026-02-27 02:48:32.404071
KL_PHC_KKD_0704	HOSPITAL	FHC Arikkulam	fhc arikkulam	Kerala	Kozhikode	0496-2696731	\N	phcakl@gmail.com	FHC	GOVERNMENT	Arikkulam	673620	\N	\N	2026-02-27 02:48:32.404429
KL_PHC_KKD_0705	HOSPITAL	FHC Irringal (Kottakkal)	fhc irringal kottakkal	Kerala	Kozhikode	0496-2602366	\N	iringalphckottakkal@gmail.com	FHC	GOVERNMENT	Kottakkal, Iringal	673521	\N	\N	2026-02-27 02:48:32.404769
KL_PHC_KKD_0706	HOSPITAL	FHC Edachery	fhc edachery	Kerala	Kozhikode	0496-2441115	\N	mophcedachery@gmail.com	FHC	GOVERNMENT	Kachery P.O, Vadakara	673502	\N	\N	2026-02-27 02:48:32.40511
KL_PHC_WYD_0707	HOSPITAL	PHC Mullankolly	phc mullankolly	Kerala	Wayanad	04936-234799	\N	phc.mullankolly@gmail.com	PHC	GOVERNMENT	Padichira P.O, Mullankolly, Pulpally	673579	\N	\N	2026-02-27 02:48:32.405492
KL_PHC_WYD_0708	HOSPITAL	PHC Chulliyode	phc chulliyode	Kerala	Wayanad	04936-266049	\N	phc.chulliyode@gmail.com	PHC	GOVERNMENT	Chulliyode P.O	673592	\N	\N	2026-02-27 02:48:32.405853
KL_PHC_WYD_0709	HOSPITAL	PHC Varadoor	phc varadoor	Kerala	Wayanad	04936-294366	\N	mofhcvarwyd.hsd@kerala.gov.in	PHC	GOVERNMENT	Varadoor P.O	673591	\N	\N	2026-02-27 02:48:32.406245
KL_PHC_WYD_0710	HOSPITAL	PHC Kappukunnu	phc kappukunnu	Kerala	Wayanad	04936-273322	\N	phc.kappukunnu@gmail.com	PHC	GOVERNMENT	Padinjarathara P.O	673575	\N	\N	2026-02-27 02:48:32.40659
KL_PHC_WYD_0711	HOSPITAL	FHC Mooppainad	fhc mooppainad	Kerala	Wayanad	04936-294370	\N	fhcmoopainad@gmail.com	FHC	GOVERNMENT	Padivayal, Vaduvanchal P.O	673581	\N	\N	2026-02-27 02:48:32.406922
KL_PHC_WYD_0712	HOSPITAL	PHC Valad	phc valad	Kerala	Wayanad	04935-266586	\N	phc.valad@gmail.com	PHC	GOVERNMENT	Valad P.O	670645	\N	\N	2026-02-27 02:48:32.407253
KL_PHC_WYD_0713	HOSPITAL	FHC Edavaka	fhc edavaka	Kerala	Wayanad	04935-296906	\N	mofhcedawyd.hsd@kerala.gov.in	FHC	GOVERNMENT	Ellumannam P.O, Mananthavady Via	670645	\N	\N	2026-02-27 02:48:32.40761
KL_PHC_WYD_0714	HOSPITAL	FHC Vellamunda	fhc vellamunda	Kerala	Wayanad	04935-296562	\N	fhcvellamunda@gmail.com	FHC	GOVERNMENT	Vellamunda P.O	670731	\N	\N	2026-02-27 02:48:32.407938
KL_PHC_WYD_0715	HOSPITAL	FHC Cheeral	fhc cheeral	Kerala	Wayanad	04936-262216	\N	phc.cheeral@gmail.com	FHC	GOVERNMENT	Cheeral P.O	673595	\N	\N	2026-02-27 02:48:32.408308
KL_PHC_WYD_0716	HOSPITAL	FHC Vazhavatta	fhc vazhavatta	Kerala	Wayanad	04936-249495	\N	fhcvazhavatta@gmail.com	FHC	GOVERNMENT	Vazhavatta P.O	673122	\N	\N	2026-02-27 02:48:32.408636
KL_PHC_WYD_0717	HOSPITAL	PHC Kurukkanmoola	phc kurukkanmoola	Kerala	Wayanad	04935-215320	\N	phc.kurukkanmoola@gmail.com	PHC	GOVERNMENT	Payyampally P.O, Mananthavady	670646	\N	\N	2026-02-27 02:48:32.408982
KL_PHC_WYD_0718	HOSPITAL	FHC Thondernad	fhc thondernad	Kerala	Wayanad	04935-235909	\N	fhcthondernadwynd@gmail.com	FHC	GOVERNMENT	Thondernad P.O	670731	\N	\N	2026-02-27 02:48:32.409321
KL_PHC_WYD_0719	HOSPITAL	FHC Begur	fhc begur	Kerala	Wayanad	04935-250758	\N	mophcbegur@gmail.com	FHC	GOVERNMENT	Kattikulam P.O	670646	\N	\N	2026-02-27 02:48:32.409654
KL_PHC_WYD_0720	HOSPITAL	FHC Sugandhagiri	fhc sugandhagiri	Kerala	Wayanad	9446581101	\N	phc.sugandhagiri@gmail.com	FHC	GOVERNMENT	Sugandhagiri P.O	673575	\N	\N	2026-02-27 02:48:32.409984
KL_PHC_WYD_0721	HOSPITAL	FHC Pozhuthana	fhc pozhuthana	Kerala	Wayanad	04936-296107	\N	phc.pozhuthana@gmail.com	FHC	GOVERNMENT	Pozhuthana P.O	673575	\N	\N	2026-02-27 02:48:32.410323
KL_PHC_WYD_0722	HOSPITAL	FHC Kottathara	fhc kottathara	Kerala	Wayanad	9447963008	\N	phc.kottathara@gmail.com	FHC	GOVERNMENT	Valal, Madakunnu P.O	673122	\N	\N	2026-02-27 02:48:32.410881
KL_PHC_WYD_0723	HOSPITAL	FHC Padinjarathara	fhc padinjarathara	Kerala	Wayanad	9947769229	\N	phc.padinjarathara@gmail.com	FHC	GOVERNMENT	Mundakutty P.O, Bankkunnu	670645	\N	\N	2026-02-27 02:48:32.411258
KL_PHC_WYD_0724	HOSPITAL	FHC Pakkom	fhc pakkom	Kerala	Wayanad	9544007439	\N	phc.pakkom@gmail.com	FHC	GOVERNMENT	Pakkom P.O	673579	\N	\N	2026-02-27 02:48:32.411593
KL_PHC_WYD_0725	HOSPITAL	FHC Chethalayam	fhc chethalayam	Kerala	Wayanad	04936-238007	\N	phc.chethalayam@gmail.com	FHC	GOVERNMENT	Chethalayam P.O, Sulthan Bathery	673592	\N	\N	2026-02-27 02:48:32.411934
KL_PHC_WYD_0726	HOSPITAL	FHC Appapara	fhc appapara	Kerala	Wayanad	04935-210452	\N	phc.appapara@gmail.com	FHC	GOVERNMENT	Thirunelli P.O	670646	\N	\N	2026-02-27 02:48:32.41228
KL_PHC_WYD_0727	HOSPITAL	FHC Poothady	fhc poothady	Kerala	Wayanad	04936-211110	\N	mofhcpoowyd.hsd@keralal.gov.in	FHC	GOVERNMENT	Kenichira P.O	673596	\N	\N	2026-02-27 02:48:32.41261
KL_PHC_WYD_0728	HOSPITAL	FHC Noolpuzha	fhc noolpuzha	Kerala	Wayanad	04936-270604	\N	phc.noolpuzha@gmail.com	FHC	GOVERNMENT	Naiketty P.O, Sulthan Bathery	673592	\N	\N	2026-02-27 02:48:32.412952
KL_PHC_WYD_0729	HOSPITAL	FHC Vengapally	fhc vengapally	Kerala	Wayanad	04936-288344	\N	phc.vengapally@gmail.com	FHC	GOVERNMENT	Thekkumthara P.O	673122	\N	\N	2026-02-27 02:48:32.413289
KL_PHC_KNR_0730	HOSPITAL	PHC Naduvil	phc naduvil	Kerala	Kannur	0460-2250901	\N	phcnaduvil@gmail.com	PHC	GOVERNMENT	Naduvil P.O	670582	\N	\N	2026-02-27 02:48:32.41362
KL_PHC_KNR_0731	HOSPITAL	PHC Chuzhali	phc chuzhali	Kerala	Kannur	0460-2261687	\N	phcchuzhali@gmail.com	PHC	GOVERNMENT	Thatteri, Chuzhali P.O	670602	\N	\N	2026-02-27 02:48:32.413955
KL_PHC_KNR_0732	HOSPITAL	PHC Muttam	phc muttam	Kerala	Kannur	0497-2875956	\N	muttomphc@yahoo.com	PHC	GOVERNMENT	Vengara P.O	670305	\N	\N	2026-02-27 02:48:32.414297
KL_PHC_KNR_0733	HOSPITAL	PHC Alakkad	phc alakkad	Kerala	Kannur	0460-2281400	\N	phcalakkad@gmail.com	PHC	GOVERNMENT	Eriam P.O, Mathamangalam Via	670306	\N	\N	2026-02-27 02:48:32.414653
KL_PHC_KNR_0734	HOSPITAL	PHC Eruvessy	phc eruvessy	Kerala	Kannur	0460-2292239	\N	moeruvessy@gmail.com	PHC	GOVERNMENT	Pooparamba P.O	670632	\N	\N	2026-02-27 02:48:32.414989
KL_PHC_KNR_0735	HOSPITAL	PHC Kolachery	phc kolachery	Kerala	Kannur	0460-2244500	\N	phckolachery@gmail.com	PHC	GOVERNMENT	Kolachery P.O	670604	\N	\N	2026-02-27 02:48:32.415322
KL_PHC_KNR_0736	HOSPITAL	PHC Pampuruthy	phc pampuruthy	Kerala	Kannur	0497-2244786	\N	pampuruthyphc@gmail.com	PHC	GOVERNMENT	Narath P.O	670601	\N	\N	2026-02-27 02:48:32.415666
KL_PHC_KNR_0737	HOSPITAL	PHC Chandanakkampara	phc chandanakkampara	Kerala	Kannur	0460-2214300	\N	phcckpara@gmail.com	PHC	GOVERNMENT	Chandanakkampara P.O	670633	\N	\N	2026-02-27 02:48:32.416005
KL_PHC_KNR_0738	HOSPITAL	PHC Karikkottakkari	phc karikkottakkari	Kerala	Kannur	0490-2456111	\N	phckarikkotakari@gmail.com	PHC	GOVERNMENT	Karikkottakkari P.O	\N	\N	\N	2026-02-27 02:48:32.416343
KL_PHC_KNR_0739	HOSPITAL	PHC Angadikadavu	phc angadikadavu	Kerala	Kannur	0490-2427270	\N	phcangadi@gmail.com	PHC	GOVERNMENT	Angadikadavu P.O	670706	\N	\N	2026-02-27 02:48:32.416679
KL_PHC_KNR_0740	HOSPITAL	PHC Urathur	phc urathur	Kerala	Kannur	0460-2278312	\N	phcurathur@gmail.com	PHC	GOVERNMENT	Kosavanvayal P.O	670593	\N	\N	2026-02-27 02:48:32.41701
KL_PHC_KNR_0741	HOSPITAL	PHC Keezhallur	phc keezhallur	Kerala	Kannur	0490-2485930	\N	phckeezhallur@gmail.com	PHC	GOVERNMENT	Edayannur P.O	670595	\N	\N	2026-02-27 02:48:32.417339
KL_PHC_KNR_0742	HOSPITAL	PHC Kudiyanmala	phc kudiyanmala	Kerala	Kannur	8129503266	\N	phckudiyanmala@gmail.com	PHC	GOVERNMENT	Kudiyanmala P.O	670582	\N	\N	2026-02-27 02:48:32.417672
KL_PHC_KNR_0743	HOSPITAL	PHC Manakkadavu	phc manakkadavu	Kerala	Kannur	0460-2287188	\N	phcmanakkadavu@gmail.com	PHC	GOVERNMENT	Manakkadavu P.O, Alakode	670571	\N	\N	2026-02-27 02:48:32.418032
KL_PHC_KNR_0744	HOSPITAL	FHC Ezhome	fhc ezhome	Kerala	Kannur	04972-815163	\N	phcezhome@gmail.com	FHC	GOVERNMENT	Ezhome P.O	670334	\N	\N	2026-02-27 02:48:32.418371
KL_PHC_KNR_0745	HOSPITAL	FHC Panniyannur	fhc panniyannur	Kerala	Kannur	0490-2312730	\N	phcpanniyannur@gmail.com	FHC	GOVERNMENT	Panniyannur P.O	670671	\N	\N	2026-02-27 02:48:32.418711
KL_PHC_KNR_0746	HOSPITAL	PHC Cherukunnu	phc cherukunnu	Kerala	Kannur	0497-2863455	\N	mocuuphc@gmail.com	PHC	GOVERNMENT	Cherukunnu (RS)	670301	\N	\N	2026-02-27 02:48:32.419042
KL_PHC_KNR_0747	HOSPITAL	PHC Kottayam Malabar	phc kottayam malabar	Kerala	Kannur	0490-2930796	\N	phckottayammalabar@gmail.com	PHC	GOVERNMENT	Poolabazar, Kottyampoyil P.O	670691	\N	\N	2026-02-27 02:48:32.419376
KL_PHC_KNR_0748	HOSPITAL	FHC Puzhathy	fhc puzhathy	Kerala	Kannur	0497-2748950	\N	medicalofficerphcpuzhathy@gmail.com	FHC	GOVERNMENT	Kottali P.O	670005	\N	\N	2026-02-27 02:48:32.419716
KL_PHC_KNR_0749	HOSPITAL	FHC Pallikunnu	fhc pallikunnu	Kerala	Kannur	0497-2744020	\N	phcpallikunnu@gmail.com	FHC	GOVERNMENT	Palliyamoola, Alavil P.O	670008	\N	\N	2026-02-27 02:48:32.420205
KL_PHC_KNR_0750	HOSPITAL	FHC Kanichar	fhc kanichar	Kerala	Kannur	0490-2445422	\N	mophcknr@gmail.com	FHC	GOVERNMENT	Kolakkad P.O	670673	\N	\N	2026-02-27 02:48:32.42054
KL_PHC_KNR_0751	HOSPITAL	FHC Chalil	fhc chalil	Kerala	Kannur	0490-2343450	\N	phcchalil@gmail.com	FHC	GOVERNMENT	Templegate P.O, Thalassery	670102	\N	\N	2026-02-27 02:48:32.42087
KL_PHC_KNR_0752	HOSPITAL	FHC Cherukunnu	fhc cherukunnu	Kerala	Kannur	0497-2864140	\N	phccherukunnu@gmail.com	FHC	GOVERNMENT	Cherukunnu P.O	670301	\N	\N	2026-02-27 02:48:32.421226
KL_PHC_KNR_0753	HOSPITAL	FHC Pulingome	fhc pulingome	Kerala	Kannur	0498-5213808	\N	phcpulingome@gmail.com	FHC	GOVERNMENT	Chunda Post	670511	\N	\N	2026-02-27 02:48:32.421557
KL_PHC_KNR_0754	HOSPITAL	FHC Koodali	fhc koodali	Kerala	Kannur	0497-2858779	\N	koodaliphc@gmail.com	FHC	GOVERNMENT	Koodali P.O	670592	\N	\N	2026-02-27 02:48:32.421897
KL_PHC_KNR_0755	HOSPITAL	FHC Udayagiri	fhc udayagiri	Kerala	Kannur	0460-2287111	\N	phcudayagiri@gmail.com	FHC	GOVERNMENT	Udayagiri P.O	670571	\N	\N	2026-02-27 02:48:32.422226
KL_PHC_KNR_0756	HOSPITAL	FHC Parassinikadavu	fhc parassinikadavu	Kerala	Kannur	0497-2780025	\N	phc.parassini@gmail.com	FHC	GOVERNMENT	Parassinikadavu P.O	670563	\N	\N	2026-02-27 02:48:32.42256
KL_PHC_KNR_0757	HOSPITAL	FHC Chengalayi	fhc chengalayi	Kerala	Kannur	0460-2233088	\N	mphcchengalayi0@gmail.com	FHC	GOVERNMENT	Chengalayi P.O	670631	\N	\N	2026-02-27 02:48:32.42292
KL_PHC_KNR_0758	HOSPITAL	FHC Ettikulam	fhc ettikulam	Kerala	Kannur	0498-5230372	\N	ettikulamphc@gmail.com	FHC	GOVERNMENT	Ettikulam P.O	670308	\N	\N	2026-02-27 02:48:32.423249
KL_PHC_KNR_0759	HOSPITAL	FHC Ulikkal	fhc ulikkal	Kerala	Kannur	0460-2254360	\N	mophculikkal@gmail.com	FHC	GOVERNMENT	Puravayal Vattiamthode P.O	670705	\N	\N	2026-02-27 02:48:32.423582
KL_PHC_KNR_0760	HOSPITAL	FHC Narath	fhc narath	Kerala	Kannur	0460-2243777	\N	narathphc@gmail.com	FHC	GOVERNMENT	Narath P.O	670604	\N	\N	2026-02-27 02:48:32.423911
KL_PHC_KNR_0761	HOSPITAL	FHC Chirakkal	fhc chirakkal	Kerala	Kannur	0497-2777280	\N	phcchirakkal@gmail.com	FHC	GOVERNMENT	Chirakkal	670011	\N	\N	2026-02-27 02:48:32.424247
KL_PHC_KNR_0762	HOSPITAL	FHC Aralam Farm	fhc aralam farm	Kerala	Kannur	9447673200	\N	phcaralamfarm@gmail.com	FHC	GOVERNMENT	Aralam Farm Block-7	670673	\N	\N	2026-02-27 02:48:32.424609
KL_PHC_KNR_0763	HOSPITAL	FHC Vallithode	fhc vallithode	Kerala	Kannur	0490-2421232	\N	phcvalllithode@gmail.com	FHC	GOVERNMENT	Kiliyanthara P.O	670706	\N	\N	2026-02-27 02:48:32.42494
KL_PHC_KNR_0764	HOSPITAL	FHC Muzhakunnu	fhc muzhakunnu	Kerala	Kannur	0490-2458900	\N	mophckkd@gmail.com	FHC	GOVERNMENT	Muzhakunnu	670673	\N	\N	2026-02-27 02:48:32.425278
KL_PHC_KNR_0765	HOSPITAL	FHC Dharmadam	fhc dharmadam	Kerala	Kannur	0490-2346211	\N	phcdharmadam@gmail.com	FHC	GOVERNMENT	Palayad P.O	670661	\N	\N	2026-02-27 02:48:32.425637
KL_PHC_KNR_0766	HOSPITAL	FHC Peralassery	fhc peralassery	Kerala	Kannur	0497-2081048	\N	peralasseryphc@gmail.com	FHC	GOVERNMENT	Pothuvachery P.O	670621	\N	\N	2026-02-27 02:48:32.425995
KL_PHC_KNR_0767	HOSPITAL	FHC Vengad	fhc vengad	Kerala	Kannur	0490-2968420	\N	phcvengad@gmail.com	FHC	GOVERNMENT	Pathiriyad P.O	670741	\N	\N	2026-02-27 02:48:32.426659
KL_PHC_KNR_0768	HOSPITAL	FHC Anjarakkandy	fhc anjarakkandy	Kerala	Kannur	0497-2852530	\N	phcanjarakandy@gmail.com	FHC	GOVERNMENT	Kannadivelicham, Muringeri P.O	670612	\N	\N	2026-02-27 02:48:32.427045
KL_PHC_KNR_0769	HOSPITAL	FHC Kadachira	fhc kadachira	Kerala	Kannur	0497-2824550	\N	phckadachira@gmail.ocm	FHC	GOVERNMENT	Kadachira	670621	\N	\N	2026-02-27 02:48:32.427423
KL_PHC_KNR_0770	HOSPITAL	FHC Kuttiattoor	fhc kuttiattoor	Kerala	Kannur	0460-2610670	\N	phckuttiattoor@gmail.com	FHC	GOVERNMENT	Chattukappara P.O	670602	\N	\N	2026-02-27 02:48:32.427811
KL_PHC_KNR_0771	HOSPITAL	FHC Eramam Kuttur	fhc eramam kuttur	Kerala	Kannur	0498-5278155	\N	phckuttur@gmail.com	FHC	GOVERNMENT	Kuttur P.O, Mathamangalam	670306	\N	\N	2026-02-27 02:48:32.428188
KL_PHC_KNR_0772	HOSPITAL	FHC Ramanthali	fhc ramanthali	Kerala	Kannur	0498-5222513	\N	phcramanthali@gmail.com	FHC	GOVERNMENT	Ramanthali P.O	670308	\N	\N	2026-02-27 02:48:32.428565
KL_PHC_KNR_0773	HOSPITAL	FHC Kunhimangalam	fhc kunhimangalam	Kerala	Kannur	0497-2812333	\N	fhckunhimangalam@gmail.com	FHC	GOVERNMENT	Kunhimangalam P.O	670309	\N	\N	2026-02-27 02:48:32.42893
KL_PHC_KNR_0774	HOSPITAL	FHC Pattuvam	fhc pattuvam	Kerala	Kannur	0460-2220990	\N	phcpattuvam@gmail.com	FHC	GOVERNMENT	Pattuvam P.O	670143	\N	\N	2026-02-27 02:48:32.429272
KL_PHC_KNR_0775	HOSPITAL	FHC Kadannappally	fhc kadannappally	Kerala	Kannur	0498-5278992	\N	phckadannappally@gmail.com	FHC	GOVERNMENT	Kandonthar, Mathamangalam P.O	670306	\N	\N	2026-02-27 02:48:32.429616
KL_PHC_KNR_0776	HOSPITAL	FHC Puthiyangadi Fisheries	fhc puthiyangadi fisheries	Kerala	Kannur	0497-2877826	\N	fphcputhiyangadi@gmail.com	PHC	GOVERNMENT	Near Puthiyangadi Bus Stand, Madayi P.O	670304	\N	\N	2026-02-27 02:48:32.429965
KL_PHC_KNR_0777	HOSPITAL	FHC Kannapuram	fhc kannapuram	Kerala	Kannur	0497-2863468	\N	phckannapuram@gmail.com	FHC	GOVERNMENT	Mottammal P.O	670331	\N	\N	2026-02-27 02:48:32.43063
KL_PHC_KNR_0778	HOSPITAL	FHC Kalliassery	fhc kalliassery	Kerala	Kannur	04972-783499	\N	phckalliassery@gmail.com	FHC	GOVERNMENT	Kalliassery	670562	\N	\N	2026-02-27 02:48:32.430989
KL_PHC_KNR_0779	HOSPITAL	FHC Eranholi	fhc eranholi	Kerala	Kannur	0490-2354039	\N	phceranholi@gmail.com	FHC	GOVERNMENT	Moozhikkara, Eengayipeedika	670102	\N	\N	2026-02-27 02:48:32.431336
KL_PHC_KNR_0780	HOSPITAL	FHC Kodiyeri	fhc kodiyeri	Kerala	Kannur	0490-2356102	\N	phckodiyeri@gmail.com	FHC	GOVERNMENT	Kodiyeri	670102	\N	\N	2026-02-27 02:48:32.431683
KL_PHC_KNR_0781	HOSPITAL	FHC New Mahe	fhc new mahe	Kerala	Kannur	0490-2359801	\N	phcnewmahe@gmail.com	FHC	GOVERNMENT	Kurichiyil P.O, New Mahe	670102	\N	\N	2026-02-27 02:48:32.432052
KL_PHC_KNR_0782	HOSPITAL	FHC Chokli	fhc chokli	Kerala	Kannur	0490-2330522	\N	phcchockli@gmail.com	FHC	GOVERNMENT	Olavilam P.O, Chokli	673313	\N	\N	2026-02-27 02:48:32.432702
KL_PHC_KNR_0783	HOSPITAL	FHC Peruva	fhc peruva	Kerala	Kannur	0490-2303777	\N	phcperua@gmail.com	FHC	GOVERNMENT	Peruva P.O	670650	\N	\N	2026-02-27 02:48:32.433327
KL_PHC_KNR_0784	HOSPITAL	FHC Mangattidam	fhc mangattidam	Kerala	Kannur	0490-2308670	\N	phcmangattidam@gmail.com	FHC	GOVERNMENT	Mangattidam P.O	670643	\N	\N	2026-02-27 02:48:32.434071
KL_PHC_KNR_0785	HOSPITAL	PHC Maloor	phc maloor	Kerala	Kannur	0490-2401510	\N	phcmaloor@gmail.com	PHC	GOVERNMENT	Tholambra P.O	670673	\N	\N	2026-02-27 02:48:32.434778
KL_PHC_KNR_0786	HOSPITAL	PHC Chapparapadavu	phc chapparapadavu	Kerala	Kannur	0460-2271101	\N	phcchapparapadavu@gmail.com	PHC	GOVERNMENT	Chapparapadavu P.O	670581	\N	\N	2026-02-27 02:48:32.435497
KL_PHC_KNR_0787	HOSPITAL	FHC Kurumathur	fhc kurumathur	Kerala	Kannur	0460-2969177	\N	phckurumatur@gmail.com	FHC	GOVERNMENT	Bavuparamba, Kurumathur P.O	670142	\N	\N	2026-02-27 02:48:32.436073
KL_PHC_KNR_0788	HOSPITAL	Fisheries FHC Morazha	fisheries fhc morazha	Kerala	Kannur	0497-2784401	\N	phcmorazha@gmail.com	FHC	GOVERNMENT	Morazha P.O, Vellikkeel	670331	\N	\N	2026-02-27 02:48:32.436558
KL_PHC_KNR_0789	HOSPITAL	PHC Pariyaram	phc pariyaram	Kerala	Kannur	0460-2208711	\N	pariyaramphc@gmail.com	PHC	GOVERNMENT	Koranpeedika, Chithappile Poyil P.O	670502	\N	\N	2026-02-27 02:48:32.437011
KL_PHC_KNR_0790	HOSPITAL	PHC Edakkad	phc edakkad	Kerala	Kannur	0497-2823904	\N	phcedakkadmedi@gmail.com	PHC	GOVERNMENT	Attadappa P.O	670006	\N	\N	2026-02-27 02:48:32.437469
KL_PHC_KNR_0791	HOSPITAL	FHC Elayavoor	fhc elayavoor	Kerala	Kannur	0497-2722485	\N	phcelayavur@gmail.com	FHC	GOVERNMENT	Mundayad P.O	670594	\N	\N	2026-02-27 02:48:32.438331
KL_PHC_KNR_0792	HOSPITAL	FHC Mokeri	fhc mokeri	Kerala	Kannur	0490-2313337	\N	phcmokeri@gmail.com	FHC	GOVERNMENT	Pathayakkunnu P.O	670691	\N	\N	2026-02-27 02:48:32.43885
KL_PHC_KNR_0793	HOSPITAL	FHC Kunnothparamba	fhc kunnothparamba	Kerala	Kannur	0490-2375805	\N	phckunnothparamba@gmail.com	FHC	GOVERNMENT	Nillangal, Chendayad P.O	670692	\N	\N	2026-02-27 02:48:32.439274
KL_PHC_KNR_0794	HOSPITAL	PHC Thriprangottur	phc thriprangottur	Kerala	Kannur	0490-2392350	\N	phcthriprangottur@gmail.com	PHC	GOVERNMENT	Kadavathur P.O, Thendaparamba	670676	\N	\N	2026-02-27 02:48:32.439745
KL_PHC_KNR_0795	HOSPITAL	FHC Peringalam	fhc peringalam	Kerala	Kannur	0490-2393565	\N	phcperingalam@gmail.com	FHC	GOVERNMENT	Aniyaram P.O	670672	\N	\N	2026-02-27 02:48:32.440301
KL_PHC_KNR_0796	HOSPITAL	FHC Mekkunnu	fhc mekkunnu	Kerala	Kannur	0490-2393340	\N	phcmekkunnu@gmail.com	FHC	GOVERNMENT	Mekkunnu P.O	670675	\N	\N	2026-02-27 02:48:32.440813
KL_PHC_KSD_0839	HOSPITAL	FHC Bellur	fhc bellur	Kerala	Kasaragod	04998-266788	\N	bellurphc@gmail.com	FHC	GOVERNMENT	Bellur P.O	\N	\N	\N	2026-02-27 02:48:32.461345
KL_PHC_KNR_0797	HOSPITAL	FHC Chittariparamba	fhc chittariparamba	Kerala	Kannur	0490-2301388	\N	phcchittariparamba@gmail.com	FHC	GOVERNMENT	Kannoth P.O, Thodikkalam	670650	\N	\N	2026-02-27 02:48:32.441338
KL_PHC_KNR_0798	HOSPITAL	FHC Kottiyoor	fhc kottiyoor	Kerala	Kannur	0490-2430718	\N	phckotiyoor@gmail.com	FHC	GOVERNMENT	Kottiyoor P.O	670651	\N	\N	2026-02-27 02:48:32.442066
KL_PHC_KNR_0799	HOSPITAL	FHC Cheruthazham	fhc cheruthazham	Kerala	Kannur	0497-2802686	\N	phc.cheruthazham@gmail.com	FHC	GOVERNMENT	Pilathara	670504	\N	\N	2026-02-27 02:48:32.442708
KL_PHC_KNR_0800	HOSPITAL	FHC Valapattanam	fhc valapattanam	Kerala	Kannur	04972-775030	\N	moghvalapattanam@gmail.com	FHC	GOVERNMENT	Valapattanam P.O	670010	\N	\N	2026-02-27 02:48:32.443145
KL_PHC_KNR_0801	HOSPITAL	FHC Malappattam	fhc malappattam	Kerala	Kannur	0460-2235400	\N	grdmalappattam@gmail.com	FHC	GOVERNMENT	Malappattam P.O	670631	\N	\N	2026-02-27 02:48:32.443558
KL_PHC_KNR_0802	HOSPITAL	FHC Kankol Alappadamba	fhc kankol alappadamba	Kerala	Kannur	0498-5283900	\N	phcmathil@gmail.com	FHC	GOVERNMENT	Mathil P.O	670307	\N	\N	2026-02-27 02:48:32.443946
KL_PHC_KNR_0803	HOSPITAL	FHC Thillenkery	fhc thillenkery	Kerala	Kannur	0490-2406696	\N	phcthillenkery@gmail.com	FHC	GOVERNMENT	Thillenkery P.O	670702	\N	\N	2026-02-27 02:48:32.444541
KL_PHC_KNR_0804	HOSPITAL	FHC Alakode (Therthally)	fhc alakode therthally	Kerala	Kannur	0460-2285700	\N	phctherthalli@gmail.com	FHC	GOVERNMENT	Therthally P.O	670571	\N	\N	2026-02-27 02:48:32.444998
KL_PHC_KNR_0805	HOSPITAL	FHC Muzhappilangad	fhc muzhappilangad	Kerala	Kannur	0497-2832952	\N	phcmuzhappilangad@gmail.com	FHC	GOVERNMENT	Muzhappilangad P.O	670662	\N	\N	2026-02-27 02:48:32.445417
KL_PHC_KNR_0806	HOSPITAL	FHC Munderi	fhc munderi	Kerala	Kannur	04972-792454	\N	phcmunderi@gmail.com	FHC	GOVERNMENT	Munderi P.O	670591	\N	\N	2026-02-27 02:48:32.445828
KL_PHC_KNR_0807	HOSPITAL	FHC Kadirur	fhc kadirur	Kerala	Kannur	04972-2305890	\N	phckadirur@gmail.com	FHC	GOVERNMENT	Kadirur P.O	670642	\N	\N	2026-02-27 02:48:32.446184
KL_PHC_KNR_0808	HOSPITAL	FHC Chelora	fhc chelora	Kerala	Kannur	0497-2721549	\N	cheloraphc@gmail.com	FHC	GOVERNMENT	Chelora P.O, Varam	670594	\N	\N	2026-02-27 02:48:32.446547
KL_PHC_KNR_0809	HOSPITAL	FHC Kelakam	fhc kelakam	Kerala	Kannur	0490-2416216	\N	phckelakam@gmail.com	FHC	GOVERNMENT	Kelakam P.O	670674	\N	\N	2026-02-27 02:48:32.447115
KL_PHC_KSD_0810	HOSPITAL	PHC Vellarikkundu	phc vellarikkundu	Kerala	Kasaragod	0467-2242228	\N	mophcv@gmail.com	PHC	GOVERNMENT	Vellarikkundu P.O	671534	\N	\N	2026-02-27 02:48:32.447829
KL_PHC_KSD_0811	HOSPITAL	FHC Karicheri	fhc karicheri	Kerala	Kasaragod	04994-284829	\N	phckaricheri@gmail.com	FHC	GOVERNMENT	Kolathur P.O	671541	\N	\N	2026-02-27 02:48:32.448486
KL_PHC_KSD_0812	HOSPITAL	FHC Bandadka	fhc bandadka	Kerala	Kasaragod	04994-201191	\N	phcbandadka@gmail.com	FHC	GOVERNMENT	Bandadka P.O, Chengala Via	671541	\N	\N	2026-02-27 02:48:32.449197
KL_PHC_KSD_0813	HOSPITAL	FHC Kalanad	fhc kalanad	Kerala	Kasaragod	04994-237086	\N	Pphckalanad@gmail.com	FHC	GOVERNMENT	Kalanad P.O	671317	\N	\N	2026-02-27 02:48:32.449835
KL_PHC_KSD_0814	HOSPITAL	FHC Chengala	fhc chengala	Kerala	Kasaragod	04994-282824	\N	phcchengala@gmail.com	FHC	GOVERNMENT	Chengala P.O	671541	\N	\N	2026-02-27 02:48:32.450478
KL_PHC_KSD_0815	HOSPITAL	FHC Konnakkad	fhc konnakkad	Kerala	Kasaragod	0467-2249105	\N	phc.konnakkad@gmail.com	FHC	GOVERNMENT	Konnakkad P.O, via Vellarikkundu	671534	\N	\N	2026-02-27 02:48:32.451268
KL_PHC_KSD_0816	HOSPITAL	FHC Meenja	fhc meenja	Kerala	Kasaragod	\N	04998-252820	phcmeenja2gmail.com	FHC	GOVERNMENT	Meenja P.O	671323	\N	\N	2026-02-27 02:48:32.45185
KL_PHC_KSD_0817	HOSPITAL	FHC Arikady	fhc arikady	Kerala	Kasaragod	04998-293153	\N	phcarikady@gmail.com	FHC	GOVERNMENT	Kumbla P.O	671321	\N	\N	2026-02-27 02:48:32.452521
KL_PHC_KSD_0818	HOSPITAL	FHC Madhur	fhc madhur	Kerala	Kasaragod	04994-241177	\N	madhurphc@gmail.com	FHC	GOVERNMENT	Maipady P.O	671124	\N	\N	2026-02-27 02:48:32.453395
KL_PHC_KSD_0819	HOSPITAL	FHC Angadimogar	fhc angadimogar	Kerala	Kasaragod	04998-247292	\N	phcangadimogaru@gmail.com	FHC	GOVERNMENT	Ariyappady, Puthige	671321	\N	\N	2026-02-27 02:48:32.454214
KL_PHC_KSD_0820	HOSPITAL	FHC Vaninagar	fhc vaninagar	Kerala	Kasaragod	9446969103	\N	phcvaninagar@gmail.com	FHC	GOVERNMENT	Vaninagar P.O	671552	\N	\N	2026-02-27 02:48:32.454652
KL_PHC_KSD_0821	HOSPITAL	FHC Chittarikkal	fhc chittarikkal	Kerala	Kasaragod	0467-2222131	\N	2021fhcchittarikkal@gmail.com	FHC	GOVERNMENT	Chittarikkal P.O	671326	\N	\N	2026-02-27 02:48:32.455014
KL_PHC_KSD_0822	HOSPITAL	FHC Narkilakkad	fhc narkilakkad	Kerala	Kasaragod	0467-2241888	\N	phcnkd@gmail.com	FHC	GOVERNMENT	Kottamala P.O	671314	\N	\N	2026-02-27 02:48:32.455366
KL_PHC_KSD_0823	HOSPITAL	FHC Valiyaparamba	fhc valiyaparamba	Kerala	Kasaragod	0467-2258800	\N	mophcvaliyaparamba@gmail.com	FHC	GOVERNMENT	Valiyaparamba	\N	\N	\N	2026-02-27 02:48:32.455713
KL_PHC_KSD_0824	HOSPITAL	FHC Padne	fhc padne	Kerala	Kasaragod	0467-2276056	\N	phcpadne@gmail.com	FHC	GOVERNMENT	Padne P.O, Cheruvathur Via	671312	\N	\N	2026-02-27 02:48:32.456063
KL_PHC_KSD_0825	HOSPITAL	FHC Panathur	fhc panathur	Kerala	Kasaragod	04670-2227555	\N	phcpanathur@gmail.com	FHC	GOVERNMENT	Panathur P.O, Rajapuram Via	671532	\N	\N	2026-02-27 02:48:32.456412
KL_PHC_KSD_0826	HOSPITAL	FHC Bayar	fhc bayar	Kerala	Kasaragod	04998-206666	\N	phcbayar@gmail.com	FHC	GOVERNMENT	Bayar P.O	671348	\N	\N	2026-02-27 02:48:32.456757
KL_PHC_KSD_0827	HOSPITAL	FHC Moucode	fhc moucode	Kerala	Kasaragod	0467-2963488	\N	phcmoucode2009@gmail.com	FHC	GOVERNMENT	Perumbatta P.O, Cheruvathur	671313	\N	\N	2026-02-27 02:48:32.457102
KL_PHC_KSD_0828	HOSPITAL	PHC Thaikadappuram	phc thaikadappuram	Kerala	Kasaragod	8547876854	\N	phcthaikadapuram@gmail.com	PHC	GOVERNMENT	Thaikadappuram P.O, Nileshwar Via	671314	\N	\N	2026-02-27 02:48:32.457436
KL_PHC_KSD_0829	HOSPITAL	FHC Thuruthy	fhc thuruthy	Kerala	Kasaragod	0467-2263922	\N	phcturuthi@gmail.com	FHC	GOVERNMENT	Thuruthy P.O	671351	\N	\N	2026-02-27 02:48:32.457767
KL_PHC_KSD_0830	HOSPITAL	FHC Olat	fhc olat	Kerala	Kasaragod	8547705270	\N	phcolatolat@gmail.com	FHC	GOVERNMENT	Olat P.O	671310	\N	\N	2026-02-27 02:48:32.458125
KL_PHC_KSD_0831	HOSPITAL	PHC Mavilakadappuram	phc mavilakadappuram	Kerala	Kasaragod	0467-2080794	\N	phcmavilakadappuram@gmail.com	PHC	GOVERNMENT	Mavilakadappuram P.O	671312	\N	\N	2026-02-27 02:48:32.45866
KL_PHC_KSD_0832	HOSPITAL	FHC Udumbunthala	fhc udumbunthala	Kerala	Kasaragod	0467-2271080	\N	phcudumbunthala@gmail.com	FHC	GOVERNMENT	Udumbunthala P.O	671311	\N	\N	2026-02-27 02:48:32.459012
KL_PHC_KSD_0833	HOSPITAL	FHC Ajanur	fhc ajanur	Kerala	Kasaragod	0467-2204985	\N	phcajanur@gmail.com	FHC	GOVERNMENT	Klavayal P.O, Ajanur	671531	\N	\N	2026-02-27 02:48:32.459347
KL_PHC_KSD_0834	HOSPITAL	FHC Madikai	fhc madikai	Kerala	Kasaragod	0467-2269612	\N	phcmadikai@gmail.com	FHC	GOVERNMENT	Madikai P.O	\N	\N	\N	2026-02-27 02:48:32.459676
KL_PHC_KSD_0835	HOSPITAL	FHC Anandashram	fhc anandashram	Kerala	Kasaragod	0467-2209711	\N	phcanandasram@gmail.com	FHC	GOVERNMENT	Anandashram P.O	671531	\N	\N	2026-02-27 02:48:32.460012
KL_PHC_KSD_0836	HOSPITAL	FHC Pallikkare	fhc pallikkare	Kerala	Kasaragod	0467-2275500	\N	phcpallikkare@gmail.com	FHC	GOVERNMENT	Pallikkare P.O	\N	\N	\N	2026-02-27 02:48:32.460354
KL_PHC_KSD_0837	HOSPITAL	FHC Chattanchal	fhc chattanchal	Kerala	Kasaragod	04994-284808	\N	phcchattanchal@gmail.com	FHC	GOVERNMENT	Thekkil P.O, Chattanchal	671541	\N	\N	2026-02-27 02:48:32.460688
KL_PHC_KSD_0838	HOSPITAL	FHC Adoor	fhc adoor	Kerala	Kasaragod	04994-271266	\N	fhcadoor@gmail.com	FHC	GOVERNMENT	Urdoor P.O, Adoor	671543	\N	\N	2026-02-27 02:48:32.461018
KL_PHC_KSD_0840	HOSPITAL	FHC Kumbadaje	fhc kumbadaje	Kerala	Kasaragod	04998-260700	\N	phckumbadajeksd@gmail.com	FHC	GOVERNMENT	Kumbadaje	671551	\N	\N	2026-02-27 02:48:32.461698
KL_PHC_KSD_0841	HOSPITAL	FHC Puthige	fhc puthige	Kerala	Kasaragod	04998-247730	\N	phcputhige@gmail.com	FHC	GOVERNMENT	Puthige P.O	671321	\N	\N	2026-02-27 02:48:32.462059
KL_PHC_KSD_0842	HOSPITAL	FHC Perla	fhc perla	Kerala	Kasaragod	04998-225790	\N	phcperla@gmail.com	FHC	GOVERNMENT	Perla P.O	671552	\N	\N	2026-02-27 02:48:32.462385
KL_PHC_KSD_0843	HOSPITAL	FHC Kayyur	fhc kayyur	Kerala	Kasaragod	0467-2230301	\N	phckayyur@gmail.com	FHC	GOVERNMENT	Kayyur P.O	671313	\N	\N	2026-02-27 02:48:32.462712
KL_PHC_KSD_0844	HOSPITAL	FHC Uduma	fhc uduma	Kerala	Kasaragod	0467-2236737	\N	phcuduma@gmail.com	FHC	GOVERNMENT	Uduma P.O	671319	\N	\N	2026-02-27 02:48:32.463037
KL_PHC_KSD_0845	HOSPITAL	FHC Ennappara	fhc ennappara	Kerala	Kasaragod	0467-2279979	\N	phcennappara@gmail.com	FHC	GOVERNMENT	Ennappara, Thayannur P.O	671531	\N	\N	2026-02-27 02:48:32.463371
KL_PHC_KSD_0846	HOSPITAL	FHC Karindalam	fhc karindalam	Kerala	Kasaragod	0467-2235053	\N	fhckarindalam@gmail.com	FHC	GOVERNMENT	Karindalam P.O, Nileshwar Via	671314	\N	\N	2026-02-27 02:48:32.463701
KL_PHC_KSD_0847	HOSPITAL	FHC Mulleria	fhc mulleria	Kerala	Kasaragod	04994-262633	\N	phcmulleria@gmail.com	FHC	GOVERNMENT	Mulleria P.O	671543	\N	\N	2026-02-27 02:48:32.464032
KL_PHC_KSD_0848	HOSPITAL	FHC Mogral Puthur	fhc mogral puthur	Kerala	Kasaragod	04994-232300	\N	phcmogralputhur@gmail.com	FHC	GOVERNMENT	Mogralputhur P.O	671124	\N	\N	2026-02-27 02:48:32.464364
KL_PHC_KSD_0849	HOSPITAL	FHC Vorkady	fhc vorkady	Kerala	Kasaragod	04998-203900	\N	vorkadyhealth@gmail.com	FHC	GOVERNMENT	Vorkady	671323	\N	\N	2026-02-27 02:48:32.464694
\.


--
-- TOC entry 4804 (class 2606 OID 16400)
-- Name: emergency_services emergency_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emergency_services
    ADD CONSTRAINT emergency_services_pkey PRIMARY KEY (id);


--
-- TOC entry 4805 (class 1259 OID 16482)
-- Name: idx_dept_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dept_name ON public.emergency_services USING btree (department, normalized_name);


--
-- TOC entry 4806 (class 1259 OID 16483)
-- Name: idx_trgm_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_trgm_name ON public.emergency_services USING gin (normalized_name public.gin_trgm_ops);


-- Completed on 2026-04-06 00:41:09

--
-- PostgreSQL database dump complete
--

\unrestrict DUrWoyoZGrSWtICmTdGYQSklmhIklBWCGn2mm62XlQCZscFmJfffJxbKY3QrhzW

