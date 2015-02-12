--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

--
-- Name: bigint_unsigned; Type: DOMAIN; Schema: public; Owner: drupal
--

CREATE DOMAIN bigint_unsigned AS bigint
	CONSTRAINT bigint_unsigned_check CHECK ((VALUE >= 0));


ALTER DOMAIN public.bigint_unsigned OWNER TO drupal;

--
-- Name: int_unsigned; Type: DOMAIN; Schema: public; Owner: drupal
--

CREATE DOMAIN int_unsigned AS integer
	CONSTRAINT int_unsigned_check CHECK ((VALUE >= 0));


ALTER DOMAIN public.int_unsigned OWNER TO drupal;

--
-- Name: smallint_unsigned; Type: DOMAIN; Schema: public; Owner: drupal
--

CREATE DOMAIN smallint_unsigned AS smallint
	CONSTRAINT smallint_unsigned_check CHECK ((VALUE >= 0));


ALTER DOMAIN public.smallint_unsigned OWNER TO drupal;

--
-- Name: concat(text, text); Type: FUNCTION; Schema: public; Owner: drupal
--

CREATE FUNCTION concat(text, text) RETURNS text
    LANGUAGE sql
    AS $_$SELECT $1 || $2;$_$;


ALTER FUNCTION public.concat(text, text) OWNER TO drupal;

--
-- Name: greatest(numeric, numeric); Type: FUNCTION; Schema: public; Owner: drupal
--

CREATE FUNCTION "greatest"(numeric, numeric) RETURNS numeric
    LANGUAGE sql
    AS $_$SELECT CASE WHEN (($1 > $2) OR ($2 IS NULL)) THEN $1 ELSE $2 END;$_$;


ALTER FUNCTION public."greatest"(numeric, numeric) OWNER TO drupal;

--
-- Name: greatest(numeric, numeric, numeric); Type: FUNCTION; Schema: public; Owner: drupal
--

CREATE FUNCTION "greatest"(numeric, numeric, numeric) RETURNS numeric
    LANGUAGE sql
    AS $_$SELECT greatest($1, greatest($2, $3));$_$;


ALTER FUNCTION public."greatest"(numeric, numeric, numeric) OWNER TO drupal;

--
-- Name: if(boolean, text, text); Type: FUNCTION; Schema: public; Owner: drupal
--

CREATE FUNCTION if(boolean, text, text) RETURNS text
    LANGUAGE sql
    AS $_$SELECT CASE WHEN $1 THEN $2 ELSE $3 END;$_$;


ALTER FUNCTION public.if(boolean, text, text) OWNER TO drupal;

--
-- Name: if(boolean, integer, integer); Type: FUNCTION; Schema: public; Owner: drupal
--

CREATE FUNCTION if(boolean, integer, integer) RETURNS integer
    LANGUAGE sql
    AS $_$SELECT CASE WHEN $1 THEN $2 ELSE $3 END;$_$;


ALTER FUNCTION public.if(boolean, integer, integer) OWNER TO drupal;

--
-- Name: rand(); Type: FUNCTION; Schema: public; Owner: drupal
--

CREATE FUNCTION rand() RETURNS double precision
    LANGUAGE sql
    AS $$SELECT random();$$;


ALTER FUNCTION public.rand() OWNER TO drupal;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: access; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE access (
    aid integer NOT NULL,
    mask character varying(255) DEFAULT ''::character varying NOT NULL,
    type character varying(255) DEFAULT ''::character varying NOT NULL,
    status smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.access OWNER TO drupal;

--
-- Name: access_aid_seq; Type: SEQUENCE; Schema: public; Owner: drupal
--

CREATE SEQUENCE access_aid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.access_aid_seq OWNER TO drupal;

--
-- Name: access_aid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drupal
--

ALTER SEQUENCE access_aid_seq OWNED BY access.aid;


--
-- Name: access_aid_seq; Type: SEQUENCE SET; Schema: public; Owner: drupal
--

SELECT pg_catalog.setval('access_aid_seq', 1, false);


--
-- Name: actions; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE actions (
    aid character varying(255) DEFAULT '0'::character varying NOT NULL,
    type character varying(32) DEFAULT ''::character varying NOT NULL,
    callback character varying(255) DEFAULT ''::character varying NOT NULL,
    parameters text NOT NULL,
    description character varying(255) DEFAULT '0'::character varying NOT NULL
);


ALTER TABLE public.actions OWNER TO drupal;

--
-- Name: actions_aid; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE actions_aid (
    aid integer NOT NULL,
    CONSTRAINT actions_aid_aid_check CHECK ((aid >= 0))
);


ALTER TABLE public.actions_aid OWNER TO drupal;

--
-- Name: actions_aid_aid_seq; Type: SEQUENCE; Schema: public; Owner: drupal
--

CREATE SEQUENCE actions_aid_aid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.actions_aid_aid_seq OWNER TO drupal;

--
-- Name: actions_aid_aid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drupal
--

ALTER SEQUENCE actions_aid_aid_seq OWNED BY actions_aid.aid;


--
-- Name: actions_aid_aid_seq; Type: SEQUENCE SET; Schema: public; Owner: drupal
--

SELECT pg_catalog.setval('actions_aid_aid_seq', 1, false);


--
-- Name: authmap; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE authmap (
    aid integer NOT NULL,
    uid integer DEFAULT 0 NOT NULL,
    authname character varying(128) DEFAULT ''::character varying NOT NULL,
    module character varying(128) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT authmap_aid_check CHECK ((aid >= 0))
);


ALTER TABLE public.authmap OWNER TO drupal;

--
-- Name: authmap_aid_seq; Type: SEQUENCE; Schema: public; Owner: drupal
--

CREATE SEQUENCE authmap_aid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.authmap_aid_seq OWNER TO drupal;

--
-- Name: authmap_aid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drupal
--

ALTER SEQUENCE authmap_aid_seq OWNED BY authmap.aid;


--
-- Name: authmap_aid_seq; Type: SEQUENCE SET; Schema: public; Owner: drupal
--

SELECT pg_catalog.setval('authmap_aid_seq', 1, false);


--
-- Name: batch; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE batch (
    bid integer NOT NULL,
    token character varying(64) NOT NULL,
    "timestamp" integer NOT NULL,
    batch text,
    CONSTRAINT batch_bid_check CHECK ((bid >= 0))
);


ALTER TABLE public.batch OWNER TO drupal;

--
-- Name: batch_bid_seq; Type: SEQUENCE; Schema: public; Owner: drupal
--

CREATE SEQUENCE batch_bid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.batch_bid_seq OWNER TO drupal;

--
-- Name: batch_bid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drupal
--

ALTER SEQUENCE batch_bid_seq OWNED BY batch.bid;


--
-- Name: batch_bid_seq; Type: SEQUENCE SET; Schema: public; Owner: drupal
--

SELECT pg_catalog.setval('batch_bid_seq', 3, true);


--
-- Name: blocks; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE blocks (
    bid integer NOT NULL,
    module character varying(64) DEFAULT ''::character varying NOT NULL,
    delta character varying(32) DEFAULT '0'::character varying NOT NULL,
    theme character varying(64) DEFAULT ''::character varying NOT NULL,
    status smallint DEFAULT 0 NOT NULL,
    weight smallint DEFAULT 0 NOT NULL,
    region character varying(64) DEFAULT ''::character varying NOT NULL,
    custom smallint DEFAULT 0 NOT NULL,
    throttle smallint DEFAULT 0 NOT NULL,
    visibility smallint DEFAULT 0 NOT NULL,
    pages text NOT NULL,
    title character varying(64) DEFAULT ''::character varying NOT NULL,
    cache smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.blocks OWNER TO drupal;

--
-- Name: blocks_bid_seq; Type: SEQUENCE; Schema: public; Owner: drupal
--

CREATE SEQUENCE blocks_bid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.blocks_bid_seq OWNER TO drupal;

--
-- Name: blocks_bid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drupal
--

ALTER SEQUENCE blocks_bid_seq OWNED BY blocks.bid;


--
-- Name: blocks_bid_seq; Type: SEQUENCE SET; Schema: public; Owner: drupal
--

SELECT pg_catalog.setval('blocks_bid_seq', 3, true);


--
-- Name: blocks_roles; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE blocks_roles (
    module character varying(64) NOT NULL,
    delta character varying(32) NOT NULL,
    rid integer NOT NULL,
    CONSTRAINT blocks_roles_rid_check CHECK ((rid >= 0))
);


ALTER TABLE public.blocks_roles OWNER TO drupal;

--
-- Name: boxes; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE boxes (
    bid integer NOT NULL,
    body text,
    info character varying(128) DEFAULT ''::character varying NOT NULL,
    format smallint DEFAULT 0 NOT NULL,
    CONSTRAINT boxes_bid_check CHECK ((bid >= 0))
);


ALTER TABLE public.boxes OWNER TO drupal;

--
-- Name: boxes_bid_seq; Type: SEQUENCE; Schema: public; Owner: drupal
--

CREATE SEQUENCE boxes_bid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.boxes_bid_seq OWNER TO drupal;

--
-- Name: boxes_bid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drupal
--

ALTER SEQUENCE boxes_bid_seq OWNED BY boxes.bid;


--
-- Name: boxes_bid_seq; Type: SEQUENCE SET; Schema: public; Owner: drupal
--

SELECT pg_catalog.setval('boxes_bid_seq', 1, false);


--
-- Name: cache; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE cache (
    cid character varying(255) DEFAULT ''::character varying NOT NULL,
    data bytea,
    expire integer DEFAULT 0 NOT NULL,
    created integer DEFAULT 0 NOT NULL,
    headers text,
    serialized smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.cache OWNER TO drupal;

--
-- Name: cache_block; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE cache_block (
    cid character varying(255) DEFAULT ''::character varying NOT NULL,
    data bytea,
    expire integer DEFAULT 0 NOT NULL,
    created integer DEFAULT 0 NOT NULL,
    headers text,
    serialized smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.cache_block OWNER TO drupal;

--
-- Name: cache_filter; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE cache_filter (
    cid character varying(255) DEFAULT ''::character varying NOT NULL,
    data bytea,
    expire integer DEFAULT 0 NOT NULL,
    created integer DEFAULT 0 NOT NULL,
    headers text,
    serialized smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.cache_filter OWNER TO drupal;

--
-- Name: cache_form; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE cache_form (
    cid character varying(255) DEFAULT ''::character varying NOT NULL,
    data bytea,
    expire integer DEFAULT 0 NOT NULL,
    created integer DEFAULT 0 NOT NULL,
    headers text,
    serialized smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.cache_form OWNER TO drupal;

--
-- Name: cache_menu; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE cache_menu (
    cid character varying(255) DEFAULT ''::character varying NOT NULL,
    data bytea,
    expire integer DEFAULT 0 NOT NULL,
    created integer DEFAULT 0 NOT NULL,
    headers text,
    serialized smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.cache_menu OWNER TO drupal;

--
-- Name: cache_page; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE cache_page (
    cid character varying(255) DEFAULT ''::character varying NOT NULL,
    data bytea,
    expire integer DEFAULT 0 NOT NULL,
    created integer DEFAULT 0 NOT NULL,
    headers text,
    serialized smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.cache_page OWNER TO drupal;

--
-- Name: cache_update; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE cache_update (
    cid character varying(255) DEFAULT ''::character varying NOT NULL,
    data bytea,
    expire integer DEFAULT 0 NOT NULL,
    created integer DEFAULT 0 NOT NULL,
    headers text,
    serialized smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.cache_update OWNER TO drupal;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE comments (
    cid integer NOT NULL,
    pid integer DEFAULT 0 NOT NULL,
    nid integer DEFAULT 0 NOT NULL,
    uid integer DEFAULT 0 NOT NULL,
    subject character varying(64) DEFAULT ''::character varying NOT NULL,
    comment text NOT NULL,
    hostname character varying(128) DEFAULT ''::character varying NOT NULL,
    "timestamp" integer DEFAULT 0 NOT NULL,
    status smallint DEFAULT 0 NOT NULL,
    format smallint DEFAULT 0 NOT NULL,
    thread character varying(255) NOT NULL,
    name character varying(60),
    mail character varying(64),
    homepage character varying(255),
    CONSTRAINT comments_status_check CHECK ((status >= 0))
);


ALTER TABLE public.comments OWNER TO drupal;

--
-- Name: comments_cid_seq; Type: SEQUENCE; Schema: public; Owner: drupal
--

CREATE SEQUENCE comments_cid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.comments_cid_seq OWNER TO drupal;

--
-- Name: comments_cid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drupal
--

ALTER SEQUENCE comments_cid_seq OWNED BY comments.cid;


--
-- Name: comments_cid_seq; Type: SEQUENCE SET; Schema: public; Owner: drupal
--

SELECT pg_catalog.setval('comments_cid_seq', 1, false);


--
-- Name: files; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE files (
    fid integer NOT NULL,
    uid integer DEFAULT 0 NOT NULL,
    filename character varying(255) DEFAULT ''::character varying NOT NULL,
    filepath character varying(255) DEFAULT ''::character varying NOT NULL,
    filemime character varying(255) DEFAULT ''::character varying NOT NULL,
    filesize integer DEFAULT 0 NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    "timestamp" integer DEFAULT 0 NOT NULL,
    CONSTRAINT files_fid_check CHECK ((fid >= 0)),
    CONSTRAINT files_filesize_check CHECK ((filesize >= 0)),
    CONSTRAINT files_timestamp_check CHECK (("timestamp" >= 0)),
    CONSTRAINT files_uid_check CHECK ((uid >= 0))
);


ALTER TABLE public.files OWNER TO drupal;

--
-- Name: files_fid_seq; Type: SEQUENCE; Schema: public; Owner: drupal
--

CREATE SEQUENCE files_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.files_fid_seq OWNER TO drupal;

--
-- Name: files_fid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drupal
--

ALTER SEQUENCE files_fid_seq OWNED BY files.fid;


--
-- Name: files_fid_seq; Type: SEQUENCE SET; Schema: public; Owner: drupal
--

SELECT pg_catalog.setval('files_fid_seq', 1, false);


--
-- Name: filter_formats; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE filter_formats (
    format integer NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    roles character varying(255) DEFAULT ''::character varying NOT NULL,
    cache smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.filter_formats OWNER TO drupal;

--
-- Name: filter_formats_format_seq; Type: SEQUENCE; Schema: public; Owner: drupal
--

CREATE SEQUENCE filter_formats_format_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.filter_formats_format_seq OWNER TO drupal;

--
-- Name: filter_formats_format_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drupal
--

ALTER SEQUENCE filter_formats_format_seq OWNED BY filter_formats.format;


--
-- Name: filter_formats_format_seq; Type: SEQUENCE SET; Schema: public; Owner: drupal
--

SELECT pg_catalog.setval('filter_formats_format_seq', 2, true);


--
-- Name: filters; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE filters (
    fid integer NOT NULL,
    format integer DEFAULT 0 NOT NULL,
    module character varying(64) DEFAULT ''::character varying NOT NULL,
    delta smallint DEFAULT 0 NOT NULL,
    weight smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.filters OWNER TO drupal;

--
-- Name: filters_fid_seq; Type: SEQUENCE; Schema: public; Owner: drupal
--

CREATE SEQUENCE filters_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.filters_fid_seq OWNER TO drupal;

--
-- Name: filters_fid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drupal
--

ALTER SEQUENCE filters_fid_seq OWNED BY filters.fid;


--
-- Name: filters_fid_seq; Type: SEQUENCE SET; Schema: public; Owner: drupal
--

SELECT pg_catalog.setval('filters_fid_seq', 7, true);


--
-- Name: flood; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE flood (
    fid integer NOT NULL,
    event character varying(64) DEFAULT ''::character varying NOT NULL,
    hostname character varying(128) DEFAULT ''::character varying NOT NULL,
    "timestamp" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.flood OWNER TO drupal;

--
-- Name: flood_fid_seq; Type: SEQUENCE; Schema: public; Owner: drupal
--

CREATE SEQUENCE flood_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.flood_fid_seq OWNER TO drupal;

--
-- Name: flood_fid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drupal
--

ALTER SEQUENCE flood_fid_seq OWNED BY flood.fid;


--
-- Name: flood_fid_seq; Type: SEQUENCE SET; Schema: public; Owner: drupal
--

SELECT pg_catalog.setval('flood_fid_seq', 1, false);


--
-- Name: history; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE history (
    uid integer DEFAULT 0 NOT NULL,
    nid integer DEFAULT 0 NOT NULL,
    "timestamp" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.history OWNER TO drupal;

--
-- Name: languages; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE languages (
    language character varying(12) DEFAULT ''::character varying NOT NULL,
    name character varying(64) DEFAULT ''::character varying NOT NULL,
    native character varying(64) DEFAULT ''::character varying NOT NULL,
    direction integer DEFAULT 0 NOT NULL,
    enabled integer DEFAULT 0 NOT NULL,
    plurals integer DEFAULT 0 NOT NULL,
    formula character varying(128) DEFAULT ''::character varying NOT NULL,
    domain character varying(128) DEFAULT ''::character varying NOT NULL,
    prefix character varying(128) DEFAULT ''::character varying NOT NULL,
    weight integer DEFAULT 0 NOT NULL,
    javascript character varying(32) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.languages OWNER TO drupal;

--
-- Name: locales_source; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE locales_source (
    lid integer NOT NULL,
    location character varying(255) DEFAULT ''::character varying NOT NULL,
    textgroup character varying(255) DEFAULT 'default'::character varying NOT NULL,
    source text NOT NULL,
    version character varying(20) DEFAULT 'none'::character varying NOT NULL
);


ALTER TABLE public.locales_source OWNER TO drupal;

--
-- Name: locales_source_lid_seq; Type: SEQUENCE; Schema: public; Owner: drupal
--

CREATE SEQUENCE locales_source_lid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.locales_source_lid_seq OWNER TO drupal;

--
-- Name: locales_source_lid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drupal
--

ALTER SEQUENCE locales_source_lid_seq OWNED BY locales_source.lid;


--
-- Name: locales_source_lid_seq; Type: SEQUENCE SET; Schema: public; Owner: drupal
--

SELECT pg_catalog.setval('locales_source_lid_seq', 2211, true);


--
-- Name: locales_target; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE locales_target (
    lid integer DEFAULT 0 NOT NULL,
    translation text NOT NULL,
    language character varying(12) DEFAULT ''::character varying NOT NULL,
    plid integer DEFAULT 0 NOT NULL,
    plural integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.locales_target OWNER TO drupal;

--
-- Name: menu_custom; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE menu_custom (
    menu_name character varying(32) DEFAULT ''::character varying NOT NULL,
    title character varying(255) DEFAULT ''::character varying NOT NULL,
    description text
);


ALTER TABLE public.menu_custom OWNER TO drupal;

--
-- Name: menu_links; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE menu_links (
    menu_name character varying(32) DEFAULT ''::character varying NOT NULL,
    mlid integer NOT NULL,
    plid integer DEFAULT 0 NOT NULL,
    link_path character varying(255) DEFAULT ''::character varying NOT NULL,
    router_path character varying(255) DEFAULT ''::character varying NOT NULL,
    link_title character varying(255) DEFAULT ''::character varying NOT NULL,
    options text,
    module character varying(255) DEFAULT 'system'::character varying NOT NULL,
    hidden smallint DEFAULT 0 NOT NULL,
    external smallint DEFAULT 0 NOT NULL,
    has_children smallint DEFAULT 0 NOT NULL,
    expanded smallint DEFAULT 0 NOT NULL,
    weight integer DEFAULT 0 NOT NULL,
    depth smallint DEFAULT 0 NOT NULL,
    customized smallint DEFAULT 0 NOT NULL,
    p1 integer DEFAULT 0 NOT NULL,
    p2 integer DEFAULT 0 NOT NULL,
    p3 integer DEFAULT 0 NOT NULL,
    p4 integer DEFAULT 0 NOT NULL,
    p5 integer DEFAULT 0 NOT NULL,
    p6 integer DEFAULT 0 NOT NULL,
    p7 integer DEFAULT 0 NOT NULL,
    p8 integer DEFAULT 0 NOT NULL,
    p9 integer DEFAULT 0 NOT NULL,
    updated smallint DEFAULT 0 NOT NULL,
    CONSTRAINT menu_links_mlid_check CHECK ((mlid >= 0)),
    CONSTRAINT menu_links_p1_check CHECK ((p1 >= 0)),
    CONSTRAINT menu_links_p2_check CHECK ((p2 >= 0)),
    CONSTRAINT menu_links_p3_check CHECK ((p3 >= 0)),
    CONSTRAINT menu_links_p4_check CHECK ((p4 >= 0)),
    CONSTRAINT menu_links_p5_check CHECK ((p5 >= 0)),
    CONSTRAINT menu_links_p6_check CHECK ((p6 >= 0)),
    CONSTRAINT menu_links_p7_check CHECK ((p7 >= 0)),
    CONSTRAINT menu_links_p8_check CHECK ((p8 >= 0)),
    CONSTRAINT menu_links_p9_check CHECK ((p9 >= 0)),
    CONSTRAINT menu_links_plid_check CHECK ((plid >= 0))
);


ALTER TABLE public.menu_links OWNER TO drupal;

--
-- Name: menu_links_mlid_seq; Type: SEQUENCE; Schema: public; Owner: drupal
--

CREATE SEQUENCE menu_links_mlid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.menu_links_mlid_seq OWNER TO drupal;

--
-- Name: menu_links_mlid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drupal
--

ALTER SEQUENCE menu_links_mlid_seq OWNED BY menu_links.mlid;


--
-- Name: menu_links_mlid_seq; Type: SEQUENCE SET; Schema: public; Owner: drupal
--

SELECT pg_catalog.setval('menu_links_mlid_seq', 120, true);


--
-- Name: menu_router; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE menu_router (
    path character varying(255) DEFAULT ''::character varying NOT NULL,
    load_functions text NOT NULL,
    to_arg_functions text NOT NULL,
    access_callback character varying(255) DEFAULT ''::character varying NOT NULL,
    access_arguments text,
    page_callback character varying(255) DEFAULT ''::character varying NOT NULL,
    page_arguments text,
    fit integer DEFAULT 0 NOT NULL,
    number_parts smallint DEFAULT 0 NOT NULL,
    tab_parent character varying(255) DEFAULT ''::character varying NOT NULL,
    tab_root character varying(255) DEFAULT ''::character varying NOT NULL,
    title character varying(255) DEFAULT ''::character varying NOT NULL,
    title_callback character varying(255) DEFAULT ''::character varying NOT NULL,
    title_arguments character varying(255) DEFAULT ''::character varying NOT NULL,
    type integer DEFAULT 0 NOT NULL,
    block_callback character varying(255) DEFAULT ''::character varying NOT NULL,
    description text NOT NULL,
    "position" character varying(255) DEFAULT ''::character varying NOT NULL,
    weight integer DEFAULT 0 NOT NULL,
    file text
);


ALTER TABLE public.menu_router OWNER TO drupal;

--
-- Name: node; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE node (
    nid integer NOT NULL,
    vid integer DEFAULT 0 NOT NULL,
    type character varying(32) DEFAULT ''::character varying NOT NULL,
    language character varying(12) DEFAULT ''::character varying NOT NULL,
    title character varying(255) DEFAULT ''::character varying NOT NULL,
    uid integer DEFAULT 0 NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    created integer DEFAULT 0 NOT NULL,
    changed integer DEFAULT 0 NOT NULL,
    comment integer DEFAULT 0 NOT NULL,
    promote integer DEFAULT 0 NOT NULL,
    moderate integer DEFAULT 0 NOT NULL,
    sticky integer DEFAULT 0 NOT NULL,
    tnid integer DEFAULT 0 NOT NULL,
    translate integer DEFAULT 0 NOT NULL,
    CONSTRAINT node_nid_check CHECK ((nid >= 0)),
    CONSTRAINT node_tnid_check CHECK ((tnid >= 0)),
    CONSTRAINT node_vid_check CHECK ((vid >= 0))
);


ALTER TABLE public.node OWNER TO drupal;

--
-- Name: node_access; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE node_access (
    nid integer DEFAULT 0 NOT NULL,
    gid integer DEFAULT 0 NOT NULL,
    realm character varying(255) DEFAULT ''::character varying NOT NULL,
    grant_view smallint DEFAULT 0 NOT NULL,
    grant_update smallint DEFAULT 0 NOT NULL,
    grant_delete smallint DEFAULT 0 NOT NULL,
    CONSTRAINT node_access_gid_check CHECK ((gid >= 0)),
    CONSTRAINT node_access_grant_delete_check CHECK ((grant_delete >= 0)),
    CONSTRAINT node_access_grant_update_check CHECK ((grant_update >= 0)),
    CONSTRAINT node_access_grant_view_check CHECK ((grant_view >= 0)),
    CONSTRAINT node_access_nid_check CHECK ((nid >= 0))
);


ALTER TABLE public.node_access OWNER TO drupal;

--
-- Name: node_comment_statistics; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE node_comment_statistics (
    nid integer DEFAULT 0 NOT NULL,
    last_comment_timestamp integer DEFAULT 0 NOT NULL,
    last_comment_name character varying(60),
    last_comment_uid integer DEFAULT 0 NOT NULL,
    comment_count integer DEFAULT 0 NOT NULL,
    CONSTRAINT node_comment_statistics_comment_count_check CHECK ((comment_count >= 0)),
    CONSTRAINT node_comment_statistics_nid_check CHECK ((nid >= 0))
);


ALTER TABLE public.node_comment_statistics OWNER TO drupal;

--
-- Name: node_counter; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE node_counter (
    nid integer DEFAULT 0 NOT NULL,
    totalcount bigint DEFAULT 0 NOT NULL,
    daycount integer DEFAULT 0 NOT NULL,
    "timestamp" integer DEFAULT 0 NOT NULL,
    CONSTRAINT node_counter_daycount_check CHECK ((daycount >= 0)),
    CONSTRAINT node_counter_timestamp_check CHECK (("timestamp" >= 0)),
    CONSTRAINT node_counter_totalcount_check CHECK ((totalcount >= 0))
);


ALTER TABLE public.node_counter OWNER TO drupal;

--
-- Name: node_nid_seq; Type: SEQUENCE; Schema: public; Owner: drupal
--

CREATE SEQUENCE node_nid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.node_nid_seq OWNER TO drupal;

--
-- Name: node_nid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drupal
--

ALTER SEQUENCE node_nid_seq OWNED BY node.nid;


--
-- Name: node_nid_seq; Type: SEQUENCE SET; Schema: public; Owner: drupal
--

SELECT pg_catalog.setval('node_nid_seq', 1, false);


--
-- Name: node_revisions; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE node_revisions (
    nid integer DEFAULT 0 NOT NULL,
    vid integer NOT NULL,
    uid integer DEFAULT 0 NOT NULL,
    title character varying(255) DEFAULT ''::character varying NOT NULL,
    body text NOT NULL,
    teaser text NOT NULL,
    log text NOT NULL,
    "timestamp" integer DEFAULT 0 NOT NULL,
    format integer DEFAULT 0 NOT NULL,
    CONSTRAINT node_revisions_nid_check CHECK ((nid >= 0)),
    CONSTRAINT node_revisions_vid_check CHECK ((vid >= 0))
);


ALTER TABLE public.node_revisions OWNER TO drupal;

--
-- Name: node_revisions_vid_seq; Type: SEQUENCE; Schema: public; Owner: drupal
--

CREATE SEQUENCE node_revisions_vid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.node_revisions_vid_seq OWNER TO drupal;

--
-- Name: node_revisions_vid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drupal
--

ALTER SEQUENCE node_revisions_vid_seq OWNED BY node_revisions.vid;


--
-- Name: node_revisions_vid_seq; Type: SEQUENCE SET; Schema: public; Owner: drupal
--

SELECT pg_catalog.setval('node_revisions_vid_seq', 1, false);


--
-- Name: node_type; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE node_type (
    type character varying(32) NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    module character varying(255) NOT NULL,
    description text NOT NULL,
    help text NOT NULL,
    has_title smallint NOT NULL,
    title_label character varying(255) DEFAULT ''::character varying NOT NULL,
    has_body smallint NOT NULL,
    body_label character varying(255) DEFAULT ''::character varying NOT NULL,
    min_word_count smallint NOT NULL,
    custom smallint DEFAULT 0 NOT NULL,
    modified smallint DEFAULT 0 NOT NULL,
    locked smallint DEFAULT 0 NOT NULL,
    orig_type character varying(255) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT node_type_has_body_check CHECK ((has_body >= 0)),
    CONSTRAINT node_type_has_title_check CHECK ((has_title >= 0)),
    CONSTRAINT node_type_min_word_count_check CHECK ((min_word_count >= 0))
);


ALTER TABLE public.node_type OWNER TO drupal;

--
-- Name: permission; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE permission (
    pid integer NOT NULL,
    rid integer DEFAULT 0 NOT NULL,
    perm text,
    tid integer DEFAULT 0 NOT NULL,
    CONSTRAINT permission_rid_check CHECK ((rid >= 0)),
    CONSTRAINT permission_tid_check CHECK ((tid >= 0))
);


ALTER TABLE public.permission OWNER TO drupal;

--
-- Name: permission_pid_seq; Type: SEQUENCE; Schema: public; Owner: drupal
--

CREATE SEQUENCE permission_pid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.permission_pid_seq OWNER TO drupal;

--
-- Name: permission_pid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drupal
--

ALTER SEQUENCE permission_pid_seq OWNED BY permission.pid;


--
-- Name: permission_pid_seq; Type: SEQUENCE SET; Schema: public; Owner: drupal
--

SELECT pg_catalog.setval('permission_pid_seq', 2, true);


--
-- Name: role; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE role (
    rid integer NOT NULL,
    name character varying(64) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT role_rid_check CHECK ((rid >= 0))
);


ALTER TABLE public.role OWNER TO drupal;

--
-- Name: role_rid_seq; Type: SEQUENCE; Schema: public; Owner: drupal
--

CREATE SEQUENCE role_rid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.role_rid_seq OWNER TO drupal;

--
-- Name: role_rid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drupal
--

ALTER SEQUENCE role_rid_seq OWNED BY role.rid;


--
-- Name: role_rid_seq; Type: SEQUENCE SET; Schema: public; Owner: drupal
--

SELECT pg_catalog.setval('role_rid_seq', 2, true);


--
-- Name: semaphore; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE semaphore (
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    value character varying(255) DEFAULT ''::character varying NOT NULL,
    expire double precision NOT NULL
);


ALTER TABLE public.semaphore OWNER TO drupal;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE sessions (
    uid integer NOT NULL,
    sid character varying(64) DEFAULT ''::character varying NOT NULL,
    hostname character varying(128) DEFAULT ''::character varying NOT NULL,
    "timestamp" integer DEFAULT 0 NOT NULL,
    cache integer DEFAULT 0 NOT NULL,
    session text,
    CONSTRAINT sessions_uid_check CHECK ((uid >= 0))
);


ALTER TABLE public.sessions OWNER TO drupal;

--
-- Name: system; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE system (
    filename character varying(255) DEFAULT ''::character varying NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    type character varying(255) DEFAULT ''::character varying NOT NULL,
    owner character varying(255) DEFAULT ''::character varying NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    throttle smallint DEFAULT 0 NOT NULL,
    bootstrap integer DEFAULT 0 NOT NULL,
    schema_version smallint DEFAULT (-1) NOT NULL,
    weight integer DEFAULT 0 NOT NULL,
    info text
);


ALTER TABLE public.system OWNER TO drupal;

--
-- Name: term_data; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE term_data (
    tid integer NOT NULL,
    vid integer DEFAULT 0 NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    description text,
    weight smallint DEFAULT 0 NOT NULL,
    CONSTRAINT term_data_tid_check CHECK ((tid >= 0)),
    CONSTRAINT term_data_vid_check CHECK ((vid >= 0))
);


ALTER TABLE public.term_data OWNER TO drupal;

--
-- Name: term_data_tid_seq; Type: SEQUENCE; Schema: public; Owner: drupal
--

CREATE SEQUENCE term_data_tid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.term_data_tid_seq OWNER TO drupal;

--
-- Name: term_data_tid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drupal
--

ALTER SEQUENCE term_data_tid_seq OWNED BY term_data.tid;


--
-- Name: term_data_tid_seq; Type: SEQUENCE SET; Schema: public; Owner: drupal
--

SELECT pg_catalog.setval('term_data_tid_seq', 1, false);


--
-- Name: term_hierarchy; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE term_hierarchy (
    tid integer DEFAULT 0 NOT NULL,
    parent integer DEFAULT 0 NOT NULL,
    CONSTRAINT term_hierarchy_parent_check CHECK ((parent >= 0)),
    CONSTRAINT term_hierarchy_tid_check CHECK ((tid >= 0))
);


ALTER TABLE public.term_hierarchy OWNER TO drupal;

--
-- Name: term_node; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE term_node (
    nid integer DEFAULT 0 NOT NULL,
    vid integer DEFAULT 0 NOT NULL,
    tid integer DEFAULT 0 NOT NULL,
    CONSTRAINT term_node_nid_check CHECK ((nid >= 0)),
    CONSTRAINT term_node_tid_check CHECK ((tid >= 0)),
    CONSTRAINT term_node_vid_check CHECK ((vid >= 0))
);


ALTER TABLE public.term_node OWNER TO drupal;

--
-- Name: term_relation; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE term_relation (
    trid integer NOT NULL,
    tid1 integer DEFAULT 0 NOT NULL,
    tid2 integer DEFAULT 0 NOT NULL,
    CONSTRAINT term_relation_tid1_check CHECK ((tid1 >= 0)),
    CONSTRAINT term_relation_tid2_check CHECK ((tid2 >= 0))
);


ALTER TABLE public.term_relation OWNER TO drupal;

--
-- Name: term_relation_trid_seq; Type: SEQUENCE; Schema: public; Owner: drupal
--

CREATE SEQUENCE term_relation_trid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.term_relation_trid_seq OWNER TO drupal;

--
-- Name: term_relation_trid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drupal
--

ALTER SEQUENCE term_relation_trid_seq OWNED BY term_relation.trid;


--
-- Name: term_relation_trid_seq; Type: SEQUENCE SET; Schema: public; Owner: drupal
--

SELECT pg_catalog.setval('term_relation_trid_seq', 1, false);


--
-- Name: term_synonym; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE term_synonym (
    tsid integer NOT NULL,
    tid integer DEFAULT 0 NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT term_synonym_tid_check CHECK ((tid >= 0))
);


ALTER TABLE public.term_synonym OWNER TO drupal;

--
-- Name: term_synonym_tsid_seq; Type: SEQUENCE; Schema: public; Owner: drupal
--

CREATE SEQUENCE term_synonym_tsid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.term_synonym_tsid_seq OWNER TO drupal;

--
-- Name: term_synonym_tsid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drupal
--

ALTER SEQUENCE term_synonym_tsid_seq OWNED BY term_synonym.tsid;


--
-- Name: term_synonym_tsid_seq; Type: SEQUENCE SET; Schema: public; Owner: drupal
--

SELECT pg_catalog.setval('term_synonym_tsid_seq', 1, false);


--
-- Name: url_alias; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE url_alias (
    pid integer NOT NULL,
    src character varying(128) DEFAULT ''::character varying NOT NULL,
    dst character varying(128) DEFAULT ''::character varying NOT NULL,
    language character varying(12) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT url_alias_pid_check CHECK ((pid >= 0))
);


ALTER TABLE public.url_alias OWNER TO drupal;

--
-- Name: url_alias_pid_seq; Type: SEQUENCE; Schema: public; Owner: drupal
--

CREATE SEQUENCE url_alias_pid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.url_alias_pid_seq OWNER TO drupal;

--
-- Name: url_alias_pid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drupal
--

ALTER SEQUENCE url_alias_pid_seq OWNED BY url_alias.pid;


--
-- Name: url_alias_pid_seq; Type: SEQUENCE SET; Schema: public; Owner: drupal
--

SELECT pg_catalog.setval('url_alias_pid_seq', 1, false);


--
-- Name: users; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE users (
    uid integer NOT NULL,
    name character varying(60) DEFAULT ''::character varying NOT NULL,
    pass character varying(32) DEFAULT ''::character varying NOT NULL,
    mail character varying(64) DEFAULT ''::character varying,
    mode smallint DEFAULT 0 NOT NULL,
    sort smallint DEFAULT 0,
    threshold smallint DEFAULT 0,
    theme character varying(255) DEFAULT ''::character varying NOT NULL,
    signature character varying(255) DEFAULT ''::character varying NOT NULL,
    signature_format smallint DEFAULT 0 NOT NULL,
    created integer DEFAULT 0 NOT NULL,
    access integer DEFAULT 0 NOT NULL,
    login integer DEFAULT 0 NOT NULL,
    status smallint DEFAULT 0 NOT NULL,
    timezone character varying(8),
    language character varying(12) DEFAULT ''::character varying NOT NULL,
    picture character varying(255) DEFAULT ''::character varying NOT NULL,
    init character varying(64) DEFAULT ''::character varying,
    data text,
    CONSTRAINT users_uid_check CHECK ((uid >= 0))
);


ALTER TABLE public.users OWNER TO drupal;

--
-- Name: users_roles; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE users_roles (
    uid integer DEFAULT 0 NOT NULL,
    rid integer DEFAULT 0 NOT NULL,
    CONSTRAINT users_roles_rid_check CHECK ((rid >= 0)),
    CONSTRAINT users_roles_uid_check CHECK ((uid >= 0))
);


ALTER TABLE public.users_roles OWNER TO drupal;

--
-- Name: users_uid_seq; Type: SEQUENCE; Schema: public; Owner: drupal
--

CREATE SEQUENCE users_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.users_uid_seq OWNER TO drupal;

--
-- Name: users_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drupal
--

ALTER SEQUENCE users_uid_seq OWNED BY users.uid;


--
-- Name: users_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: drupal
--

SELECT pg_catalog.setval('users_uid_seq', 2, true);


--
-- Name: variable; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE variable (
    name character varying(128) DEFAULT ''::character varying NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.variable OWNER TO drupal;

--
-- Name: vocabulary; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE vocabulary (
    vid integer NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    description text,
    help character varying(255) DEFAULT ''::character varying NOT NULL,
    relations smallint DEFAULT 0 NOT NULL,
    hierarchy smallint DEFAULT 0 NOT NULL,
    multiple smallint DEFAULT 0 NOT NULL,
    required smallint DEFAULT 0 NOT NULL,
    tags smallint DEFAULT 0 NOT NULL,
    module character varying(255) DEFAULT ''::character varying NOT NULL,
    weight smallint DEFAULT 0 NOT NULL,
    CONSTRAINT vocabulary_hierarchy_check CHECK ((hierarchy >= 0)),
    CONSTRAINT vocabulary_multiple_check CHECK ((multiple >= 0)),
    CONSTRAINT vocabulary_relations_check CHECK ((relations >= 0)),
    CONSTRAINT vocabulary_required_check CHECK ((required >= 0)),
    CONSTRAINT vocabulary_tags_check CHECK ((tags >= 0)),
    CONSTRAINT vocabulary_vid_check CHECK ((vid >= 0))
);


ALTER TABLE public.vocabulary OWNER TO drupal;

--
-- Name: vocabulary_node_types; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE vocabulary_node_types (
    vid integer DEFAULT 0 NOT NULL,
    type character varying(32) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT vocabulary_node_types_vid_check CHECK ((vid >= 0))
);


ALTER TABLE public.vocabulary_node_types OWNER TO drupal;

--
-- Name: vocabulary_vid_seq; Type: SEQUENCE; Schema: public; Owner: drupal
--

CREATE SEQUENCE vocabulary_vid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.vocabulary_vid_seq OWNER TO drupal;

--
-- Name: vocabulary_vid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drupal
--

ALTER SEQUENCE vocabulary_vid_seq OWNED BY vocabulary.vid;


--
-- Name: vocabulary_vid_seq; Type: SEQUENCE SET; Schema: public; Owner: drupal
--

SELECT pg_catalog.setval('vocabulary_vid_seq', 1, false);


--
-- Name: watchdog; Type: TABLE; Schema: public; Owner: drupal; Tablespace: 
--

CREATE TABLE watchdog (
    wid integer NOT NULL,
    uid integer DEFAULT 0 NOT NULL,
    type character varying(16) DEFAULT ''::character varying NOT NULL,
    message text NOT NULL,
    variables text NOT NULL,
    severity smallint DEFAULT 0 NOT NULL,
    link character varying(255) DEFAULT ''::character varying NOT NULL,
    location text NOT NULL,
    referer text,
    hostname character varying(128) DEFAULT ''::character varying NOT NULL,
    "timestamp" integer DEFAULT 0 NOT NULL,
    CONSTRAINT watchdog_severity_check CHECK ((severity >= 0))
);


ALTER TABLE public.watchdog OWNER TO drupal;

--
-- Name: watchdog_wid_seq; Type: SEQUENCE; Schema: public; Owner: drupal
--

CREATE SEQUENCE watchdog_wid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.watchdog_wid_seq OWNER TO drupal;

--
-- Name: watchdog_wid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drupal
--

ALTER SEQUENCE watchdog_wid_seq OWNED BY watchdog.wid;


--
-- Name: watchdog_wid_seq; Type: SEQUENCE SET; Schema: public; Owner: drupal
--

SELECT pg_catalog.setval('watchdog_wid_seq', 14, true);


--
-- Name: aid; Type: DEFAULT; Schema: public; Owner: drupal
--

ALTER TABLE ONLY access ALTER COLUMN aid SET DEFAULT nextval('access_aid_seq'::regclass);


--
-- Name: aid; Type: DEFAULT; Schema: public; Owner: drupal
--

ALTER TABLE ONLY actions_aid ALTER COLUMN aid SET DEFAULT nextval('actions_aid_aid_seq'::regclass);


--
-- Name: aid; Type: DEFAULT; Schema: public; Owner: drupal
--

ALTER TABLE ONLY authmap ALTER COLUMN aid SET DEFAULT nextval('authmap_aid_seq'::regclass);


--
-- Name: bid; Type: DEFAULT; Schema: public; Owner: drupal
--

ALTER TABLE ONLY batch ALTER COLUMN bid SET DEFAULT nextval('batch_bid_seq'::regclass);


--
-- Name: bid; Type: DEFAULT; Schema: public; Owner: drupal
--

ALTER TABLE ONLY blocks ALTER COLUMN bid SET DEFAULT nextval('blocks_bid_seq'::regclass);


--
-- Name: bid; Type: DEFAULT; Schema: public; Owner: drupal
--

ALTER TABLE ONLY boxes ALTER COLUMN bid SET DEFAULT nextval('boxes_bid_seq'::regclass);


--
-- Name: cid; Type: DEFAULT; Schema: public; Owner: drupal
--

ALTER TABLE ONLY comments ALTER COLUMN cid SET DEFAULT nextval('comments_cid_seq'::regclass);


--
-- Name: fid; Type: DEFAULT; Schema: public; Owner: drupal
--

ALTER TABLE ONLY files ALTER COLUMN fid SET DEFAULT nextval('files_fid_seq'::regclass);


--
-- Name: format; Type: DEFAULT; Schema: public; Owner: drupal
--

ALTER TABLE ONLY filter_formats ALTER COLUMN format SET DEFAULT nextval('filter_formats_format_seq'::regclass);


--
-- Name: fid; Type: DEFAULT; Schema: public; Owner: drupal
--

ALTER TABLE ONLY filters ALTER COLUMN fid SET DEFAULT nextval('filters_fid_seq'::regclass);


--
-- Name: fid; Type: DEFAULT; Schema: public; Owner: drupal
--

ALTER TABLE ONLY flood ALTER COLUMN fid SET DEFAULT nextval('flood_fid_seq'::regclass);


--
-- Name: lid; Type: DEFAULT; Schema: public; Owner: drupal
--

ALTER TABLE ONLY locales_source ALTER COLUMN lid SET DEFAULT nextval('locales_source_lid_seq'::regclass);


--
-- Name: mlid; Type: DEFAULT; Schema: public; Owner: drupal
--

ALTER TABLE ONLY menu_links ALTER COLUMN mlid SET DEFAULT nextval('menu_links_mlid_seq'::regclass);


--
-- Name: nid; Type: DEFAULT; Schema: public; Owner: drupal
--

ALTER TABLE ONLY node ALTER COLUMN nid SET DEFAULT nextval('node_nid_seq'::regclass);


--
-- Name: vid; Type: DEFAULT; Schema: public; Owner: drupal
--

ALTER TABLE ONLY node_revisions ALTER COLUMN vid SET DEFAULT nextval('node_revisions_vid_seq'::regclass);


--
-- Name: pid; Type: DEFAULT; Schema: public; Owner: drupal
--

ALTER TABLE ONLY permission ALTER COLUMN pid SET DEFAULT nextval('permission_pid_seq'::regclass);


--
-- Name: rid; Type: DEFAULT; Schema: public; Owner: drupal
--

ALTER TABLE ONLY role ALTER COLUMN rid SET DEFAULT nextval('role_rid_seq'::regclass);


--
-- Name: tid; Type: DEFAULT; Schema: public; Owner: drupal
--

ALTER TABLE ONLY term_data ALTER COLUMN tid SET DEFAULT nextval('term_data_tid_seq'::regclass);


--
-- Name: trid; Type: DEFAULT; Schema: public; Owner: drupal
--

ALTER TABLE ONLY term_relation ALTER COLUMN trid SET DEFAULT nextval('term_relation_trid_seq'::regclass);


--
-- Name: tsid; Type: DEFAULT; Schema: public; Owner: drupal
--

ALTER TABLE ONLY term_synonym ALTER COLUMN tsid SET DEFAULT nextval('term_synonym_tsid_seq'::regclass);


--
-- Name: pid; Type: DEFAULT; Schema: public; Owner: drupal
--

ALTER TABLE ONLY url_alias ALTER COLUMN pid SET DEFAULT nextval('url_alias_pid_seq'::regclass);


--
-- Name: uid; Type: DEFAULT; Schema: public; Owner: drupal
--

ALTER TABLE ONLY users ALTER COLUMN uid SET DEFAULT nextval('users_uid_seq'::regclass);


--
-- Name: vid; Type: DEFAULT; Schema: public; Owner: drupal
--

ALTER TABLE ONLY vocabulary ALTER COLUMN vid SET DEFAULT nextval('vocabulary_vid_seq'::regclass);


--
-- Name: wid; Type: DEFAULT; Schema: public; Owner: drupal
--

ALTER TABLE ONLY watchdog ALTER COLUMN wid SET DEFAULT nextval('watchdog_wid_seq'::regclass);


--
-- Data for Name: access; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY access (aid, mask, type, status) FROM stdin;
\.


--
-- Data for Name: actions; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY actions (aid, type, callback, parameters, description) FROM stdin;
comment_publish_action	comment	comment_publish_action		コメントを掲載する
comment_unpublish_action	comment	comment_unpublish_action		コメントを非掲載にする
node_publish_action	node	node_publish_action		投稿を掲載する
node_unpublish_action	node	node_unpublish_action		投稿を非掲載にする
node_make_sticky_action	node	node_make_sticky_action		リスト上部へ固定する
node_make_unsticky_action	node	node_make_unsticky_action		リスト上部への固定を解除する
node_promote_action	node	node_promote_action		投稿をフロントページへ掲載する
node_unpromote_action	node	node_unpromote_action		投稿をフロントページから撤去する
node_save_action	node	node_save_action		投稿を保存する
user_block_user_action	user	user_block_user_action		現在のユーザをブロックする
user_block_ip_action	user	user_block_ip_action		現在のユーザのIPアドレスをアクセス禁止にする
\.


--
-- Data for Name: actions_aid; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY actions_aid (aid) FROM stdin;
\.


--
-- Data for Name: authmap; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY authmap (aid, uid, authname, module) FROM stdin;
\.


--
-- Data for Name: batch; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY batch (bid, token, "timestamp", batch) FROM stdin;
\.


--
-- Data for Name: blocks; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY blocks (bid, module, delta, theme, status, weight, region, custom, throttle, visibility, pages, title, cache) FROM stdin;
1	user	0	garland	1	0	left	0	0	0			-1
2	user	1	garland	1	0	left	0	0	0			-1
3	system	0	garland	1	10	footer	0	0	0			-1
\.


--
-- Data for Name: blocks_roles; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY blocks_roles (module, delta, rid) FROM stdin;
\.


--
-- Data for Name: boxes; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY boxes (bid, body, info, format) FROM stdin;
\.


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY cache (cid, data, expire, created, headers, serialized) FROM stdin;
\.


--
-- Data for Name: cache_block; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY cache_block (cid, data, expire, created, headers, serialized) FROM stdin;
\.


--
-- Data for Name: cache_filter; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY cache_filter (cid, data, expire, created, headers, serialized) FROM stdin;
\.


--
-- Data for Name: cache_form; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY cache_form (cid, data, expire, created, headers, serialized) FROM stdin;
\.


--
-- Data for Name: cache_menu; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY cache_menu (cid, data, expire, created, headers, serialized) FROM stdin;
\.


--
-- Data for Name: cache_page; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY cache_page (cid, data, expire, created, headers, serialized) FROM stdin;
\.


--
-- Data for Name: cache_update; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY cache_update (cid, data, expire, created, headers, serialized) FROM stdin;
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY comments (cid, pid, nid, uid, subject, comment, hostname, "timestamp", status, format, thread, name, mail, homepage) FROM stdin;
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY files (fid, uid, filename, filepath, filemime, filesize, status, "timestamp") FROM stdin;
\.


--
-- Data for Name: filter_formats; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY filter_formats (format, name, roles, cache) FROM stdin;
1	Filtered HTML	,1,2,	1
2	Full HTML		1
\.


--
-- Data for Name: filters; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY filters (fid, format, module, delta, weight) FROM stdin;
1	1	filter	2	0
2	1	filter	0	1
3	1	filter	1	2
4	1	filter	3	10
5	2	filter	2	0
6	2	filter	1	1
7	2	filter	3	10
\.


--
-- Data for Name: flood; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY flood (fid, event, hostname, "timestamp") FROM stdin;
\.


--
-- Data for Name: history; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY history (uid, nid, "timestamp") FROM stdin;
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY languages (language, name, native, direction, enabled, plurals, formula, domain, prefix, weight, javascript) FROM stdin;
en	English	English	0	1	0				0	
ja	Japanese	日本語	0	1	2	($n!=1)		ja	0	44b13db58decc911aa3da99f4e3746b8
\.


--
-- Data for Name: locales_source; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY locales_source (lid, location, textgroup, source, version) FROM stdin;
2	misc/drupal.js	default	An error occurred. \\n@uri\\n@text	none
3	misc/drupal.js	default	An error occurred. \\n@uri\\n(no information available).	none
4	misc/drupal.js	default	An HTTP error @status occurred. \\n@uri	none
5	themes/garland/template.php:74;85	default	!datetime — !username	none
6	modules/block/block-admin-display-form.tpl.php:41	default	Region	none
7	modules/block/block-admin-display-form.tpl.php:56	default	No blocks in this region	none
8	modules/block/block.admin.inc:90	default	Save blocks	none
9	modules/block/block.admin.inc:105	default	The block settings have been updated.	none
10	modules/block/block.admin.inc:155	default	Block specific settings	none
11	modules/block/block.admin.inc:160	default	Block title	none
12	modules/block/block.admin.inc:162	default	The title of the block as shown to the user.	none
13	modules/block/block.admin.inc:162	default	Override the default title for the block. Use <em>&lt;none&gt;</em> to display no title, or leave blank to use the default block title.	none
14	modules/block/block.admin.inc:178	default	'%name' block	none
15	modules/block/block.admin.inc:184	default	User specific visibility settings	none
16	modules/block/block.admin.inc:189	default	Custom visibility settings	none
17	modules/block/block.admin.inc:191	default	Users cannot control whether or not they see this block.	none
18	modules/block/block.admin.inc:192	default	Show this block by default, but let individual users hide it.	none
19	modules/block/block.admin.inc:193	default	Hide this block by default but let individual users show it.	none
20	modules/block/block.admin.inc:195	default	Allow individual users to customize the visibility of this block in their account settings.	none
21	modules/block/block.admin.inc:212	default	Role specific visibility settings	none
22	modules/block/block.admin.inc:217	default	Show block for specific roles	none
23	modules/block/block.admin.inc:220	default	Show this block only for the selected role(s). If you select no roles, the block will be visible to all users.	none
24	modules/block/block.admin.inc:225	default	Page specific visibility settings	none
25	modules/block/block.admin.inc:236	default	Show on every page except the listed pages.	none
26	modules/block/block.admin.inc:236	default	Show on only the listed pages.	none
27	modules/block/block.admin.inc:237	default	Enter one page per line as Drupal paths. The '*' character is a wildcard. Example paths are %blog for the blog page and %blog-wildcard for every personal blog. %front is the front page.	none
28	modules/block/block.admin.inc:240	default	Show if the following PHP code returns <code>TRUE</code> (PHP-mode, experts only).	none
29	modules/block/block.admin.inc:241	default	If the PHP-mode is chosen, enter PHP code between %php. Note that executing incorrect PHP-code can break your Drupal site.	none
30	modules/block/block.admin.inc:245	default	Show block on specific pages	none
31	modules/block/block.admin.inc:251	default	Pages	none
32	modules/block/block.admin.inc:259	default	Save block	none
33	modules/block/block.admin.inc:268;297	default	Please ensure that each block description is unique.	none
34	modules/block/block.admin.inc:281	default	The block configuration has been saved.	none
35	modules/block/block.admin.inc:318	default	The block has been created.	none
36	modules/block/block.admin.inc:333	default	Are you sure you want to delete the block %name?	none
37	modules/block/block.admin.inc:342	default	The block %name has been removed.	none
38	modules/block/block.module:69	default	Blocks are boxes of content rendered into an area, or region, of a web page. The default theme Garland, for example, implements the regions "left sidebar", "right sidebar", "content", "header", and "footer", and a block may appear in any one of these areas. The <a href="@blocks">blocks administration page</a> provides a drag-and-drop interface for assigning a block to a region, and for controlling the order of blocks within regions.	none
39	modules/block/block.module:70	default	Although blocks are usually generated automatically by modules (like the <em>User login</em> block, for example), administrators can also define custom blocks. Custom blocks have a title, description, and body. The body of the block can be as long as necessary, and can contain content supported by any available <a href="@input-format">input format</a>.	none
40	modules/block/block.module:71	default	When working with blocks, remember that:	none
41	modules/block/block.module:72	default	since not all themes implement the same regions, or display regions in the same way, blocks are positioned on a per-theme basis.	none
42	modules/block/block.module:73	default	disabled blocks, or blocks not in a region, are never shown.	none
43	modules/block/block.module:74	default	when throttle module is enabled, throttled blocks (blocks with the <em>Throttle</em> checkbox selected) are hidden during high server loads.	none
44	modules/block/block.module:75	default	blocks can be configured to be visible only on certain pages.	none
45	modules/block/block.module:76	default	blocks can be configured to be visible only when specific conditions are true.	none
46	modules/block/block.module:77	default	blocks can be configured to be visible only for certain user roles.	none
47	modules/block/block.module:78	default	when allowed by an administrator, specific blocks may be enabled or disabled on a per-user basis using the <em>My account</em> page.	none
48	modules/block/block.module:79	default	some dynamic blocks, such as those generated by modules, will be displayed only on certain pages.	none
49	modules/block/block.module:80	default	For more information, see the online handbook entry for <a href="@block">Block module</a>.	none
50	modules/block/block.module:84	default	This page provides a drag-and-drop interface for assigning a block to a region, and for controlling the order of blocks within regions. To change the region or order of a block, grab a drag-and-drop handle under the <em>Block</em> column and drag the block to a new location in the list. (Grab a handle by clicking and holding the mouse while hovering over a handle icon.) Since not all themes implement the same regions, or display regions in the same way, blocks are positioned on a per-theme basis. Remember that your changes will not be saved until you click the <em>Save blocks</em> button at the bottom of the page.	none
51	「バンドワイズ」は誤読のため「帯域幅」に統一,  modules/block/block.module:86	default	To reduce CPU usage, database traffic or bandwidth, blocks may be automatically disabled during high server loads by selecting their <em>Throttle</em> checkbox. Adjust throttle thresholds on the <a href="@throttleconfig">throttle configuration page</a>.	none
52	modules/block/block.module:88	default	Click the <em>configure</em> link next to each block to configure its specific title and visibility settings. Use the <a href="@add-block">add block page</a> to create a custom block.	none
53	modules/block/block.module:91	default	Use this page to create a new custom block. New blocks are disabled by default, and must be moved to a region on the <a href="@blocks">blocks administration page</a> to be visible.	none
54	modules/block/block.module:286	default	The block %info was assigned to the invalid region %region and has been disabled.	none
55	modules/block/block.module:355	default	Block description	none
56	modules/block/block.module:358	default	A brief description of your block. Used on the <a href="@overview">block overview page</a>.	none
57	modules/block/block.module:365	default	Block body	none
58	modules/block/block.module:368	default	The content of the block as shown to the user.	none
59	modules/block/block.module:414	default	Block configuration	none
60	modules/block/block.module:112	default	administer blocks	none
61	modules/block/block.module:112	default	use PHP for block visibility	none
62	modules/block/block.module:120	default	Blocks	none
63	modules/block/block.module:121	default	Configure what block content appears in your site's sidebars and other regions.	none
64	modules/block/block.module:132	default	JavaScript List Form	none
65	modules/block/block.module:139	default	Configure block	none
66	modules/block/block.module:147	default	Delete block	none
67	modules/block/block.module:155	default	Add block	none
68	modules/block/block.js:0	default	The changes to these blocks will not be saved until the <em>Save blocks</em> button is clicked.	none
1	misc/drupal.js:0	default	Unspecified error	none
69	misc/drupal.js:0	default	An error occurred. \n@uri\n@text	none
70	misc/drupal.js:0	default	An error occurred. \n@uri\n(no information available).	none
71	misc/drupal.js:0	default	An HTTP error @status occurred. \n@uri	none
72	misc/tabledrag.js:0	default	Drag to re-order	none
73	misc/tabledrag.js:0	default	Changes made in this table will not be saved until the form is submitted.	none
74	misc/tableselect.js:0	default	Select all rows in this table	none
75	misc/tableselect.js:0	default	Deselect all rows in this table	none
76	misc/teaser.js:0;0	default	Split summary at cursor	none
77	misc/teaser.js:0;0	default	Join summary	none
78	includes/actions.inc:337	default	Remove orphaned actions	none
79	includes/actions.inc:65	default	Stack overflow: too many calls to actions_do(). Aborting to prevent infinite recursion.	none
80	includes/actions.inc:311	default	Action '%action' added.	none
81	includes/actions.inc:333	default	Removed orphaned action '%action' from database.	none
82	includes/actions.inc:368	default	Action %action saved.	none
83	includes/actions.inc:376	default	Action %action created.	none
84	includes/actions.inc:339	default	One orphaned action (%orphans) exists in the actions table. !link	none
85	includes/actions.inc:339	default	@count orphaned actions (%orphans) exist in the actions table. !link	none
86	includes/batch.inc:99	default	HTTP POST is required.	none
87	(duplicate) includes/batch.inc:100 includes/unicode.inc:85	default	Error	none
88	includes/common.inc:367	default	Site off-line	none
89	includes/common.inc:394	default	Page not found	none
90	includes/common.inc:395	default	The requested page could not be found.	none
91	includes/common.inc:424	default	Access denied	none
92	includes/common.inc:425	default	You are not authorized to access this page.	none
93	includes/common.inc:1289	default	KB	none
94	includes/common.inc:1294	default	@size @suffix	none
95	includes/common.inc:1326	default	0 sec	none
96	includes/common.inc:3753	default	notice	none
97	includes/common.inc:3754	default	info	none
98	includes/common.inc:3755	default	debug	none
99	includes/common.inc:699 includes/image.inc:94 includes/menu.inc:2360,  includes/unicode.inc:150;183	default	php	none
100	includes/common.inc:699	default	%message in %file on line %line.	none
101	includes/common.inc:2784;2791;2806;2822	default	cron	none
102	要するにセマフォが何らかの原因で残っている状態,  includes/common.inc:2784	default	Cron has been running for more than an hour and is most likely stuck.	none
103	"cron がすでに実行されている間に再実行が試みられました。",  includes/common.inc:2791	default	Attempting to re-run cron while it is already running.	none
104	includes/common.inc:2806	default	Cron run completed.	none
105	includes/common.inc:2822	default	Cron run exceeded the time limit and was aborted.	none
106	includes/common.inc:1285	default	1 byte	none
107	includes/common.inc:1285	default	@count bytes	none
108	「年間」とするかどうか難しいところ,  includes/common.inc:0	default	1 year	none
109	「年間」とするかどうか難しいところ,  includes/common.inc:0	default	@count years	none
110	「週間」とするかどうか難しいところ,  includes/common.inc:0	default	1 week	none
111	「週間」とするかどうか難しいところ,  includes/common.inc:0	default	@count weeks	none
112	includes/common.inc:0	default	1 day	none
113	includes/common.inc:0	default	@count days	none
114	includes/common.inc:0	default	1 hour	none
115	includes/common.inc:0	default	@count hours	none
116	includes/common.inc:0	default	1 min	none
117	includes/common.inc:0	default	@count min	none
118	includes/common.inc:0	default	1 sec	none
119	includes/common.inc:0	default	@count sec	none
120	(duplicate) includes/database.mysql.inc:25 includes/database.mysqli.inc:28	default	MySQL database	none
121	(duplicate) includes/database.mysql.inc:31 includes/database.mysqli.inc:34	default	Your MySQL Server is too old. Drupal requires at least MySQL %version.	none
122	(duplicate) includes/database.pgsql.inc:22	default	PostgreSQL database	none
123	(duplicate) includes/database.pgsql.inc:28	default	Your PostgreSQL Server is too old. Drupal requires at least PostgreSQL %version.	none
124	(duplicate) includes/database.pgsql.inc:419	default	Your PostgreSQL database is set up with the wrong character encoding (%encoding). It is possible it will not work as expected. It is advised to recreate it with UTF-8/Unicode encoding. More information can be found in the <a href="@url">PostgreSQL documentation</a>.	none
125	includes/file.inc:114	default	The directory %directory has been created.	none
126	includes/file.inc:128	default	The permissions of directory %directory have been changed to make it writable.	none
127	includes/file.inc:131	default	The directory %directory is not writable	none
128	includes/file.inc:169;171	default	Security warning: Couldn't write .htaccess file. Please create a .htaccess file in your %directory directory which contains the following lines: <code>!htaccess</code>	none
129	includes/file.inc:304	default	The selected file %file could not be uploaded, because the destination %directory is not properly configured.	none
130	includes/file.inc:320	default	The selected file %file could not be copied, because no file by that name exists. Please check that you supplied the correct filename.	none
131	includes/file.inc:333;384	default	The selected file %file could not be copied, because a file by that name already exists in the destination.	none
132	includes/file.inc:338	default	The selected file %file could not be copied.	none
133	includes/file.inc:425	default	The removal of the original file %file has failed.	none
134	includes/file.inc:490	default	For security reasons, your upload has been renamed to %filename.	none
135	includes/file.inc:618	default	The file %file could not be saved, because it exceeds %maxsize, the maximum allowed size for uploads.	none
136	includes/file.inc:623	default	The file %file could not be saved, because the upload did not complete.	none
137	includes/file.inc:628	default	The file %file could not be saved. An unknown error has occurred.	none
138	includes/file.inc:679	default	The selected file %name could not be uploaded.	none
139	includes/file.inc:694	default	File upload error. Could not move uploaded file.	none
140	includes/file.inc:724	default	Its name exceeds the 255 characters limit. Please rename the file and try again.	none
141	includes/file.inc:752	default	Only files with the following extensions are allowed: %files-allowed.	none
142	includes/file.inc:781	default	The file is %filesize exceeding the maximum file size of %maxsize.	none
143	includes/file.inc:786	default	The file is %filesize which would exceed your disk quota of %quota.	none
144	includes/file.inc:805	default	Only JPEG, PNG and GIF images are allowed.	none
145	includes/file.inc:840	default	The image was resized to fit within the maximum allowed dimensions of %dimensions pixels.	none
146	includes/file.inc:848	default	The image is too large; the maximum dimensions are %dimensions pixels.	none
147	includes/file.inc:857	default	The image is too small; the minimum dimensions are %dimensions pixels.	none
148	includes/file.inc:882	default	The file could not be created.	none
149	includes/file.inc:132	default	The directory %directory is not writable, because it does not have the correct permissions set.	none
150	includes/file.inc:305	default	The selected file %file could not be uploaded, because the destination %directory could not be found, or because its permissions do not allow the file to be written.	none
151	includes/file.inc:695	default	file	none
152	includes/file.inc:695	default	Upload error. Could not move uploaded file %file to destination %destination.	none
154	includes/form.inc:1651	default	The specified passwords do not match.	none
155	includes/form.inc:1655	default	Password field is required.	none
156	includes/form.inc:1736	default	The specified date is invalid.	none
157	(duplicate) includes/form.inc:702	default	!name field is required.	none
158	(duplicate) includes/form.inc:707	default	!name cannot be longer than %max characters but is currently %length characters long.	none
159	(duplicate) includes/form.inc:2223	default	This field is required.	none
160	(duplicate) includes/form.inc:2228 ;2231	default	!title: !required	none
161	(duplicate) includes/form.inc:2475	default	Initializing.	none
162	(duplicate) includes/form.inc:2476	default	Remaining @remaining of @total.	none
163	(duplicate) includes/form.inc:2477	default	An error has occurred.	none
164	(duplicate) includes/form.inc:2550	default	Please continue to <a href="@error_url">the error page</a>	none
165	includes/form.inc:722	default	Illegal choice %choice in !name element.	none
166	includes/image.gd.inc:17	default	GD2 image manipulation toolkit	none
167	includes/image.gd.inc:27	default	The GD toolkit is installed and working properly.	none
168	includes/image.gd.inc:32	default	JPEG quality	none
169	includes/image.gd.inc:33	default	Define the image quality for JPEG manipulations. Ranges from 0 to 100. Higher values mean better image quality but bigger files.	none
170	includes/image.gd.inc:37	default	%	none
171	includes/image.gd.inc:44	default	The GD image toolkit requires that the GD module for PHP be installed and configured properly. For more information see <a href="@url">PHP's image documentation</a>.	none
172	includes/image.gd.inc:56	default	JPEG quality must be a number between 0 and 100.	none
173	includes/image.inc:94	default	The selected image handling toolkit %toolkit can not correctly process %function.	none
174	includes/install.inc:727	default	Currently using !item !version	none
175	includes/locale.inc:50;281	default	Right to left	none
176	includes/locale.inc:50;281	default	Left to right	none
177	includes/locale.inc:92	default	Code	none
178	includes/locale.inc:92	default	English name	none
179	includes/locale.inc:92	default	Native name	none
180	includes/locale.inc:92;277	default	Direction	none
181	includes/locale.inc:124	default	Configuration saved.	none
182	includes/locale.inc:159	default	Predefined language	none
183	includes/locale.inc:163;729	default	Language name	none
184	includes/locale.inc:166	default	Select the desired language and click the <em>Add language</em> button. (Use the <em>Custom language</em> options if your desired language does not appear in this list.)	none
185	includes/locale.inc:178	default	Custom language	none
186	includes/locale.inc:185	default	Add custom language	none
187	includes/locale.inc:205	default	Save language	none
188	includes/locale.inc:231;241	default	Language code	none
189	includes/locale.inc:247	default	<a href="@rfc4646">RFC 4646</a> compliant language identifier. Language codes typically use a country code, and optionally, a script or regional variant name. <em>Examples: "en", "en-US" and "zh-Hant".</em>	none
190	includes/locale.inc:251	default	Language name in English	none
191	includes/locale.inc:255	default	Name of the language in English. Will be available for translation in all languages.	none
192	includes/locale.inc:258	default	Native language name	none
193	includes/locale.inc:262	default	Name of the language in the language being added.	none
194	includes/locale.inc:265	default	Path prefix	none
195	includes/locale.inc:268	default	Language code or other custom string for pattern matching within the path. With language negotiation set to <em>Path prefix only</em> or <em>Path prefix with language fallback</em>, this site is presented in this language when the Path prefix value matches an element in the path. For the default language, this value may be left blank. <strong>Modifying this value will break existing URLs and should be used with caution in a production environment.</strong> <em>Example: Specifying "deutsch" as the path prefix for German results in URLs in the form "www.example.com/deutsch/node".</em>	none
196	includes/locale.inc:271	default	Language domain	none
197	includes/locale.inc:274	default	Language-specific URL, with protocol. With language negotiation set to <em>Domain name only</em>, the site is presented in this language when the URL accessing the site references this domain. For the default language, this value may be left blank. <strong>This value must include a protocol as part of the string.</strong> <em>Example: Specifying "http://example.de" or "http://de.example.com" as language domains for German results in URLs in the forms "http://example.de/node" and "http://de.example.com/node", respectively.</em>	none
198	includes/locale.inc:279	default	Direction that text in this language is presented.	none
199	includes/locale.inc:293	default	The language %language (%code) already exists.	none
200	includes/locale.inc:300	default	Invalid language code.	none
201	includes/locale.inc:317;323	default	The language %language has been created and can now be used. More information is available on the <a href="@locale-help">help screen</a>.	none
202	includes/locale.inc:342	default	The characters &lt;, &gt;, " and ' are not allowed in the language code field.	none
203	includes/locale.inc:345	default	The characters &lt;, &gt;, " and ' are not allowed in the language name in English field.	none
204	includes/locale.inc:348	default	The characters &lt;, &gt;, " and ' are not allowed in the native language name field.	none
205	includes/locale.inc:352	default	Domain and path prefix values should not be set at the same time.	none
206	includes/locale.inc:355	default	The domain (%domain) is already tied to a language (%language).	none
207	includes/locale.inc:358	default	Only the default language can have both the domain and prefix empty.	none
208	includes/locale.inc:361	default	The prefix (%prefix) is already tied to a language (%language).	none
209	includes/locale.inc:399	default	The English language cannot be deleted.	none
210	includes/locale.inc:404	default	The default language cannot be deleted.	none
211	includes/locale.inc:416	default	Are you sure you want to delete the language %name?	none
212	includes/locale.inc:416	default	Deleting a language will remove all interface translations associated with it, and posts in this language will be set to be language neutral. This action cannot be undone.	none
213	includes/locale.inc:435;436	default	The language %locale has been removed.	none
214	includes/locale.inc:459	default	Language negotiation	none
215	includes/locale.inc:462	default	None.	none
216	includes/locale.inc:463	default	Path prefix only.	none
217	includes/locale.inc:464	default	Path prefix with language fallback.	none
218	includes/locale.inc:465	default	Domain name only.	none
219	includes/locale.inc:467	default	Select the mechanism used to determine your site's presentation language. <strong>Modifying this setting may break all incoming URLs and should be used with caution in a production environment.</strong>	none
220	includes/locale.inc:481	default	Language negotiation configuration saved.	none
221	includes/locale.inc:514	default	English (built-in)	none
222	includes/locale.inc:567	default	String contains	none
223	includes/locale.inc:569	default	Leave blank to show all strings. The search is case sensitive.	none
224	includes/locale.inc:577	default	English (provided by Drupal)	none
225	includes/locale.inc:580	default	Search in	none
226	includes/locale.inc:582	default	Both translated and untranslated strings	none
227	includes/locale.inc:582	default	Only translated strings	none
228	includes/locale.inc:582	default	Only untranslated strings	none
229	includes/locale.inc:586	default	Limit search to	none
230	includes/locale.inc:588	default	All text groups	none
231	includes/locale.inc:619	default	Already added languages	none
232	includes/locale.inc:620	default	Languages not yet added	none
233	includes/locale.inc:627	default	Import translation	none
234	includes/locale.inc:630	default	Language file	none
235	includes/locale.inc:632	default	A Gettext Portable Object (<em>.po</em>) file.	none
236	includes/locale.inc:635	default	Import into	none
297	includes/locale.inc:2327	default	Akan	none
298	includes/locale.inc:2328	default	Amharic	none
237	includes/locale.inc:638	default	Choose the language you want to add strings into. If you choose a language which is not yet set up, it will be added.	none
238	includes/locale.inc:641;734;753;2058	default	Text group	none
239	includes/locale.inc:644	default	Imported translations will be added to this text group.	none
240	includes/locale.inc:647	default	Mode	none
241	includes/locale.inc:650	default	Strings in the uploaded file replace existing ones, new ones are added	none
242	includes/locale.inc:651	default	Existing strings are kept, only new strings are added	none
243	includes/locale.inc:673	default	The language %language has been created.	none
244	includes/locale.inc:679;680	default	The translation import of %filename failed.	none
245	includes/locale.inc:684	default	File to import not found.	none
246	includes/locale.inc:725	default	Export translation	none
247	includes/locale.inc:731	default	Select the language to export in Gettext Portable Object (<em>.po</em>) format.	none
248	includes/locale.inc:748	default	Export template	none
249	includes/locale.inc:750	default	Generate a Gettext Portable Object Template (<em>.pot</em>) file with all strings from the Drupal locale database.	none
250	includes/locale.inc:792	default	String not found.	none
251	includes/locale.inc:800	default	Original text	none
252	includes/locale.inc:842	default	Save translations	none
253	includes/locale.inc:872	default	The submitted string contains disallowed HTML: %string	none
254	includes/locale.inc:905	default	The string has been saved.	none
255	includes/locale.inc:940	default	Are you sure you want to delete the string "%source"?	none
256	includes/locale.inc:940	default	Deleting the string will remove all translations of this string in all languages. This action cannot be undone.	none
257	includes/locale.inc:952	default	The string has been removed.	none
258	includes/locale.inc:1046	default	The language selected for import is not supported.	none
259	includes/locale.inc:1061	default	The translation file %filename appears to have a missing or malformed header.	none
260	状況を把握しやすいようにシンプルに,  includes/locale.inc:1071	default	The translation was successfully imported. There are %number newly created translated strings, %update strings were updated and %delete strings were removed.	none
261	includes/locale.inc:1462	default	The translation file %filename contains an error: the plural formula could not be parsed.	none
262	includes/locale.inc:2058	default	String	none
263	includes/locale.inc:2084	default	No strings found for your search.	none
264	(duplicate) includes/locale.inc:2602	default	Importing interface translations	none
265	(duplicate) includes/locale.inc:2603	default	Starting import	none
266	(duplicate) includes/locale.inc:2604	default	Error importing interface translations	none
267	(duplicate) includes/locale.inc:1099	default	The translation import failed, because the file %filename could not be read.	none
268	(duplicate) includes/locale.inc:1128	default	The translation file %filename contains an error: "msgstr" was expected but not found on line %line.	none
269	(duplicate) includes/locale.inc:1134	default	The translation file %filename contains an error: "msgid_plural" was expected but not found on line %line.	none
270	(duplicate) includes/locale.inc:1140 ;1158 ;1170 ;1178 ;1192 ;1201	default	The translation file %filename contains a syntax error on line %line.	none
271	(duplicate) includes/locale.inc:1152	default	The translation file %filename contains an error: "msgid" is unexpected on line %line.	none
272	(duplicate) includes/locale.inc:1166	default	The translation file %filename contains an error: "msgstr[]" is unexpected on line %line.	none
273	(duplicate) includes/locale.inc:1186	default	The translation file %filename contains an error: "msgstr" is unexpected on line %line.	none
274	(duplicate) includes/locale.inc:1214	default	The translation file %filename contains an error: there is an unexpected string on line %line.	none
275	(duplicate) includes/locale.inc:1225	default	The translation file %filename ended unexpectedly at line %line.	none
276	includes/locale.inc:436;680;873;1015;1072;1904;1908;2244;2247;2251;2254;2257	default	locale	none
277	includes/locale.inc:873	default	Attempted submission of a translation string with disallowed HTML: %string	none
278	includes/locale.inc:1015	default	The %language language (%code) has been created.	none
279	状況を把握しやすいようにシンプルに,  includes/locale.inc:1072	default	Imported %file into %locale: %number new strings added, %update updated and %delete removed.	none
280	includes/locale.inc:1904	default	Exported %locale translation file: %filename.	none
281	includes/locale.inc:1908	default	Exported translation file: %filename.	none
282	includes/locale.inc:2244	default	Updated JavaScript translation file for the language %language.	none
283	includes/locale.inc:2247	default	JavaScript translation file %file.js was lost.	none
284	includes/locale.inc:2251	default	Created JavaScript translation file for the language %language.	none
285	includes/locale.inc:2254	default	Removed JavaScript translation file for the language %language, because no translations currently exist for that language.	none
286	includes/locale.inc:2257	default	An error occurred during creation of the JavaScript translation file for the language %language.	none
287	includes/locale.inc:1074	default	One translation string was skipped because it contains disallowed HTML.	none
288	includes/locale.inc:1074	default	@count translation strings were skipped because they contain disallowed HTML.	none
289	includes/locale.inc:2642	default	One translation file imported for the newly installed modules.	none
290	includes/locale.inc:2642	default	@count translation files imported for the newly installed modules.	none
291	includes/locale.inc:2652	default	One translation file imported for the enabled modules.	none
292	includes/locale.inc:2652	default	@count translation files imported for the enabled modules.	none
293	includes/locale.inc:2323	default	Afar	none
294	includes/locale.inc:2324	default	Abkhazian	none
295	includes/locale.inc:2325	default	Avestan	none
296	includes/locale.inc:2326	default	Afrikaans	none
299	includes/locale.inc:2329	default	Arabic	none
300	includes/locale.inc:2330	default	Assamese	none
301	includes/locale.inc:2331	default	Avar	none
302	includes/locale.inc:2332	default	Aymara	none
303	includes/locale.inc:2333	default	Azerbaijani	none
304	includes/locale.inc:2334	default	Bashkir	none
305	includes/locale.inc:2335	default	Belarusian	none
306	includes/locale.inc:2336	default	Bulgarian	none
307	includes/locale.inc:2337	default	Bihari	none
308	includes/locale.inc:2338	default	Bislama	none
309	includes/locale.inc:2339	default	Bambara	none
310	includes/locale.inc:2340	default	Bengali	none
311	includes/locale.inc:2341	default	Tibetan	none
312	includes/locale.inc:2342	default	Breton	none
313	includes/locale.inc:2343	default	Bosnian	none
314	includes/locale.inc:2344	default	Catalan	none
315	includes/locale.inc:2345	default	Chechen	none
316	includes/locale.inc:2346	default	Chamorro	none
317	includes/locale.inc:2347	default	Corsican	none
318	includes/locale.inc:2348	default	Cree	none
319	includes/locale.inc:2349	default	Czech	none
320	includes/locale.inc:2350	default	Old Slavonic	none
321	includes/locale.inc:2351	default	Chuvash	none
322	includes/locale.inc:2352	default	Welsh	none
323	includes/locale.inc:2353	default	Danish	none
324	includes/locale.inc:2354	default	German	none
325	includes/locale.inc:2355	default	Maldivian	none
326	includes/locale.inc:2356	default	Bhutani	none
327	includes/locale.inc:2357	default	Ewe	none
328	includes/locale.inc:2358	default	Greek	none
329	includes/locale.inc:2359	default	English	none
330	includes/locale.inc:2360	default	Esperanto	none
331	includes/locale.inc:2361	default	Spanish	none
332	includes/locale.inc:2362	default	Estonian	none
333	includes/locale.inc:2363	default	Basque	none
334	includes/locale.inc:2364	default	Persian	none
335	includes/locale.inc:2365	default	Fulah	none
336	includes/locale.inc:2366	default	Finnish	none
337	includes/locale.inc:2367	default	Fiji	none
338	includes/locale.inc:2368	default	Faeroese	none
339	includes/locale.inc:2369	default	French	none
340	includes/locale.inc:2370	default	Frisian	none
341	includes/locale.inc:2371	default	Irish	none
342	includes/locale.inc:2372	default	Scots Gaelic	none
343	includes/locale.inc:2373	default	Galician	none
344	includes/locale.inc:2374	default	Guarani	none
345	includes/locale.inc:2375	default	Gujarati	none
346	includes/locale.inc:2376	default	Manx	none
347	includes/locale.inc:2377	default	Hausa	none
348	includes/locale.inc:2378	default	Hebrew	none
349	includes/locale.inc:2379	default	Hindi	none
350	includes/locale.inc:2380	default	Hiri Motu	none
351	includes/locale.inc:2381	default	Croatian	none
352	includes/locale.inc:2382	default	Hungarian	none
353	includes/locale.inc:2383	default	Armenian	none
354	includes/locale.inc:2384	default	Herero	none
355	includes/locale.inc:2385	default	Interlingua	none
356	includes/locale.inc:2386	default	Indonesian	none
357	includes/locale.inc:2387	default	Interlingue	none
358	includes/locale.inc:2388	default	Igbo	none
359	includes/locale.inc:2389	default	Inupiak	none
360	includes/locale.inc:2390	default	Icelandic	none
361	includes/locale.inc:2391	default	Italian	none
362	includes/locale.inc:2392	default	Inuktitut	none
364	includes/locale.inc:2394	default	Javanese	none
365	includes/locale.inc:2395	default	Georgian	none
366	includes/locale.inc:2396	default	Kongo	none
367	includes/locale.inc:2397	default	Kikuyu	none
368	includes/locale.inc:2398	default	Kwanyama	none
369	includes/locale.inc:2399	default	Kazakh	none
370	includes/locale.inc:2400	default	Greenlandic	none
371	includes/locale.inc:2401	default	Cambodian	none
372	includes/locale.inc:2402	default	Kannada	none
373	includes/locale.inc:2403	default	Korean	none
374	includes/locale.inc:2404	default	Kanuri	none
375	includes/locale.inc:2405	default	Kashmiri	none
376	includes/locale.inc:2406	default	Kurdish	none
377	includes/locale.inc:2407	default	Komi	none
378	includes/locale.inc:2408	default	Cornish	none
379	includes/locale.inc:2409	default	Kirghiz	none
380	includes/locale.inc:2410	default	Latin	none
381	includes/locale.inc:2411	default	Luxembourgish	none
382	includes/locale.inc:2412	default	Luganda	none
383	includes/locale.inc:2413	default	Lingala	none
384	includes/locale.inc:2414	default	Laothian	none
385	includes/locale.inc:2415	default	Lithuanian	none
386	includes/locale.inc:2416	default	Latvian	none
387	includes/locale.inc:2417	default	Malagasy	none
388	includes/locale.inc:2418	default	Marshallese	none
389	includes/locale.inc:2419	default	Maori	none
390	includes/locale.inc:2420	default	Macedonian	none
391	includes/locale.inc:2421	default	Malayalam	none
392	includes/locale.inc:2422	default	Mongolian	none
393	includes/locale.inc:2423	default	Moldavian	none
394	includes/locale.inc:2424	default	Marathi	none
395	includes/locale.inc:2425	default	Malay	none
396	includes/locale.inc:2426	default	Maltese	none
1767		default	create story content	none
397	includes/locale.inc:2427	default	Burmese	none
398	includes/locale.inc:2428	default	Nauru	none
399	includes/locale.inc:2429	default	North Ndebele	none
400	includes/locale.inc:2430	default	Nepali	none
401	includes/locale.inc:2431	default	Ndonga	none
402	includes/locale.inc:2432	default	Dutch	none
403	includes/locale.inc:2433	default	Norwegian Bokmål	none
404	includes/locale.inc:2434	default	Norwegian Nynorsk	none
405	includes/locale.inc:2435	default	South Ndebele	none
406	includes/locale.inc:2436	default	Navajo	none
407	includes/locale.inc:2437	default	Chichewa	none
408	includes/locale.inc:2438	default	Occitan	none
409	includes/locale.inc:2439	default	Oromo	none
410	includes/locale.inc:2440	default	Oriya	none
411	includes/locale.inc:2441	default	Ossetian	none
412	includes/locale.inc:2442	default	Punjabi	none
413	includes/locale.inc:2443	default	Pali	none
414	includes/locale.inc:2444	default	Polish	none
415	includes/locale.inc:2445	default	Pashto	none
416	includes/locale.inc:2446	default	Portuguese, Portugal	none
417	includes/locale.inc:2447	default	Portuguese, Brazil	none
418	includes/locale.inc:2448	default	Quechua	none
419	includes/locale.inc:2449	default	Rhaeto-Romance	none
420	includes/locale.inc:2450	default	Kirundi	none
421	includes/locale.inc:2451	default	Romanian	none
422	includes/locale.inc:2452	default	Russian	none
423	includes/locale.inc:2453	default	Kinyarwanda	none
424	includes/locale.inc:2454	default	Sanskrit	none
425	includes/locale.inc:2455	default	Sardinian	none
426	includes/locale.inc:2456	default	Sindhi	none
427	includes/locale.inc:2457	default	Northern Sami	none
428	includes/locale.inc:2458	default	Sango	none
429	includes/locale.inc:2459	default	Serbo-Croatian	none
430	includes/locale.inc:2460	default	Sinhala	none
431	includes/locale.inc:2461	default	Slovak	none
432	includes/locale.inc:2462	default	Slovenian	none
433	includes/locale.inc:2463	default	Samoan	none
434	includes/locale.inc:2464	default	Shona	none
435	includes/locale.inc:2465	default	Somali	none
436	includes/locale.inc:2466	default	Albanian	none
437	includes/locale.inc:2467	default	Serbian	none
438	includes/locale.inc:2468	default	Siswati	none
439	includes/locale.inc:2469	default	Sesotho	none
440	includes/locale.inc:2470	default	Sudanese	none
441	includes/locale.inc:2471	default	Swedish	none
442	includes/locale.inc:2472	default	Swahili	none
443	includes/locale.inc:2473	default	Tamil	none
444	includes/locale.inc:2474	default	Telugu	none
445	includes/locale.inc:2475	default	Tajik	none
446	includes/locale.inc:2476	default	Thai	none
447	includes/locale.inc:2477	default	Tigrinya	none
448	includes/locale.inc:2478	default	Turkmen	none
449	includes/locale.inc:2479	default	Tagalog	none
450	includes/locale.inc:2480	default	Setswana	none
451	includes/locale.inc:2481	default	Tonga	none
452	includes/locale.inc:2482	default	Turkish	none
453	includes/locale.inc:2483	default	Tsonga	none
454	includes/locale.inc:2484	default	Tatar	none
455	includes/locale.inc:2485	default	Twi	none
456	includes/locale.inc:2486	default	Tahitian	none
457	includes/locale.inc:2487	default	Uighur	none
458	includes/locale.inc:2488	default	Ukrainian	none
459	includes/locale.inc:2489	default	Urdu	none
460	includes/locale.inc:2490	default	Uzbek	none
461	includes/locale.inc:2491	default	Venda	none
462	includes/locale.inc:2492	default	Vietnamese	none
463	includes/locale.inc:2493	default	Wolof	none
464	includes/locale.inc:2494	default	Xhosa	none
465	includes/locale.inc:2495	default	Yiddish	none
466	includes/locale.inc:2496	default	Yoruba	none
467	includes/locale.inc:2497	default	Zhuang	none
468	includes/locale.inc:2498	default	Chinese, Simplified	none
469	includes/locale.inc:2499	default	Chinese, Traditional	none
470	includes/locale.inc:2500	default	Zulu	none
471	includes/mail.inc:134	default	Unable to send e-mail. Please contact the site administrator if the problem persists.	none
472	includes/mail.inc:133	default	Error sending e-mail (from %from to %to).	none
473	includes/menu.inc:2500	default	Operating in off-line mode.	none
474	includes/menu.inc:2360	default	Menu router rebuild failed - some paths may not work correctly.	none
475	includes/module.inc:214	default	%module is part of a circular dependency. This is not supported and you will not be able to switch it on.	none
476	最初<->最後の方が一般的なようだが……,  includes/pager.inc:144;400	default	« first	none
477	includes/pager.inc:145;401	default	‹ previous	none
478	includes/pager.inc:146;402	default	next ›	none
479	最初<->最後の方が一般的なようだが……,  includes/pager.inc:147;403	default	last »	none
480	includes/pager.inc:400	default	Go to first page	none
481	includes/pager.inc:403	default	Go to last page	none
482	includes/pager.inc:410	default	Go to page @number	none
483	includes/tablesort.inc:70	default	sort by @s	none
484	includes/theme.inc:1472;1475	default	sort icon	none
485	includes/theme.inc:1472	default	sort ascending	none
486	includes/theme.inc:1475	default	sort descending	none
487	includes/theme.inc:1513	default	updated	none
488	includes/theme.inc:1585	default	[<a href="@link">more help...</a>]	none
489	includes/theme.inc:1598;1598	default	XML feed	none
490	includes/theme.inc:1612	default	Syndicate content	none
491	includes/theme.inc:1626	default	<a href="@link" title="@title">more</a>	none
492	includes/theme.inc:1706	default	not verified	none
493	(duplicate) includes/unicode.inc:47	default	The PCRE library in your PHP installation is outdated. This will cause problems when handling Unicode text. If you are running PHP 4.3.3 or higher, make sure you are using the PCRE library supplied by PHP. Please refer to the <a href="@url">PHP PCRE documentation</a> for more information.	none
494	(duplicate) includes/unicode.inc:52	default	Operations on Unicode strings are emulated on a best-effort basis. Install the <a href="@url">PHP mbstring extension</a> for improved Unicode support.	none
495	(duplicate) includes/unicode.inc:57	default	Multibyte string function overloading in PHP is active and must be disabled. Check the php.ini <em>mbstring.func_overload</em> setting. Please refer to the <a href="@url">PHP mbstring documentation</a> for more information.	none
496	(duplicate) includes/unicode.inc:60	default	Multibyte string input conversion in PHP is active and must be disabled. Check the php.ini <em>mbstring.encoding_translation</em> setting. Please refer to the <a href="@url">PHP mbstring documentation</a> for more information.	none
497	(duplicate) includes/unicode.inc:63	default	Multibyte string input conversion in PHP is active and must be disabled. Check the php.ini <em>mbstring.http_input</em> setting. Please refer to the <a href="@url">PHP mbstring documentation</a> for more information.	none
498	(duplicate) includes/unicode.inc:66	default	Multibyte string output conversion in PHP is active and must be disabled. Check the php.ini <em>mbstring.http_output</em> setting. Please refer to the <a href="@url">PHP mbstring documentation</a> for more information.	none
499	(duplicate) includes/unicode.inc:83	default	Standard PHP	none
500	(duplicate) includes/unicode.inc:84	default	PHP Mbstring Extension	none
501	(duplicate) includes/unicode.inc:95	default	Unicode library	none
502	includes/unicode.inc:150	default	Could not convert XML encoding %s to UTF-8.	none
503	includes/unicode.inc:183	default	Unsupported encoding %s. Please install iconv, GNU recode or mbstring for PHP.	none
504	includes/xmlrpc.inc:451	default	Parse error. Not well formed	none
505	includes/xmlrpcs.inc:61	default	Parse error. Request not well formed.	none
506	includes/xmlrpcs.inc:64	default	Server error. Invalid XML-RPC. Request must be a methodCall.	none
507	includes/xmlrpcs.inc:154;293	default	Server error. Requested method @methodname not specified.	none
508	includes/xmlrpcs.inc:165	default	Server error. Wrong number of method parameters.	none
509	includes/xmlrpcs.inc:202	default	Server error. Invalid method parameters.	none
510	includes/xmlrpcs.inc:208	default	Server error. Requested function @method does not exist.	none
511	includes/xmlrpcs.inc:221	default	Invalid syntax for system.multicall.	none
512	includes/xmlrpcs.inc:227	default	Recursive calls to system.multicall are forbidden.	none
513	includes/xmlrpcs.inc:296	default	Server error. Requested method @methodname signature not specified.	none
514	modules/system/system.admin.inc:21	default	One or more problems were detected with your Drupal installation. Check the <a href="@status">status report</a> for more information.	none
515	modules/system/system.admin.inc:57;79	default	You do not have any administrative items.	none
516	modules/system/system.admin.inc:118	default	Get help	none
517	modules/system/system.admin.inc:158	default	System default	none
518	modules/system/system.admin.inc:166 modules/system/system.module:264	default	Administration theme	none
519	modules/system/system.admin.inc:167	default	Choose which theme the administration pages should display in. If you choose "System default" the administration pages will use the same theme as the rest of the site.	none
520	modules/system/system.admin.inc:173	default	Use administration theme for content editing	none
521	modules/system/system.admin.inc:174	default	Use the administration theme when editing existing posts or creating new ones.	none
522	modules/system/system.admin.inc:215 modules/system/system.module:712	default	Screenshot for %theme theme	none
523	modules/system/system.admin.inc:215 modules/system/system.module:712	default	no screenshot	none
524	modules/system/system.admin.inc:295	default	Please note that the <a href="!admin_theme_page">administration theme</a> is still set to the %admin_theme theme; consequently, the theme on this page remains unchanged. All non-administrative sections of the site, however, will show the selected %selected_theme theme by default.	none
525	modules/system/system.admin.inc:313;571;957,  modules/system/system.module:1146	default	The configuration options have been saved.	none
526	modules/system/system.admin.inc:384	default	Logo	none
527	modules/system/system.admin.inc:385	default	Site name	none
528	modules/system/system.admin.inc:386	default	Site slogan	none
529	modules/system/system.admin.inc:387	default	Mission statement	none
530	modules/system/system.admin.inc:388	default	User pictures in posts	none
531	modules/system/system.admin.inc:389	default	User pictures in comments	none
532	modules/system/system.admin.inc:390	default	Search box	none
533	modules/system/system.admin.inc:391	default	Shortcut icon	none
534	modules/system/system.admin.inc:408	default	Toggle display	none
535	modules/system/system.admin.inc:409	default	Enable or disable the display of certain page elements.	none
536	modules/system/system.admin.inc:434	default	Display post information on	none
537	modules/system/system.admin.inc:435	default	Enable or disable the <em>submitted by Username on date</em> text when displaying posts of the following type.	none
538	modules/system/system.admin.inc:454	default	Logo image settings	none
539	modules/system/system.admin.inc:455	default	If toggled on, the following logo will be displayed.	none
540	modules/system/system.admin.inc:460	default	Use the default logo	none
541	modules/system/system.admin.inc:463	default	Check here if you want the theme to use the logo supplied with it.	none
542	modules/system/system.admin.inc:467	default	Path to custom logo	none
543	modules/system/system.admin.inc:469	default	The path to the file you would like to use as your logo file instead of the default logo.	none
544	modules/system/system.admin.inc:473	default	Upload logo image	none
545	modules/system/system.admin.inc:475	default	If you don't have direct file access to the server, use this field to upload your logo.	none
546	modules/system/system.admin.inc:482	default	Shortcut icon settings	none
547	modules/system/system.admin.inc:483	default	Your shortcut icon, or 'favicon', is displayed in the address bar and bookmarks of most browsers.	none
548	modules/system/system.admin.inc:487	default	Use the default shortcut icon.	none
549	modules/system/system.admin.inc:489	default	Check here if you want the theme to use the default shortcut icon.	none
550	modules/system/system.admin.inc:493	default	Path to custom icon	none
551	modules/system/system.admin.inc:495	default	The path to the image file you would like to use as your custom shortcut icon.	none
552	modules/system/system.admin.inc:500	default	Upload icon image	none
553	modules/system/system.admin.inc:501	default	If you don't have direct file access to the server, use this field to upload your shortcut icon.	none
554	modules/system/system.admin.inc:511	default	Theme-engine-specific settings	none
555	modules/system/system.admin.inc:511	default	These settings only exist for all the templates and styles based on the %engine theme engine.	none
556	modules/system/system.admin.inc:541	default	Theme-specific settings	none
557	modules/system/system.admin.inc:542	default	These settings only exist for the %theme theme and all the styles based on it.	none
558	modules/system/system.admin.inc:565 modules/system/system.module:1143	default	The configuration options have been reset to their default values.	none
559	modules/system/system.admin.inc:702	default	@module (<span class="admin-missing">missing</span>)	none
560	modules/system/system.admin.inc:709;733	default	@module (<span class="admin-enabled">enabled</span>)	none
561	modules/system/system.admin.inc:712;738	default	@module (<span class="admin-disabled">disabled</span>)	none
562	modules/system/system.admin.inc:865	default	Some required modules must be enabled	none
563	modules/system/system.admin.inc:867	default	Would you like to continue with enabling the above?	none
564	modules/system/system.admin.inc:868	default	Continue	none
565	modules/system/system.admin.inc:1064;1109;2133,  modules/system/system.module:330;336	default	Uninstall	none
566	modules/system/system.admin.inc:1103	default	The following modules will be completely uninstalled from your site, and <em>all data from these modules will be lost</em>!	none
567	modules/system/system.admin.inc:1106	default	Confirm uninstall	none
568	modules/system/system.admin.inc:1108	default	Would you like to continue with uninstalling the above?	none
569	modules/system/system.admin.inc:1121	default	No modules selected.	none
570	modules/system/system.admin.inc:1138	default	The selected modules have been uninstalled.	none
571	modules/system/system.admin.inc:1159	default	The name of this website.	none
572	modules/system/system.admin.inc:1166	default	The <em>From</em> address in automated e-mails sent during registration and new password requests, and other notifications. (Use an address ending in your site's domain to help prevent this e-mail being flagged as spam.)	none
573	modules/system/system.admin.inc:1171	default	Slogan	none
574	modules/system/system.admin.inc:1173	default	Your site's motto, tag line, or catchphrase (often displayed alongside the title of the site).	none
575	modules/system/system.admin.inc:1177	default	Mission	none
576	modules/system/system.admin.inc:1179	default	Your site's mission or focus statement (often prominently displayed on the front page).	none
577	modules/system/system.admin.inc:1183	default	Footer message	none
578	modules/system/system.admin.inc:1185	default	This text will be displayed at the bottom of each page. Useful for adding a copyright notice to your pages.	none
579	modules/system/system.admin.inc:1189	default	Anonymous user	none
580	modules/system/system.admin.inc:1191	default	The name used to indicate anonymous users.	none
581	modules/system/system.admin.inc:1196	default	Default front page	none
582	modules/system/system.admin.inc:1199	default	The home page displays content from this relative URL. If unsure, specify "node".	none
583	modules/system/system.admin.inc:1224	default	The path '@path' is either invalid or you do not have access to it.	none
584	modules/system/system.admin.inc:1238	default	Default 403 (access denied) page	none
585	modules/system/system.admin.inc:1241	default	This page is displayed when the requested document is denied to the current user. If unsure, specify nothing.	none
586	modules/system/system.admin.inc:1247	default	Default 404 (not found) page	none
587	modules/system/system.admin.inc:1250	default	This page is displayed when no other content matches the requested document. If unsure, specify nothing.	none
588	modules/system/system.admin.inc:1255 modules/system/system.module:387	default	Error reporting	none
589	modules/system/system.admin.inc:1256	default	Write errors to the log	none
590	modules/system/system.admin.inc:1256	default	Write errors to the log and to the screen	none
591	modules/system/system.admin.inc:1257	default	Specify where Drupal, PHP and SQL errors are logged. While it is recommended that a site running in a production environment write errors to the log only, in a development or testing environment it may be helpful to write errors both to the log and to the screen.	none
592	modules/system/system.admin.inc:1283	default	The normal cache mode is suitable for most sites and does not cause any side effects. The aggressive cache mode causes Drupal to skip the loading (boot) and unloading (exit) of enabled modules when serving a cached page. This results in an additional performance boost but can cause unwanted side effects.	none
593	modules/system/system.admin.inc:1289	default	<strong class="error">The following enabled modules are incompatible with aggressive mode caching and will not function properly: %modules</strong>	none
594	modules/system/system.admin.inc:1292	default	<strong class="ok">Currently, all enabled modules are compatible with the aggressive caching policy.</strong> Please note, if you use aggressive caching and enable new modules, you will need to check this page again to ensure compatibility.	none
595	modules/system/system.admin.inc:1296	default	Page cache	none
642	modules/system/system.admin.inc:1559	default	Short date format	none
596	modules/system/system.admin.inc:1297	default	Enabling the page cache will offer a significant performance boost. Drupal can store and send compressed cached pages requested by <em>anonymous</em> users. By caching a web page, Drupal does not have to construct the page each time it is viewed.	none
597	modules/system/system.admin.inc:1302	default	Caching mode	none
598	modules/system/system.admin.inc:1304	default	Normal (recommended for production sites, no side effects)	none
599	modules/system/system.admin.inc:1304	default	Aggressive (experts only, possible side effects)	none
600	modules/system/system.admin.inc:1312	default	Minimum cache lifetime	none
601	modules/system/system.admin.inc:1315	default	On high-traffic sites, it may be necessary to enforce a minimum cache lifetime. The minimum cache lifetime is the minimum amount of time that will elapse before the cache is emptied and recreated, and is applied to both page and block caches. A larger minimum cache lifetime offers better performance, but users will not see new content for a longer period of time.	none
602	modules/system/system.admin.inc:1319	default	Page compression	none
603	「バンドワイズ」は誤読のため「帯域幅」に統一,  modules/system/system.admin.inc:1322	default	By default, Drupal compresses the pages it caches in order to save bandwidth and improve download times. This option should be disabled when using a webserver that performs compression.	none
604	modules/system/system.admin.inc:1327;1333	default	Block cache	none
605	modules/system/system.admin.inc:1328	default	Enabling the block cache can offer a performance increase for all users by preventing blocks from being reconstructed on each page load. If the page cache is also enabled, performance increases from enabling the block cache will mainly benefit authenticated users.	none
606	modules/system/system.admin.inc:1335	default	Enabled (recommended)	none
607	modules/system/system.admin.inc:1337	default	Note that block caching is inactive when modules defining content access restrictions are enabled.	none
608	「バンドワイズ」は誤読のため「帯域幅」に統一,  modules/system/system.admin.inc:1342	default	Bandwidth optimizations	none
609	「バンドワイズ」は誤読のため「帯域幅」に統一,  modules/system/system.admin.inc:1343	default	<p>Drupal can automatically optimize external resources like CSS and JavaScript, which can reduce both the size and number of requests made to your website. CSS files can be aggregated and compressed into a single file, while JavaScript files are aggregated (but not compressed). These optional optimizations may reduce server load, bandwidth requirements, and page loading times.</p><p>These options are disabled if you have not set up your files directory, or if your download method is set to private.</p>	none
610	modules/system/system.admin.inc:1350	default	Optimize CSS files	none
611	modules/system/system.admin.inc:1354	default	This option can interfere with theme development and should only be enabled in a production environment.	none
612	modules/system/system.admin.inc:1358	default	Optimize JavaScript files	none
613	modules/system/system.admin.inc:1362	default	This option can interfere with module development and should only be enabled in a production environment.	none
614	modules/system/system.admin.inc:1367;1373	default	Clear cached data	none
615	modules/system/system.admin.inc:1368	default	Caching data improves performance, but may cause problems while troubleshooting new modules, themes, or translations, if outdated information has been cached. To refresh all cached data on your site, click the button below. <em>Warning: high-traffic sites will experience performance slowdowns while cached data is rebuilt.</em>	none
616	modules/system/system.admin.inc:1390	default	Caches cleared.	none
617	modules/system/system.admin.inc:1403	default	File system path	none
618	modules/system/system.admin.inc:1406	default	A file system path where the files will be stored. This directory must exist and be writable by Drupal. If the download method is set to public, this directory must be relative to the Drupal installation directory and be accessible over the web. If the download method is set to private, this directory should not be accessible over the web. Changing this location will modify all download paths and may cause unexpected problems on an existing site.	none
619	modules/system/system.admin.inc:1412	default	Temporary directory	none
620	modules/system/system.admin.inc:1415	default	A file system path where uploaded files will be stored during previews.	none
621	modules/system/system.admin.inc:1421	default	Download method	none
622	modules/system/system.admin.inc:1423	default	Public - files are available using HTTP directly.	none
623	modules/system/system.admin.inc:1423	default	Private - files are transferred by Drupal.	none
624	modules/system/system.admin.inc:1424	default	Choose the <em>Public download</em> method unless you wish to enforce fine-grained access controls over file downloads. Changing the download method will modify all download paths and may cause unexpected problems on an existing site.	none
625	modules/system/system.admin.inc:1441	default	Select an image processing toolkit	none
626	modules/system/system.admin.inc:1465	default	Number of items in each feed	none
627	modules/system/system.admin.inc:1468	default	Default number of items to include in each feed.	none
628	modules/system/system.admin.inc:1472	default	Feed content	none
629	modules/system/system.admin.inc:1474	default	Titles only	none
630	modules/system/system.admin.inc:1474	default	Titles plus teaser	none
631	modules/system/system.admin.inc:1474	default	Full text	none
632	modules/system/system.admin.inc:1475	default	Global setting for the default display of content items in each feed.	none
633	modules/system/system.admin.inc:1518	default	Custom format	none
634	modules/system/system.admin.inc:1522 modules/system/system.module:558	default	Locale settings	none
635	modules/system/system.admin.inc:1527	default	Default time zone	none
636	modules/system/system.admin.inc:1530	default	Select the default site time zone.	none
637	modules/system/system.admin.inc:1535	default	User-configurable time zones	none
638	modules/system/system.admin.inc:1538	default	When enabled, users can set their own time zone and dates will be displayed accordingly.	none
639	modules/system/system.admin.inc:1543	default	First day of week	none
640	modules/system/system.admin.inc:1546	default	The first day of the week for calendar views.	none
641	modules/system/system.admin.inc:1551	default	Formatting	none
643	modules/system/system.admin.inc:1563	default	The short format of date display.	none
644	modules/system/system.admin.inc:1571	default	Custom short date format	none
645	modules/system/system.admin.inc:1574	default	A user-defined short date format. See the <a href="@url">PHP manual</a> for available options. This format is currently set to display as <span>%date</span>.	none
646	modules/system/system.admin.inc:1582	default	Medium date format	none
647	modules/system/system.admin.inc:1586	default	The medium sized date display.	none
648	modules/system/system.admin.inc:1594	default	Custom medium date format	none
649	modules/system/system.admin.inc:1597	default	A user-defined medium date format. See the <a href="@url">PHP manual</a> for available options. This format is currently set to display as <span>%date</span>.	none
650	modules/system/system.admin.inc:1605	default	Long date format	none
651	modules/system/system.admin.inc:1609	default	Longer date format used for detailed display.	none
652	modules/system/system.admin.inc:1617	default	Custom long date format	none
653	modules/system/system.admin.inc:1620	default	A user-defined long date format. See the <a href="@url">PHP manual</a> for available options. This format is currently set to display as <span>%date</span>.	none
654	modules/system/system.admin.inc:1663	default	Site status	none
655	modules/system/system.admin.inc:1665	default	Online	none
656	modules/system/system.admin.inc:1665	default	Off-line	none
657	modules/system/system.admin.inc:1666	default	When set to "Online", all visitors will be able to browse your site normally. When set to "Off-line", only users with the "administer site configuration" permission will be able to access your site to perform maintenance; all other visitors will see the site off-line message configured below. Authorized users can log in during "Off-line" mode directly via the <a href="@user-login">user login</a> page.	none
658	modules/system/system.admin.inc:1671	default	Site off-line message	none
659	modules/system/system.admin.inc:1673	default	Message to show visitors when the site is in off-line mode.	none
660	modules/system/system.admin.inc:1688 modules/system/system.module:457	default	Clean URLs	none
661	詳細に（冗長？）,  modules/system/system.admin.inc:1691	default	This option makes Drupal emit "clean" URLs (i.e. without <code>?q=</code> in the URL).	none
662	modules/system/system.admin.inc:1698	default	Before enabling clean URLs, you must perform a test to determine if your server is properly configured. If you are able to see this page again after clicking the "Run the clean URL test" link, the test has succeeded and the radio buttons above will be available. If instead you are directed to a "Page not found" error, you will need to change the configuration of your server. The <a href="@handbook">handbook page on Clean URLs</a> has additional troubleshooting information.	none
663	modules/system/system.admin.inc:1702	default	<a href="@clean_url">Run the clean url test</a>.	none
665	modules/system/system.admin.inc:1743	default	Cron ran successfully.	none
666	modules/system/system.admin.inc:1746	default	Cron run failed.	none
667	modules/system/system.admin.inc:1778	default	Variable	none
668	modules/system/system.admin.inc:1778	default	Value	none
669	modules/system/system.admin.inc:1793	default	Command counters	none
670	modules/system/system.admin.inc:1795	default	The number of <code>SELECT</code>-statements.	none
671	modules/system/system.admin.inc:1796	default	The number of <code>INSERT</code>-statements.	none
672	modules/system/system.admin.inc:1797	default	The number of <code>UPDATE</code>-statements.	none
673	modules/system/system.admin.inc:1798	default	The number of <code>DELETE</code>-statements.	none
674	modules/system/system.admin.inc:1799	default	The number of table locks.	none
675	modules/system/system.admin.inc:1800	default	The number of table unlocks.	none
676	modules/system/system.admin.inc:1803	default	Query performance	none
677	Select_full_join（MySQLリファレンスマニュアル日本語版より/他も同様）,  modules/system/system.admin.inc:1805	default	The number of joins without an index; should be zero.	none
678	Select_range_check,  modules/system/system.admin.inc:1806	default	The number of joins without keys that check for key usage after each row; should be zero.	none
679	Sort_scan,  modules/system/system.admin.inc:1807	default	The number of sorts done without using an index; should be zero.	none
680	Table_locks_immediate,  modules/system/system.admin.inc:1808	default	The number of times a lock could be acquired immediately.	none
681	Table_locks_waited,  modules/system/system.admin.inc:1809	default	The number of times the server had to wait for a lock.	none
682	modules/system/system.admin.inc:1812	default	Query cache information	none
683	modules/system/system.admin.inc:1813	default	The MySQL query cache can improve performance of your site by storing the result of queries. Then, if an identical query is received later, the MySQL server retrieves the result from the query cache rather than parsing and executing the statement again.	none
684	Qcache_queries_in_cache,  modules/system/system.admin.inc:1815	default	The number of queries in the query cache.	none
685	modules/system/system.admin.inc:1816	default	The number of times MySQL found previous results in the cache.	none
686	modules/system/system.admin.inc:1817	default	The number of times MySQL added a query to the cache (misses).	none
687	modules/system/system.admin.inc:1818	default	The number of times MySQL had to remove queries from the cache because it ran out of memory. Ideally should be zero.	none
688	modules/system/system.admin.inc:1931	default	Show descriptions	none
689	modules/system/system.admin.inc:1931	default	Expand layout to include descriptions.	none
690	modules/system/system.admin.inc:1934	default	Hide descriptions	none
691	modules/system/system.admin.inc:1934	default	Compress layout by hiding descriptions.	none
692	modules/system/system.admin.inc:2050;2234	default	Version	none
693	modules/system/system.admin.inc:2057	default	Other	none
694	modules/system/system.admin.inc:2072;2077;2202;2207	default	incompatible	none
779	modules/system/system.module:200	default	File download	none
695	modules/system/system.admin.inc:2072;2202	default	Incompatible with this version of Drupal core	none
696	modules/system/system.admin.inc:2073;2203	default	This version is incompatible with the !core_version version of Drupal core.	none
697	modules/system/system.admin.inc:2077;2207	default	Incompatible with this version of PHP	none
698	modules/system/system.admin.inc:2082	default	This module requires PHP version @php_required and is incompatible with PHP version !php_version.	none
699	modules/system/system.admin.inc:2150	default	No modules are available to uninstall.	none
700	modules/system/system.admin.inc:2176;2234	default	Screenshot	none
701	modules/system/system.admin.inc:2212	default	This theme requires PHP version @php_required and is incompatible with PHP version !php_version.	none
702	modules/system/system.admin.inc:857	default	You must enable the @dependencies module to install @module.	none
703	modules/system/system.admin.inc:857	default	You must enable the @dependencies modules to install @module.	none
704	modules/system/system.module:51	default	The system module is at the foundation of your Drupal website, and provides basic but extensible functionality for use by other modules and themes. Some integral elements of Drupal are contained in and managed by the system module, including caching, enabling or disabling of modules and themes, preparing and displaying the administrative page, and configuring fundamental site settings. A number of key system maintenance operations are also part of the system module.	none
705	modules/system/system.module:52	default	The system module provides:	none
706	modules/system/system.module:53	default	support for enabling and disabling <a href="@modules">modules</a>. Drupal comes packaged with a number of core modules; each module provides a discrete set of features and may be enabled depending on the needs of your site. A wide array of additional modules contributed by members of the Drupal community are available for download at the <a href="@drupal-modules">Drupal.org module page</a>.	none
707	modules/system/system.module:54	default	support for enabling and disabling <a href="@themes">themes</a>, which determine the design and presentation of your site. Drupal comes packaged with several core themes and additional contributed themes are available at the <a href="@drupal-themes">Drupal.org theme page</a>.	none
708	modules/system/system.module:55	default	a robust <a href="@cache-settings">caching system</a> that allows the efficient re-use of previously-constructed web pages and web page components. Drupal stores the pages requested by anonymous users in a compressed format; depending on your site configuration and the amount of your web traffic tied to anonymous visitors, Drupal's caching system may significantly increase the speed of your site.	none
709	modules/system/system.module:56	default	a set of routine administrative operations that rely on a correctly-configured <a href="@cron">cron maintenance task</a> to run automatically. A number of other modules, including the feed aggregator, ping module and search also rely on <a href="@cron">cron maintenance tasks</a>. For more information, see the online handbook entry for <a href="@handbook">configuring cron jobs</a>.	none
710	modules/system/system.module:57	default	basic configuration options for your site, including <a href="@date-settings">date and time settings</a>, <a href="@file-system">file system settings</a>, <a href="@clean-url">clean URL support</a>, <a href="@site-info">site name and other information</a>, and a <a href="@site-maintenance">site maintenance</a> function for taking your site temporarily off-line.	none
711	modules/system/system.module:58	default	For more information, see the online handbook entry for <a href="@system">System module</a>.	none
712	modules/system/system.module:61	default	Welcome to the administration section. Here you may control how your site functions.	none
713	modules/system/system.module:63	default	This page shows you all available administration tasks for each module.	none
714	modules/system/system.module:65	default	Select which themes are available to your users and specify the default theme. To configure site-wide display settings, click the "configure" task above. Alternatively, to override these settings in a specific theme, click the "configure" link for that theme. Note that different themes may have different regions available for displaying content; for consistency in presentation, you may wish to enable only one theme.	none
715	modules/system/system.module:66	default	To change the appearance of your site, a number of <a href="@themes">contributed themes</a> are available.	none
716	modules/system/system.module:71	default	These options control the display settings for the <code>%template</code> theme. When your site is displayed using this theme, these settings will be used. By clicking "Reset to defaults," you can choose to use the <a href="@global">global settings</a> for this theme.	none
717	modules/system/system.module:73	default	These options control the default display settings for your entire site, across all themes. Unless they have been overridden by a specific theme, these settings will be used.	none
718	modules/system/system.module:75	default	Modules are plugins that extend Drupal's core functionality. Enable modules by selecting the <em>Enabled</em> checkboxes below and clicking the <em>Save configuration</em> button. Once a module is enabled, new <a href="@permissions">permissions</a> may be available. To reduce server load, modules with their <em>Throttle</em> checkbox selected are temporarily disabled when your site becomes extremely busy. (Note that the <em>Throttle</em> checkbox is only available if the Throttle module is enabled.)	none
719	modules/system/system.module:77	default	The auto-throttle functionality must be enabled on the <a href="@throttle">throttle configuration page</a> after having enabled the throttle module.	none
720	modules/system/system.module:80	default	It is important that <a href="@update-php">update.php</a> is run every time a module is updated to a newer version.	none
721	modules/system/system.module:81	default	You can find all administration tasks belonging to a particular module on the <a href="@by-module">administration by module page</a>.	none
722	modules/system/system.module:82	default	To extend the functionality of your site, a number of <a href="@modules">contributed modules</a> are available.	none
723	modules/system/system.module:83	default	To clear all caches, click the button on the <a href="@performance">Performance page</a>.	none
724	modules/system/system.module:86	default	The uninstall process removes all data related to a module. To uninstall a module, you must first disable it. Not all modules support this feature.	none
725	modules/system/system.module:89	default	The <em>Powered by Drupal</em> block is an optional link to the home page of the Drupal project. While there is absolutely no requirement that sites feature this link, it may be used to show support for Drupal.	none
726	modules/system/system.module:94	default	Actions are individual tasks that the system can do, such as unpublishing a piece of content or banning a user. Modules, such as the trigger module, can fire these actions when certain system events happen; for example, when a new post is added or when a user logs in. Modules may also provide additional actions.	none
727	modules/system/system.module:95	default	There are two types of actions: simple and advanced. Simple actions do not require any additional configuration, and are listed here automatically. Advanced actions can do more than simple actions; for example, send an e-mail to a specified address, or check for certain words within a piece of content. These actions need to be created and configured first before they may be used. To create an advanced action, select the action from the drop-down below and click the <em>Create</em> button.	none
728	modules/system/system.module:97	default	You may proceed to the <a href="@url">Triggers</a> page to assign these actions to system events.	none
729	modules/system/system.module:101	default	An advanced action offers additional configuration options which may be filled out below. Changing the <em>Description</em> field is recommended, in order to better identify the precise action taking place. This description will be displayed in modules such as the trigger module when assigning actions to system events, so it is best if it is as descriptive as possible (for example, "Send e-mail to Moderation Team" rather than simply "Send e-mail").	none
730	modules/system/system.module:103	default	Here you can find a short overview of your site's parameters as well as any problems detected with your installation. It may be useful to copy and paste this information into support requests filed on drupal.org's support forums and project issue queues.	none
731	modules/system/system.module:552	default	Selecting a different theme will change the look and feel of the site.	none
732	modules/system/system.module:564	default	Time zone	none
733	modules/system/system.module:567	default	Select your current local time. Dates and times throughout this site will be displayed using this time zone.	none
734	modules/system/system.module:584	default	Powered by Drupal	none
735	modules/system/system.module:594	default	Badge color	none
736	modules/system/system.module:596	default	Black	none
737	modules/system/system.module:596	default	Blue	none
738	modules/system/system.module:596	default	Gray	none
739	modules/system/system.module:600	default	Badge size	none
740	modules/system/system.module:602	default	Small	none
741	modules/system/system.module:602	default	Large	none
742	modules/system/system.module:692	default	Theme configuration	none
743	modules/system/system.module:715	default	(site default theme)	none
744	modules/system/system.module:1112	default	The settings have not been saved because of the errors.	none
745	modules/system/system.module:1291	default	Configure permissions	none
746	modules/system/system.module:1345	default	When cron runs	none
749	modules/system/system.module:1400	default	Choose an advanced action	none
750	modules/system/system.module:1415	default	Action type	none
751	modules/system/system.module:1435	default	Actions available to Drupal:	none
752	modules/system/system.module:1461	default	Make a new advanced action available	none
753	modules/system/system.module:1473	default	Create	none
754	modules/system/system.module:1540	default	A unique description for this advanced action. This description will be displayed in the interface of modules that integrate with actions, such as Trigger module.	none
755	modules/system/system.module:1596	default	The action has been successfully saved.	none
756	modules/system/system.module:1614	default	Are you sure you want to delete the action %action?	none
757	modules/system/system.module:1616	default	This cannot be undone.	none
758	modules/system/system.module:1631	default	Action %action was deleted	none
759	modules/system/system.module:1643	default	Deleted orphaned action (%action).	none
760	modules/system/system.module:1679	default	Recipient	none
761	modules/system/system.module:1682	default	The email address to which the message should be sent OR enter %author if you would like to send an e-mail to the author of the original post.	none
762	modules/system/system.module:1689	default	The subject of the message.	none
763	modules/system/system.module:1697	default	The message that should be sent. You may include the following variables: %site_name, %username, %node_url, %node_type, %title, %teaser, %body, %term_name, %term_description, %term_id, %vocabulary_name, %vocabulary_description, %vocabulary_id. Not all variables will be available in all contexts.	none
764	modules/system/system.module:1710	default	Please enter a valid email address or %author.	none
765	modules/system/system.module:1843	default	The message to be displayed to the current user. You may include the following variables: %site_name, %username, %node_url, %node_type, %title, %teaser, %body. Not all variables will be available in all contexts.	none
766	modules/system/system.module:1916	default	The URL to which the user should be redirected. This can be an internal URL like node/1234 or an external URL like http://drupal.org.	none
767	modules/system/system.module:1973;1973	default	Powered by Drupal, an open source content management system	none
768	modules/system/system.module:1324	default	Could not delete temporary file "%path" during garbage collection	none
769	modules/system/system.module:1630	default	Deleted action %aid (%action)	none
770	modules/system/system.module:1757	default	Cannot use %author token in this context.	none
771	modules/system/system.module:1788	default	Sent email to %recipient	none
772	modules/system/system.module:1791	default	Unable to send email to %recipient	none
773	modules/system/system.module:158	default	administer site configuration	none
774	modules/system/system.module:158	default	access administration pages	none
775	modules/system/system.module:158	default	administer actions	none
776	modules/system/system.module:158	default	access site reports	none
777	modules/system/system.module:158	default	select different theme	none
778	modules/system/system.module:158	default	administer files	none
748	modules/system/system.module:1380	default	Redirect to URL	6.34
780	modules/system/system.module:206	default	Administer	none
781	modules/system/system.module:213	default	Compact mode	none
782	modules/system/system.module:220	default	By task	none
783	modules/system/system.module:227	default	By module	none
784	modules/system/system.module:235	default	Content management	none
785	modules/system/system.module:236	default	Manage your site's content.	none
786	modules/system/system.module:246	default	Site configuration	none
787	modules/system/system.module:247	default	Adjust basic site configuration options.	none
788	modules/system/system.module:255	default	Site building	none
789	modules/system/system.module:256	default	Control how your site looks and feels.	none
790	modules/system/system.module:265	default	Settings for how your administrative pages should look.	none
791	modules/system/system.module:276	default	Change which theme your site uses or allows users to set.	none
792	modules/system/system.module:284	default	Select the default theme.	none
793	modules/system/system.module:296	default	Global settings	none
794	modules/system/system.module:314	default	Enable or disable add-on modules for your site.	none
795	modules/system/system.module:343	default	Actions	none
796	modules/system/system.module:344;350	default	Manage the actions defined for your site.	none
797	modules/system/system.module:349	default	Manage actions	none
798	modules/system/system.module:356	default	Configure an advanced action	none
799	modules/system/system.module:363	default	Delete action	none
800	modules/system/system.module:364	default	Delete an action.	none
801	modules/system/system.module:371	default	Remove orphans	none
802	modules/system/system.module:379	default	Site information	none
803	modules/system/system.module:380	default	Change basic site information, such as the site name, slogan, e-mail address, mission, front page and more.	none
804	modules/system/system.module:388	default	Control how Drupal deals with errors including 403/404 errors as well as PHP error reporting.	none
805	modules/system/system.module:395	default	Logging and alerts	none
806	modules/system/system.module:396	default	Settings for logging and alerts modules. Various modules can route Drupal's system events to different destination, such as syslog, database, email, ...etc.	none
807	modules/system/system.module:402	default	Performance	none
808	「バンドワイズ」は誤読のため「帯域幅」に統一,  modules/system/system.module:403	default	Enable or disable page caching for anonymous users and set CSS and JS bandwidth optimization options.	none
809	(duplicate) modules/system/system.module:410,  modules/system/system.install:212	default	File system	none
810	modules/system/system.module:411	default	Tell Drupal where to store uploaded files and how they are accessed.	none
811	modules/system/system.module:418	default	Image toolkit	none
812	modules/system/system.module:419	default	Choose which image toolkit to use if you have installed optional toolkits.	none
813	modules/system/system.module:426	default	RSS publishing	none
814	modules/system/system.module:427	default	Configure the number of items per feed and whether feeds should be titles/teasers/full-text.	none
815	modules/system/system.module:434	default	Date and time	none
816	modules/system/system.module:435	default	Settings for how Drupal displays date and time, as well as the system's default timezone.	none
817	modules/system/system.module:442	default	Date and time lookup	none
818	modules/system/system.module:449	default	Site maintenance	none
819	modules/system/system.module:450	default	Take the site off-line for maintenance or bring it back online.	none
820	modules/system/system.module:458	default	Enable or disable clean URLs for your site.	none
821	modules/system/system.module:465	default	Clean URL check	none
822	modules/system/system.module:474	default	Reports	none
823	modules/system/system.module:475	default	View reports from system logs and other status information.	none
824	modules/system/system.module:483	default	Status report	none
825	modules/system/system.module:484	default	Get a status report about your site's operation and any detected problems.	none
826	modules/system/system.module:491	default	Run cron	none
827	(duplicate) modules/system/system.module:498,  modules/system/system.install:35	default	PHP	none
828	modules/system/system.module:505	default	SQL	none
829	modules/system/system.module:0	default	Footer	none
830	modules/system/system.install:66	default	-1 (Unlimited)	none
832	(duplicate) modules/system/system.install:19	default	Drupal	none
833	(duplicate) modules/system/system.install:29	default	Web server	none
834	(duplicate) modules/system/system.install:39	default	Your PHP installation is too old. Drupal requires at least PHP %version.	none
835	(duplicate) modules/system/system.install:45	default	PHP register globals	none
836	(duplicate) modules/system/system.install:54	default	<em>register_globals</em> is enabled. Drupal requires this configuration directive to be disabled. Your site may not be secure when <em>register_globals</em> is enabled. The PHP manual has instructions for <a href="http://php.net/configuration.changes">how to change configuration settings</a>.	none
837	(duplicate) modules/system/system.install:56	default	Enabled ('@value')	none
838	(duplicate) modules/system/system.install:65	default	PHP memory limit	none
839	(duplicate) modules/system/system.install:72	default	Consider increasing your PHP memory limit to %memory_minimum_limit to help prevent errors in the installation process.	none
840	(duplicate) modules/system/system.install:75	default	Consider increasing your PHP memory limit to %memory_minimum_limit to help prevent errors in the update process.	none
841	(duplicate) modules/system/system.install:78	default	Depending on your configuration, Drupal can run with a %memory_limit PHP memory limit. However, a %memory_minimum_limit PHP memory limit or above is recommended, especially if your site uses additional custom or contributed modules.	none
842	(duplicate) modules/system/system.install:83	default	Increase the memory limit by editing the memory_limit parameter in the file %configuration-file and then restart your web server (or contact your system administrator or hosting provider for assistance).	none
843	(duplicate) modules/system/system.install:86	default	Contact your system administrator or hosting provider for assistance with increasing your PHP memory limit.	none
844	(duplicate) modules/system/system.install:89	default	See the <a href="@url">Drupal requirements</a> for more information.	none
845	(duplicate) modules/system/system.install:106 ;282	default	Not protected	none
846	(duplicate) modules/system/system.install:111	default	The directory %file is not protected from modifications and poses a security risk. You must change the directory's permissions to be non-writable. 	none
847	(duplicate) modules/system/system.install:114	default	The file %file is not protected from modifications and poses a security risk. You must change the file's permissions to be non-writable.	none
848	(duplicate) modules/system/system.install:119 ;289	default	Protected	none
849	(duplicate) modules/system/system.install:122	default	Configuration file	none
850	(duplicate) modules/system/system.install:132	default	Files directory	none
851	(duplicate) modules/system/system.install:136	default	Temporary files directory	none
852	(duplicate) modules/system/system.install:146	default	Not fully protected	none
853	(duplicate) modules/system/system.install:148	default	See <a href="@url">@url</a> for information about the recommended .htaccess file which should be added to the %directory directory to help protect against arbitrary code execution.	none
854	(duplicate) modules/system/system.install:161	default	For more information, see the online handbook entry for <a href="@cron-handbook">configuring cron jobs</a>.	none
855	(duplicate) modules/system/system.install:185	default	Cron has not run. Please visit the <a href="@status">status report</a> for more information.	none
856	(duplicate) modules/system/system.install:190	default	Never run	none
857	(duplicate) modules/system/system.install:191	default	Cron has not run.	none
858	(duplicate) modules/system/system.install:194	default	Last run !time ago	none
859	(duplicate) modules/system/system.install:197	default	Cron has not run recently.	none
860	(duplicate) modules/system/system.install:202	default	Cron maintenance tasks	none
861	(duplicate) modules/system/system.install:205	default	You can <a href="@cron">run cron manually</a>.	none
862	(duplicate) modules/system/system.install:224	default	Not writable	none
863	(duplicate) modules/system/system.install:229	default	The directory %directory is not writable.	none
864	(duplicate) modules/system/system.install:233	default	You may need to set the correct directory at the <a href="@admin-file-system">file system settings page</a> or change the current directory's permissions so that it is writable.	none
865	(duplicate) modules/system/system.install:238	default	An automated attempt to create this directory failed, possibly due to a permissions problem. To proceed with the installation, either create the directory and modify its permissions manually, or ensure that the installer has the permissions to create it automatically. For more information, please see INSTALL.txt or the <a href="@handbook_url">on-line handbook</a>.	none
866	(duplicate) modules/system/system.install:248	default	Writable (<em>public</em> download method)	none
867	(duplicate) modules/system/system.install:251	default	Writable (<em>private</em> download method)	none
868	(duplicate) modules/system/system.install:258	default	Database updates	none
869	(duplicate) modules/system/system.install:271	default	Some modules have database schema updates to install. You should run the <a href="@update">database update script</a> immediately.	none
870	(duplicate) modules/system/system.install:284	default	The update.php script is accessible to everyone without authentication check, which is a security risk. You must change the $update_free_access value in your settings.php back to FALSE.	none
871	(duplicate) modules/system/system.install:292	default	Access to update.php	none
872	(duplicate) modules/system/system.install:303	default	Not enabled	none
873	(duplicate) modules/system/system.install:305	default	Update notifications are not enabled. It is <strong>highly recommended</strong> that you enable the update status module from the <a href="@module">module administration page</a> in order to stay up-to-date on new releases. For more information please read the <a href="@update">Update status handbook page</a>.	none
874	(duplicate) modules/system/system.install:313	default	Update notifications	none
875	(duplicate) modules/system/system.install:318	default	HTTP request status	none
876	(duplicate) modules/system/system.install:319	default	Fails	none
877	(duplicate) modules/system/system.install:321	default	Your system or network configuration does not allow Drupal to access web pages, resulting in reduced functionality. This could be due to your webserver configuration or PHP settings, and should be resolved in order to download information about available updates, fetch aggregator feeds, sign in via OpenID, or use other network-dependent services.	none
880	includes/actions.inc:65;311;333;368;376,  modules/trigger/trigger.admin.inc:86	default	actions	none
881	includes/common.inc:369 modules/system/system.admin.inc:1672	default	@site is currently under maintenance. We should be back shortly. Thank you for your patience.	none
882	includes/common.inc:1292 modules/blogapi/blogapi.module:738;748,  modules/upload/upload.admin.inc:97;106;135;144	default	MB	none
883	includes/common.inc:3748 modules/dblog/dblog.admin.inc:40;40	default	emergency	none
884	includes/common.inc:3749 modules/dblog/dblog.admin.inc:39;39	default	alert	none
885	includes/common.inc:3750 modules/dblog/dblog.admin.inc:38;38	default	critical	none
886	includes/common.inc:3751 modules/dblog/dblog.admin.inc:37;37,  modules/system/system.module:1757;1791,  modules/update/update.report.inc:58;58	default	error	none
887	includes/common.inc:3752 modules/dblog/dblog.admin.inc:36;36,  modules/update/update.report.inc:52;52;64;64	default	warning	none
888	(duplicate) includes/file.inc:119 modules/system/system.install:226	default	The directory %directory does not exist.	none
889	includes/file.inc:132;305 modules/system/system.module:1324	default	file system	none
890	includes/file.inc:171 modules/user/user.pages.inc:277;346,  modules/user/user.module:1859;2375	default	security	none
891	includes/form.inc:592 modules/upload/upload.module:579	default	Validation error, please try again. If this error persists, please contact the site administrator.	none
893	(duplicate) includes/form.inc:721 ;727 modules/filter/filter.module:544	default	An illegal choice has been detected. Please contact the site administrator.	none
894	(duplicate) includes/form.inc:2474 modules/node/node.admin.inc:356	default	Processing	none
895	includes/form.inc:722;728 modules/filter/filter.module:545	default	form	none
896	includes/form.inc:728 modules/filter/filter.module:545	default	Illegal choice %choice in %name element.	none
897	includes/locale.inc:60 modules/filter/filter.admin.inc:154;350,  modules/menu/menu.admin.inc:50 modules/profile/profile.admin.inc:43	default	Save configuration	none
898	includes/locale.inc:88;2072 modules/aggregator/aggregator.admin.inc:34;48,  modules/book/book.admin.inc:236 modules/comment/comment.admin.inc:70	default	edit	none
899	includes/locale.inc:88;2073 modules/block/block.admin.inc:84,  modules/book/book.admin.inc:237 modules/comment/comment.module:825	default	delete	none
900	(duplicate) includes/locale.inc:92 modules/comment/comment.module:552,  modules/locale/locale.module:263 modules/menu/menu.admin.inc:176;293	default	Enabled	none
901	includes/locale.inc:92 modules/filter/filter.admin.inc:68,  modules/system/system.admin.inc:2234	default	Default	none
902	includes/locale.inc:92 modules/block/block-admin-display-form.tpl.php:42,  modules/book/book.admin.inc:217 modules/book/book.module:386	default	Weight	none
903	includes/locale.inc:92;2058 modules/aggregator/aggregator.admin.inc:26;45,  modules/block/block-admin-display-form.tpl.php:46,  modules/book/book.admin.inc:16;217 modules/comment/comment.admin.inc:57	default	Operations	none
904	includes/locale.inc:168 modules/locale/locale.module:87	default	Add language	none
905	includes/locale.inc:416;940,  modules/aggregator/aggregator.admin.inc:109;149;285;316,  modules/block/block.admin.inc:333 modules/comment/comment.admin.inc:246	default	Delete	none
906	includes/locale.inc:416;940 modules/aggregator/aggregator.admin.inc:198,  modules/block/block.admin.inc:333 modules/comment/comment.admin.inc:188;247	default	Cancel	none
907	includes/locale.inc:471 modules/comment/comment.module:1632	default	Save settings	none
908	includes/locale.inc:502;575;2058 modules/locale/locale.module:229;248;275,  modules/node/node.admin.inc:558 modules/path/path.admin.inc:35	default	Language	none
909	includes/locale.inc:516 modules/blogapi/blogapi.module:258,  modules/filter/filter.module:464 modules/forum/forum-submitted.tpl.php:26	default	n/a	none
910	includes/locale.inc:564;591 modules/locale/locale.module:131,  modules/search/search.module:158;1051;1071;168 modules/search/search.info:0	default	Search	none
911	includes/locale.inc:577 modules/locale/locale.module:249	default	All languages	none
912	includes/locale.inc:654 modules/locale/locale.module:139	default	Import	none
913	includes/locale.inc:738;757 modules/locale/locale.module:147	default	Export	none
914	includes/locale.inc:2058 modules/locale/locale.module:591;75	default	Languages	none
915	includes/mail.inc:133 modules/contact/contact.admin.inc:114;120;147,  modules/contact/contact.pages.inc:145;230	default	mail	none
916	includes/menu.inc:1538 modules/blog/blog.module:108,  modules/book/book.module:624 modules/comment/comment.pages.inc:52,  modules/forum/forum.module:197;666	default	Home	none
917	includes/pager.inc:401 modules/book/book-navigation.tpl.php:39	default	Go to previous page	none
918	includes/pager.inc:402 modules/book/book-navigation.tpl.php:45	default	Go to next page	none
919	includes/theme.inc:1510 modules/comment/comment.module:1693;1718	default	new	none
920	includes/theme.inc:1688 modules/user/user.module:852	default	View user profile.	none
921	includes/theme.inc:1709 modules/comment/comment.module:1344;1353;1455,  modules/node/node.pages.inc:188 modules/system/system.admin.inc:1190	default	Anonymous	none
923	modules/aggregator/aggregator.admin.inc:32,  modules/aggregator/aggregator.pages.inc:481,  modules/comment/comment.module:395,  modules/statistics/statistics.admin.inc:124 modules/user/user.admin.inc:207	default	@time ago	none
924	modules/aggregator/aggregator.admin.inc:32;33,  modules/aggregator/aggregator.pages.inc:484 modules/user/user.admin.inc:207	default	never	none
925	modules/aggregator/aggregator.admin.inc:77,  modules/profile/profile.module:41;549,  modules/statistics/statistics.admin.inc:143	default	URL	none
926	modules/aggregator/aggregator.admin.inc:106;120;282;296,  modules/comment/comment.module:1391;1392,  modules/contact/contact.admin.inc:71 modules/forum/forum.admin.inc:57;144	default	Save	none
927	modules/aggregator/aggregator.admin.inc:181;348,  modules/blogapi/blogapi.module:237;299 modules/book/book.admin.inc:129;235,  modules/comment/comment.admin.inc:109	default	view	none
928	modules/aggregator/aggregator.admin.inc:196,  modules/comment/comment.admin.inc:187 modules/contact/contact.admin.inc:137,  modules/menu/menu.admin.inc:467 modules/node/content_types.inc:390	default	This action cannot be undone.	none
929	modules/aggregator/aggregator.admin.inc:234,  modules/block/block.admin.inc:38 modules/book/book.module:411,  modules/system/system.admin.inc:1309	default	none	none
930	modules/aggregator/aggregator.admin.inc:238,  modules/filter/filter.module:686	default	Allowed HTML tags	none
931	modules/aggregator/aggregator.admin.inc:279,  modules/forum/forum.admin.inc:44;125 modules/menu/menu.admin.inc:286;427,  modules/node/content_types.inc:14;102	default	Description	none
932	「全文を表示」の方が仕様に合うが……,  modules/aggregator/aggregator.pages.inc:362 modules/node/node.module:1740	default	read more	none
933	modules/aggregator/aggregator.module:98 modules/contact/contact.module:58	default	Add category	none
1151	modules/color/color.module:174	default	Color set	none
934	modules/aggregator/aggregator.module:123 modules/block/block.module:127,  modules/book/book.module:85 modules/contact/contact.module:52	default	List	none
935	「設定」でもよいが……,  modules/aggregator/aggregator.module:128 modules/book/book.module:89,  modules/contact/contact.module:83 modules/forum/forum.module:123	default	Settings	none
936	modules/aggregator/aggregator.module:156 modules/node/node.module:1501	default	RSS feed	none
937	modules/aggregator/aggregator.module:179;208 modules/node/node.module:1547,  modules/user/user.module:1095	default	View	none
938	「環境設定」でもよいが……,  modules/aggregator/aggregator.module:192;221,  modules/filter/filter.module:121 modules/locale/locale.module:95	default	Configure	none
939	modules/aggregator/aggregator.info:0	default	Aggregator	none
940	modules/aggregator/aggregator.info:0	default	Aggregates syndicated content (RSS, RDF, and Atom feeds).	none
941	modules/aggregator/aggregator.info:0 modules/blog/blog.info:0,  modules/blogapi/blogapi.info:0 modules/book/book.info:0,  modules/color/color.info:0 modules/comment/comment.info:0	default	Core - optional	none
942	modules/block/block-admin-display-form.tpl.php:40,  modules/block/block.info:0	default	Block	none
943	modules/block/block-admin-display-form.tpl.php:44,  modules/system/system.admin.inc:2047 modules/throttle/throttle.module:10,  modules/throttle/throttle.info:0	default	Throttle	none
944	modules/block/block.admin.inc:82 modules/filter/filter.admin.inc:33,  modules/system/system.admin.inc:225 modules/system/system.module:1425	default	configure	none
945	(duplicate) modules/block/block.admin.inc:362,  modules/comment/comment.module:500;552;584 modules/locale/locale.module:263,  modules/statistics/statistics.admin.inc:184	default	Disabled	none
946	modules/block/block.info:0	default	Controls the boxes that are displayed around the main content.	none
947	modules/block/block.info:0 modules/filter/filter.info:0,  modules/node/node.info:0 modules/system/system.info:0,  modules/user/user.info:0	default	Core - required	none
948	modules/blog/blog.module:50 modules/blog/blog.info:0	default	Blog	none
949	あえてシンプルに,  modules/blog/blog.info:0	default	Enables keeping easily and regularly updated user web pages or blogs.	none
950	modules/blogapi/blogapi.module:725 modules/upload/upload.admin.inc:85	default	Default permitted file extensions	none
951	modules/blogapi/blogapi.module:728 modules/upload/upload.admin.inc:88	default	Default extensions that users can upload. Separate extensions with a space and do not include the leading dot.	none
952	modules/blogapi/blogapi.module:733 modules/upload/upload.admin.inc:92	default	Default maximum file size per upload	none
953	modules/blogapi/blogapi.module:743 modules/upload/upload.admin.inc:101	default	Default total file size per user	none
954	modules/blogapi/blogapi.module:747 modules/upload/upload.admin.inc:105	default	The default maximum size of all files a user can have on the site.	none
955	modules/blogapi/blogapi.module:751 modules/upload/upload.admin.inc:16;109	default	Your PHP settings limit the maximum file size per upload to %size.	none
956	modules/blogapi/blogapi.module:759 modules/upload/upload.admin.inc:117	default	Settings for @role	none
957	modules/blogapi/blogapi.module:765 modules/upload/upload.admin.inc:123	default	Permitted file extensions	none
958	modules/blogapi/blogapi.module:768 modules/upload/upload.admin.inc:126	default	Extensions that users in this role can upload. Separate extensions with a space and do not include the leading dot.	none
959	modules/blogapi/blogapi.module:772 modules/upload/upload.admin.inc:130	default	Maximum file size per upload	none
960	modules/blogapi/blogapi.module:780 modules/upload/upload.admin.inc:139	default	Total file size per user	none
961	modules/blogapi/blogapi.module:237;299 modules/book/book.admin.inc:129,  modules/comment/comment.admin.inc:109;278;284,  modules/comment/comment.module:707;770;792	default	content	none
962	modules/blogapi/blogapi.module:799 modules/blogapi/blogapi.info:0	default	Blog API	none
963	modules/blogapi/blogapi.info:0	default	Allows users to post content using applications that support XML-RPC blog APIs.	none
964	modules/book/book.admin.inc:16 modules/book/book.module:417,  modules/book/book.info:0	default	Book	none
965	modules/book/book.admin.inc:217 modules/forum/forum.admin.inc:49;130	default	Parent	none
966	modules/book/book.module:348 modules/menu/menu.admin.inc:312,  modules/menu/menu.module:405	default	Parent item	none
967	modules/book/book.info:0	default	Allows users to structure site pages in a hierarchy or outline.	none
968	modules/color/color.module:230 modules/comment/comment.pages.inc:59,  modules/comment/comment.module:1391;1395;1398,  modules/node/node.pages.inc:245;407	default	Preview	none
969	modules/color/color.module:298,  modules/node/content_types.inc:207;278;305;324,  modules/system/system.admin.inc:263;563,  modules/system/system.module:1109;1132;1142	default	Reset to defaults	none
970	modules/color/color.info:0	default	Color	none
971	modules/color/color.info:0	default	Allows the user to change the color scheme of certain themes.	none
972	modules/comment/comment.admin.inc:39 modules/node/node.admin.inc:463,  modules/user/user.admin.inc:172	default	Update options	none
973	modules/comment/comment.admin.inc:47 modules/node/node.admin.inc:478,  modules/user/user.admin.inc:128;187	default	Update	none
974	modules/comment/comment.admin.inc:53 modules/comment/comment.module:1361,  modules/contact/contact.pages.inc:54;186 modules/forum/forum.module:304	default	Subject	none
975	modules/comment/comment.admin.inc:54 modules/node/node.admin.inc:556,  modules/tracker/tracker.pages.inc:64	default	Author	none
976	modules/comment/comment.admin.inc:56,  modules/statistics/statistics.pages.inc:12	default	Time	none
977	modules/comment/comment.admin.inc:113 modules/node/node.admin.inc:371;423,  modules/user/user.admin.inc:237	default	The update has been performed.	none
978	modules/comment/comment.module:559 modules/node/node.admin.inc:53	default	Optional	none
979	modules/comment/comment.module:559 modules/node/node.admin.inc:53,  modules/taxonomy/taxonomy.admin.inc:165	default	Required	none
980	modules/comment/comment.module:1192 modules/node/node.module:815	default	You have to specify a valid date.	none
981	modules/comment/comment.module:1292;1308 modules/node/node.pages.inc:183	default	Authored by	none
1152	modules/color/color.module:182	default	Base color	none
982	modules/comment/comment.module:1316;1347;1355,  modules/user/user.admin.inc:768;824	default	E-mail	none
983	modules/comment/comment.module:1320;1347;1355,  modules/profile/profile.module:340	default	The content of this field is kept private and will not be shown publicly.	none
984	modules/comment/comment.module:1332 modules/node/node.pages.inc:192	default	Authored on	none
985	modules/comment/comment.module:1334 modules/node/node.admin.inc:556,  modules/translation/translation.pages.inc:26,  modules/user/user.admin.inc:149;931 modules/user/user.module:1537	default	Status	none
986	modules/comment/comment.module:1334 modules/node/content_types.inc:156,  modules/node/node.pages.inc:212,  modules/translation/translation.pages.inc:39	default	Published	none
987	modules/comment/comment.module:1334,  modules/translation/translation.pages.inc:39	default	Not published	none
988	modules/comment/comment.module:1338;1344;1353,  modules/contact/contact.pages.inc:42	default	Your name	none
989	modules/comment/comment.module:1373 modules/comment/comment.info:0	default	Comment	none
990	modules/comment/comment.module:1668 modules/openid/openid.module:470,  modules/user/user.module:1467;2391	default	Error saving user account.	none
991	modules/comment/comment.module:1869 modules/forum/forum.admin.inc:203	default	Date - newest first	none
992	modules/comment/comment.module:1870 modules/forum/forum.admin.inc:203	default	Date - oldest first	none
993	modules/comment/comment.module:2140 modules/node/node.module:2759	default	Keywords	none
994	modules/comment/comment.module:2081;2104;2125,  modules/node/node.module:2640;2649;2658;2667;2676;2685;2694;2704;2784,  modules/system/system.module:1788 modules/user/user.module:2333;2343	default	action	none
995	modules/comment/comment.module:418;624 modules/node/node.module:143	default	1 comment	none
996	modules/comment/comment.module:418;624 modules/node/node.module:143	default	@count comments	none
997	modules/comment/comment.module:197 modules/trigger/trigger.module:66,  themes/garland/template.php:56	default	Comments	none
998	modules/comment/comment.info:0	default	Allows users to comment on and discuss published content.	none
1001	modules/contact/contact.admin.inc:17;39,  modules/contact/contact.pages.inc:66,  modules/profile/profile.admin.inc:148;213	default	Category	none
1002	modules/contact/contact.admin.inc:17;62,  modules/system/system.admin.inc:2176	default	Selected	none
1003	modules/contact/contact.admin.inc:82 modules/profile/profile.admin.inc:301	default	You must enter a category.	none
1004	modules/contact/contact.pages.inc:62 modules/forum/forum.module:386,  modules/taxonomy/taxonomy.module:439	default	- Please choose -	none
1005	modules/contact/contact.pages.inc:80;191,  modules/dblog/dblog.admin.inc:59;107;157,  modules/system/system.module:1693;1839	default	Message	none
1007	modules/contact/contact.module:92;99 modules/contact/contact.info:0	default	Contact	none
1008	modules/contact/contact.info:0	default	Enables the use of both personal and site-wide contact forms.	none
1009	modules/dblog/dblog.admin.inc:57;137;222,  modules/node/content_types.inc:14;80;94 modules/node/node.admin.inc:556,  modules/profile/profile.admin.inc:146	default	Type	none
1010	modules/dblog/dblog.admin.inc:58;141,  modules/statistics/statistics.admin.inc:157	default	Date	none
1011	modules/dblog/dblog.admin.inc:60;145,  modules/statistics/statistics.admin.inc:15;161,  modules/statistics/statistics.pages.inc:14 modules/user/user.info:0	default	User	none
1012	modules/dblog/dblog.admin.inc:153,  modules/statistics/statistics.admin.inc:153,  modules/statistics/statistics.pages.inc:13	default	Referrer	none
1013	modules/dblog/dblog.admin.inc:165,  modules/statistics/statistics.admin.inc:165 modules/user/user.admin.inc:835	default	Hostname	none
1014	modules/dblog/dblog.admin.inc:289;305;317 modules/filter/filter.info:0,  modules/node/node.admin.inc:246;311 modules/path/path.admin.inc:205	default	Filter	none
1015	modules/dblog/dblog.admin.inc:294;324 modules/menu/menu.admin.inc:589,  modules/node/node.admin.inc:249;327 modules/path/path.admin.inc:211	default	Reset	none
1016	modules/dblog/dblog.module:45 modules/dblog/dblog.info:0	default	Database logging	none
1017	modules/dblog/dblog.module:78 modules/statistics/statistics.module:126	default	Details	none
1018	modules/dblog/dblog.info:0	default	Logs and records system events to the database.	none
1019	modules/filter/filter.admin.inc:68;101;361,  modules/node/content_types.inc:14;71 modules/profile/profile.admin.inc:146,  modules/system/system.admin.inc:1157;2049;2134;2176;2234	default	Name	none
1020	modules/filter/filter.admin.inc:68;109 modules/user/user.admin.inc:150;932,  modules/user/user.module:1562;1018	default	Roles	none
1021	「コンテンツ作成のヒント」ページでの<h1>～<h6>タグの説明では「見出し」としたいが……,  modules/filter/filter.module:219;220;221;222;223;224	default	Header	none
1022	modules/filter/filter.module:115 modules/node/node.module:1527;1551,  modules/user/user.module:1111	default	Edit	none
1023	modules/filter/filter.info:0	default	Handles the filtering of content in preparation for display.	none
1024	modules/forum/forum-list.tpl.php:36 modules/forum/forum.info:0	default	Forum	none
1025	modules/forum/forum.admin.inc:275 modules/taxonomy/taxonomy.admin.inc:694	default	root	none
1026	modules/forum/forum.module:579 modules/tracker/tracker.pages.inc:64	default	Replies	none
1027	modules/forum/forum.module:780;842 modules/tracker/tracker.pages.inc:47	default	1 new	none
1028	modules/forum/forum.module:780;842 modules/tracker/tracker.pages.inc:47	default	@count new	none
1029	modules/forum/forum.info:0	default	Enables threaded discussions about general topics.	none
1030	modules/help/help.module:13 modules/help/help.info:0	default	Help	none
1031	modules/help/help.info:0	default	Manages the display of online help.	none
1032	modules/locale/locale.module:277 modules/node/node.admin.inc:158;223;493	default	Language neutral	none
1033	modules/locale/locale.module:110 modules/system/system.module:1247	default	Confirm	none
1000	modules/contact/contact.admin.inc:15;63 modules/upload/upload.admin.inc:79,  modules/user/user.module:2258	default	No	6.34
1006	modules/contact/contact.pages.inc:94;199 modules/system/system.module:1369	default	Send e-mail	6.34
1036	modules/locale/locale.module:0 modules/system/system.admin.inc:1545	default	Saturday	none
1037	modules/locale/locale.module:0 modules/system/system.admin.inc:1545	default	Sunday	none
1038	modules/locale/locale.module:0 modules/system/system.admin.inc:1545	default	Monday	none
1039	modules/locale/locale.module:0 modules/system/system.admin.inc:1545	default	Tuesday	none
1040	modules/locale/locale.module:0 modules/system/system.admin.inc:1545	default	Wednesday	none
1041	modules/locale/locale.info:0	default	Locale	none
1042	modules/locale/locale.info:0	default	Adds language handling functionality and enables the translation of the user interface to languages other than English.	none
1043	modules/menu/menu.admin.inc:258;274 modules/path/path.info:0	default	Path	none
1044	modules/menu/menu.admin.inc:338 modules/system/system.admin.inc:1220	default	The menu system stores system paths only, but will use the URL alias for display. %link_path has been stored as %normal_path	none
1045	modules/menu/menu.admin.inc:362 modules/path/path.admin.inc:142	default	The path '@link_path' is either invalid or you do not have access to it.	none
1046	modules/menu/menu.admin.inc:501;580 modules/node/content_types.inc:403	default	menu	none
1047	(duplicate) modules/menu/menu.install:11 modules/user/user.module:724;774	default	Navigation	none
1048	(duplicate) modules/menu/menu.install:12,  modules/system/system.admin.inc:392	default	Primary links	none
1049	(duplicate) modules/menu/menu.install:13,  modules/system/system.admin.inc:393	default	Secondary links	none
1050	modules/menu/menu.info:0	default	Menu	none
1051	modules/menu/menu.info:0	default	Allows administrators to customize the site navigation menu.	none
1053	コンテンツタイプの識別情報なので,  modules/node/content_types.inc:68,  modules/taxonomy/taxonomy.admin.inc:117;657	default	Identification	none
1054	modules/node/node.admin.inc:34 modules/poll/poll.module:247	default	Unlimited	none
1055	modules/node/node.admin.inc:132 modules/user/user.module:2049	default	status	none
1056	modules/node/node.admin.inc:246;312 modules/user/user.admin.inc:87;112	default	Refine	none
1057	modules/node/node.admin.inc:248;324 modules/user/user.admin.inc:92;122	default	Undo	none
1058	modules/node/node.admin.inc:285 modules/user/user.admin.inc:1016	default	and	none
1059	modules/node/node.admin.inc:285 modules/user/user.admin.inc:1016	default	where	none
1060	modules/node/node.admin.inc:291 modules/user/user.admin.inc:1022	default	is	none
1061	modules/node/node.admin.inc:581 modules/tracker/tracker.pages.inc:61	default	No posts available.	none
1062	modules/node/node.admin.inc:612 modules/user/user.module:1940	default	Delete all	none
1063	modules/node/node.module:1161;1435;1488 modules/system/system.module:0,  modules/trigger/trigger.module:48	default	Content	none
1064	modules/node/node.module:2724;2733,  modules/user/user.admin.inc:148;768;813;930,  modules/user/user.module:690;1297;1506	default	Username	none
1065	modules/node/node.module:1468 modules/taxonomy/taxonomy.admin.inc:140;144	default	Content types	none
1066	modules/node/node.info:0	default	Node	none
1067	modules/node/node.info:0	default	Allows content to be submitted to the site and displayed on pages.	none
1068	modules/openid/openid.pages.inc:41;63 modules/openid/openid.info:0	default	OpenID	none
1069	modules/openid/openid.module:478 modules/user/user.admin.inc:257	default	Only site administrators can create new user accounts.	none
1070	modules/openid/openid.info:0	default	Allows users to log into your site using OpenID.	none
1071	modules/path/path.admin.inc:30 modules/system/system.info:0	default	System	none
1072	modules/path/path.info:0	default	Allows users to rename URLs.	none
1073	modules/php/php.info:0	default	PHP filter	none
1074	modules/php/php.info:0	default	Allows embedded PHP code/snippets to be evaluated.	none
1075	modules/ping/ping.info:0	default	Ping	none
1076	modules/ping/ping.info:0	default	Alerts other sites when your site has been updated.	none
1077	modules/poll/poll.pages.inc:33 modules/statistics/statistics.admin.inc:79	default	Visitor	none
1078	modules/poll/poll.module:145;169 modules/poll/poll.info:0	default	Poll	none
1079	modules/poll/poll.module:248 modules/user/user.module:1539	default	Active	none
1080	modules/poll/poll.info:0	default	Allows your site to capture votes on different topics in the form of multiple choice questions.	none
1081	modules/profile/profile.info:0	default	Profile	none
1082	modules/profile/profile.info:0	default	Supports configurable user profiles.	none
1083	modules/search/search.info:0	default	Enables site-wide keyword searching.	none
1084	トラックにすべきか？,  modules/statistics/statistics.module:154 modules/tracker/tracker.module:45	default	Track	none
1085	modules/statistics/statistics.info:0	default	Statistics	none
1086	modules/statistics/statistics.info:0	default	Logs access statistics for your site.	none
1087	modules/syslog/syslog.module:30 modules/syslog/syslog.info:0	default	Syslog	none
1088	modules/syslog/syslog.info:0	default	Logs and records system events to syslog.	none
1089	modules/system/system.admin.inc:720 modules/update/update.report.inc:191	default	Depends on: !dependencies	none
1090	modules/system/system.admin.inc:746 modules/update/update.report.inc:201	default	Required by: !required	none
1091	modules/system/system.admin.inc:1164 modules/user/user.module:1514	default	E-mail address	none
1093	modules/system/system.module:1630 modules/user/user.pages.inc:74;112;148,  modules/user/user.module:1402;1417;1471;1668;2397	default	user	none
1094	modules/system/system.module:275 modules/update/update.report.inc:220	default	Themes	none
1095	modules/system/system.module:313 modules/update/update.report.inc:219	default	Modules	none
1035	modules/locale/locale.module:0 modules/system/system.admin.inc:1545	default	Friday	6.34
1092	modules/system/system.module:602 modules/user/user.module:2249	default	Medium	6.34
1052	modules/node/content_types.inc:58 modules/node/node.module:603,  modules/user/user.admin.inc:286;306;326;346;371;396;421	default	Body	6.34
1096	modules/system/system.module:0 themes/chameleon/chameleon.info:0,  themes/chameleon/marvin/marvin.info:0	default	Left sidebar	none
1097	modules/system/system.module:0 themes/chameleon/chameleon.info:0,  themes/chameleon/marvin/marvin.info:0	default	Right sidebar	none
1098	(duplicate) modules/system/system.install:260,  modules/update/update.report.inc:83 modules/update/update.module:283	default	Up to date	none
1099	(duplicate) modules/system/system.install:270,  modules/update/update.module:273	default	Out of date	none
1100	modules/system/system.info:0	default	Handles general site configuration for administrators.	none
1101	modules/taxonomy/taxonomy.module:111 modules/taxonomy/taxonomy.info:0,  modules/trigger/trigger.module:75	default	Taxonomy	none
1102	modules/taxonomy/taxonomy.info:0	default	Enables the categorization of content.	none
1103	modules/throttle/throttle.module:103 modules/user/user.module:805;808	default	1 user	none
1104	modules/throttle/throttle.module:103 modules/user/user.module:805;808	default	@count users	none
1105	modules/throttle/throttle.info:0	default	Handles the auto-throttling mechanism, to control site congestion.	none
1106	modules/tracker/tracker.info:0	default	Tracker	none
1107	modules/tracker/tracker.info:0	default	Enables tracking of recent posts for users.	none
1108	modules/translation/translation.info:0	default	Content translation	none
1109	modules/translation/translation.info:0	default	Allows content to be translated into different languages.	none
1110	modules/trigger/trigger.module:57 modules/user/user.module:602;980	default	Users	none
1111	modules/trigger/trigger.info:0	default	Trigger	none
1112	modules/trigger/trigger.info:0	default	Enables actions to be fired on certain system events, such as when new content is created.	none
1113	modules/update/update.info:0	default	Update status	none
1114	modules/update/update.info:0	default	Checks the status of available updates for Drupal and your installed modules and themes.	none
1115	modules/upload/upload.info:0	default	Upload	none
1116	modules/upload/upload.info:0	default	Allows users to upload and attach files to content.	none
1117	modules/user/user.info:0	default	Manages the user registration and login system.	none
1118	themes/bluemarine/bluemarine.info:0 themes/garland/color/color.inc:11,  themes/garland/minnelli/color/color.inc:11	default	Bluemarine	none
1119	themes/bluemarine/bluemarine.info:0	default	Table-based multi-column theme with a marine and ash color scheme.	none
1120	themes/chameleon/chameleon.info:0	default	Chameleon	none
1121	themes/chameleon/chameleon.info:0	default	Minimalist tabled theme with light colors.	none
1122	themes/chameleon/marvin/marvin.info:0	default	Marvin	none
1123	themes/chameleon/marvin/marvin.info:0	default	Boxy tabled theme in all grays.	none
1124	themes/garland/garland.info:0	default	Garland	none
1125	themes/garland/garland.info:0	default	Tableless, recolorable, multi-column, fluid width theme (default).	none
1126	themes/garland/color/color.inc:7 themes/garland/minnelli/color/color.inc:7	default	Blue Lagoon (Default)	none
1127	themes/garland/color/color.inc:8 themes/garland/minnelli/color/color.inc:8	default	Ash	none
1128	themes/garland/color/color.inc:9 themes/garland/minnelli/color/color.inc:9	default	Aquamarine	none
1129	themes/garland/color/color.inc:10,  themes/garland/minnelli/color/color.inc:10	default	Belgian Chocolate	none
1130	themes/garland/color/color.inc:12,  themes/garland/minnelli/color/color.inc:12	default	Citrus Blast	none
1131	themes/garland/color/color.inc:13,  themes/garland/minnelli/color/color.inc:13	default	Cold Day	none
1132	themes/garland/color/color.inc:14,  themes/garland/minnelli/color/color.inc:14	default	Greenbeam	none
1133	themes/garland/color/color.inc:15,  themes/garland/minnelli/color/color.inc:15	default	Mediterrano	none
1134	themes/garland/color/color.inc:16,  themes/garland/minnelli/color/color.inc:16	default	Mercury	none
1135	themes/garland/color/color.inc:17,  themes/garland/minnelli/color/color.inc:17	default	Nocturnal	none
1136	themes/garland/color/color.inc:18,  themes/garland/minnelli/color/color.inc:18	default	Olivia	none
1137	themes/garland/color/color.inc:19,  themes/garland/minnelli/color/color.inc:19	default	Pink Plastic	none
1138	themes/garland/color/color.inc:20,  themes/garland/minnelli/color/color.inc:20	default	Shiny Tomato	none
1139	themes/garland/color/color.inc:21,  themes/garland/minnelli/color/color.inc:21	default	Teal Top	none
1140	themes/garland/minnelli/minnelli.info:0	default	Minnelli	none
1141	themes/garland/minnelli/minnelli.info:0	default	Tableless, recolorable, multi-column, fixed width theme.	none
1142	themes/pushbutton/pushbutton.info:0	default	Pushbutton	none
1143	themes/pushbutton/pushbutton.info:0	default	Tabled, multi-column theme in blue and orange tones.	none
1144	modules/color/color.module:9	default	The color module allows a site administrator to quickly and easily change the color scheme of certain themes. Although not all themes support color module, both Garland (the default theme) and Minnelli were designed to take advantage of its features. By using color module with a compatible theme, you can easily change the color of links, backgrounds, text, and other theme elements. Color module requires that your <a href="@url">file download method</a> be set to public.	none
1145	modules/color/color.module:10	default	It is important to remember that color module saves a modified copy of the theme's specified stylesheets in the files directory. This means that if you make any manual changes to your theme's stylesheet, you must save your color settings again, even if they haven't changed. This causes the color module generated version of the stylesheets in the files directory to be recreated using the new version of the original file.	none
1146	modules/color/color.module:11	default	To change the color settings for a compatible theme, select the "configure" link for the theme on the <a href="@themes">themes administration page</a>.	none
1147	modules/color/color.module:12	default	For more information, see the online handbook entry for <a href="@color">Color module</a>.	none
1148	modules/color/color.module:37	default	The color picker only works if the <a href="@url">download method</a> is set to public.	none
1149	modules/color/color.module:42	default	Color scheme	none
1150	modules/color/color.module:171	default	Custom	none
1153	modules/color/color.module:183	default	Link color	none
1154	modules/color/color.module:184	default	Header top	none
1155	modules/color/color.module:185	default	Header bottom	none
1156	modules/color/color.module:186	default	Text color	none
1157	modules/color/color.module:246	default	%name must be a valid hexadecimal CSS color value.	none
1158	modules/color/color.module:283	default	There is not enough memory available to PHP to change this theme's color scheme. You need at least %size more. Check the <a href="@url">PHP documentation</a> for more information.	none
1159	modules/color/color.install:20	default	The GD library for PHP is enabled, but was compiled without PNG support. Please check the <a href="@url">PHP image documentation</a> for information on how to correct this.	none
1160	modules/color/color.install:25	default	Not installed	none
1161	modules/color/color.install:27	default	The GD library for PHP is missing or outdated. Please check the <a href="@url">PHP image documentation</a> for information on how to correct this.	none
1162	modules/color/color.install:30	default	GD library	none
1163	modules/comment/comment-folded.tpl.php:19	default	by	none
1164	modules/comment/comment.admin.inc:55	default	Posted in	none
1165	modules/comment/comment.admin.inc:85	default	Please select one or more comments to perform the update on.	none
1166	modules/comment/comment.admin.inc:140	default	No comments available.	none
1167	modules/comment/comment.admin.inc:181	default	There do not appear to be any comments to delete or your selected comment was deleted by another administrator.	none
1168	modules/comment/comment.admin.inc:186	default	Are you sure you want to delete these comments and all their children?	none
1169	modules/comment/comment.admin.inc:188	default	Delete comments	none
1170	modules/comment/comment.admin.inc:205	default	The comments have been deleted.	none
1171	modules/comment/comment.admin.inc:226	default	The comment no longer exists.	none
1172	modules/comment/comment.admin.inc:243	default	Are you sure you want to delete the comment %title?	none
1173	modules/comment/comment.admin.inc:245	default	Any replies to this comment will be lost. This action cannot be undone.	none
1174	modules/comment/comment.admin.inc:255	default	The comment and all its replies have been deleted.	none
1175	modules/comment/comment.admin.inc:109 modules/comment/comment.module:707	default	Comment: updated %subject.	none
1176	modules/comment/comment.admin.inc:278	default	Cannot delete non-existent comment.	none
1177	modules/comment/comment.admin.inc:284	default	Comment: deleted %subject.	none
1178	modules/comment/comment.pages.inc:64;104	default	You are not authorized to post comments.	none
1179	modules/comment/comment.pages.inc:77;86	default	The comment you are replying to does not exist.	none
1180	modules/comment/comment.pages.inc:97	default	This discussion is closed: you can't post new comments.	none
1181	modules/comment/comment.pages.inc:101	default	Reply	none
1182	modules/comment/comment.pages.inc:110	default	You are not authorized to view comments.	none
1183	modules/comment/comment.module:128	default	The comment module allows visitors to comment on your posts, creating ad hoc discussion boards. Any <a href="@content-type">content type</a> may have its <em>Default comment setting</em> set to <em>Read/Write</em> to allow comments, or <em>Disabled</em>, to prevent comments. Comment display settings and other controls may also be customized for each content type (some display settings are customizable by individual users).	none
1184	modules/comment/comment.module:129	default	Comment permissions are assigned to user roles, and are used to determine whether anonymous users (or other roles) are allowed to comment on posts. If anonymous users are allowed to comment, their individual contact information may be retained in cookies stored on their local computer for use in later comment submissions. When a comment has no replies, it may be (optionally) edited by its author. The comment module uses the same input formats and HTML tags available when creating other forms of content.	none
1185	modules/comment/comment.module:130	default	For more information, see the online handbook entry for <a href="@comment">Comment module</a>.	none
1186	原文の説明は旧バージョン用のため現状に即して変更,  modules/comment/comment.module:133	default	Below is a list of the latest comments posted to your site. Click on a subject to see the comment, the author's name to edit the author's user information, 'edit' to modify the text, and 'delete' to remove their submission.	none
1187	原文の説明は旧バージョン用のため現状に即して変更,  modules/comment/comment.module:135	default	Below is a list of the comments posted to your site that need approval. To approve a comment, click on 'edit' and then change its 'moderation status' to Approved. Click on a subject to see the comment, the author's name to edit the author's user information, 'edit' to modify the text, and 'delete' to remove their submission.	none
1188	modules/comment/comment.module:284;288	default	Recent comments	none
1189	modules/comment/comment.module:420	default	Jump to the first comment of this posting.	none
1190	modules/comment/comment.module:431	default	Jump to the first new comment of this posting.	none
1191	modules/comment/comment.module:440;461	default	Add new comment	none
1192	modules/comment/comment.module:442	default	Add a new comment to this page.	none
1193	modules/comment/comment.module:463	default	Share your thoughts and opinions related to this posting.	none
1194	modules/comment/comment.module:492;575	default	Comment settings	none
1195	modules/comment/comment.module:498	default	Default comment setting	none
1196	modules/comment/comment.module:500;584	default	Read only	none
1197	modules/comment/comment.module:500;584	default	Read/Write	none
1198	modules/comment/comment.module:501	default	Users with the <em>administer comments</em> permission will be able to override this setting.	none
1199	modules/comment/comment.module:505	default	Default display mode	none
1200	modules/comment/comment.module:508	default	The default view for comments. Expanded views display the body of the comment. Threaded views keep replies together.	none
1201	modules/comment/comment.module:512	default	Default display order	none
1264	modules/comment/comment.module:274	default	post comments	none
1265	modules/comment/comment.module:274	default	administer comments	none
1202	modules/comment/comment.module:515	default	The default sorting for new users and anonymous users while viewing comments. These users may change their view using the comment control panel. For registered users, this change is remembered as a persistent user preference.	none
1203	modules/comment/comment.module:519	default	Default comments per page	none
1204	modules/comment/comment.module:522	default	Default number of comments for each page: more comments are distributed in several pages.	none
1205	modules/comment/comment.module:526	default	Comment controls	none
1206	modules/comment/comment.module:529	default	Display above the comments	none
1207	modules/comment/comment.module:530	default	Display below the comments	none
1208	modules/comment/comment.module:531	default	Display above and below the comments	none
1209	modules/comment/comment.module:532	default	Do not display	none
1210	modules/comment/comment.module:533	default	Position of the comment controls box. The comment controls let the user change the default display mode and display order of comments.	none
1211	modules/comment/comment.module:537	default	Anonymous commenting	none
1212	modules/comment/comment.module:540	default	Anonymous posters may not enter their contact information	none
1213	modules/comment/comment.module:541	default	Anonymous posters may leave their contact information	none
1214	modules/comment/comment.module:542	default	Anonymous posters must leave their contact information	none
1215	modules/comment/comment.module:543	default	This option is enabled when anonymous users have permission to post comments on the <a href="@url">permissions page</a>.	none
1216	modules/comment/comment.module:550	default	Comment subject field	none
1217	modules/comment/comment.module:553	default	Can users provide a unique subject for their comments?	none
1218	modules/comment/comment.module:557;1429	default	Preview comment	none
1219	modules/comment/comment.module:560	default	Forces a user to look at their comment by clicking on a 'Preview' button before they can actually add the comment	none
1220	modules/comment/comment.module:564	default	Location of comment submission form	none
1221	modules/comment/comment.module:566	default	Display on separate page	none
1222	modules/comment/comment.module:566	default	Display below post or comments	none
1223	modules/comment/comment.module:780	default	Your comment has been queued for moderation by site administrators and will be published after approval.	none
1224	modules/comment/comment.module:793;792	default	Comment: unauthorized comment submitted or comment submitted to a closed post %subject.	none
1225	modules/comment/comment.module:816	default	parent	none
1226	modules/comment/comment.module:833;845	default	reply	none
1227	modules/comment/comment.module:1050	default	Post new comment	none
1228	modules/comment/comment.module:1073;1085	default	Publish the selected comments	none
1229	modules/comment/comment.module:1074;1080;1087	default	Delete the selected comments	none
1230	modules/comment/comment.module:1079;1086	default	Unpublish the selected comments	none
1231	modules/comment/comment.module:1196	default	You have to specify a valid author.	none
1232	modules/comment/comment.module:1207	default	The name you used belongs to a registered user.	none
1233	modules/comment/comment.module:1212	default	You have to leave your name.	none
1234	modules/comment/comment.module:1217	default	The e-mail address you specified is not valid.	none
1235	modules/comment/comment.module:1221	default	You have to leave an e-mail address.	none
1236	modules/comment/comment.module:1226	default	The URL of your homepage is not valid. Remember that it must be fully qualified, i.e. of the form <code>http://example.com/directory</code>.	none
1237	modules/comment/comment.module:1282	default	Administration	none
1238	modules/comment/comment.module:1325;1350;1357	default	Homepage	none
1239	modules/comment/comment.module:1531	default	(No subject)	none
1240	modules/comment/comment.module:1623	default	!a comments per page	none
1241	modules/comment/comment.module:1650	default	Select your preferred way to display the comments and click "Save settings" to activate your changes.	none
1242	modules/comment/comment.module:1651	default	Comment viewing options	none
1243	modules/comment/comment.module:1808	default	<a href="@login">Login</a> or <a href="@register">register</a> to post comments	none
1244	modules/comment/comment.module:1812	default	<a href="@login">Login</a> to post comments	none
1245	modules/comment/comment.module:1839	default	Submitted by !username on @datetime.	none
1246	modules/comment/comment.module:1854	default	Flat list - collapsed	none
1247	modules/comment/comment.module:1855	default	Flat list - expanded	none
1248	modules/comment/comment.module:1856	default	Threaded list - collapsed	none
1249	modules/comment/comment.module:1857	default	Threaded list - expanded	none
1250	modules/comment/comment.module:2013	default	After saving a new comment	none
1251	modules/comment/comment.module:2016	default	After saving an updated comment	none
1252	modules/comment/comment.module:2019	default	After deleting a comment	none
1253	modules/comment/comment.module:2022	default	When a comment is being viewed by an authenticated user	none
1257	modules/comment/comment.module:2142	default	The comment will be unpublished if it contains any of the character sequences above. Use a comma-separated list of character sequences. Example: funny, bungee jumping, "Company, Inc.". Character sequences are case-sensitive.	none
1258	modules/comment/comment.module:770	default	Comment: added %subject.	none
1259	modules/comment/comment.module:2081	default	Published comment %subject.	none
1260	modules/comment/comment.module:2104;2125	default	Unpublished comment %subject.	none
1261	modules/comment/comment.module:428	default	1 new comment	none
1262	modules/comment/comment.module:428	default	@count new comments	none
1263	modules/comment/comment.module:274	default	access comments	none
1255	modules/comment/comment.module:2043	default	Unpublish comment	6.34
1266	modules/comment/comment.module:274	default	post comments without approval	none
1267	modules/comment/comment.module:198	default	List and edit site comments and the comment moderation queue.	none
1268	modules/comment/comment.module:206	default	Published comments	none
1269	modules/comment/comment.module:211	default	Approval queue	none
1270	modules/comment/comment.module:219	default	Delete comment	none
1271	modules/comment/comment.module:227	default	Edit comment	none
1272	modules/comment/comment.module:234	default	Reply to comment	none
1273	modules/dblog/dblog.admin.inc:17	default	Discard log entries above the following row limit	none
1274	modules/dblog/dblog.admin.inc:20	default	The maximum number of rows to keep in the database log. Older entries will be automatically discarded. (Requires a correctly configured <a href="@cron">cron maintenance task</a>.)	none
1275	modules/dblog/dblog.admin.inc:90;118	default	No log messages available.	none
1276	modules/dblog/dblog.admin.inc:106	default	Count	none
1277	modules/dblog/dblog.admin.inc:149	default	Location	none
1278	modules/dblog/dblog.admin.inc:161;229	default	Severity	none
1279	modules/dblog/dblog.admin.inc:269	default	Filter log messages	none
1280	modules/dblog/dblog.admin.inc:306	default	You must select something to filter by.	none
1281	modules/dblog/dblog.module:20	default	The dblog module monitors your system, capturing system events in a log to be reviewed by an authorized individual at a later time. This is useful for site administrators who want a quick overview of activities on their site. The logs also record the sequence of events, so it can be useful for debugging site errors.	none
1282	modules/dblog/dblog.module:21	default	The dblog log is simply a list of recorded events containing usage data, performance data, errors, warnings and operational information. Administrators should check the dblog report on a regular basis to ensure their site is working properly.	none
1283	modules/dblog/dblog.module:22	default	For more information, see the online handbook entry for <a href="@dblog">Dblog module</a>.	none
1284	modules/dblog/dblog.module:25	default	The dblog module monitors your website, capturing system events in a log to be reviewed by an authorized individual at a later time. The dblog log is simply a list of recorded events containing usage data, performance data, errors, warnings and operational information. It is vital to check the dblog report on a regular basis as it is often the only way to tell what is going on.	none
1285	modules/dblog/dblog.module:46	default	Settings for logging to the Drupal database logs. This is the most common method for small to medium sites on shared hosting. The logs are viewable from the admin pages.	none
1286	modules/dblog/dblog.module:54	default	Recent log entries	none
1287	modules/dblog/dblog.module:55	default	View events that have recently been logged.	none
1288	modules/dblog/dblog.module:62	default	Top 'page not found' errors	none
1289	modules/dblog/dblog.module:63	default	View 'page not found' errors (404s).	none
1290	modules/dblog/dblog.module:70	default	Top 'access denied' errors	none
1291	modules/dblog/dblog.module:71	default	View 'access denied' errors (403s).	none
1292	modules/filter/filter.admin.inc:32	default	All roles may use default format	none
1293	modules/filter/filter.admin.inc:32	default	No roles may use this format	none
1294	modules/filter/filter.admin.inc:37	default	Set default format	none
1295	modules/filter/filter.admin.inc:44	default	Default format updated.	none
1296	modules/filter/filter.admin.inc:80 modules/filter/filter.module:82	default	Add input format	none
1297	modules/filter/filter.admin.inc:96	default	All roles for the default format must be enabled and cannot be changed.	none
1298	modules/filter/filter.admin.inc:103	default	Specify a unique name for this filter format.	none
1299	modules/filter/filter.admin.inc:110	default	Choose which roles may use this filter format. Note that roles with the "administer filters" permission can always use all the filter formats.	none
1300	modules/filter/filter.admin.inc:129	default	Filters	none
1301	modules/filter/filter.admin.inc:130	default	Choose the filters that will be used in this filter format.	none
1302	modules/filter/filter.admin.inc:145 modules/filter/filter.module:601	default	More information about formatting options	none
1303	modules/filter/filter.admin.inc:148	default	No guidelines available.	none
1304	modules/filter/filter.admin.inc:150	default	These are the guidelines that users will see for posting in this input format. They are automatically generated from the filter settings.	none
1305	modules/filter/filter.admin.inc:152 modules/filter/filter.module:525	default	Formatting guidelines	none
1306	modules/filter/filter.admin.inc:167	default	Filter format names need to be unique. A format named %name already exists.	none
1307	modules/filter/filter.admin.inc:186	default	Added input format %format.	none
1308	modules/filter/filter.admin.inc:189	default	The input format settings have been updated.	none
1309	modules/filter/filter.admin.inc:251	default	Are you sure you want to delete the input format %format?	none
1310	modules/filter/filter.admin.inc:251	default	If you have any content left in this input format, it will be switched to the default input format. This action cannot be undone.	none
1311	modules/filter/filter.admin.inc:254	default	The default format cannot be deleted.	none
1312	modules/filter/filter.admin.inc:277	default	Deleted input format %format.	none
1313	modules/filter/filter.admin.inc:288	default	Configure %format	none
1314	modules/filter/filter.admin.inc:311	default	No settings are available.	none
1315	modules/filter/filter.admin.inc:329	default	Rearrange %format	none
1316	modules/filter/filter.admin.inc:390	default	The filter ordering has been saved.	none
1317	modules/filter/filter.pages.inc:34	default	input formats	none
1360	modules/filter/filter.module:213	default	Ordered list - use the &lt;li&gt; to begin each list item	none
1361	modules/filter/filter.module:213;214	default	First item	none
1362	modules/filter/filter.module:213;214	default	Second item	none
1363	modules/filter/filter.module:214	default	Unordered list - use the &lt;li&gt; to begin each list item	none
1494	modules/locale/locale.module:0	default	am	none
1318	modules/filter/filter.module:22	default	The filter module allows administrators to configure text input formats for use on your site. An input format defines the HTML tags, codes, and other input allowed in both content and comments, and is a key feature in guarding against potentially damaging input from malicious users. Two input formats included by default are <em>Filtered HTML</em> (which allows only an administrator-approved subset of HTML tags) and <em>Full HTML</em> (which allows the full set of HTML tags). Additional input formats may be created by an administrator.	none
1319	modules/filter/filter.module:23	default	Each input format uses filters to manipulate text, and most input formats apply several different filters to text in a specific order. Each filter is designed for a specific purpose, and generally either adds, removes or transforms elements within user-entered text before it is displayed. A filter does not change the actual content of a post, but instead, modifies it temporarily before it is displayed. A filter may remove unapproved HTML tags, for instance, while another automatically adds HTML to make links referenced in text clickable.	none
1320	modules/filter/filter.module:24	default	Users can choose between the available input formats when creating or editing content. Administrators can configure which input formats are available to which user roles, as well as choose a default input format.	none
1321	modules/filter/filter.module:25	default	For more information, see the online handbook entry for <a href="@filter">Filter module</a>.	none
1322	modules/filter/filter.module:28	default	<em>Input formats</em> define a way of processing user-supplied text in Drupal. Each input format uses filters to manipulate text, and most input formats apply several different filters to text, in a specific order. Each filter is designed to accomplish a specific purpose, and generally either removes elements from or adds elements to text before it is displayed. Users can choose between the available input formats when submitting content.	none
1323	modules/filter/filter.module:29	default	Use the list below to configure which input formats are available to which roles, as well as choose a default input format (used for imported content, for example). The default format is always available to users. All input formats are available to users in a role with the "administer filters" permission.	none
1324	modules/filter/filter.module:32	default	Every <em>filter</em> performs one particular change on the user input, for example stripping out malicious HTML or making URLs clickable. Choose which filters you want to apply to text in this input format. If you notice some filters are causing conflicts in the output, you can <a href="@rearrange">rearrange them</a>.	none
1325	modules/filter/filter.module:34	default	If you cannot find the settings for a certain filter, make sure you have enabled it on the <a href="@url">view tab</a> first.	none
1326	例を変更,  modules/filter/filter.module:36	default	Because of the flexible filtering system, you might encounter a situation where one filter prevents another from doing its job. For example: a word in an URL gets converted into a glossary term, before the URL can be converted to a clickable link. When this happens, rearrange the order of the filters.	none
1327	modules/filter/filter.module:37	default	Filters are executed from top-to-bottom. To change the order of the filters, modify the values in the <em>Weight</em> column or grab a drag-and-drop handle under the <em>Name</em> column and drag filters to new locations in the list. (Grab a handle by clicking and holding the mouse while hovering over a handle icon.) Remember that your changes will not be saved until you click the <em>Save configuration</em> button at the bottom of the page.	none
1328	modules/filter/filter.module:179;181	default	Allowed HTML tags: @tags	none
1329	modules/filter/filter.module:186	default	\n<p>This site allows HTML content. While learning all of HTML may feel intimidating, learning how to use a very small number of the most basic HTML "tags" is very easy. This table provides examples for each tag that is enabled on this site.</p>\n<p>For more information see W3C's <a href="http://www.w3.org/TR/html/">HTML Specifications</a> or use your favorite search engine to find other sites that explain HTML.</p>	none
1330	modules/filter/filter.module:190	default	Anchors are used to make links to other pages.	none
1331	modules/filter/filter.module:191	default	By default line break tags are automatically added, so use this tag to add additional ones. Use of this tag is different because it is not used with an open/close pair like all the others. Use the extra " /" inside the tag to maintain XHTML 1.0 compatibility	none
1332	modules/filter/filter.module:191	default	Text with <br />line break	none
1333	modules/filter/filter.module:192	default	By default paragraph tags are automatically added, so use this tag to add additional ones.	none
1334	modules/filter/filter.module:192	default	Paragraph one.	none
1335	modules/filter/filter.module:192	default	Paragraph two.	none
1336	modules/filter/filter.module:193;193	default	Strong	none
1337	modules/filter/filter.module:194;194	default	Emphasized	none
1338	modules/filter/filter.module:195;195	default	Cited	none
1339	modules/filter/filter.module:196	default	Coded text used to show programming source code	none
1340	modules/filter/filter.module:196	default	Coded	none
1341	modules/filter/filter.module:197;197	default	Bolded	none
1342	modules/filter/filter.module:198;198	default	Underlined	none
1343	modules/filter/filter.module:199;199	default	Italicized	none
1344	modules/filter/filter.module:200	default	Superscripted	none
1345	modules/filter/filter.module:200	default	<sup>Super</sup>scripted	none
1346	modules/filter/filter.module:201	default	Subscripted	none
1347	modules/filter/filter.module:201	default	<sub>Sub</sub>scripted	none
1348	modules/filter/filter.module:202;202	default	Preformatted	none
1349	modules/filter/filter.module:203	default	Abbreviation	none
1350	modules/filter/filter.module:203	default	<abbr title="Abbreviation">Abbrev.</abbr>	none
1351	modules/filter/filter.module:204	default	Acronym	none
1352	modules/filter/filter.module:204	default	<acronym title="Three-Letter Acronym">TLA</acronym>	none
1353	modules/filter/filter.module:205;205	default	Block quoted	none
1354	modules/filter/filter.module:206;206	default	Quoted inline	none
1355	modules/filter/filter.module:208	default	Table	none
1356	modules/filter/filter.module:208	default	Table header	none
1357	modules/filter/filter.module:208	default	Table cell	none
1358	modules/filter/filter.module:210;210	default	Deleted	none
1359	modules/filter/filter.module:211;211	default	Inserted	none
1364	modules/filter/filter.module:217	default	Definition lists are similar to other HTML lists. &lt;dl&gt; begins the definition list, &lt;dt&gt; begins the definition term and &lt;dd&gt; begins the definition description.	none
1365	modules/filter/filter.module:217	default	First term	none
1366	modules/filter/filter.module:217	default	First definition	none
1367	modules/filter/filter.module:217	default	Second term	none
1368	modules/filter/filter.module:217	default	Second definition	none
1369	modules/filter/filter.module:220	default	Subtitle	none
1370	modules/filter/filter.module:221	default	Subtitle three	none
1371	modules/filter/filter.module:222	default	Subtitle four	none
1372	modules/filter/filter.module:223	default	Subtitle five	none
1373	modules/filter/filter.module:224	default	Subtitle six	none
1374	modules/filter/filter.module:226	default	Tag Description	none
1375	modules/filter/filter.module:226;255	default	You Type	none
1376	modules/filter/filter.module:226;255	default	You Get	none
1377	modules/filter/filter.module:240	default	No help provided for tag %tag.	none
1378	modules/filter/filter.module:246	default	\n<p>Most unusual characters can be directly entered without any problems.</p>\n<p>If you do encounter problems, try using HTML character entities. A common example looks like &amp;amp; for an ampersand &amp; character. For a full list of entities see HTML's <a href="http://www.w3.org/TR/html4/sgml/entities.html">entities</a> page. Some of the available characters include:</p>	none
1379	modules/filter/filter.module:250	default	Ampersand	none
1380	modules/filter/filter.module:251	default	Greater than	none
1381	modules/filter/filter.module:252	default	Less than	none
1382	modules/filter/filter.module:253	default	Quotation mark	none
1383	modules/filter/filter.module:255	default	Character Description	none
1384	modules/filter/filter.module:269	default	No HTML tags allowed	none
1385	modules/filter/filter.module:277	default	Lines and paragraphs break automatically.	none
1386	modules/filter/filter.module:279	default	Lines and paragraphs are automatically recognized. The &lt;br /&gt; line break, &lt;p&gt; paragraph and &lt;/p&gt; close paragraph tags are inserted automatically. If paragraphs are not recognized simply add a couple blank lines.	none
1387	modules/filter/filter.module:283	default	Web page addresses and e-mail addresses turn into links automatically.	none
1388	modules/filter/filter.module:497	default	Input format	none
1389	modules/filter/filter.module:623;674	default	HTML filter	none
1390	modules/filter/filter.module:623	default	Line break converter	none
1391	modules/filter/filter.module:623;734	default	URL filter	none
1392	modules/filter/filter.module:623	default	HTML corrector	none
1393	modules/filter/filter.module:628	default	Allows you to restrict whether users can post HTML and which tags to filter out. It will also remove harmful content such as JavaScript events, JavaScript URLs and CSS styles from those tags that are not removed.	none
1394	modules/filter/filter.module:630	default	Converts line breaks into HTML (i.e. &lt;br&gt; and &lt;p&gt; tags).	none
1395	modules/filter/filter.module:632	default	Turns web and e-mail addresses into clickable links.	none
1396	modules/filter/filter.module:634	default	Corrects faulty and chopped off HTML in postings.	none
1397	modules/filter/filter.module:679	default	Filter HTML tags	none
1398	modules/filter/filter.module:681	default	Strip disallowed tags	none
1399	modules/filter/filter.module:681	default	Escape all tags	none
1400	modules/filter/filter.module:682	default	How to deal with HTML tags in user-contributed content. If set to "Strip disallowed tags", dangerous tags are removed (see below). If set to "Escape tags", all HTML is escaped and presented as it was typed.	none
1401	modules/filter/filter.module:690	default	If "Strip disallowed tags" is selected, optionally specify tags which should not be stripped. JavaScript event attributes are always stripped.	none
1402	modules/filter/filter.module:694	default	Display HTML help	none
1403	modules/filter/filter.module:696	default	If enabled, Drupal will display some basic HTML help in the long filter tips.	none
1404	スパムリンク云々だと誤解が生じるため,  modules/filter/filter.module:700	default	Spam link deterrent	none
1405	modules/filter/filter.module:702	default	If enabled, Drupal will add rel="nofollow" to all links, as a measure to reduce the effectiveness of spam links. Note: this will also prevent valid links from being followed by search engines, therefore it is likely most effective when enabled for anonymous users.	none
1406	modules/filter/filter.module:739	default	Maximum link text length	none
1407	modules/filter/filter.module:742	default	URLs longer than this number of characters will be truncated to prevent long strings that break formatting. The link itself will be retained; just the text portion of the link will be truncated.	none
1408	modules/filter/filter.module:156	default	administer filters	none
1409	modules/filter/filter.module:70	default	Input formats	none
1410	modules/filter/filter.module:71	default	Configure how content input by users is filtered, including allowed HTML tags. Also allows enabling of module-provided filters.	none
1411	modules/filter/filter.module:90	default	Delete input format	none
1412	modules/filter/filter.module:98	default	Compose tips	none
1413	modules/filter/filter.module:130	default	Rearrange	none
1414	modules/help/help.admin.inc:14	default	Help topics	none
1415	modules/help/help.admin.inc:14	default	Help is available on the following items:	none
1416	modules/help/help.admin.inc:29	default	No help is available for module %module.	none
1417	modules/help/help.admin.inc:40	default	@module administration pages	none
1418	modules/help/help.module:40	default	This guide provides context sensitive help on the use and configuration of <a href="@drupal">Drupal</a> and its modules, and is a supplement to the more extensive online <a href="@handbook">Drupal handbook</a>. The online handbook may contain more up-to-date information, is annotated with helpful user-contributed comments, and serves as the definitive reference point for all Drupal documentation.	none
1492	modules/locale/locale.module:0	default	Tue	none
1493	modules/locale/locale.module:0	default	Wed	none
1419	modules/help/help.module:43	default	The help module provides context sensitive help on the use and configuration of <a href="@drupal">Drupal</a> and its modules, and is a supplement to the more extensive online <a href="@handbook">Drupal handbook</a>. The online handbook may contain more up-to-date information, is annotated with helpful user-contributed comments, and serves as the definitive reference point for all Drupal documentation.	none
1420	modules/help/help.module:44	default	For more information, see the online handbook entry for <a href="@help">Help module</a>.	none
1421	modules/locale/locale.module:23	default	The locale module allows your Drupal site to be presented in languages other than the default English, a defining feature of multi-lingual websites. The locale module works by examining text as it is about to be displayed: when a translation of the text is available in the language to be displayed, the translation is displayed rather than the original text. When a translation is unavailable, the original text is displayed, and then stored for later review by a translator.	none
1422	modules/locale/locale.module:24	default	Beyond translation of the Drupal interface, the locale module provides a feature set tailored to the needs of a multi-lingual site. Language negotiation allows your site to automatically change language based on the domain or path used for each request. Users may (optionally) select their preferred language on their <em>My account</em> page, and your site can be configured to honor a web browser's preferred language settings. Your site content can be created in (and translated to) any enabled language, and each post may have a language-appropriate alias for each of its translations. The locale module works in concert with the <a href="@content-help">content translation module</a> to manage translated content.	none
1423	modules/locale/locale.module:25	default	Translations may be provided by:	none
1424	modules/locale/locale.module:26	default	translating the original text via the locale module's integrated web interface, or	none
1425	modules/locale/locale.module:27	default	importing files from a set of existing translations, known as a translation package. A translation package enables the display of a specific version of Drupal in a specific language, and contain files in the Gettext Portable Object (<em>.po</em>) format. Although not all languages are available for every version of Drupal, translation packages for many languages are available for download from the <a href="@translations">Drupal translation page</a>.	none
1426	modules/locale/locale.module:28	default	If an existing translation package does not meet your needs, the Gettext Portable Object (<em>.po</em>) files within a package may be modified, or new <em>.po</em> files may be created, using a desktop Gettext editor. The locale module's <a href="@import">import</a> feature allows the translated strings from a new or modified <em>.po</em> file to be added to your site. The locale module's <a href="@export">export</a> feature generates files from your site's translated strings, that can either be shared with others or edited offline by a Gettext translation editor.	none
1427	modules/locale/locale.module:29	default	For more information, see the online handbook entry for <a href="@locale">Locale module</a>.	none
1428	modules/locale/locale.module:32	default	This page provides an overview of your site's enabled languages. If multiple languages are available and enabled, the text on your site interface may be translated, registered users may select their preferred language on the <em>My account</em> page, and site authors may indicate a specific language when creating posts. The site's default language is used for anonymous visitors and for users who have not selected a preferred language.	none
1429	modules/locale/locale.module:33	default	For each language available on the site, use the <em>edit</em> link to configure language details, including name, an optional language-specific path or domain, and whether the language is natively presented either left-to-right or right-to-left. These languages also appear in the <em>Language</em> selection when creating a post of a content type with multilingual support.	none
1430	modules/locale/locale.module:34	default	Use the <a href="@add-language">add language page</a> to enable additional languages (and automatically import files from a translation package, if available), the <a href="@search">translate interface page</a> to locate strings for manual translation, or the <a href="@import">import page</a> to add translations from individual <em>.po</em> files. A number of contributed translation packages containing <em>.po</em> files are available on the <a href="@translations">Drupal.org translations page</a>.	none
1431	modules/locale/locale.module:37	default	Add all languages to be supported by your site. If your desired language is not available in the <em>Language name</em> drop-down, click <em>Custom language</em> and provide a language code and other details manually. When providing a language code manually, be sure to enter a standardized language code, since this code may be used by browsers to determine an appropriate display language.	none
1432	modules/locale/locale.module:39	default	Language negotiation settings determine the site's presentation language. Available options include:	none
1433	modules/locale/locale.module:40	default	<strong>None.</strong> The default language is used for site presentation, though users may (optionally) select a preferred language on the <em>My Account</em> page. (User language preferences will be used for site e-mails, if available.)	none
1434	modules/locale/locale.module:41	default	<strong>Path prefix only.</strong> The presentation language is determined by examining the path for a language code or other custom string that matches the path prefix (if any) specified for each language. If a suitable prefix is not identified, the default language is used. <em>Example: "example.com/de/contact" sets presentation language to German based on the use of "de" within the path.</em>	none
1435	modules/locale/locale.module:42	default	<strong>Path prefix with language fallback.</strong> The presentation language is determined by examining the path for a language code or other custom string that matches the path prefix (if any) specified for each language. If a suitable prefix is not identified, the display language is determined by the user's language preferences from the <em>My Account</em> page, or by the browser's language settings. If a presentation language cannot be determined, the default language is used.	none
1436	modules/locale/locale.module:43	default	<strong>Domain name only.</strong> The presentation language is determined by examining the domain used to access the site, and comparing it to the language domain (if any) specified for each language. If a match is not identified, the default language is used. <em>Example: "http://de.example.com/contact" sets presentation language to German based on the use of "http://de.example.com" in the domain.</em>	none
1437	modules/locale/locale.module:44	default	The path prefix or domain name for a language may be set by editing the <a href="@languages">available languages</a>. In the absence of an appropriate match, the site is displayed in the <a href="@languages">default language</a>.	none
1438	modules/locale/locale.module:47	default	This page provides an overview of available translatable strings. Drupal displays translatable strings in text groups; modules may define additional text groups containing other translatable strings. Because text groups provide a method of grouping related strings, they are often used to focus translation efforts on specific areas of the Drupal interface.	none
1439	modules/locale/locale.module:48	default	Review the <a href="@languages">languages page</a> for more information on adding support for additional languages.	none
1440	modules/locale/locale.module:51	default	This page imports the translated strings contained in an individual Gettext Portable Object (<em>.po</em>) file. Normally distributed as part of a translation package (each translation package may contain several <em>.po</em> files), a <em>.po</em> file may need to be imported after off-line editing in a Gettext translation editor. Importing an individual <em>.po</em> file may be a lengthy process.	none
1441	modules/locale/locale.module:52	default	Note that the <em>.po</em> files within a translation package are imported automatically (if available) when new modules or themes are enabled, or as new languages are added. Since this page only allows the import of one <em>.po</em> file at a time, it may be simpler to download and extract a translation package into your Drupal installation directory and <a href="@language-add">add the language</a> (which automatically imports all <em>.po</em> files within the package). Translation packages are available for download on the <a href="@translations">Drupal translation page</a>.	none
1442	modules/locale/locale.module:55	default	This page exports the translated strings used by your site. An export file may be in Gettext Portable Object (<em>.po</em>) form, which includes both the original string and the translation (used to share translations with others), or in Gettext Portable Object Template (<em>.pot</em>) form, which includes the original strings only (used to create new translations with a Gettext translation editor).	none
1443	modules/locale/locale.module:57	default	This page allows a translator to search for specific translated and untranslated strings, and is used when creating or editing translations. (Note: For translation tasks involving many strings, it may be more convenient to <a href="@export">export</a> strings for off-line editing in a desktop Gettext translation editor.) Searches may be limited to strings found within a specific text group or in a specific language.	none
1444	modules/locale/locale.module:60	default	This block is only shown if <a href="@languages">at least two languages are enabled</a> and <a href="@configuration">language negotiation</a> is set to something other than <em>None</em>.	none
1445	modules/locale/locale.module:195	default	Built-in interface	none
1446	modules/locale/locale.module:221	default	Language settings	none
1447	modules/locale/locale.module:232	default	This account's default language for e-mails, and preferred language for site presentation.	none
1448	modules/locale/locale.module:232	default	This account's default language for e-mails.	none
1449	modules/locale/locale.module:252	default	A path alias set for a specific language will always be used when displaying this page in that language, and takes precedence over path aliases set for <em>All languages</em>.	none
1450	modules/locale/locale.module:261	default	Multilingual support	none
1451	modules/locale/locale.module:264	default	Enable multilingual support for this content type. If enabled, a language selection field will be added to the editing form, allowing you to select from one of the <a href="!languages">enabled languages</a>. If disabled, new posts are saved with the default language. Existing content will not be affected by changing this option.	none
1452	modules/locale/locale.module:444	default	All	none
1453	modules/locale/locale.module:564	default	Language switcher	none
1454	modules/locale/locale.module:186	default	administer languages	none
1455	modules/locale/locale.module:186	default	translate interface	none
1456	modules/locale/locale.module:76	default	Configure languages for content and the user interface.	none
1457	modules/locale/locale.module:103	default	Edit language	none
1458	modules/locale/locale.module:119	default	Translate interface	none
1459	modules/locale/locale.module:120	default	Translate the built in interface and optionally other text.	none
1460	modules/locale/locale.module:126	default	Overview	none
1461	modules/locale/locale.module:155	default	Edit string	none
1462	modules/locale/locale.module:162	default	Delete string	none
1463	modules/locale/locale.module:0	default	!long-month-name January	none
1464	modules/locale/locale.module:0	default	Jan	none
1466	modules/locale/locale.module:0	default	Feb	none
1467	modules/locale/locale.module:0	default	!long-month-name March	none
1468	modules/locale/locale.module:0	default	Mar	none
1469	modules/locale/locale.module:0	default	!long-month-name April	none
1470	modules/locale/locale.module:0	default	Apr	none
1471	modules/locale/locale.module:0	default	!long-month-name May	none
1472	modules/locale/locale.module:0	default	May	none
1473	modules/locale/locale.module:0	default	!long-month-name June	none
1474	modules/locale/locale.module:0	default	Jun	none
1475	modules/locale/locale.module:0	default	!long-month-name July	none
1476	modules/locale/locale.module:0	default	Jul	none
1477	modules/locale/locale.module:0	default	!long-month-name August	none
1478	modules/locale/locale.module:0	default	Aug	none
1479	modules/locale/locale.module:0	default	!long-month-name September	none
1480	modules/locale/locale.module:0	default	Sep	none
1481	modules/locale/locale.module:0	default	!long-month-name October	none
1482	modules/locale/locale.module:0	default	Oct	none
1483	modules/locale/locale.module:0	default	!long-month-name November	none
1484	modules/locale/locale.module:0	default	Nov	none
1485	modules/locale/locale.module:0	default	!long-month-name December	none
1486	modules/locale/locale.module:0	default	Dec	none
1488	modules/locale/locale.module:0	default	Fri	none
1489	modules/locale/locale.module:0	default	Sat	none
1490	modules/locale/locale.module:0	default	Sun	none
1491	modules/locale/locale.module:0	default	Mon	none
1487	modules/locale/locale.module:0;0	default	Thu	6.34
1495	modules/locale/locale.module:0	default	pm	none
1496	modules/locale/locale.module:0	default	AM	none
1497	modules/locale/locale.module:0	default	PM	none
1498	modules/menu/menu.admin.inc:54	default	There are no menu items yet.	none
1499	modules/menu/menu.admin.inc:72 modules/menu/menu.module:244	default	disabled	none
1500	modules/menu/menu.admin.inc:104	default	reset	none
1501	modules/menu/menu.admin.inc:175	default	Menu item	none
1502	modules/menu/menu.admin.inc:177;299	default	Expanded	none
1503	modules/menu/menu.admin.inc:230 modules/menu/menu.module:365	default	Menu settings	none
1504	modules/menu/menu.admin.inc:260	default	The path this menu item links to. This can be an internal Drupal path such as %add-node or an external URL such as %drupal. Enter %front to link to the front page.	none
1505	modules/menu/menu.admin.inc:279 modules/menu/menu.module:392	default	Menu link title	none
1506	modules/menu/menu.admin.inc:281	default	The link text corresponding to this item that should appear in the menu.	none
1507	modules/menu/menu.admin.inc:289	default	The description displayed when hovering over a menu item.	none
1508	modules/menu/menu.admin.inc:295	default	Menu items that are not enabled will not be listed in any menu.	none
1509	modules/menu/menu.admin.inc:301	default	If selected and this menu item has children, the menu will always appear expanded.	none
1510	modules/menu/menu.admin.inc:315 modules/menu/menu.module:408	default	The maximum depth for an item and all its children is fixed at !maxdepth. Some menu items may not be available as parents if selecting them would exceed this limit.	none
1511	modules/menu/menu.admin.inc:323 modules/menu/menu.module:418	default	Optional. In the menu, the heavier items will sink and the lighter items will be positioned nearer the top.	none
1512	modules/menu/menu.admin.inc:387 modules/menu/menu.module:309	default	There was an error saving the menu link.	none
1513	modules/menu/menu.admin.inc:411	default	Menu name	none
1514	modules/menu/menu.admin.inc:413	default	The machine-readable name of this menu. This text will be used for constructing the URL of the <em>menu overview</em> page for this menu. This name must contain only lowercase letters, numbers, and hyphens, and must be unique.	none
1515	modules/menu/menu.admin.inc:468	default	Are you sure you want to delete the custom menu %title?	none
1516	modules/menu/menu.admin.inc:500	default	The custom menu %title has been deleted.	none
1517	modules/menu/menu.admin.inc:510	default	The menu name may only consist of lowercase letters, numbers, and hyphens.	none
1518	modules/menu/menu.admin.inc:517	default	The menu already exists.	none
1519	modules/menu/menu.admin.inc:569	default	Are you sure you want to delete the custom menu item %item?	none
1520	modules/menu/menu.admin.inc:579	default	The menu item %title has been deleted.	none
1521	modules/menu/menu.admin.inc:589	default	Are you sure you want to reset the item %item to its default values?	none
1522	modules/menu/menu.admin.inc:589	default	Any customizations will be lost. This action cannot be undone.	none
1523	modules/menu/menu.admin.inc:598	default	The menu item was reset to its default settings.	none
1524	modules/menu/menu.admin.inc:608	default	The menu module allows on-the-fly creation of menu links in the content authoring forms. The following option sets the default menu in which a new link will be added.	none
1525	modules/menu/menu.admin.inc:614	default	Default menu for content	none
1526	modules/menu/menu.admin.inc:617	default	Choose the menu to be the default in the menu options in the content authoring form.	none
1527	modules/menu/menu.admin.inc:621	default	No primary links	none
1528	modules/menu/menu.admin.inc:624	default	Source for the primary links	none
1529	modules/menu/menu.admin.inc:628	default	Select what should be displayed as the primary links.	none
1530	modules/menu/menu.admin.inc:631	default	No secondary links	none
1531	modules/menu/menu.admin.inc:634	default	Source for the secondary links	none
1532	modules/menu/menu.admin.inc:638	default	Select what should be displayed as the secondary links. You can choose the same menu for secondary links as for primary links (currently %primary). If you do this, the children of the active primary menu link will be displayed as secondary links.	none
1533	modules/menu/menu.admin.inc:501	default	Deleted custom menu %title and all its menu items.	none
1534	modules/menu/menu.admin.inc:580	default	Deleted menu item %title.	none
1535	modules/menu/menu.admin.inc:465	default	<strong>Warning:</strong> There is currently 1 menu item in %title. It will be deleted (system-defined items will be reset).	none
1536	modules/menu/menu.admin.inc:465	default	<strong>Warning:</strong> There are currently @count menu items in %title. They will be deleted (system-defined items will be reset).	none
1537	modules/menu/menu.module:20	default	The menu module provides an interface to control and customize Drupal's powerful menu system. Menus are a hierarchical collection of links, or menu items, used to navigate a website, and are positioned and displayed using Drupal's flexible block system. By default, three menus are created during installation: <em>Navigation</em>, <em>Primary links</em>, and <em>Secondary links</em>. The <em>Navigation</em> menu contains most links necessary for working with and navigating your site, and is often displayed in either the left or right sidebar. Most Drupal themes also provide support for <em>Primary links</em> and <em>Secondary links</em>, by displaying them in either the header or footer of each page. By default, <em>Primary links</em> and <em>Secondary links</em> contain no menu items but may be configured to contain custom menu items specific to your site.	none
1538	modules/menu/menu.module:21	default	The <a href="@menu">menus page</a> displays all menus currently available on your site. Select a menu from this list to add or edit a menu item, or to rearrange items within the menu. Create new menus using the <a href="@add-menu">add menu page</a> (the block containing a new menu must also be enabled on the <a href="@blocks">blocks administration page</a>).	none
1539	modules/menu/menu.module:22	default	For more information, see the online handbook entry for <a href="@menu">Menu module</a>.	none
1540	modules/menu/menu.module:25	default	Menus are a collection of links (menu items) used to navigate a website. The menus currently available on your site are displayed below. Select a menu from this list to manage its menu items.	none
1592	modules/node/content_types.inc:402	default	The content type %name has been deleted.	none
1541	modules/menu/menu.module:27	default	Enter the name for your new menu. Remember to enable the newly created block in the <a href="@blocks">blocks administration page</a>.	none
1542	modules/menu/menu.module:29	default	To rearrange menu items, grab a drag-and-drop handle under the <em>Menu item</em> column and drag the items (or group of items) to a new location in the list. (Grab a handle by clicking and holding the mouse while hovering over a handle icon.) Remember that your changes will not be saved until you click the <em>Save configuration</em> button at the bottom of the page.	none
1543	modules/menu/menu.module:31	default	Enter the title and path for your new menu item.	none
1544	modules/menu/menu.module:379	default	Delete this menu item.	none
1545	modules/menu/menu.module:394	default	The link text corresponding to this item that should appear in the menu. Leave blank if you do not wish to add this post to the menu.	none
1546	modules/menu/menu.module:39	default	administer menu	none
1547	modules/menu/menu.module:47	default	Menus	none
1548	modules/menu/menu.module:48	default	Control your site's navigation menu, primary links and secondary links, as well as rename and reorganize menu items.	none
1549	modules/menu/menu.module:56	default	List menus	none
1550	modules/menu/menu.module:62	default	Add menu	none
1551	modules/menu/menu.module:79	default	Customize menu	none
1552	modules/menu/menu.module:89	default	List items	none
1553	modules/menu/menu.module:95	default	Add item	none
1554	modules/menu/menu.module:103	default	Edit menu	none
1555	modules/menu/menu.module:111	default	Delete menu	none
1556	modules/menu/menu.module:119	default	Edit menu item	none
1557	modules/menu/menu.module:127	default	Reset menu item	none
1558	modules/menu/menu.module:135	default	Delete menu item	none
1559	(duplicate) modules/menu/menu.install:11	default	The navigation menu is provided by Drupal and is the main interactive menu for any site. It is usually the only menu that contains personalized links for authenticated users, and is often not even visible to anonymous users.	none
1560	(duplicate) modules/menu/menu.install:12	default	Primary links are often used at the theme layer to show the major sections of a site. A typical representation for primary links would be tabs along the top.	none
1561	(duplicate) modules/menu/menu.install:13	default	Secondary links are often used for pages like legal notices, contact details, and other secondary navigation items that play a lesser role than primary links	none
1562	modules/node/content_types.inc:41	default	No content types available.	none
1563	modules/node/content_types.inc:74	default	The human-readable name of this content type. This text will be displayed as part of the list on the <em>create content</em> page. It is recommended that this name begin with a capital letter and contain only letters, numbers, and <strong>spaces</strong>. This name must be unique.	none
1564	modules/node/content_types.inc:85	default	The machine-readable name of this content type. This text will be used for constructing the URL of the <em>create content</em> page for this content type. This name must contain only lowercase letters, numbers, and underscores. Underscores will be converted into hyphens when constructing the URL of the <em>create content</em> page. This name must be unique.	none
1565	modules/node/content_types.inc:97	default	The machine-readable name of this content type. This field cannot be modified for system-defined content types.	none
1566	modules/node/content_types.inc:105	default	A brief description of this content type. This text will be displayed as part of the list on the <em>create content</em> page.	none
1567	modules/node/content_types.inc:110	default	Submission form settings	none
1568	modules/node/content_types.inc:115	default	Title field label	none
1569	modules/node/content_types.inc:124	default	This content type does not have a title field.	none
1570	modules/node/content_types.inc:128	default	Body field label	none
1571	modules/node/content_types.inc:131	default	To omit the body field for this content type, remove any text and leave this field blank.	none
1572	modules/node/content_types.inc:135	default	Minimum number of words	none
1573	modules/node/content_types.inc:138	default	The minimum number of words for the body field to be considered valid for this content type. This can be useful to rule out submissions that do not meet the site's standards, such as short test posts.	none
1574	modules/node/content_types.inc:142	default	Explanation or submission guidelines	none
1575	modules/node/content_types.inc:144	default	This text will be displayed at the top of the submission form for this content type. It is useful for helping or instructing your users.	none
1576	modules/node/content_types.inc:148	default	Workflow settings	none
1577	modules/node/content_types.inc:153	default	Default options	none
1578	modules/node/content_types.inc:157 modules/node/node.pages.inc:217	default	Promoted to front page	none
1579	modules/node/content_types.inc:158 modules/node/node.pages.inc:222	default	Sticky at top of lists	none
1580	modules/node/content_types.inc:159 modules/node/node.pages.inc:160	default	Create new revision	none
1581	modules/node/content_types.inc:161	default	Users with the <em>administer nodes</em> permission will be able to override these options.	none
1582	modules/node/content_types.inc:191	default	Save content type	none
1583	modules/node/content_types.inc:199;281	default	Delete content type	none
1584	machine-readable name == type,  modules/node/content_types.inc:230	default	The machine-readable name %type is already taken.	none
1585	modules/node/content_types.inc:233	default	The machine-readable name must contain only lowercase letters, numbers, and underscores.	none
1586	modules/node/content_types.inc:238	default	Invalid machine-readable name. Please enter a name other than %invalid.	none
1587	human-readable name == name,  modules/node/content_types.inc:245	default	The human-readable name %name is already taken.	none
1588	modules/node/content_types.inc:325	default	The content type %name has been reset to its default values.	none
1589	modules/node/content_types.inc:330	default	The content type %name has been updated.	none
1590	modules/node/content_types.inc:333	default	The content type %name has been added.	none
1591	modules/node/content_types.inc:382	default	Are you sure you want to delete the content type %type?	none
1593	modules/node/content_types.inc:334	default	node	none
1594	modules/node/content_types.inc:334	default	Added content type %name.	none
1595	modules/node/content_types.inc:403	default	Deleted content type %name.	none
1596	modules/node/content_types.inc:349	default	Changed the content type of 1 post from %old-type to %type.	none
1597	modules/node/content_types.inc:349	default	Changed the content type of @count posts from %old-type to %type.	none
1598	modules/node/content_types.inc:387	default	<strong>Warning:</strong> there is currently 1 %type post on your site. It may not be able to be displayed or edited correctly, once you have removed this content type.	none
1599	modules/node/content_types.inc:387	default	<strong>Warning:</strong> there are currently @count %type posts on your site. They may not be able to be displayed or edited correctly, once you have removed this content type.	none
1600	modules/node/node.admin.inc:12	default	If the site is experiencing problems with permissions to content, you may have to rebuild the permissions cache. Possible causes for permission problems are disabling modules or configuration changes to permissions. Rebuilding will remove all privileges to posts, and replace them with permissions based on the current modules and settings.	none
1601	modules/node/node.admin.inc:13	default	Rebuilding may take some time if there is a lot of content or complex permission settings. After rebuilding has completed posts will automatically use the new permissions.	none
1602	modules/node/node.admin.inc:17	default	Node access status	none
1603	modules/node/node.admin.inc:22;72 modules/node/node.module:1458	default	Rebuild permissions	none
1604	modules/node/node.admin.inc:27	default	Number of posts on main page	none
1605	modules/node/node.admin.inc:29	default	The default maximum number of posts to display per page on overview pages such as the main page.	none
1606	modules/node/node.admin.inc:32	default	Length of trimmed posts	none
1607	modules/node/node.admin.inc:35	default	200 characters	none
1608	modules/node/node.admin.inc:36	default	400 characters	none
1609	modules/node/node.admin.inc:37	default	600 characters	none
1610	modules/node/node.admin.inc:38	default	800 characters	none
1611	modules/node/node.admin.inc:39	default	1000 characters	none
1612	modules/node/node.admin.inc:40	default	1200 characters	none
1613	modules/node/node.admin.inc:41	default	1400 characters	none
1614	modules/node/node.admin.inc:42	default	1600 characters	none
1615	modules/node/node.admin.inc:43	default	1800 characters	none
1616	modules/node/node.admin.inc:44	default	2000 characters	none
1617	modules/node/node.admin.inc:46	default	The maximum number of characters used in the trimmed version of a post. Drupal will use this setting to determine at which offset long posts should be trimmed. The trimmed version of a post is typically used as a teaser when displaying the post on the main page, in XML feeds, etc. To disable teasers, set to 'Unlimited'. Note that this setting will only affect new or updated content and will not affect existing teasers.	none
1618	modules/node/node.admin.inc:51	default	Preview post	none
1619	modules/node/node.admin.inc:54	default	Must users preview posts before submitting?	none
1620	modules/node/node.admin.inc:71	default	Are you sure you want to rebuild the permissions on site content?	none
1621	modules/node/node.admin.inc:72	default	This action rebuilds all permissions on site content, and may be a lengthy process. This action cannot be undone.	none
1622	modules/node/node.admin.inc:89	default	Publish	none
1623	modules/node/node.admin.inc:94	default	Unpublish	none
1624	modules/node/node.admin.inc:99	default	Promote to front page	none
1625	modules/node/node.admin.inc:104	default	Demote from front page	none
1626	modules/node/node.admin.inc:109	default	Make sticky	none
1627	modules/node/node.admin.inc:114	default	Remove stickiness	none
1628	modules/node/node.admin.inc:134;491	default	published	none
1629	modules/node/node.admin.inc:135;491	default	not published	none
1630	modules/node/node.admin.inc:136	default	promoted	none
1631	modules/node/node.admin.inc:137	default	not promoted	none
1632	modules/node/node.admin.inc:138	default	sticky	none
1633	modules/node/node.admin.inc:139	default	not sticky	none
1634	modules/node/node.admin.inc:145	default	Up to date translation	none
1635	modules/node/node.admin.inc:146	default	Outdated translation	none
1636	modules/node/node.admin.inc:150	default	type	none
1637	modules/node/node.admin.inc:154	default	category	none
1638	modules/node/node.admin.inc:159	default	language	none
1639	modules/node/node.admin.inc:211	default	Show only items where	none
1640	modules/node/node.admin.inc:229	default	<em>and</em> where <strong>%a</strong> is <strong>%b</strong>	none
1641	modules/node/node.admin.inc:232	default	<strong>%a</strong> is <strong>%b</strong>	none
1642	modules/node/node.admin.inc:360	default	The update has encountered an error.	none
1643	modules/node/node.admin.inc:426	default	An error occurred and processing did not complete.	none
1644	modules/node/node.admin.inc:512	default	No items selected.	none
1645	modules/node/node.admin.inc:610	default	Are you sure you want to delete these items?	none
1646	modules/node/node.admin.inc:620	default	The items have been deleted.	none
1647	modules/node/node.admin.inc:427	default	1 item successfully processed:	none
1648	modules/node/node.admin.inc:427	default	@count items successfully processed:	none
1649	modules/node/node.pages.inc:59	default	Create @name	none
1650	modules/node/node.pages.inc:151	default	Revision information	none
1651	modules/node/node.pages.inc:165	default	Log message	none
1652	modules/node/node.pages.inc:168	default	An explanation of the additions or updates being made to help other authors understand your motivations.	none
1653	modules/node/node.pages.inc:176	default	Authoring information	none
1654	modules/node/node.pages.inc:188	default	Leave blank for %anonymous.	none
1655	modules/node/node.pages.inc:194	default	Format: %time. Leave blank to use the time of form submission.	none
1656	modules/node/node.pages.inc:205	default	Publishing options	none
1657	teaser,summary,trimmed version...,  modules/node/node.pages.inc:286	default	Show summary in full view	none
1658	modules/node/node.pages.inc:439	default	The trimmed version of your post shows what your post looks like when promoted to the main page or when exported for syndication.<span class="no-js"> You can insert the delimiter "&lt;!--break--&gt;" (without the quotes) to fine-tune where your post gets split.</span>	none
1659	modules/node/node.pages.inc:440	default	Preview trimmed version	none
1660	modules/node/node.pages.inc:442	default	Preview full version	none
1661	modules/node/node.pages.inc:465	default	@type %title has been created.	none
1662	modules/node/node.pages.inc:469	default	@type %title has been updated.	none
1663	modules/node/node.pages.inc:479	default	The post could not be saved.	none
1664	modules/node/node.pages.inc:507	default	Are you sure you want to delete %title?	none
1665	modules/node/node.pages.inc:530	default	Revisions for %title	none
1666	modules/node/node.pages.inc:532	default	Revision	none
1667	modules/node/node.pages.inc:550;556	default	!date by !username	none
1668	modules/node/node.pages.inc:553	default	current revision	none
1669	modules/node/node.pages.inc:559	default	revert	none
1670	modules/node/node.pages.inc:576	default	Are you sure you want to revert to the revision from %revision-date?	none
1671	modules/node/node.pages.inc:576	default	Revert	none
1672	modules/node/node.pages.inc:582	default	Copy of the revision from %date.	none
1673	modules/node/node.pages.inc:590	default	@type %title has been reverted back to the revision from %revision-date.	none
1674	modules/node/node.pages.inc:596	default	Are you sure you want to delete the revision from %revision-date?	none
1675	modules/node/node.pages.inc:604	default	Revision from %revision-date of @type %title has been deleted.	none
1676	modules/node/node.pages.inc:464	default	@type: added %title.	none
1677	modules/node/node.pages.inc:468	default	@type: updated %title.	none
1678	modules/node/node.pages.inc:589	default	@type: reverted %title revision %revision.	none
1679	modules/node/node.pages.inc:603	default	@type: deleted %title revision %revision.	none
1680	modules/node/node.module:34	default	The content access permissions need to be rebuilt.	none
1681	modules/node/node.module:37	default	The content access permissions need to be rebuilt. Please visit <a href="@node_access_rebuild">this page</a>.	none
1682	modules/node/node.module:44	default	The node module manages content on your site, and stores all posts (regardless of type) as a "node". In addition to basic publishing settings, including whether the post has been published, promoted to the site front page, or should remain present (or sticky) at the top of lists, the node module also records basic information about the author of a post. Optional revision control over edits is available. For additional functionality, the node module is often extended by other modules.	none
1683	modules/node/node.module:45	default	Though each post on your site is a node, each post is also of a particular <a href="@content-type">content type</a>. <a href="@content-type">Content types</a> are used to define the characteristics of a post, including the title and description of the fields displayed on its add and edit pages. Each content type may have different default settings for <em>Publishing options</em> and other workflow controls. By default, the two content types in a standard Drupal installation are <em>Page</em> and <em>Story</em>. Use the <a href="@content-type">content types page</a> to add new or edit existing content types. Additional content types also become available as you enable additional core, contributed and custom modules.	none
1684	modules/node/node.module:46	default	The administrative <a href="@content">content page</a> allows you to review and manage your site content. The <a href="@post-settings">post settings page</a> sets certain options for the display of posts. The node module makes a number of permissions available for each content type, which may be set by role on the <a href="@permissions">permissions page</a>.	none
1685	modules/node/node.module:47	default	For more information, see the online handbook entry for <a href="@node">Node module</a>.	none
1686	modules/node/node.module:52	default	Below is a list of all the content types on your site. All posts that exist on your site are instances of one of these content types.	none
1687	modules/node/node.module:54	default	To create a new content type, enter the human-readable name, the machine-readable name, and all other relevant fields that are on this page. Once created, users of your site will be able to create posts that are instances of this content type.	none
1688	modules/node/node.module:56	default	The revisions let you track differences between multiple versions of a post.	none
1689	modules/node/node.module:265	default	You specified that the summary should not be shown when this post is displayed in full view. This setting is ignored when the summary is empty.	none
1690	modules/node/node.module:269	default	You specified that the summary should not be shown when this post is displayed in full view. This setting has been ignored since you have not defined a summary for the post. (To define a summary, insert the delimiter "&lt;!--break--&gt;" (without the quotes) in the Body of the post to indicate the end of the summary and the start of the main content.)	none
1691	modules/node/node.module:797	default	The @body_label of your @type is too short. You need at least %words words.	none
1692	modules/node/node.module:801	default	This content has been modified by another user, changes cannot be saved.	none
1693	modules/node/node.module:810	default	The username %name does not exist.	none
1694	modules/node/node.module:997	default	@type %title has been deleted.	none
1695	modules/node/node.module:1112	default	Revision of %title from %date	none
1696	modules/node/node.module:1132	default	Log	none
1697	modules/node/node.module:1177	default	Content ranking	none
1698	ここだけ weight の使い方が他とは逆,  modules/node/node.module:1181	default	The following numbers control which properties the content search should favor when ordering the results. Higher numbers mean more influence, zero means the property is ignored. Changing these numbers does not require the search index to be rebuilt. Changes take effect immediately.	none
1699	modules/node/node.module:1184	default	Keyword relevance	none
1700	modules/node/node.module:1185	default	Recently posted	none
1701	modules/node/node.module:1187	default	Number of comments	none
1702	modules/node/node.module:1190	default	Number of views	none
1703	modules/node/node.module:1347	default	Factor	none
1704	modules/node/node.module:1381	default	Read more	none
1705	modules/node/node.module:1385	default	Read the rest of !title.	none
1706	modules/node/node.module:1648;1654;1655	default	Syndicate	none
1707	modules/node/node.module:1784	default	RSS	none
1708	modules/node/node.module:1788	default	<h1 class="title">Welcome to your new Drupal website!</h1><p>Please follow these steps to set up and start using your website:</p>	none
1709	modules/node/node.module:1791	default	<strong>Configure your website</strong> Once logged in, visit the <a href="@admin">administration section</a>, where you can <a href="@config">customize and configure</a> all aspects of your website.	none
1710	modules/node/node.module:1792	default	<strong>Enable additional functionality</strong> Next, visit the <a href="@modules">module list</a> and enable features which suit your specific needs. You can find additional modules in the <a href="@download_modules">Drupal modules download section</a>.	none
1711	modules/node/node.module:1793	default	<strong>Customize your website design</strong> To change the "look and feel" of your website, visit the <a href="@themes">themes section</a>. You may choose from one of the included themes or download additional themes from the <a href="@download_themes">Drupal themes download section</a>.	none
1712	modules/node/node.module:1794	default	<strong>Start posting content</strong> Finally, you can <a href="@content">create content</a> for your website. This message will disappear once you have promoted a post to the front page.	none
1713	modules/node/node.module:1796	default	For more information, please refer to the <a href="@help">help section</a>, or the <a href="@handbook">online Drupal handbooks</a>. You may also post at the <a href="@forum">Drupal forum</a>, or view the wide range of <a href="@support">other support options</a> available.	none
1714	modules/node/node.module:1868;1920	default	Advanced search	none
1715	modules/node/node.module:1879	default	Containing any of the words	none
1716	modules/node/node.module:1885	default	Containing the phrase	none
1717	modules/node/node.module:1891	default	Containing none of the words	none
1718	modules/node/node.module:1900	default	Only in the category(s)	none
1719	modules/node/node.module:1913	default	Only of the type(s)	none
1720	modules/node/node.module:2337	default	Rebuilding content access permissions	none
1721	modules/node/node.module:2367	default	Content permissions have been rebuilt.	none
1722	modules/node/node.module:2413	default	The content access permissions have been rebuilt.	none
1723	modules/node/node.module:2417	default	The content access permissions have not been properly rebuilt.	none
1724	modules/node/node.module:2505	default	Submitted by !username on @datetime	none
1725	modules/node/node.module:2520	default	When either saving a new post or updating an existing post	none
1726	modules/node/node.module:2523	default	After saving a new post	none
1727	modules/node/node.module:2526	default	After saving an updated post	none
1728	modules/node/node.module:2529	default	After deleting a post	none
1729	modules/node/node.module:2532	default	When content is viewed by an authenticated user	none
1739	modules/node/node.module:2708	default	The username of the user to which you would like to assign ownership.	none
1740	modules/node/node.module:2747	default	Please enter a valid username.	none
1741	modules/node/node.module:2761	default	The post will be unpublished if it contains any of the character sequences above. Use a comma-separated list of character sequences. Example: funny, bungee jumping, "Company, Inc.". Character sequences are case-sensitive.	none
1742	modules/node/node.module:996	default	@type: deleted %title.	none
1743	modules/node/node.module:2640	default	Set @type %title to published.	none
1744	modules/node/node.module:2649;2784	default	Set @type %title to unpublished.	none
1745	modules/node/node.module:2658	default	Set @type %title to sticky.	none
1746	modules/node/node.module:2667	default	Set @type %title to unsticky.	none
1747	modules/node/node.module:2676	default	Promoted @type %title to front page.	none
1748	modules/node/node.module:2685	default	Removed @type %title from front page.	none
1749	modules/node/node.module:2694	default	Saved @type %title	none
1750	modules/node/node.module:2704	default	Changed owner of @type %title to uid %name.	none
1751	modules/node/node.module:1138	default	administer content types	none
1752	modules/node/node.module:1138	default	administer nodes	none
1753	modules/node/node.module:1138	default	access content	none
1754	modules/node/node.module:1138	default	view revisions	none
1755	modules/node/node.module:1138	default	revert revisions	none
1756	modules/node/node.module:1436	default	View, edit, and delete your site's content.	none
1757	modules/node/node.module:1450	default	Post settings	none
1758	modules/node/node.module:1451	default	Control posting behavior, such as teaser length, requiring previews before posting, and the number of posts on the front page.	none
1759	リンクの説明に合うように変更,  modules/node/node.module:1469	default	Manage posts by content type, including default status, front page promotion, etc.	none
1760	modules/node/node.module:1480	default	Add content type	none
1761	modules/node/node.module:1494	default	Create content	none
1762	modules/node/node.module:1570;1580	default	Revisions	none
1763	modules/node/node.module:1589	default	Revert to earlier revision	none
1764	modules/node/node.module:1599	default	Delete earlier revision	none
1765	以下、デフォルトタイプの各権限文字列	default	create book content	none
1766		default	create page content	none
1732	modules/node/node.module:2566	default	Make post sticky	6.34
1733	modules/node/node.module:2576	default	Make post unsticky	6.34
1734	modules/node/node.module:2586	default	Promote post to front page	6.34
1735	modules/node/node.module:2596	default	Remove post from front page	6.34
1736	modules/node/node.module:2606	default	Change the author of a post	6.34
1737	modules/node/node.module:2617	default	Save post	6.34
1738	modules/node/node.module:2625	default	Unpublish post containing keyword(s)	6.34
1768		default	delete any book content	none
1769		default	delete any page content	none
1770		default	delete any story content	none
1771		default	delete own book content	none
1772		default	delete own page content	none
1773		default	delete own story content	none
1774		default	delete revisions	none
1775		default	edit any book content	none
1776		default	edit any page content	none
1777		default	edit any story content	none
1778		default	edit own book content	none
1779		default	edit own page content	none
1780		default	edit own story content	none
1781	modules/user/user.admin.inc:27 modules/user/user.module:706;2527;944	default	Create new account	none
1782	modules/user/user.admin.inc:57	default	Show only users where	none
1783	modules/user/user.admin.inc:66	default	<em>and</em> where <strong>%property</strong> is <strong>%value</strong>	none
1784	modules/user/user.admin.inc:69	default	<strong>%property</strong> is <strong>%value</strong>	none
1785	modules/user/user.admin.inc:151;933 modules/user/user.module:660	default	Member for	none
1786	modules/user/user.admin.inc:152;934	default	Last access	none
1787	modules/user/user.admin.inc:192 modules/user/user.module:2052	default	blocked	none
1788	modules/user/user.admin.inc:192 modules/user/user.module:2052	default	active	none
1789	modules/user/user.admin.inc:244	default	No users selected.	none
1790	modules/user/user.admin.inc:256	default	User registration settings	none
1791	modules/user/user.admin.inc:257	default	Public registrations	none
1792	modules/user/user.admin.inc:257	default	Visitors can create accounts and no administrator approval is required.	none
1793	modules/user/user.admin.inc:257	default	Visitors can create accounts but administrator approval is required.	none
1794	modules/user/user.admin.inc:258	default	Require e-mail verification when a visitor creates an account	none
1795	modules/user/user.admin.inc:258	default	If this box is checked, new users will be required to validate their e-mail address prior to logging into the site, and will be assigned a system-generated password. With it unchecked, users will be logged in immediately upon registering, and may select their own passwords during registration.	none
1796	modules/user/user.admin.inc:259	default	User registration guidelines	none
1797	modules/user/user.admin.inc:259	default	This text is displayed at the top of the user registration form and is useful for helping or instructing your users.	none
1798	modules/user/user.admin.inc:264	default	User e-mail settings	none
1799	modules/user/user.admin.inc:265	default	Drupal sends emails whenever new users register on your site, and optionally, may also notify users after other account actions. Using a simple set of content templates, notification e-mails can be customized to fit the specific needs of your site.	none
1800	modules/user/user.admin.inc:269	default	Available variables are:	none
1801	modules/user/user.admin.inc:273	default	Welcome, new user created by administrator	none
1802	modules/user/user.admin.inc:276	default	Customize welcome e-mail messages sent to new member accounts created by an administrator.	none
1803	modules/user/user.admin.inc:293	default	Welcome, no approval required	none
1804	modules/user/user.admin.inc:296	default	Customize welcome e-mail messages sent to new members upon registering, when no administrator approval is required.	none
1805	modules/user/user.admin.inc:313	default	Welcome, awaiting administrator approval	none
1806	modules/user/user.admin.inc:316	default	Customize welcome e-mail messages sent to new members upon registering, when administrative approval is required.	none
1807	modules/user/user.admin.inc:333	default	Password recovery email	none
1808	modules/user/user.admin.inc:336	default	Customize e-mail messages sent to users who request a new password.	none
1809	modules/user/user.admin.inc:353	default	Account activation email	none
1810	modules/user/user.admin.inc:356	default	Enable and customize e-mail messages sent to users upon account activation (when an administrator activates an account of a user who has already registered, on a site where administrative approval is required).	none
1811	modules/user/user.admin.inc:360	default	Notify user when account is activated.	none
1812	modules/user/user.admin.inc:378	default	Account blocked email	none
1813	modules/user/user.admin.inc:381	default	Enable and customize e-mail messages sent to users when their accounts are blocked.	none
1814	modules/user/user.admin.inc:385	default	Notify user when account is blocked.	none
1815	modules/user/user.admin.inc:403	default	Account deleted email	none
1816	modules/user/user.admin.inc:406	default	Enable and customize e-mail messages sent to users when their accounts are deleted.	none
1817	modules/user/user.admin.inc:410	default	Notify user when account is deleted.	none
1818	modules/user/user.admin.inc:429	default	Signatures	none
1819	modules/user/user.admin.inc:433	default	Signature support	none
1820	modules/user/user.admin.inc:446	default	Pictures	none
1821	modules/user/user.admin.inc:451	default	Picture support	none
1822	modules/user/user.admin.inc:471	default	Picture image path	none
1823	modules/user/user.admin.inc:475	default	Subdirectory in the directory %dir where pictures will be stored.	none
1824	modules/user/user.admin.inc:479	default	Default picture	none
1825	modules/user/user.admin.inc:483	default	URL of picture to display for users with no custom picture selected. Leave blank for none.	none
1826	modules/user/user.admin.inc:487	default	Picture maximum dimensions	none
1827	modules/user/user.admin.inc:491	default	Maximum dimensions for pictures, in pixels.	none
1828	modules/user/user.admin.inc:495	default	Picture maximum file size	none
1829	modules/user/user.admin.inc:499	default	Maximum file size for pictures, in kB.	none
1830	modules/user/user.admin.inc:503	default	Picture guidelines	none
1831	modules/user/user.admin.inc:505	default	This text is displayed at the picture upload form in addition to the default guidelines. It's useful for helping or instructing your users.	none
1832	modules/user/user.admin.inc:566	default	Save permissions	none
1833	modules/user/user.admin.inc:586 modules/user/user.pages.inc:296;362	default	The changes have been saved.	none
1834	modules/user/user.admin.inc:605 modules/user/user.module:2036	default	@module module	none
1835	modules/user/user.admin.inc:618	default	Permission	none
1836	modules/user/user.admin.inc:647	default	Role name	none
1837	modules/user/user.admin.inc:652	default	The name for this role. Example: "moderator", "editorial board", "site architect".	none
1838	modules/user/user.admin.inc:660;685;702	default	Save role	none
1839	modules/user/user.admin.inc:664;706	default	Delete role	none
1840	modules/user/user.admin.inc:675;690;714	default	Add role	none
1841	modules/user/user.admin.inc:687;692	default	The role name %name already exists. Please choose another role name.	none
1842	modules/user/user.admin.inc:697	default	You must specify a valid role name.	none
1843	modules/user/user.admin.inc:704	default	The role has been renamed.	none
1844	modules/user/user.admin.inc:712	default	The role has been deleted.	none
1845	modules/user/user.admin.inc:716	default	The role has been added.	none
1846	modules/user/user.admin.inc:740 modules/user/user.module:1045	default	Add rule	none
1847	modules/user/user.admin.inc:748	default	Save rule	none
1848	modules/user/user.admin.inc:764;908	default	Access type	none
1849	modules/user/user.admin.inc:766	default	Allow	none
1850	modules/user/user.admin.inc:766	default	Deny	none
1851	modules/user/user.admin.inc:768	default	Host	none
1852	modules/user/user.admin.inc:771;908	default	Rule type	none
1853	modules/user/user.admin.inc:777;908	default	Mask	none
1854	modules/user/user.admin.inc:781	default	Matches any number of characters, even zero characters	none
1855	modules/user/user.admin.inc:781	default	Matches exactly one character.	none
1856	modules/user/user.admin.inc:797	default	The access rule has been saved.	none
1857	modules/user/user.admin.inc:801	default	The access rule has been added.	none
1858	modules/user/user.admin.inc:808	default	No value entered. Please enter a test string and try again.	none
1859	modules/user/user.admin.inc:814	default	Enter a username to check if it will be denied or allowed.	none
1860	modules/user/user.admin.inc:816	default	Check username	none
1861	modules/user/user.admin.inc:825	default	Enter an e-mail address to check if it will be denied or allowed.	none
1862	modules/user/user.admin.inc:827	default	Check e-mail	none
1863	modules/user/user.admin.inc:836	default	Enter a hostname or IP address to check if it will be denied or allowed.	none
1864	modules/user/user.admin.inc:838	default	Check hostname	none
1865	modules/user/user.admin.inc:849	default	The username %name is not allowed.	none
1866	modules/user/user.admin.inc:852	default	The username %name is allowed.	none
1867	modules/user/user.admin.inc:857	default	The e-mail address %mail is not allowed.	none
1868	modules/user/user.admin.inc:860	default	The e-mail address %mail is allowed.	none
1869	modules/user/user.admin.inc:865	default	The hostname %host is not allowed.	none
1870	modules/user/user.admin.inc:868	default	The hostname %host is allowed.	none
1871	modules/user/user.admin.inc:883;910	default	username	none
1872	modules/user/user.admin.inc:883;910	default	e-mail	none
1873	modules/user/user.admin.inc:883;910	default	host	none
1874	modules/user/user.admin.inc:889	default	Are you sure you want to delete the @type rule for %rule?	none
1875	modules/user/user.admin.inc:899	default	The access rule has been deleted.	none
1876	modules/user/user.admin.inc:913	default	allow	none
1877	modules/user/user.admin.inc:913	default	deny	none
1878	modules/user/user.admin.inc:916	default	There are currently no access rules.	none
1879	modules/user/user.admin.inc:953	default	No users available.	none
1880	modules/user/user.admin.inc:974	default	edit permissions	none
1881	modules/user/user.admin.inc:976	default	edit role	none
1882	modules/user/user.admin.inc:979	default	locked	none
1883	modules/user/user.pages.inc:33	default	Username or e-mail address	none
1884	modules/user/user.pages.inc:38	default	E-mail new password	none
1885	modules/user/user.pages.inc:57	default	%name is not allowed to request a new password.	none
1886	modules/user/user.pages.inc:64	default	Sorry, %name is not recognized as a user name or an e-mail address.	none
1887	modules/user/user.pages.inc:75	default	Further instructions have been sent to your e-mail address.	none
1888	modules/user/user.pages.inc:89	default	You have already used this one-time login link. It is not necessary to use this link to login anymore. You are already logged in.	none
1889	modules/user/user.pages.inc:100	default	You have tried to use a one-time login for an account which has been blocked.	none
1890	modules/user/user.pages.inc:106	default	You have tried to use a one-time login link that has expired. Please request a new one using the form below.	none
1891	modules/user/user.pages.inc:118	default	You have just used your one-time login link. It is no longer necessary to use this link to login. Please change your password.	none
1892	modules/user/user.pages.inc:122	default	<p>This is a one-time login for %user_name and will expire on %expiration_date.</p><p>Click on this button to login to the site and change your password.</p>	none
1893	modules/user/user.pages.inc:123	default	This login can be used only once.	none
1894	modules/user/user.pages.inc:124 modules/user/user.module:702;1310;938	default	Log in	none
1895	modules/user/user.pages.inc:130	default	You have tried to use a one-time login link which has either been used or is no longer valid. Please request a new one using the form below.	none
1896	modules/user/user.pages.inc:279;348;277;346,  modules/user/user.module:1859;2375	default	Detected malicious attempt to alter protected user fields.	none
1897	modules/user/user.pages.inc:324	default	Are you sure you want to delete the account %name?	none
1898	modules/user/user.pages.inc:326	default	All submissions made by this user will be attributed to the anonymous account. This action cannot be undone.	none
1899	modules/user/user.pages.inc:335	default	%name has been deleted.	none
1900	modules/user/user.pages.inc:74	default	Password reset instructions mailed to %name at %email.	none
1901	modules/user/user.pages.inc:112	default	User %name used one-time login link at time %timestamp.	none
1902	modules/user/user.pages.inc:148	default	Session closed for %name.	none
1903	modules/user/user.module:397	default	You must enter a username.	none
1904	modules/user/user.module:400	default	The username cannot begin with a space.	none
1905	modules/user/user.module:403	default	The username cannot end with a space.	none
1906	modules/user/user.module:406	default	The username cannot contain multiple spaces in a row.	none
1907	modules/user/user.module:409;421	default	The username contains an illegal character.	none
1908	modules/user/user.module:424	default	The username %name is too long: it must be %max characters or less.	none
1909	modules/user/user.module:429	default	You must enter an e-mail address.	none
1910	modules/user/user.module:431	default	The e-mail address %mail is not valid.	none
1911	modules/user/user.module:457	default	Failed to upload the picture image; the %directory directory doesn't exist or is not writable.	none
1912	modules/user/user.module:656	default	History	none
1914	modules/user/user.module:706	default	Create a new user account.	none
1915	modules/user/user.module:708;953	default	Request new password	none
1916	modules/user/user.module:708	default	Request new password via e-mail.	none
1917	modules/user/user.module:720;767	default	User login	none
1918	modules/user/user.module:729;788	default	Who's new	none
1919	modules/user/user.module:732;821	default	Who's online	none
1920	modules/user/user.module:739	default	Number of users to display	none
1921	modules/user/user.module:747	default	User activity	none
1922	modules/user/user.module:747	default	A user is considered online for this long after they have last viewed a page.	none
1923	modules/user/user.module:748	default	User list length	none
1924	modules/user/user.module:748	default	Maximum number of currently online users to display.	none
1925	msgstr "現在、%members と %visitors がオンラインです。",  modules/user/user.module:805	default	There is currently %members and %visitors online.	none
1926	msgstr "現在、%members と %visitors がオンラインです。",  modules/user/user.module:808	default	There are currently %members and %visitors online.	none
1927	modules/user/user.module:818	default	Online users	none
1928	modules/user/user.module:849	default	@user's picture	none
1929	modules/user/user.module:1231;1083	default	My account	none
1930	modules/user/user.module:1303	default	Enter your @s username.	none
1931	modules/user/user.module:1306	default	Enter the password that accompanies your username.	none
1932	modules/user/user.module:1344	default	The username %name has not been activated or is blocked.	none
1933	実際の挙動に基づき意訳,  modules/user/user.module:1348	default	The name %name is a reserved username.	none
1934	modules/user/user.module:1368	default	Sorry, unrecognized username or password. <a href="@password">Have you forgotten your password?</a>	none
1935	modules/user/user.module:1390	default	The name %name is registered using a reserved e-mail address and therefore could not be logged in.	none
1936	modules/user/user.module:1500	default	Account information	none
1937	modules/user/user.module:1509	default	Spaces are allowed; punctuation is not allowed except for periods, hyphens, and underscores.	none
1938	modules/user/user.module:1517	default	A valid e-mail address. All e-mails from the system will be sent to this address. The e-mail address is not made public and will only be used if you wish to receive a new password or wish to receive certain news or notifications by e-mail.	none
1939	modules/user/user.module:1522	default	To change the current user password, enter the new password in both fields.	none
1940	modules/user/user.module:1529	default	Provide a password for the new account in both fields.	none
1941	ボックスの「ブロック」と勘違いする人はいないと信じて……,  modules/user/user.module:1539	default	Blocked	none
1942	modules/user/user.module:1574	default	Signature settings	none
1943	modules/user/user.module:1579	default	Signature	none
1944	仕様に基づき変更,  modules/user/user.module:1581	default	Your signature will be publicly displayed at the end of your comments.	none
1945	modules/user/user.module:1587	default	The signature input format has been set to a format you don't have access to. It will be changed to a format you have access to when you save this page.	none
1946	modules/user/user.module:1596	default	Picture	none
1947	modules/user/user.module:1600	default	Delete picture	none
1948	modules/user/user.module:1600	default	Check this box to delete your current picture.	none
1949	modules/user/user.module:1605	default	Upload picture	none
1950	modules/user/user.module:1605	default	Your virtual face or picture. Maximum dimensions are %dimensions and the maximum size is %size kB.	none
1951	modules/user/user.module:1621	default	The name %name is already taken.	none
1952	modules/user/user.module:1624	default	The name %name has been denied access.	none
1953	modules/user/user.module:1633	default	The e-mail address %email is already registered. <a href="@password">Have you forgotten your password?</a>	none
1954	modules/user/user.module:1636	default	The e-mail address %email has been denied access.	none
1955	ウェルカムメールの件名なのでそれらしく,  modules/user/user.module:1716	default	Account details for !username at !site	none
1956	modules/user/user.module:1718	default	!username,\n\nThank you for registering at !site. You may now log in to !login_uri using the following username and password:\n\nusername: !username\npassword: !password\n\nYou may also log in by clicking on this link or copying and pasting it in your browser:\n\n!login_url\n\nThis is a one-time login, so it can be used only once.\n\nAfter logging in, you will be redirected to !edit_uri so you can change your password.\n\n\n--  !site team	none
1957	modules/user/user.module:1720	default	An administrator created an account for you at !site	none
1958	modules/user/user.module:1722	default	!username,\n\nA site administrator at !site has created an account for you. You may now log in to !login_uri using the following username and password:\n\nusername: !username\npassword: !password\n\nYou may also log in by clicking on this link or copying and pasting it in your browser:\n\n!login_url\n\nThis is a one-time login, so it can be used only once.\n\nAfter logging in, you will be redirected to !edit_uri so you can change your password.\n\n\n--  !site team	none
1959	ウェルカムメールの件名なのでそれらしく,  modules/user/user.module:1725	default	Account details for !username at !site (pending admin approval)	none
1960	modules/user/user.module:1727	default	!username,\n\nThank you for registering at !site. Your application for an account is currently pending approval. Once it has been approved, you will receive another e-mail containing information about how to log in, set your password, and other details.\n\n\n--  !site team	none
1961	modules/user/user.module:1729	default	!username has applied for an account.\n\n!edit_uri	none
1962	modules/user/user.module:1731	default	Replacement login information for !username at !site	none
1963	modules/user/user.module:1733	default	!username,\n\nA request to reset the password for your account has been made at !site.\n\nYou may now log in to !uri_brief by clicking on this link or copying and pasting it in your browser:\n\n!login_url\n\nThis is a one-time login, so it can be used only once. It expires after one day and nothing will happen if it's not used.\n\nAfter logging in, you will be redirected to !edit_uri so you can change your password.	none
1966	modules/user/user.module:1739	default	Account details for !username at !site (blocked)	none
1967	modules/user/user.module:1741	default	!username,\n\nYour account on !site has been blocked.	none
1968	modules/user/user.module:1743	default	Account details for !username at !site (deleted)	none
1969	modules/user/user.module:1745	default	!username,\n\nYour account on !site has been deleted.	none
1970	modules/user/user.module:1805	default	Unblock the selected users	none
1971	modules/user/user.module:1809	default	Block the selected users	none
1972	modules/user/user.module:1813	default	Delete the selected users	none
1973	modules/user/user.module:1833	default	Add a role to the selected users	none
1974	modules/user/user.module:1836	default	Remove a role from the selected users	none
1975	modules/user/user.module:1938	default	Are you sure you want to delete these users?	none
1976	modules/user/user.module:1948	default	The users have been deleted.	none
1977	より詳細に,  modules/user/user.module:1962	default	The user module allows users to register, login, and log out. Users benefit from being able to sign on because it associates content they create with their account and allows various permissions to be set for their roles. The user module supports user roles which establish fine grained permissions allowing each role to do only what the administrator wants them to. Each user is assigned to one or more roles. By default there are two roles <em>anonymous</em> - a user who has not logged in, and <em>authenticated</em> a user who has signed up and who has been authorized.	none
1978	modules/user/user.module:1963	default	Users can use their own name or handle and can specify personal configuration settings through their individual <em>My account</em> page. Users must authenticate by supplying a local username and password or through their OpenID, an optional and secure method for logging into many websites with a single username and password. In some configurations, users may authenticate using a username and password from another Drupal site, or through some other site-specific mechanism.	none
1979	modules/user/user.module:1964	default	A visitor accessing your website is assigned a unique ID, or session ID, which is stored in a cookie. The cookie does not contain personal information, but acts as a key to retrieve information from your site. Users should have cookies enabled in their web browser when using your site.	none
1980	modules/user/user.module:1965	default	For more information, see the online handbook entry for <a href="@user">User module</a>.	none
1981	modules/user/user.module:1968	default	Drupal allows users to register, login, log out, maintain user profiles, etc. Users of the site may not use their own names to post content until they have signed up for a user account.	none
1982	modules/user/user.module:1971	default	This web page allows administrators to register new users. Users' e-mail addresses and usernames must be unique.	none
1983	modules/user/user.module:1973	default	Set up username and e-mail address access rules for new <em>and</em> existing accounts (currently logged in accounts will not be logged out). If a username or e-mail address for an account matches any deny rule, but not an allow rule, then the account will not be allowed to be created or to log in. A host rule is effective for every page view, not just registrations.	none
1984	例を多少変更,  modules/user/user.module:1975	default	Permissions let you control what users can do on your site. Each user role (defined on the <a href="@role">user roles page</a>) has its own set of permissions. For example, you could give users classified as "Administrators" permission to "administer nodes" but deny this power to ordinary, "authenticated" users. You can use permissions to reveal new features to privileged users (those with subscriptions, for example). Permissions also allow trusted users to share the administrative burden of running a busy site.	none
1985	modules/user/user.module:1977	default	<p>Roles allow you to fine tune the security and administration of Drupal. A role defines a group of users that have certain privileges as defined in <a href="@permissions">user permissions</a>. Examples of roles include: anonymous user, authenticated user, moderator, administrator and so on. In this area you will define the <em>role names</em> of the various roles. To delete a role choose "edit".</p><p>By default, Drupal comes with two user roles:</p>\n      <ul>\n      <li>Anonymous user: this role is used for users that don't have a user account or that are not authenticated.</li>\n      <li>Authenticated user: this role is automatically granted to all logged in users.</li>\n      </ul>	none
1986	冗長？,  modules/user/user.module:1983	default	Enter a simple pattern ("*" may be used as a wildcard match) to search for a username or e-mail address. For example, one may search for "br" and Drupal might return "brian", "brad", and "brenda@example.com".	none
1987	modules/user/user.module:2024	default	role	none
1988	modules/user/user.module:2042	default	permission	none
1999	modules/user/user.module:2274	default	After a user account has been created	none
2000	modules/user/user.module:2277	default	After a user's profile has been updated	none
2001	modules/user/user.module:2280	default	After a user has been deleted	none
2002	modules/user/user.module:2283	default	After a user has logged in	none
2003	modules/user/user.module:2286	default	After a user has logged out	none
2004	modules/user/user.module:2289	default	When a user's profile is being viewed	none
2007	modules/user/user.module:2401	default	Welcome to Drupal. You are now logged in as user #1, which gives you full control over your website.	none
2008	modules/user/user.module:2403	default	</p><p> Your password is <strong>%pass</strong>. You may change your password below.</p>	none
2009	modules/user/user.module:2415	default	Created a new user account for <a href="@url">%name</a>. No e-mail has been sent.	none
2010	modules/user/user.module:2422	default	Registration successful. You are now logged in.	none
2011	modules/user/user.module:2432	default	Password and further instructions have been e-mailed to the new user <a href="@url">%name</a>.	none
2012	modules/user/user.module:2435	default	Your password and further instructions have been sent to your e-mail address.	none
2013	modules/user/user.module:2443	default	Thank you for applying for an account. Your account is currently pending approval by the site administrator.<br />In the meantime, a welcome message with further instructions has been sent to your e-mail address.	none
2014	modules/user/user.module:2484	default	Notify user of new account	none
2015	modules/user/user.module:1402	default	Login attempt failed for %user.	none
2016	modules/user/user.module:1417	default	Session opened for %name.	none
2017	modules/user/user.module:1471	default	New external user: %name using module %module.	none
2018	modules/user/user.module:1668	default	Deleted user: %name %email.	none
2019	modules/user/user.module:2333	default	Blocked user %name.	none
2020	modules/user/user.module:2343	default	Banned IP address %ip	none
2021	modules/user/user.module:2397	default	New user: %name (%email).	none
2022	modules/user/user.module:805;808	default	1 guest	none
2023	modules/user/user.module:805;808	default	@count guests	none
2024	modules/user/user.module:580	default	administer permissions	none
2025	modules/user/user.module:580	default	administer users	none
2026	modules/user/user.module:580	default	access user profiles	none
2027	modules/user/user.module:580	default	change own username	none
2028	modules/user/user.module:920	default	User autocomplete	none
2029	modules/user/user.module:930	default	User account	none
2030	modules/user/user.module:961	default	Reset password	none
2031	modules/user/user.module:971	default	User management	none
2032	modules/user/user.module:972	default	Manage your site's users, groups and access to site features.	none
2033	modules/user/user.module:981	default	List, add, and edit users.	none
2034	modules/user/user.module:993	default	Add user	none
2035	modules/user/user.module:1000	default	User settings	none
2036	modules/user/user.module:1001	default	Configure default behavior of users, including registration requirements, e-mails, and user pictures.	none
2037	modules/user/user.module:1010	default	Permissions	none
2038	modules/user/user.module:1011	default	Determine access to features by selecting permissions for roles.	none
2039	modules/user/user.module:1019	default	List, edit, or add user roles.	none
2040	modules/user/user.module:1026	default	Edit role	none
2041	modules/user/user.module:1033	default	Access rules	none
2042	modules/user/user.module:1034	default	List and create rules to disallow usernames, e-mail addresses, and IP addresses.	none
2043	modules/user/user.module:1052	default	Check rules	none
2044	modules/user/user.module:1059	default	Edit rule	none
2045	modules/user/user.module:1066	default	Delete rule	none
2046	modules/user/user.module:1075	default	Log out	none
2047	modules/user/user.module:1122	default	Account	none
2048	modules/user/user.module:0	default	anonymous user	none
2049	modules/user/user.module:0	default	authenticated user	none
2050	modules/taxonomy/taxonomy.admin.inc:28	default	edit vocabulary	none
2051	modules/taxonomy/taxonomy.admin.inc:29	default	list terms	none
2052	modules/taxonomy/taxonomy.admin.inc:30	default	add terms	none
2053	modules/taxonomy/taxonomy.admin.inc:84	default	No vocabularies available.	none
2054	modules/taxonomy/taxonomy.admin.inc:121	default	Vocabulary name	none
2055	modules/taxonomy/taxonomy.admin.inc:124	default	The name for this vocabulary, e.g., <em>"Tags"</em>.	none
2056	modules/taxonomy/taxonomy.admin.inc:130	default	Description of the vocabulary; can be used by modules.	none
2057	modules/taxonomy/taxonomy.admin.inc:133	default	Help text	none
1990	modules/user/user.module:2248	default	Low	6.34
1991	modules/user/user.module:2250	default	High	6.34
1993	modules/user/user.module:2252	default	The password does not include enough variation to be secure. Try:	6.34
1994	modules/user/user.module:2253	default	Adding both upper and lowercase letters.	6.34
1995	modules/user/user.module:2254	default	Adding numbers.	6.34
1996	modules/user/user.module:2255	default	Adding punctuation.	6.34
1997	modules/user/user.module:2256	default	It is recommended to choose a password different from the username.	6.34
1998	modules/user/user.module:2259	default	Passwords match:	6.34
2005	modules/user/user.module:2302	default	Block current user	6.34
2006	modules/user/user.module:2308	default	Ban IP address of current user	6.34
2058	modules/taxonomy/taxonomy.admin.inc:136	default	Instructions to present to the user when selecting terms, e.g., <em>"Enter a comma separated list of words"</em>.	none
2059	modules/taxonomy/taxonomy.admin.inc:147	default	Select content types to categorize using this vocabulary.	none
2060	modules/taxonomy/taxonomy.admin.inc:155	default	Tags	none
2061	modules/taxonomy/taxonomy.admin.inc:157	default	Terms are created by users when submitting posts by typing a comma separated list.	none
2062	modules/taxonomy/taxonomy.admin.inc:160	default	Multiple select	none
2063	modules/taxonomy/taxonomy.admin.inc:162	default	Allows posts to have more than one term from this vocabulary (always true for tags).	none
2064	modules/taxonomy/taxonomy.admin.inc:167	default	At least one term in this vocabulary must be selected when submitting a post.	none
2065	modules/taxonomy/taxonomy.admin.inc:172	default	Vocabularies are displayed in ascending order by weight.	none
2066	modules/taxonomy/taxonomy.admin.inc:201;202	default	Created new vocabulary %name.	none
2067	modules/taxonomy/taxonomy.admin.inc:205;206	default	Updated vocabulary %name.	none
2068	modules/taxonomy/taxonomy.admin.inc:253	default	Terms in %vocabulary	none
2069	modules/taxonomy/taxonomy.admin.inc:408	default	No terms available.	none
2070	modules/taxonomy/taxonomy.admin.inc:417;444;911	default	Reset to alphabetical	none
2071	modules/taxonomy/taxonomy.admin.inc:623	default	Add term to %vocabulary	none
2072	modules/taxonomy/taxonomy.admin.inc:662	default	Term name	none
2073	冗長？,  modules/taxonomy/taxonomy.admin.inc:665	default	The name of this term.	none
2074	modules/taxonomy/taxonomy.admin.inc:671	default	A description of the term. To be displayed on taxonomy/term pages and RSS feeds.	none
2075	modules/taxonomy/taxonomy.admin.inc:675	default	Advanced options	none
2076	modules/taxonomy/taxonomy.admin.inc:694	default	Parents	none
2077	modules/taxonomy/taxonomy.admin.inc:694	default	Parent terms	none
2078	タームという用語を生かすためにあえて「関連語」とはせず,  modules/taxonomy/taxonomy.admin.inc:695	default	Related terms	none
2079	類似・同義タームのようにする手もあるがあえて造語はせず,  modules/taxonomy/taxonomy.admin.inc:699	default	Synonyms	none
2080	modules/taxonomy/taxonomy.admin.inc:701	default	Synonyms of this term, one synonym per line.	none
2081	modules/taxonomy/taxonomy.admin.inc:707	default	Terms are displayed in ascending order by weight.	none
2082	modules/taxonomy/taxonomy.admin.inc:738	default	Weight value must be numeric.	none
2083	modules/taxonomy/taxonomy.admin.inc:767;768	default	Created new term %term.	none
2084	modules/taxonomy/taxonomy.admin.inc:771;772	default	Updated term %term.	none
2085	modules/taxonomy/taxonomy.admin.inc:817	default	Set multiple term parents?	none
2086	modules/taxonomy/taxonomy.admin.inc:818	default	Adding multiple parents to a term will cause the %vocabulary vocabulary to look for multiple parents on every term. Because multiple parents are not supported when using the drag and drop outline interface, drag and drop will be disabled if you enable this option. If you choose to have multiple parents, you will only be able to set parents by using the term edit form.	none
2087	modules/taxonomy/taxonomy.admin.inc:819	default	You may re-enable the drag and drop interface at any time by reducing multiple parents to a single parent for the terms in this vocabulary.	none
2088	modules/taxonomy/taxonomy.admin.inc:820	default	Set multiple parents	none
2089	modules/taxonomy/taxonomy.admin.inc:837	default	Are you sure you want to delete the term %title?	none
2090	modules/taxonomy/taxonomy.admin.inc:840	default	Deleting a term will delete all its children if there are any. This action cannot be undone.	none
2091	modules/taxonomy/taxonomy.admin.inc:853;854	default	Deleted term %name.	none
2092	modules/taxonomy/taxonomy.admin.inc:872	default	Are you sure you want to delete the vocabulary %title?	none
2093	modules/taxonomy/taxonomy.admin.inc:875	default	Deleting a vocabulary will delete all the terms in it. This action cannot be undone.	none
2094	modules/taxonomy/taxonomy.admin.inc:887;888	default	Deleted vocabulary %name.	none
2095	modules/taxonomy/taxonomy.admin.inc:907	default	Are you sure you want to reset the vocabulary %title to alphabetical order?	none
2096	modules/taxonomy/taxonomy.admin.inc:910	default	Resetting a vocabulary will discard all custom ordering and sort items alphabetically.	none
2097	modules/taxonomy/taxonomy.admin.inc:922;923	default	Reset vocabulary %name to alphabetical order.	none
2098	modules/taxonomy/taxonomy.admin.inc:202;206;768;772;854;888;923	default	taxonomy	none
2099	modules/taxonomy/taxonomy.module:439	default	- None selected -	none
2100	modules/taxonomy/taxonomy.module:442	default	- None -	none
2101	冗長？,  modules/taxonomy/taxonomy.module:539	default	A comma-separated list of terms describing this content. Example: funny, bungee jumping, "Company, Inc.".	none
2102	modules/taxonomy/taxonomy.module:570	default	Vocabularies	none
2103	modules/taxonomy/taxonomy.module:661	default	The %name vocabulary can not be modified in this way.	none
2104	modules/taxonomy/taxonomy.module:1242	default	There are currently no posts in this category.	none
2105	modules/taxonomy/taxonomy.module:1345	default	The taxonomy module allows you to categorize content using various systems of classification. Free-tagging vocabularies are created by users on the fly when they submit posts (as commonly found in blogs and social bookmarking applications). Controlled vocabularies allow for administrator-defined short lists of terms as well as complex hierarchies with multiple relationships between different terms. These methods can be applied to different content types and combined together to create a powerful and flexible method of classifying and presenting your content.	none
2106	modules/taxonomy/taxonomy.module:1346	default	For example, when creating a recipe site, you might want to classify posts by both the type of meal and preparation time. A vocabulary for each allows you to categorize using each criteria independently instead of creating a tag for every possible combination.	none
2107	modules/taxonomy/taxonomy.module:1347	default	Type of Meal: <em>Appetizer, Main Course, Salad, Dessert</em>	none
2108	modules/taxonomy/taxonomy.module:1348	default	Preparation Time: <em>0-30mins, 30-60mins, 1-2 hrs, 2hrs+</em>	none
2109	modules/taxonomy/taxonomy.module:1349	default	Each taxonomy term (often called a 'category' or 'tag' in other systems) automatically provides lists of posts and a corresponding RSS feed. These taxonomy/term URLs can be manipulated to generate AND and OR lists of posts classified with terms. In our recipe site example, it then becomes easy to create pages displaying 'Main courses', '30 minute recipes', or '30 minute main courses and appetizers' by using terms on their own or in combination with others. There are a significant number of contributed modules which you to alter and extend the behavior of the core module for both display and organization of terms.	none
2110	modules/taxonomy/taxonomy.module:1350	default	Terms can also be organized in parent/child relationships from the admin interface. An example would be a vocabulary grouping countries under their parent geo-political regions. The taxonomy module also enables advanced implementations of hierarchy, for example placing Turkey in both the 'Middle East' and 'Europe'.	none
2111	modules/taxonomy/taxonomy.module:1351	default	The taxonomy module supports the use of both synonyms and related terms, but does not directly use this functionality. However, optional contributed or custom modules may make full use of these advanced features.	none
2112	modules/taxonomy/taxonomy.module:1352	default	For more information, see the online handbook entry for <a href="@taxonomy">Taxonomy module</a>.	none
2113	modules/taxonomy/taxonomy.module:1355	default	The taxonomy module allows you to categorize your content using both tags and administrator defined terms. It is a flexible tool for classifying content with many advanced features. To begin, create a 'Vocabulary' to hold one set of terms or tags. You can create one free-tagging vocabulary for everything, or separate controlled vocabularies to define the various properties of your content, for example 'Countries' or 'Colors'.	none
2114	modules/taxonomy/taxonomy.module:1356	default	Use the list below to configure and review the vocabularies defined on your site, or to list and manage the terms (tags) they contain. A vocabulary may (optionally) be tied to specific content types as shown in the <em>Type</em> column and, if so, will be displayed when creating or editing posts of that type. Multiple vocabularies tied to the same content type will be displayed in the order shown below. To change the order of a vocabulary, grab a drag-and-drop handle under the <em>Name</em> column and drag it to a new location in the list. (Grab a handle by clicking and holding the mouse while hovering over a handle icon.) Remember that your changes will not be saved until you click the <em>Save</em> button at the bottom of the page.	none
2115	modules/taxonomy/taxonomy.module:1361	default	%capital_name is a free-tagging vocabulary. To change the name or description of a term, click the <em>edit</em> link next to the term.	none
2116	modules/taxonomy/taxonomy.module:1365	default	%capital_name is a flat vocabulary. You may organize the terms in the %name vocabulary by using the handles on the left side of the table. To change the name or description of a term, click the <em>edit</em> link next to the term.	none
2117	modules/taxonomy/taxonomy.module:1367	default	%capital_name is a single hierarchy vocabulary. You may organize the terms in the %name vocabulary by using the handles on the left side of the table. To change the name or description of a term, click the <em>edit</em> link next to the term.	none
2118	modules/taxonomy/taxonomy.module:1369	default	%capital_name is a multiple hierarchy vocabulary. To change the name or description of a term, click the <em>edit</em> link next to the term. Drag and drop of multiple hierarchies is not supported, but you can re-enable drag and drop support by editing each term to include only a single parent.	none
2119	modules/taxonomy/taxonomy.module:1372	default	Define how your vocabulary will be presented to administrators and users, and which content types to categorize with it. Tags allows users to create terms when submitting posts by typing a comma separated list. Otherwise terms are chosen from a select list and can only be created by users with the "administer taxonomy" permission.	none
2120	modules/taxonomy/taxonomy.module:1413	default	After saving a new term to the database	none
2121	modules/taxonomy/taxonomy.module:1416	default	After saving an updated term to the database	none
2122	modules/taxonomy/taxonomy.module:1419	default	After deleting a term	none
2123	modules/taxonomy/taxonomy.module:12	default	administer taxonomy	none
2124	modules/taxonomy/taxonomy.module:112	default	Manage tagging, categorization, and classification of your content.	none
2125	modules/taxonomy/taxonomy.module:126	default	Add vocabulary	none
2126	modules/taxonomy/taxonomy.module:136	default	Edit vocabulary	none
2127	modules/taxonomy/taxonomy.module:145	default	Edit term	none
2128	modules/taxonomy/taxonomy.module:153	default	Taxonomy term	none
2129	modules/taxonomy/taxonomy.module:162	default	Autocomplete taxonomy	none
2130	modules/taxonomy/taxonomy.module:169	default	List terms	none
2131	modules/taxonomy/taxonomy.module:184	default	Add term	none
1034	modules/locale/locale.module:0;0 modules/system/system.admin.inc:1545	default	Thursday	6.34
1465	modules/locale/locale.module:0	default	!long-month-name February	6.34
892	includes/form.inc:1621 modules/user/user.module:696;1305	default	Password	6.34
153	includes/form.inc:1628	default	Confirm password	6.34
1989	modules/user/user.module:2247	default	Password strength:	6.34
1992	modules/user/user.module:2251	default	It is recommended to choose a password that contains at least six characters. It should include numbers, punctuation, and both upper and lowercase letters.	6.34
999	modules/contact/contact.admin.inc:15;63 modules/upload/upload.admin.inc:79,  modules/user/user.module:2257	default	Yes	6.34
1913	modules/user/user.module:678	default	Account settings	6.34
878	modules/system/system.js:0; modules/system/system.js	default	Testing clean URLs...	none
664	modules/system/system.admin.inc:1705 modules/system/system.js:0; modules/system/system.js	default	Your server has been successfully tested to support this feature.	none
879	modules/system/system.js:0; modules/system/system.js	default	Your system configuration does not currently support this feature. The <a href="http://drupal.org/node/15365">handbook page on Clean URLs</a> has additional troubleshooting information.	none
363	includes/locale.inc:2393	default	Japanese	6.34
831	modules/system/system.install:549	default	Stores details about batches (processes that run in multiple HTTP requests).	6.34
1964	modules/user/user.module:1735	default	Account details for !username at !site (approved)	6.34
1965	modules/user/user.module:1737	default	!username,\n\nYour account at !site has been activated.\n\nYou may now log in by clicking on this link or copying and pasting it in your browser:\n\n!login_url\n\nThis is a one-time login, so it can be used only once.\n\nAfter logging in, you will be redirected to !edit_uri so you can change your password.\n\nOnce you have set your own password, you will be able to log in to !login_uri in the future using:\n\nusername: !username\n	6.34
922	modules/aggregator/aggregator.admin.inc:26;45;70;273,  modules/book/book.admin.inc:217 modules/filter/filter.module:219,  modules/menu/menu.admin.inc:421 modules/node/content_types.inc:57	default	Title	6.34
2132	modules/update/update.compare.inc:206	default	Unknown	none
2133	modules/update/update.compare.inc:319	default	Project not secure	none
2134	modules/update/update.compare.inc:320	default	This project has been labeled insecure by the Drupal security team, and is no longer available for download. Immediately disabling everything included by this project is strongly recommended!	none
2135	modules/update/update.compare.inc:331	default	Project revoked	none
2136	modules/update/update.compare.inc:332	default	This project has been revoked, and is no longer available for download. Disabling everything included by this project is strongly recommended!	none
2137	modules/update/update.compare.inc:342	default	Project not supported	none
2138	modules/update/update.compare.inc:343	default	This project is no longer supported, and is no longer available for download. Disabling everything included by this project is strongly recommended!	none
2139	modules/update/update.compare.inc:348	default	Failed to fetch available update data	none
2140	modules/update/update.compare.inc:414;563;612	default	No available releases found	none
2141	modules/update/update.compare.inc:431	default	Release revoked	none
2142	modules/update/update.compare.inc:432	default	Your currently installed release has been revoked, and is no longer available for download. Disabling everything included in this release or upgrading is strongly recommended!	none
2143	modules/update/update.compare.inc:443	default	Release not supported	none
2144	modules/update/update.compare.inc:444	default	Your currently installed release is now unsupported, and is no longer available for download. Disabling everything included in this release or upgrading is strongly recommended!	none
2145	modules/update/update.compare.inc:595	default	Unknown release date	none
2146	modules/update/update.compare.inc:607	default	Invalid info	none
2147	modules/update/update.fetch.inc:13;81	default	Attempted to fetch information about all available new releases and updates.	none
2148	modules/update/update.fetch.inc:16;84	default	Unable to fetch any information about available new releases and updates.	none
2149	ログに使用されるため、敢えて「更新」とせず,  modules/update/update.fetch.inc:81;84	default	update	none
2150	modules/update/update.report.inc:29	default	Last checked: @time ago	none
2151	modules/update/update.report.inc:29	default	Last checked: never	none
2152	modules/update/update.report.inc:30	default	Check manually	none
2153	modules/update/update.report.inc:47;47	default	ok	none
2154	modules/update/update.report.inc:71	default	Security update required!	none
2155	modules/update/update.report.inc:74 modules/update/update.module:267	default	Revoked!	none
2156	modules/update/update.report.inc:77	default	Not supported!	none
2157	modules/update/update.report.inc:80	default	Update available	none
2158	modules/update/update.report.inc:138	default	Recommended version:	none
2159	modules/update/update.report.inc:144	default	Security update:	none
2160	modules/update/update.report.inc:150	default	Latest version:	none
2161	modules/update/update.report.inc:156	default	Development version:	none
2162	modules/update/update.report.inc:162	default	Also available:	none
2163	modules/update/update.report.inc:182	default	Includes: %includes	none
2164	modules/update/update.report.inc:218	default	Drupal core	none
2165	modules/update/update.report.inc:221	default	Disabled modules	none
2166	modules/update/update.report.inc:222	default	Disabled themes	none
2167	modules/update/update.report.inc:252	default	Download	none
2168	modules/update/update.report.inc:256	default	Release notes	none
2169	modules/update/update.settings.inc:17	default	E-mail addresses to notify when updates are available	none
2170	modules/update/update.settings.inc:20	default	Whenever your site checks for available updates and finds new releases, it can notify a list of users via e-mail. Put each address on a separate line. If blank, no e-mails will be sent.	none
2171	modules/update/update.settings.inc:25	default	Check for updates	none
2172	modules/update/update.settings.inc:28	default	Daily	none
2173	modules/update/update.settings.inc:29	default	Weekly	none
2174	modules/update/update.settings.inc:31	default	Select how frequently you want to automatically check for new releases of your currently installed modules and themes.	none
2175	modules/update/update.settings.inc:36	default	E-mail notification threshold	none
2176	modules/update/update.settings.inc:39	default	All newer versions	none
2177	modules/update/update.settings.inc:40	default	Only security updates	none
2178	modules/update/update.settings.inc:42	default	You can choose to send e-mail only if a security update is available, or to be notified about all newer versions. If there are updates available of Drupal core or any of your installed modules and themes, your site will always print a message on the <a href="@status_report">status report</a> page, and will also display an error message on administration pages if there is a security update.	none
2179	modules/update/update.settings.inc:79	default	%email is not a valid e-mail address.	none
2180	modules/update/update.settings.inc:82	default	%emails are not valid e-mail addresses.	none
2181	modules/update/update.module:69	default	Here you can find information about available updates for your installed modules and themes. Note that each module or theme is part of a "project", which may or may not have the same name, and might include multiple modules or themes within it.	none
2182	modules/update/update.module:70	default	To extend the functionality or to change the look of your site, a number of contributed <a href="@modules">modules</a> and <a href="@themes">themes</a> are available.	none
2183	modules/update/update.module:87	default	See the <a href="@available_updates">available updates</a> page for information on installed modules and themes with new versions released.	none
2184	modules/update/update.module:95	default	The Update status module periodically checks for new versions of your site's software (including contributed modules and themes), and alerts you to available updates.	none
2185	modules/update/update.module:96	default	The <a href="@update-report">report of available updates</a> will alert you when new releases are available for download. You may configure options for update checking frequency and notifications at the <a href="@update-settings">Update status module settings page</a>.	none
2186	modules/update/update.module:97	default	Please note that in order to provide this information, anonymous usage statistics are sent to drupal.org. If desired, you may disable the Update status module from the <a href="@modules">module administration page</a>.	none
2187	modules/update/update.module:98	default	For more information, see the online handbook entry for <a href="@update">Update status module</a>.	none
2188	modules/update/update.module:219;251	default	Drupal core update status	none
2189	modules/update/update.module:220	default	No update data available	none
2190	modules/update/update.module:254	default	Module and theme update status	none
2191	安全ではない≒危険 なので,  modules/update/update.module:264	default	Not secure!	none
2192	modules/update/update.module:270	default	Unsupported release	none
2193	modules/update/update.module:279	default	Can not determine status	none
2194	modules/update/update.module:286	default	(version @version available)	none
2195	modules/update/update.module:325	default	No information is available about potential new releases for currently installed modules and themes. To check for updates, you may need to <a href="@run_cron">run cron</a> or you can <a href="@check_manually">check manually</a>. Please note that checking for available updates can take a long time, so please be patient.	none
2196	メールの件名,  modules/update/update.module:407	default	New release(s) available for !site_name	none
2197	メール本文,  modules/update/update.module:411	default	See the available updates page for more information:	none
2198	modules/update/update.module:440	default	There is a security update available for your version of Drupal. To ensure the security of your server, you should update immediately!	none
2199	modules/update/update.module:443	default	There are security updates available for one or more of your modules or themes. To ensure the security of your server, you should update immediately!	none
2200	modules/update/update.module:449	default	Your version of Drupal has been revoked and is no longer available for download. Upgrading is strongly recommended!	none
2201	modules/update/update.module:452	default	The installed version of at least one of your modules or themes has been revoked and is no longer available for download. Upgrading or disabling is strongly recommended!	none
2202	modules/update/update.module:458	default	Your version of Drupal is no longer supported. Upgrading is strongly recommended!	none
2203	modules/update/update.module:461	default	The installed version of at least one of your modules or themes is no longer supported. Upgrading or disabling is strongly recommended! Please see the project homepage for more details.	none
2204	modules/update/update.module:467	default	There are updates available for your version of Drupal. To ensure the proper functioning of your site, you should update as soon as possible.	none
2205	modules/update/update.module:470	default	There are updates available for one or more of your modules or themes. To ensure the proper functioning of your site, you should update as soon as possible.	none
2206	modules/update/update.module:478	default	There was a problem determining the status of available updates for your version of Drupal.	none
2207	modules/update/update.module:481	default	There was a problem determining the status of available updates for one or more of your modules or themes.	none
2208	modules/update/update.module:487	default	See the <a href="@available_updates">available updates</a> page for more information.	none
2209	modules/update/update.module:128	default	Available updates	none
2210	modules/update/update.module:129	default	Get a status report about available updates for your installed modules and themes.	none
2211	modules/update/update.module:151	default	Manual update check	none
1254	modules/comment/comment.module:2035	default	Publish comment	6.34
1256	modules/comment/comment.module:2051	default	Unpublish comment containing keyword(s)	6.34
1730	modules/node/node.module:2546	default	Publish post	6.34
1731	modules/node/node.module:2556	default	Unpublish post	6.34
747	modules/system/system.module:1359	default	Display a message to the user	6.34
\.


--
-- Data for Name: locales_target; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY locales_target (lid, translation, language, plid, plural) FROM stdin;
5	!datetime — !username	ja	0	0
6	リージョン	ja	0	0
7	このリージョンにブロックはありません	ja	0	0
8	ブロックの保存	ja	0	0
9	ブロックの設定が更新されました。	ja	0	0
10	ブロック固有の設定	ja	0	0
11	ブロックのタイトル	ja	0	0
12	ユーザに提示するブロックのタイトルを入力してください。	ja	0	0
13	デフォルトのタイトルと置き換えたいタイトルがある場合は、それを入力してください。 また、タイトルを非表示にしたい場合は <em>&lt;none&gt;</em> と入力してください。 空欄にするとデフォルトのタイトルが使用されます。	ja	0	0
14	'%name'ブロック	ja	0	0
15	ユーザ固有の表示設定	ja	0	0
16	カスタム表示設定	ja	0	0
17	このブロックの表示・非表示を、ユーザは制御できない	ja	0	0
18	このブロックはデフォルトで表示されるが、各ユーザが非表示にできる	ja	0	0
19	このブロックはデフォルトで表示されないが、各ユーザが表示にできる	ja	0	0
20	各ユーザごとのアカウント設定で、このブロックの表示をカスタマイズできるかどうかの指定をしてください。	ja	0	0
21	ロール固有の表示設定	ja	0	0
22	特定ロールへのブロック表示	ja	0	0
23	ブロックの表示を特定ロールに制限したい場合、それらのロール名にチェックを入れてください。 どのロールも選択しない場合は、すべてのユーザに表示されます。	ja	0	0
24	ページ固有の表示設定	ja	0	0
25	リストに記載したページ以外のすべてのページに表示する	ja	0	0
26	リストに記載したページにのみ表示する	ja	0	0
27	１行に１ベージとして、Drupalパスを入力してください。 <b>*</b> はワイルドカードとして使えます。 例えばブログページのパスを指定するには <b>%blog</b>、ユーザ別のブログは <b>%blog-wildcard</b> と入力してください。 また、フロントページを指定するには <b>%front</b> と入力してください。<br />	ja	0	0
28	以下のPHPコードが <code>TRUE</code> を返したら表示する（PHPモード － PHPに精通した方専用)	ja	0	0
29	PHPモードを選択した場合、<b>%php</b> で囲まれたPHPコード（※ return や print 等の命令を使用して結果を返す必要があります）を記入してください。 ただし、間違ったPHPコードを実行するとサイトを壊す可能性もありますので、十分に注意を払うようにしてください。	ja	0	0
30	特定ページでのブロック表示	ja	0	0
31	ページ	ja	0	0
32	ブロックの保存	ja	0	0
33	ブロックの説明が他のブロックと重複、または空欄になっています。<br />ブロックの説明は、各ブロックごとにユニークである必要があります。	ja	0	0
34	ブロックの設定が保存されました。	ja	0	0
35	ブロックが作成されました。	ja	0	0
36	本当に、%name ブロックを削除してもよろしいですか？	ja	0	0
37	%name ブロックが削除されました。	ja	0	0
38	ブロックは、ウェブページ内の特定のリージョンに表示されるコンテンツのボックスです。 例えばデフォルトテーマの「Garland」では、「左サイドバー」「右サイドバー」「コンテンツ」「ヘッダ」「フッタ」のリージョンが実装され、これらにブロックを表示することができます。 <a href="@blocks">ブロックの管理ページ</a>では、リージョンへのブロックの割り当てと、リージョン内でのブロックの並び順をコントロールできる、ドラッグ＆ドロップインターフェイスを提供します。	ja	0	0
39	ブロックは通常、モジュールによって自動的に生成（例えば、「ユーザログイン」ブロック）されますが、管理者がカスタムブロックを定義することもできます。 カスタムブロックはタイトル・説明・本文を持ちます。 ブロックの本文は必要な限り記入することができ、利用可能な<a href="@input-format">入力書式</a>を用いた内容を含めることができます。	ja	0	0
40	ブロックを利用する際の注意：	ja	0	0
41	すべてのテーマが同じリージョン、同じような表示リージョンを実装するとは限らないため、ブロックはテーマ単位で配置されます。	ja	0	0
42	リージョン内に配置されていないブロックは、決して表示されません。	ja	0	0
43	スロットルモジュールが有効の場合、スロットル対応ブロック（「スロットル」チェックボックスにチェックが入れられたブロック）は、サーバが過負荷状態の間は隠されます。	ja	0	0
44	ブロックは、特定のページにのみ表示されるように設定できます。	ja	0	0
45	ブロックは、特定の条件が真の場合にのみ表示されるように設定できます。	ja	0	0
46	ブロックは、特定のユーザロールにのみ表示されるように設定できます。	ja	0	0
47	管理者が許可した場合、特定のブロックは「アカウント情報」ページでユーザ単位に有効・無効を指定できます。	ja	0	0
48	モジュールが生成するようないくつかの動的ブロックは、特定のページにのみ表示されることもあります。	ja	0	0
49	より詳しい情報は、オンラインハンドブックの<a href="@block">Block module（英文）</a>エントリを参照するか、日本サイトの<a href="http://drupal.jp/">&nbsp;≡ Drupal Japan ≡&nbsp;</a>を訪れてみてください。	ja	0	0
121	MySQLサーバが古すぎます。 Drupalは少なくともMySQL %version を必要とします。	ja	0	0
122	PostgreSQLデータベース	ja	0	0
123	PostgreSQLサーバが古すぎます。 Drupalは少なくともPostgreSQL %version を必要とします。	ja	0	0
239	インポートされた翻訳を追加するテキストグループを指定してください。	ja	0	0
240	モード	ja	0	0
50	このページは、ブロックのリージョンへの割り当てと、リージョン内でのブロックの並び順をコントロールできる、ドラッグ＆ドロップインターフェイスを提供します。 ブロックのリージョンや並び順を変更するには、「ブロック」カラムにあるドラッグアンドドロップハンドル（十字の矢印）をつかみ（ハンドルをつかむには、ハンドルアイコン上でマウスの左ボタンを押下したままにします）、リスト中の新しい位置へブロックをドラッグしてください。 なお、ページ下部にある「ブロックの保存」ボタンをクリックするまで、変更が保存されないことに注意してください。 すべてのテーマが同じリージョンや、同じような表示リージョンを実装するとは限らないため、ブロックはテーマ単位で配置されます。	ja	0	0
51	「スロットル」チェックボックスにチェックを入れることで、サーバが過負荷状態の間はブロックを自動的に無効化し、CPU使用率やデータベースへのアクセス量、帯域幅などを軽減させることができます。 スロットルのしきい値は<a href="@throttleconfig">スロットルの設定ページ</a>で調整できます。	ja	0	0
52	各ブロックの隣にある「設定」リンクをクリックすることで、固有のタイトルや表示の設定ができます。 <a href="@add-block">ブロックの追加ページ</a>でカスタムブロックが作成できます。	ja	0	0
53	このページで新しいカスタムブロックを作成できます。 新しく作成されたブロックはデフォルトで無効となり、表示するには<a href="@blocks">ブロックの管理ページ</a>で適当なリージョンに移動する必要があります。	ja	0	0
54	ブロック %info は無効なリージョン %region に割り当てられ、無効にされました。	ja	0	0
55	ブロックの説明	ja	0	0
56	このブロックの簡単な説明を入力してください。 これは<a href="@overview">ブロック管理ページのリスト</a>で、他のブロックと識別するために使われます。	ja	0	0
57	ブロックの本文	ja	0	0
58	ユーザに提示するブロックの内容を記入してください。	ja	0	0
59	ブロックの設定	ja	0	0
60	ブロックの管理	ja	0	0
61	ブロック表示条件にPHPを使用	ja	0	0
62	ブロック	ja	0	0
63	サイトのサイドバーや他のリージョンに表示されるブロックコンテンツを設定します。	ja	0	0
64	JavaScriptリストフォーム	ja	0	0
65	ブロックの設定	ja	0	0
66	ブロックの削除	ja	0	0
67	ブロックの追加	ja	0	0
68	「ブロックの保存」ボタンをクリックするまで、これらのブロックへの変更は保存されません。	ja	0	0
1	特定できないエラー	ja	0	0
69	エラーが発生しました。 \n@uri\n@text	ja	0	0
70	エラーが発生しました。 \n@uri\n（情報がありません）	ja	0	0
71	HTTPエラー @status が発生しました。 \n@uri	ja	0	0
72	ドラッグして並べ替え	ja	0	0
73	フォームが送信されるまで、このテーブルでの変更は保存されません。	ja	0	0
74	このテーブルのすべての行を選択する	ja	0	0
75	このテーブルのすべての行を選択解除する	ja	0	0
76	カーソル位置でティーザー（概要）を分離	ja	0	0
77	ティーザー（概要）を連結	ja	0	0
78	孤立したアクションを削除	ja	0	0
79	スタックオーバーフロー： actions_do() の呼び出し過多による無限再帰を防ぐために中断しました。	ja	0	0
80	アクション '%action' が追加されました。	ja	0	0
81	孤立したアクション '%action' がデータベースから削除されました。	ja	0	0
82	アクション '%action' が保存されました。	ja	0	0
83	アクション '%action' が作成されました。	ja	0	0
84	1 の孤立したアクション (%orphans) がアクションテーブルに存在します。 !link	ja	0	0
85	@count の孤立したアクション (%orphans) がアクションテーブルに存在します。 !link	ja	84	1
86	HTTP POST が必要です。	ja	0	0
87	エラー	ja	0	0
88	サイトオフライン	ja	0	0
89	ページが見つかりません	ja	0	0
90	リクエストされたページが見つかりません。	ja	0	0
91	アクセスは拒否されました	ja	0	0
92	このページにアクセスする権限がありません。	ja	0	0
93	KB	ja	0	0
94	@size @suffix	ja	0	0
95	0秒	ja	0	0
96	通知	ja	0	0
97	情報	ja	0	0
98	デバッグ	ja	0	0
99	php	ja	0	0
100	%message： %file の %line 行目	ja	0	0
101	cron	ja	0	0
102	cronは1時間以上実行中で、おそらく固まっています。	ja	0	0
103	cronが重複して実行されました。	ja	0	0
104	cronの実行が完了しました。	ja	0	0
105	cronの実行が制限時間を超え、中止されました。	ja	0	0
106	1 byte	ja	0	0
107	@count byte	ja	106	1
108	1年	ja	0	0
109	@count年	ja	108	1
110	1週	ja	0	0
111	@count週	ja	110	1
112	1日	ja	0	0
113	@count日	ja	112	1
114	1時間	ja	0	0
115	@count時間	ja	114	1
116	1分	ja	0	0
117	@count分	ja	116	1
118	1秒	ja	0	0
119	@count秒	ja	118	1
120	MySQLデータベース	ja	0	0
238	テキストグループ	ja	0	0
124	このPostgreSQLデータベースは、適切でない文字エンコーディング（%encoding）でセットアップされているため、このままではDrupalが正常に動作しない可能性があります。 正常に動作させるためには、UTF-8/Unicodeエンコーディングで再度作成し直すことをお勧めします。 より詳しい情報は、<a href="@url">PostgreSQLのドキュメント</a>を参照してください。	ja	0	0
125	ディレクトリ %directory が作成されました。	ja	0	0
126	ディレクトリ %directory のパーミッションが書き込み許可に変更されました。	ja	0	0
127	ディレクトリ %directory が書き込み可能ではありません。	ja	0	0
128	セキュリティ警告： .htaccess ファイルを作成できませんでした。<br />セキュリティ上の問題がありますので、以下の行を含んだ .htaccess ファイルをディレクトリ %directory に作成してください。 <code>!htaccess</code>	ja	0	0
129	保存先 %directory が適切に設定されていないため、選択されたファイル %file をアップロードできませんでした。	ja	0	0
130	ファイルが存在しないため、選択されたファイル %file をコピーできませんでした。 正しいファイル名を指定したかどうかを確認してください。	ja	0	0
131	保存先に同名のファイルが存在するため、選択されたファイル %file をコピーできませんでした。	ja	0	0
132	選択されたファイル %file をコピーできませんでした。	ja	0	0
133	オリジナルファイル %file の削除に失敗しました。	ja	0	0
134	セキュリティ上の理由から、アップロードされたファイルは %filename にリネームされました。	ja	0	0
135	アップロードの最大許容サイズ %maxsize を超えるため、ファイル %file を保存できませんでした。	ja	0	0
136	アップロードが不完全なため、ファイル %file を保存できませんでした。	ja	0	0
137	未知のエラーが発生したため、ファイル %file を保存できませんでした。	ja	0	0
138	選択されたファイル %name をアップロードできませんでした。	ja	0	0
139	ファイルのアップロードエラー ： アップロードされたファイルを移動することができませんでした。	ja	0	0
140	ファイル名が 255 文字制限を超過しています。 リネームした後に再試行してください。	ja	0	0
141	次の拡張子のファイルのみが許可されます： %files-allowed	ja	0	0
142	ファイル (%filesize) は、ファイルサイズの上限である %maxsize を超過しています。	ja	0	0
143	ファイル (%filesize) は、割り当てディスク容量の %quota を超過しています。	ja	0	0
144	JPEG/PNG/GIF 画像のみが使用できます。	ja	0	0
145	許容された最大画像サイズ %dimensions ピクセルの範囲内に収まるよう、画像のサイズが変更されました。	ja	0	0
146	画像のサイズが大きすぎます： 画像サイズの上限は %dimensions ピクセルです。	ja	0	0
147	画像のサイズが小さすぎます： 画像サイズの下限は %dimensions ピクセルです。	ja	0	0
148	ファイルを作成できませんでした。	ja	0	0
149	パーミッションが正しく設定されていないため、ディレクトリ %directory は書き込み可能ではありません。	ja	0	0
150	保存先 %directory が見つからないか、パーミッションが書き込み許可にされていないため、選択されたファイル %file をアップロードできませんでした。	ja	0	0
151	ファイル	ja	0	0
152	ファイルアップロードエラー： アップロードされたファイル %file を保存先 %destination へ移動できませんでした。	ja	0	0
153	パスワードの確認	ja	0	0
154	入力されたパスワードが一致しませんでした。	ja	0	0
155	パスワードフィールドの入力は必須です。	ja	0	0
156	指定された日付は無効です。	ja	0	0
157	!name フィールドは必須です。	ja	0	0
158	!name の最大長は %max 文字ですが、現在 %length 文字あります。	ja	0	0
159	このフィールドの入力は必須です。	ja	0	0
160	!title： !required	ja	0	0
161	初期化中です。	ja	0	0
162	残り @remaining / @total です。	ja	0	0
163	エラーが発生しました。	ja	0	0
164	<a href="@error_url">エラーページ</a>に進んでください	ja	0	0
165	!name 要素で不正な選択肢 %choice が見つかりました。	ja	0	0
166	GD2イメージ操作ツールキット	ja	0	0
167	GDツールキットがインストールされ、適切に動作しています。	ja	0	0
168	JPEGの品質	ja	0	0
169	JPEG操作での画質を 0 ～ 100 の範囲で入力してください。 数値が高いほど画質は良くなりますが、それに比例してファイルサイズが増大します。	ja	0	0
170	%	ja	0	0
171	GD2ツールキットを使用するためには、PHPにGDモジュールがインストールされ、正しく設定されている必要があります。 より詳しい情報は、<a href="@url">PHPのイメージ関数(image)</a> を参照してください。	ja	0	0
172	JPEGの品質は0～100の数字である必要があります。	ja	0	0
173	選択された画像処理ツールキット %toolkit は、%function を正しく処理することができません。	ja	0	0
174	!item !version を現在使用中	ja	0	0
175	右から左へ	ja	0	0
176	左から右へ	ja	0	0
177	コード	ja	0	0
178	英語表記	ja	0	0
179	母国語表記	ja	0	0
180	方向	ja	0	0
181	設定が保存されました。	ja	0	0
182	定義済みの言語	ja	0	0
183	言語名	ja	0	0
241	既存文字列の置換と新規文字列の追加	ja	0	0
184	希望する言語を選んで「言語の追加」をクリックしてください。 （希望する言語がこのリストにない場合は、「カスタム言語」オプションを使用してください）	ja	0	0
185	カスタム言語	ja	0	0
186	カスタム言語の追加	ja	0	0
187	言語を保存	ja	0	0
188	言語コード	ja	0	0
189	<a href="@rfc4646">RFC 4646</a> に準拠した言語識別子を入力してください。 一般に言語コードは国コードが使用され、オプションとして文字や地域の異名が付加されます。 <em>例： "en", "en-US", "zh-Hant"</em>	ja	0	0
190	英語での言語名	ja	0	0
191	英語での言語の名前を入力してください。 すべての言語での翻訳で利用可能となります。	ja	0	0
192	母国語名	ja	0	0
193	追加する言語での言語の名前を入力してください。	ja	0	0
194	パスプレフィックス	ja	0	0
195	パスでのパターンマッチングに使用する、言語コードやカスタム文字列を入力してください。 「<a href="?q=admin/settings/language/configure">言語ネゴシエーション</a>」が「<em>パスプレフィックスのみ</em>」か「<em>パスプレフィックス（代替言語あり）</em>」に設定されている場合、パスプレフィックスの値がパスの要素と一致したとき、サイトがこの言語で提示されます。 この言語がデフォルト言語の場合は、この値を空にすることもできます。 <strong>この値を修正すると既存のURLを壊すおそれがあるため、実稼働中の環境では注意して使用する必要があります。</strong> <em>例： ドイツ語用に "deutsch" をパスプレフィックスとして指定した場合、"www.example.com/deutsch/node" の形式でURLをもたらします。</em>	ja	0	0
196	言語のドメイン	ja	0	0
197	言語に特有のURLをプロトコル付きで入力してください。 「<a href="?q=admin/settings/language/configure">言語ネゴシエーション</a>」が「<em>ドメインネームのみ</em>」に設定されている場合、アクセスしているURLがこのドメインを参照しているとき、サイトがこの言語で提示されます。 この言語がデフォルト言語の場合は、この値を空にすることもできます。 <strong>この値は、文字列の一部としてプロトコルを含む必要があります。</strong> <em>例： ドイツ語用に "http://example.de" や "http://de.example.com" として言語のドメインを指定した場合、それぞれ "http://example.de/node" と "http://de.example.com/node" の形式でURLをもたらします。</em>	ja	0	0
198	この言語でのテキストの提示方向を指定してください。 例えば、日本語の場合は「左から右へ」となります。	ja	0	0
199	言語 %language (%code) はすでに存在します。	ja	0	0
200	無効な言語コードです。	ja	0	0
201	言語 %language が作成され、ただちに使用できます。 より詳しい情報は、<a href="@locale-help">ヘルプ画面</a>を参照してください。	ja	0	0
202	言語コードフィールドに「&lt;」「&gt;」「"」「'」を使用することはできません。	ja	0	0
203	英語での言語名フィールドに「&lt;」「&gt;」「"」「'」を使用することはできません。	ja	0	0
204	母国語名フィールドに「&lt;」「&gt;」「"」「'」を使用することはできません。	ja	0	0
205	ドメインとパスプレフィックスは同時に設定できません。	ja	0	0
206	ドメイン (%domain) は、すでに言語 (%language) に関連付けられています。	ja	0	0
207	ドメインとパスプレフィックスの両方を空にできるのは、デフォルトの言語のみです。	ja	0	0
208	プレフィックス (%prefix) は、すでに言語 (%language) に関連付けられています。	ja	0	0
209	英語は削除できません。	ja	0	0
210	デフォルトの言語は削除できません。	ja	0	0
211	本当に、言語 %name を削除してもよろしいですか？	ja	0	0
212	言語を削除すると、それに関連したすべてのインターフェイス翻訳も削除され、この言語での投稿は言語ニュートラルに設定されます。 この操作は元に戻すことができませんので、十分に注意して実行してください。	ja	0	0
213	言語 %locale が削除されました。	ja	0	0
214	言語ネゴシエーション	ja	0	0
215	なし	ja	0	0
216	パスプレフィックスのみ	ja	0	0
217	パスプレフィックス（代替言語あり）	ja	0	0
218	ドメイン名のみ	ja	0	0
219	サイトのプレゼンテーション言語を確定するために使用する、メカニズムを指定してください。 <strong>この設定を変更すると、サイトへのすべてのリンクが切れる可能性があるため、実稼働中の環境では慎重に使用する必要があります。</strong>	ja	0	0
220	言語ネゴシエーションの設定は保存されました。	ja	0	0
221	英語（内蔵）	ja	0	0
222	含まれる文字列	ja	0	0
223	検索したい文字列を入力してください。 大文字と小文字は区別されますので注意してください。 空欄のまま検索すると、すべての文字列を表示します。	ja	0	0
224	英語 (Drupal内蔵)	ja	0	0
225	検索範囲	ja	0	0
226	翻訳済み・未翻訳の文字列の両方	ja	0	0
227	翻訳済みの文字列のみ	ja	0	0
228	未翻訳の文字列のみ	ja	0	0
229	検索の制限	ja	0	0
230	すべてのテキストグループ	ja	0	0
231	追加済みの言語	ja	0	0
232	未追加の言語	ja	0	0
233	翻訳文字列のインポート	ja	0	0
234	言語ファイル	ja	0	0
235	インポートしたい <em>.po</em> ファイル（Gettext Portable Object file）を指定してください。	ja	0	0
236	インポート先の言語	ja	0	0
237	文字列を追加したい言語を指定してください。 未追加の言語を選ぶと、その言語が追加されます。	ja	0	0
242	新規文字列のみを追加	ja	0	0
243	言語 %language が作成されました。	ja	0	0
244	%filename の翻訳文字列のインポートに失敗しました。	ja	0	0
245	インポートするファイルが見つかりませんでした。	ja	0	0
246	翻訳文字列のエクスポート	ja	0	0
247	<em>.po</em> ファイル（Gettext Portable Object 形式）でエクスポートしたい言語を指定してください。	ja	0	0
248	テンプレートのエクスポート	ja	0	0
249	「エクスポート」ボタンをクリックすると、データベースから抽出された全文字列を含む <em>.pot</em> ファイル（Gettext Portable Object Template 形式）を生成します。	ja	0	0
250	文字列が見つかりませんでした。	ja	0	0
251	オリジナルのテキスト	ja	0	0
252	翻訳文字列の保存	ja	0	0
253	送信された文字列に許可されていないHTMLが含まれています： %string	ja	0	0
254	文字列が保存されました。	ja	0	0
255	本当に、文字列 "%source" を削除してもよろしいですか？	ja	0	0
256	文字列を削除すると、すべての言語でこの文字列の翻訳がすべて削除されます。 この操作は元に戻すことができませんので、十分に注意して実行してください。	ja	0	0
257	文字列が削除されました。	ja	0	0
258	選択された言語のインポートはサポートされていません。	ja	0	0
259	翻訳ファイル %filename は、ヘッダが欠落しているか破損しています。	ja	0	0
260	翻訳文字列は正常にインポートされました： 新規追加( %number ) / 更新( %update ) / 削除( %delete )	ja	0	0
261	翻訳ファイル %filename にエラーがあります： 複数形式が解析できませんでした。	ja	0	0
262	文字列	ja	0	0
263	検索文字列は見つかりませんでした。	ja	0	0
264	インターフェイス翻訳文字列のインポート	ja	0	0
265	インポート開始	ja	0	0
266	インターフェイス翻訳文字列インポート中のエラー	ja	0	0
267	ファイル %filename が読み込めないため、翻訳文字列のインポートに失敗しました。	ja	0	0
268	翻訳ファイル %filename にエラーがあります： 本来 %line 行目にあるべき "msgstr" が見つかりませんでした。	ja	0	0
269	翻訳ファイル %filename にエラーがあります： 本来 %line 行目にあるべき "msgid_plural" が見つかりませんでした。	ja	0	0
270	翻訳ファイル %filename の %line 行目に構文エラーがあります。	ja	0	0
271	翻訳ファイル %filename にエラーがあります： %line 行目に予期せぬ "msgid" があります。	ja	0	0
272	翻訳ファイル %filename にエラーがあります： %line 行目に予期せぬ "msgstr[]" があります。	ja	0	0
273	翻訳ファイル %filename にエラーがあります： %line 行目に予期せぬ "msgstr" があります。	ja	0	0
274	翻訳ファイル %filename にエラーがあります： %line 行目に予期せぬ文字列があります。	ja	0	0
275	翻訳ファイル %filename は %line 行目で不意に終了しました。	ja	0	0
276	ロケール	ja	0	0
277	許可されていないHTMLで翻訳文字列の送信が試行されました： %string	ja	0	0
278	言語 %language (%code) が作成されました。	ja	0	0
279	 %file が %locale にインポートされました： 新規追加( %number ) / 更新( %update ) / 削除( %delete )	ja	0	0
280	%locale 翻訳ファイルがエクスポートされました： %filename	ja	0	0
281	翻訳ファイルがエクスポートされました： %filename	ja	0	0
282	%language 用のJavaScript翻訳ファイルが更新されました。	ja	0	0
283	JavaScript翻訳ファイル %file.js が見つかりませんでした。	ja	0	0
284	%language 用のJavaScript翻訳ファイルが作成されました。	ja	0	0
285	%language 用の翻訳が現在のところ存在しないため、JavaScript翻訳ファイルが削除されました。	ja	0	0
286	%language 用JavaScript翻訳ファイルを作成中にエラーが発生しました。	ja	0	0
287	許可されていないHTMLを含むため、翻訳文字列(1)が無視されました。	ja	0	0
288	許可されていないHTMLを含むため、翻訳文字列(@count)が無視されました。	ja	287	1
289	新たにインストールされたモジュール用の翻訳ファイル(1)がインポートされました。	ja	0	0
290	新たにインストールされたモジュール用の翻訳ファイル(@count)がインポートされました。	ja	289	1
291	有効化されたモジュール用の翻訳ファイル(1)がインポートされました。	ja	0	0
292	有効化されたモジュール用の翻訳ファイル(@count)がインポートされました。	ja	291	1
293	アファール語	ja	0	0
294	アブケイジア語	ja	0	0
295	ゾロアスター語	ja	0	0
296	アフリカーンズ語	ja	0	0
297	アカン語	ja	0	0
298	アムハラ語	ja	0	0
299	アラビア語	ja	0	0
300	アッサム語	ja	0	0
301	アバール語	ja	0	0
302	アイマラ語	ja	0	0
303	アゼルバイジャン語	ja	0	0
304	バシキール語	ja	0	0
305	ベラルーシ語	ja	0	0
306	ブルガリア語	ja	0	0
307	ビハール語	ja	0	0
308	ビスラマ語	ja	0	0
309	バンバラ語	ja	0	0
310	ベンガル語	ja	0	0
311	チベット語	ja	0	0
312	ブルトン語	ja	0	0
313	ボスニア語	ja	0	0
314	カタロニア語	ja	0	0
315	チェチェン語	ja	0	0
316	チャモロ語	ja	0	0
317	コルシカ語	ja	0	0
318	クリー語	ja	0	0
319	チェコ語	ja	0	0
320	旧スラブ語	ja	0	0
321	チュヴァシ語	ja	0	0
322	ウェールズ語	ja	0	0
323	デンマーク語	ja	0	0
324	ドイツ語	ja	0	0
325	モルディブ語	ja	0	0
326	ブータン語	ja	0	0
327	エウェ語	ja	0	0
328	ギリシャ語	ja	0	0
329	英語	ja	0	0
330	エスペラント語	ja	0	0
331	スペイン語	ja	0	0
332	エストニア語	ja	0	0
333	バスク語	ja	0	0
334	ペルシャ語	ja	0	0
335	フラニ語	ja	0	0
336	フィンランド語	ja	0	0
337	フィジー語	ja	0	0
338	フェロー語	ja	0	0
339	フランス語	ja	0	0
340	フリジア語	ja	0	0
341	アイルランド語	ja	0	0
342	ガエリック語	ja	0	0
343	ガリシア語	ja	0	0
344	グアラニー語	ja	0	0
345	グジャラーティー語	ja	0	0
346	マン島語	ja	0	0
347	ハウサ語	ja	0	0
348	ヘブライ語	ja	0	0
349	ヒンディー語	ja	0	0
350	モツ語	ja	0	0
351	クロアチア語	ja	0	0
352	ハンガリー語	ja	0	0
353	アルメニア語	ja	0	0
354	ヘレロ語	ja	0	0
355	インターリングァ	ja	0	0
356	インドネシア語	ja	0	0
357	インターリングァ	ja	0	0
358	イボ語	ja	0	0
359	イヌピアック語	ja	0	0
360	アイスランド語	ja	0	0
361	イタリア語	ja	0	0
362	イヌクチタット語	ja	0	0
363	日本語	ja	0	0
364	ジャワ語	ja	0	0
365	グルジア語	ja	0	0
366	コンゴ語	ja	0	0
367	キクユ語	ja	0	0
368	クワニャマ語	ja	0	0
369	カザフ語	ja	0	0
370	グリーンランド語	ja	0	0
371	カンボジア語	ja	0	0
372	カンナダ語	ja	0	0
373	韓国語･朝鮮語	ja	0	0
374	カヌリ語	ja	0	0
375	カシミール語	ja	0	0
376	クルド語	ja	0	0
377	コミ語	ja	0	0
378	コーンウォール語	ja	0	0
379	キルギス語	ja	0	0
380	ラテン語	ja	0	0
381	ルクセンブルグ語	ja	0	0
382	ウガンダ語	ja	0	0
383	リンガラ語	ja	0	0
384	ラオス語	ja	0	0
385	リトアニア語	ja	0	0
386	ラトビア語	ja	0	0
387	マダガスカル語	ja	0	0
388	マーシャル語	ja	0	0
389	マオリ語	ja	0	0
390	マケドニア語	ja	0	0
391	マラヤラム語	ja	0	0
392	モンゴル語	ja	0	0
393	モルダヴィア語	ja	0	0
394	マラシ語	ja	0	0
395	マレー語	ja	0	0
396	マルタ語	ja	0	0
397	ビルマ(ミャンマー)語	ja	0	0
398	ナウル語	ja	0	0
399	ンデベレ語	ja	0	0
400	ネパール語	ja	0	0
401	ドゥンガ語	ja	0	0
402	オランダ語	ja	0	0
403	ノルウェー語（ブークモール）	ja	0	0
404	ノルウェー語（ニーノシュク）	ja	0	0
405	ンデベレ語	ja	0	0
406	ナヴァホ語	ja	0	0
407	チェワ語	ja	0	0
408	オック語	ja	0	0
409	オロモ語	ja	0	0
410	オリヤ語	ja	0	0
411	オセチア語	ja	0	0
412	パンジャブ語	ja	0	0
413	パーリー語	ja	0	0
414	ポーランド語	ja	0	0
415	パシュト語	ja	0	0
416	ポルトガル・ポルトガル語	ja	0	0
417	ブラジル・ポルトガル語	ja	0	0
418	ケチュア語	ja	0	0
419	レトロマン語	ja	0	0
420	キルンディ語	ja	0	0
421	ルーマニア語	ja	0	0
422	ロシア語	ja	0	0
423	キンヤルワンダ語	ja	0	0
424	サンスクリット語	ja	0	0
425	サルディニア語	ja	0	0
426	シンド語	ja	0	0
427	サモス語	ja	0	0
428	サンゴ語	ja	0	0
429	セルボ・クロアチア語	ja	0	0
430	シンハラ語	ja	0	0
431	スロバキア語	ja	0	0
432	スロヴェニア語	ja	0	0
433	サモア語	ja	0	0
434	ショナ語	ja	0	0
435	ソマリ語	ja	0	0
436	アルバニア語	ja	0	0
437	セルビア語	ja	0	0
438	シスワティ語	ja	0	0
439	ソト語	ja	0	0
440	スーダン語	ja	0	0
441	スウェーデン語	ja	0	0
442	スワヒリ語	ja	0	0
443	タミール語	ja	0	0
444	テルグ語	ja	0	0
445	タジク語	ja	0	0
446	タイ語	ja	0	0
447	ティグリニャ語	ja	0	0
448	トルクメン語	ja	0	0
449	タガログ語	ja	0	0
450	ツワナ語	ja	0	0
451	トンガ語	ja	0	0
452	トルコ語	ja	0	0
453	ツォンガ語	ja	0	0
454	タタール語	ja	0	0
455	トウィ語	ja	0	0
456	タヒチ語	ja	0	0
457	ウイグル語	ja	0	0
458	ウクライナ語	ja	0	0
459	ウルドゥー語	ja	0	0
460	ウズベク語	ja	0	0
461	ベンダ語	ja	0	0
462	ベトナム語	ja	0	0
463	ウォロフ語	ja	0	0
464	コサ語	ja	0	0
465	イディシュ語	ja	0	0
466	ヨルバ語	ja	0	0
467	チヮン語	ja	0	0
468	簡体字中国語	ja	0	0
469	繁体字中国語	ja	0	0
470	ズールー語	ja	0	0
471	メールが送信できませんでした。<br />この問題が繰り返し発生する場合は、お手数ですがサイト管理者までご連絡ください。	ja	0	0
472	メールの送信エラー（%from から %to 宛）	ja	0	0
473	オフラインモードで稼働中です。	ja	0	0
474	メニューの経路決定の再構築に失敗しました － いくつかのパスが適切に機能しない可能性があります。	ja	0	0
475	%module は循環依存の一部です。 これはサポートされず、有効にすることはできません。	ja	0	0
476	« 先頭	ja	0	0
477	‹ 前	ja	0	0
478	次 ›	ja	0	0
479	最終 »	ja	0	0
480	先頭ページへ	ja	0	0
481	最終ページへ	ja	0	0
482	@numberページへ	ja	0	0
483	@sで並べ替え	ja	0	0
484	アイコンの並べ替え	ja	0	0
485	昇順で並び替える	ja	0	0
486	降順で並び替える	ja	0	0
487	更新	ja	0	0
488	[<a href="@link">さらに詳しく...</a>]	ja	0	0
489	XMLフィード	ja	0	0
490	コンテンツ配信	ja	0	0
491	<a href="@link" title="@title">続き</a>	ja	0	0
492	未認証ユーザ	ja	0	0
493	このサーバのPHPで使用されているPCREライブラリは古いため、Unicodeのテキストを処理する際に問題を引き起こします。 このサーバのPHPバージョンが 4.3.3 以上の場合、PHP本体と一緒に配布されているPCREライブラリが使用されていることを確認してください。 より詳しい情報は、PHPドキュメントの<a href="@url">正規表現関数（Perl 互換）</a>を参照してください。	ja	0	0
494	Unicode文字列に関する操作はできる限りエミュレートされます。 Unicodeのサポートを向上させるためには、<a href="@url"> PHPのmbstring拡張モジュール</a>をインストールしてください。	ja	0	0
495	このサーバのPHPでは既存の関数を、対応するマルチバイト文字列対応の関数でオーバーロードする機能が有効になっていますが、Drupalではこれを無効にする必要があります。 php.ini の <em>mbstring.func_overload</em> をチェックし、これを無効にしてください。 より詳しい情報は、PHPドキュメントの<a href="@url">マルチバイト文字列関数(mbstring)</a>を参照してください。	ja	0	0
496	このサーバのPHPでは、HTTPから入力された文字列のエンコードの検出や変換を行う、文字エンコーディングフィルタ機能が有効になっていますが、Drupalではこれを無効にする必要があります。 php.ini の <em>mbstring.encoding_translation</em> をチェックし、これを無効にしてください。 より詳しい情報は、PHPドキュメントの<a href="@url">マルチバイト文字列関数(mbstring)</a>を参照してください。	ja	0	0
497	このサーバのPHPでは、HTTP入力文字エンコーディングのデフォルト値を定義する機能が有効になっていますが、Drupalではこれを無効にする必要があります。 php.ini の <em>mbstring.http_input</em> をチェックし、これを無効にしてください。 より詳しい情報は、PHPドキュメントの<a href="@url">マルチバイト文字列関数(mbstring)</a>を参照してください。	ja	0	0
498	このサーバのPHPでは、HTTP 出力文字エンコーディングのデフォルト値を定義する機能が有効になっていますが、Drupalではこれを無効にする必要があります。 php.ini の <em>mbstring.http_output</em> をチェックし、これを無効にしてください。 より詳しい情報は、PHPドキュメントの<a href="@url">マルチバイト文字列関数(mbstring)</a>を参照してください。	ja	0	0
499	標準PHP	ja	0	0
500	PHPマルチバイト文字列関数（mbstring）拡張	ja	0	0
501	Unicodeライブラリ	ja	0	0
502	%s でエンコードされたXMLをUTF-8に変換できませんでした。	ja	0	0
503	%s でのエンコードはサポートされていません。 PHPのmbstring、あるいはiconvやGNU recodeを利用できるように、インストールと設定を行ってください。	ja	0	0
504	構文解析のエラーです。 整形式ではありません。	ja	0	0
505	構文解析のエラーです。 リクエストが整形式ではありません。	ja	0	0
506	サーバエラー： 無効なXML-RPCです。 リクエストは methodCall でなければなりません。	ja	0	0
507	サーバエラー： リクエストされたメソッド @methodname は特定できませんでした。	ja	0	0
508	サーバエラー： メソッドのパラメータ数が違います。	ja	0	0
509	サーバエラー： メソッドのパラメータが不正です。	ja	0	0
798	高度なアクションの設定	ja	0	0
510	サーバエラー： リクエストされた関数 @method は見つかりませんでした。	ja	0	0
511	system.multicall に無効な文法です。	ja	0	0
512	system.multicall への再帰的呼び出しは禁止されています。	ja	0	0
513	サーバエラー： リクエストされたメソッド @methodname の署名が特定できませんでした。	ja	0	0
514	稼働中のDrupalでいくつかの問題点が検出されました。 <a href="@status">現状報告</a>ページで詳細を確認してください。	ja	0	0
515	管理上の項目がありません。	ja	0	0
516	ヘルプを読む	ja	0	0
517	システムデフォルト	ja	0	0
518	管理用テーマ	ja	0	0
519	管理ページの表示に使用したいテーマを選んでください。 「システムデフォルト」を選んだ場合はサイトと同じテーマを使用します。	ja	0	0
520	コンテンツの編集に管理用テーマを使用	ja	0	0
521	投稿の編集や新規作成の際に、管理用テーマを使用する場合はここにチェックを入れてください。	ja	0	0
522	%theme テーマのスクリーンショット	ja	0	0
523	スクリーンショットなし	ja	0	0
524	<a href="!admin_theme_page">管理用テーマ</a>が %admin_theme テーマに設定されていることに注意してください。 このため、このページのテーマは変更されていませんが、サイトのすべての非管理セクションは、デフォルトに指定された %selected_theme テーマで表示されます。	ja	0	0
525	設定オプションが保存されました。	ja	0	0
526	ロゴ	ja	0	0
527	サイト名	ja	0	0
528	スローガン	ja	0	0
529	ミッション	ja	0	0
530	投稿でのユーザアバター	ja	0	0
531	コメントでのユーザアバター	ja	0	0
532	検索ボックス	ja	0	0
533	ショートカットアイコン	ja	0	0
534	表示の切り替え	ja	0	0
535	テーマで表示する特定のページ要素を指定してください。 チェックを入れたものが表示されます。	ja	0	0
536	投稿情報の表示	ja	0	0
537	投稿者と投稿日時を表示するコンテンツタイプを指定してください。 チェックを入れたものに表示されます。	ja	0	0
538	ロゴ画像の設定	ja	0	0
539	テーマで表示するロゴを設定してください。 	ja	0	0
540	デフォルトのロゴを使用	ja	0	0
541	それぞれのテーマが提供するロゴを使用する場合は、ここにチェックを入れてください。	ja	0	0
542	カスタムロゴへのパス	ja	0	0
543	デフォルトロゴの代わりに独自のロゴを使用したい場合は、画像ファイルへのパスを入力してください。	ja	0	0
544	ロゴ画像のアップロード	ja	0	0
545	独自のロゴをアップロードしたい場合は、ローカルの画像ファイルへのパスを入力してください。	ja	0	0
546	ショートカットアイコンの設定	ja	0	0
547	一般に「favicon」と呼ばれる、ショートカットアイコンを設定してください。 ほとんどのブラウザでは、アドレスバーやブックマークに表示されます。	ja	0	0
548	デフォルトのショートカットアイコンを使用	ja	0	0
549	テーマにデフォルトのショートカットアイコンを使用させたい場合は、ここにチェックを入れてください。	ja	0	0
550	カスタムアイコンへのパス	ja	0	0
551	独自のショートカットアイコンを使用したい場合は、画像ファイルへのパスを入力してください。	ja	0	0
552	アイコン画像のアップロード	ja	0	0
553	独自のショートカットアイコンをアップロードしたい場合は、ローカルの画像ファイルへのパスを入力してください。	ja	0	0
554	テーマエンジン固有の設定	ja	0	0
555	これらの設定は %engine テーマエンジンに基づいた、すべてのテンプレートとスタイルにのみ存在します。	ja	0	0
556	テーマ固有の設定	ja	0	0
557	これらの設定は %theme テーマと、それに基づいたすべてのスタイルにのみ存在します。	ja	0	0
558	設定オプションがデフォルトの値に戻されました。	ja	0	0
559	@module (<span class="admin-missing">不足</span>)	ja	0	0
560	@module (<span class="admin-enabled">有効</span>)	ja	0	0
561	@module (<span class="admin-disabled">無効</span>)	ja	0	0
562	いくつかの必須モジュールを有効にする必要があります	ja	0	0
563	上記モジュールの有効化を継続しますか？	ja	0	0
564	継続	ja	0	0
565	アンインストール	ja	0	0
566	以下のモジュールはサイトから完全にアンインストールされ、<b>これらのモジュールによる全データは失われます</b>！	ja	0	0
567	アンインストールの確認	ja	0	0
568	上記モジュールのアンインストールを継続しますか？	ja	0	0
569	モジュールが選択されていません。	ja	0	0
570	選択されたモジュールがアンインストールされました。	ja	0	0
571	サイトの名前を入力してください。	ja	0	0
572	このサイトの代表メールアドレスを入力してください。 これはユーザ登録やパスワードの再発行メール、各種の通知など、自動送信メールの「From:（差出人）」として使われます。 受信者にスパムメールと見なされる可能性を減らすために、できる限りウェブサイトと同じドメインで終わるアドレスを使用してください。	ja	0	0
573	スローガン	ja	0	0
799	アクションの削除	ja	0	0
800	アクションを削除します。	ja	0	0
574	サイトの標語やキャッチフレーズなどを入力してください。 これはよくサイトのタイトルと並んで表示されます。	ja	0	0
575	ミッション	ja	0	0
576	このサイトの運営方針や関心事などを記入してください。 これはよくフロントページに表示されます。 また、サイトのRSSフィードなどにも使用されます。	ja	0	0
577	フッタメッセージ	ja	0	0
578	各ページの最下部に表示するテキストを記入してください。 ページに著作権表示などを追加するのに役立ちます。	ja	0	0
579	匿名ユーザ	ja	0	0
580	匿名ユーザを示す名称を入力してください。	ja	0	0
581	デフォルトのフロントページ	ja	0	0
582	サイトのトップページとして表示したいコンテンツの相対URLを入力してください。 よくわからない場合は <b>node</b> と入力してください。	ja	0	0
583	パス '@path' は無効、あるいはアクセスすることができません。	ja	0	0
584	デフォルトの403（access denied）ページ	ja	0	0
585	アクセス権限のないページにユーザがアクセスした際に表示する、ページを入力してください。 よくわからない場合は空欄にしてください。	ja	0	0
586	デフォルトの404（not found）ページ	ja	0	0
587	存在しないページにユーザがアクセスした際に表示する、ページを入力してください。 よくわからない場合は空欄にしてください。	ja	0	0
588	エラー報告	ja	0	0
589	エラーをログに出力	ja	0	0
590	エラーをログと画面に出力	ja	0	0
591	Drupalと、PHPやSQLのエラーを出力する場所を指定してください。 正式に運用中の環境では、エラーログにのみ出力することをお勧めします。 開発・テスト中の環境では、ログと画面の両方にエラーを出力すると問題点の把握に役立ちます。	ja	0	0
592	キャッシュモードを指定してください。 ノーマルキャッシュモードは、ほとんどのサイトに適していて、副作用も起こしません。 アグレッシブキャッシュモードは、キャッシュされたページを供給する際、有効化されているモジュールのロード（boot）とアンロード（exit）を省略します。 これはさらなるパフォーマンスの向上をもたらしますが、望まない副作用を引き起こすこともあります。	ja	0	0
593	<strong class="error">次の有効化されたモジュールは、アグレッシブキャッシュモードと不適合であるため、適切に機能しません： %modules</strong>	ja	0	0
594	<strong class="ok">現在のところ、有効化されたすべてのモジュールはアグレッシブキャッシュモードに適合します。</strong> アグレッシブキャッシュモードを使用し、新たにモジュールを有効化した場合、適合性を確保するために再度このページを確認する必要があります。	ja	0	0
595	ページキャッシュ	ja	0	0
596	ページキャッシュを有効にすることで、大幅なパフォーマンスの向上が得られます。 Drupalは<b>匿名ユーザ</b>に要求されたページを圧縮されたキャッシュページとして保存しておき、それを送信することができます。 ページをキャッシュしておくことにより、Drupalは表示のたびにページを構築する必要がなくなります。</p>	ja	0	0
597	キャッシュモード	ja	0	0
598	ノーマル（稼働中サイトに推奨、副作用なし）	ja	0	0
599	アグレッシブ（上級者向け、副作用の可能性あり）	ja	0	0
600	キャッシュの存続期間	ja	0	0
601	キャッシュを更新しない期間を指定してください。<br />アクセス数の多いサイトでは、強制的にキャッシュの更新頻度を下げ、よりパフォーマンスを向上させることができます。 キャッシュの存続期間は、保存されたキャッシュを空にして再生成するまでの最低限の時間で、ページとブロックの両方に適用されます。 この期間が長いほどパフォーマンスの向上が望めるというメリットがありますが、その間は新しいコンテンツが表示されないというデメリットがあります。	ja	0	0
602	ページの圧縮	ja	0	0
603	ページを圧縮するかどうかを指定してください。 デフォルトでDrupalは、帯域幅の節約とダウンロード時間の向上のために、キャッシュするページを圧縮します。 圧縮を行うウェブサーバを使用する場合、このオプションを無効にする必要があります。	ja	0	0
604	ブロックキャッシュ	ja	0	0
605	ブロックキャッシュを有効にすると、ページが読み込まれるたびにブロックを再構築するのを防ぎ、すべてのユーザにパフォーマンスの増大を提供します。 ページキャッシュも有効の場合、ブロックキャッシュによるパフォーマンスの増大は、主に認証済みユーザのメリットになります。	ja	0	0
606	有効（推奨）	ja	0	0
607	ブロックキャッシュを有効にするかどうかを指定してください。 コンテンツのアクセス制限が定義されたモジュールが有効な場合、ブロックキャッシュは機能しないことに注意してください。	ja	0	0
608	帯域幅の最適化	ja	0	0
609	<p>DrupalはCSSやJavaScriptのような外部リソースを、自動的に最適化することができます。 これはサイトへのリクエストの、数とサイズを減少させるのに役立ちます。 CSSファイルは1つのファイルに圧縮されてまとめられ、JavaScriptファイルは圧縮されずにまとめられます。 これら任意の最適化は、サーバの負荷、帯域幅要件、ページの読み込み時間の減少に繋がります。 </p><p>これらのオプションは、filesディレクトリを設定していない場合や、ダウンロードの方法がプライベートの場合には無効となります。</p>	ja	0	0
610	CSSファイルの最適化	ja	0	0
611	CSSファイルの最適化を行うかどうかを指定してください。 このオプションはテーマの開発に干渉するため、実稼働中のサイトでのみ有効化するべきです。	ja	0	0
612	JavaScriptファイルの最適化	ja	0	0
805	ログと警告	ja	0	0
613	JavaScriptファイルの最適化を行うかどうかを指定してください。 このオプションはモジュールの開発に干渉するため、実稼働中のサイトでのみ有効化するべきです。	ja	0	0
614	キャッシュデータのクリア	ja	0	0
615	データをキャッシュすることでパフォーマンスは向上しますが、古い情報がキャッシュされている場合、新しいモジュール・テーマ・翻訳のトラブルシューティングの間に、問題をもたらす可能性があります。 サイトの全キャッシュデータをリフレッシュするには、以下のボタンをクリックしてください。<em>警告： キャッシュデータが再構築される間、アクセス数の多いサイトではパフォーマンスの低下を感じるでしょう。</em>	ja	0	0
616	キャッシュがクリアされました。	ja	0	0
617	ファイルシステムのパス	ja	0	0
618	ファイルを保存するためのファイルシステムのパスを入力してください。 このディレクトリは、Drupalから書き込みが可能なように適切なパーミッションが与えられ、すでに存在するパスである必要があります。 以下の「ダウンロードの方法」で「パブリック」を指定した場合は、Drupalがインストールされているパスに相対的な、ウェブ上からアクセス可能なパスを入力する必要があります。 「プライベート」を指定した場合は、ウェブ上からアクセス不可能なパスを入力する必要があります。 この設定を変更した場合、すべてのダウンロードパスが変更され、既存のサイトで予期せぬ問題を引き起こす可能性があります。	ja	0	0
619	テンポラリディレクトリ	ja	0	0
620	一時的な作業に使用するためのディレクトリを入力してください。 アップロードしたファイルをプレビューする間の保管場所として使用されます。	ja	0	0
621	ダウンロードの方法	ja	0	0
622	パブリック： HTTPからファイルの実体に直接アクセスさせる	ja	0	0
623	プライベート： HTTPからファイルの実体に直接アクセスできないようにし、Drupalに転送させる	ja	0	0
624	ファイルのダウンロードに使用する方法を指定してください。 ファイルのダウンロードに対して、きめ細かなアクセス制御をしたくない場合は、「パブリック」を選んでください。 この設定を変更した場合、すべてのダウンロードパスが変更され、既存のサイトで予期せぬ問題を引き起こす可能性があります。	ja	0	0
625	画像処理ツールキットの選択	ja	0	0
626	各フィードのアイテム数	ja	0	0
627	各フィードに含める、デフォルトのアイテム数を指定してください。	ja	0	0
628	フィードの内容	ja	0	0
629	タイトルのみ	ja	0	0
630	タイトルとティーザー	ja	0	0
631	すべてのテキスト	ja	0	0
632	各フィードのアイテムにデフォルトで表示する内容を指定してください。 この設定はサイト全般で使用されます。	ja	0	0
633	カスタムフォーマット	ja	0	0
634	ロケールの設定	ja	0	0
635	デフォルトのタイムゾーン	ja	0	0
636	サイトのデフォルトとするタイムゾーンを指定してください。	ja	0	0
637	ユーザ単位のタイムゾーン	ja	0	0
638	ユーザ単位でタイムゾーンの変更を許可するかどうかを指定してください。 有効にした場合、ユーザは自分に適したタイムゾーンに変更することができるようになり、タイムゾーンに応じた日付表示が行われるようになります。	ja	0	0
639	週の最初の曜日	ja	0	0
640	カレンダ表示での最初の曜日（左端に表示する曜日）を指定してください。	ja	0	0
641	書式の設定	ja	0	0
642	日付の表示形式（短）	ja	0	0
643	短い日付表示に使われる書式を指定してください。	ja	0	0
644	日付の表示形式［カスタム］（短）	ja	0	0
645	ユーザ定義の日付形式（短）を入力してください。 <a href="@url">PHPマニュアル</a>に記載されているオプションが利用できます。<br />現設定での表示例： <span>%date</span>	ja	0	0
646	日付の表示形式（中）	ja	0	0
647	中程度の長さの日付表示に使われる書式を指定してください。	ja	0	0
648	日付の表示形式［カスタム］（中）	ja	0	0
649	ユーザ定義の日付形式（中）を入力してください。 <a href="@url">PHPマニュアル</a>に記載されているオプションが利用できます。<br />現設定での表示例： <span>%date</span>	ja	0	0
650	日付の表示形式（長）	ja	0	0
651	長い日付表示に使われる書式を指定してください。	ja	0	0
652	日付の表示形式［カスタム］（長）	ja	0	0
653	ユーザ定義の日付形式（長）を入力してください。 <a href="@url">PHPマニュアル</a>に記載されているオプションが利用できます。<br />現設定での表示例： <span>%date</span>	ja	0	0
654	サイトの状態	ja	0	0
655	オンライン	ja	0	0
656	オフライン	ja	0	0
657	サイトの状態を指定してください。 「<b>オンライン</b>」を指定すると、サイトへの訪問者が通常どおりコンテンツを閲覧できる状態となります。 「<b>オフライン</b>」を指定すると、「サイトの管理権限」を持ったユーザのみがアクセスできる状態になり、サイトのメンテナンスを行うことができます。 その際、その他の訪問者には、以下に記入されたメッセージが表示されます。 「オフライン」モード中でのアクセスを許可されているユーザは、<a href="@user-login">ユーザログイン</a>ページからログインすることができます。	ja	0	0
658	サイトオフラインのメッセージ	ja	0	0
659	サイトがオフラインの際に、訪問者へ表示するメッセージを記入してください。	ja	0	0
660	クリーンURL	ja	0	0
801	孤立したアクションを削除	ja	0	0
661	クリーンURL機能を使用するかどうかを指定してください。 クリーンURLとは、各コンテンツのURLに <b>?q=</b> を含まないスッキリとしたURLを指します。 例えば <b>about</b> というページがあった場合、この機能が無効の場合は <b>http://example.com/?q=about</b> というURLになりますが、有効の場合には <b>http://example.com/about</b> というURLになります。<br />	ja	0	0
662	クリーンURL機能を有効にする前に、このサーバが適切に設定されているかどうかを判断するために、 以下のリンクをクリックして、テストを実行する必要があります。 テストに成功した場合、再度このページが表示され、上のラジオボタンが変更できるようになります。 テストに失敗し、「ページが見つかりません」ページが表示された場合は、サーバの環境設定を変更する必要があります。 <a href="@handbook">ハンドブックのClean URLsページ（英文）</a>には、多くのトラブルシューティングに関する情報がありますので、失敗した際には参考にしてください。	ja	0	0
663	<a href="@clean_url">クリーンURLのテストを実行</a>	ja	0	0
664	サーバがこの機能をサポートすることが正常に検証されました。	ja	0	0
665	cronが正常に実行されました。	ja	0	0
666	cronの実行に失敗しました。	ja	0	0
667	変数	ja	0	0
668	値	ja	0	0
669	コマンドカウンタ	ja	0	0
670	<code>SELECT</code> ステートメントの回数	ja	0	0
671	<code>INSERT</code> ステートメントの回数	ja	0	0
672	<code>UPDATE</code> ステートメントの回数	ja	0	0
673	<code>DELETE</code> ステートメントの回数	ja	0	0
674	テーブルロックの回数	ja	0	0
675	テーブルアンロックの回数	ja	0	0
676	クエリパフォーマンス	ja	0	0
677	キーを使用しない結合の数（この値が 0 でない場合、テーブルのインデックスをチェックする必要があります）	ja	0	0
678	各レコードの後でキー使用をチェックする、キーを使用しない結合の数（この値が 0 でない場合、テーブルのインデックスをチェックする必要があります）	ja	0	0
679	テーブルのスキャンによって実行されたソートの回数	ja	0	0
680	テーブルロックがすぐに実行された回数	ja	0	0
681	テーブルロックがすぐには実行されず、待機が必要だった回数（この値が大きい場合、パフォーマンス上の問題があります）	ja	0	0
682	クエリキャッシュ情報	ja	0	0
683	MySQLクエリキャッシュは、クエリの結果を格納しておくことでサイトのパフォーマンスを向上させます。 後でまったく同じクエリを受け取ると、MySQLサーバはそのクエリの解析と実行をもう一度繰り返す代わりに、クエリキャッシュから結果を取り出します。	ja	0	0
684	クエリキャッシュに登録されているクエリ数	ja	0	0
685	MySQLがキャッシュから以前の結果を見つけ出した回数	ja	0	0
686	MySQLがキャッシュにクエリを追加した回数	ja	0	0
687	メモリ不足のためにMySQLがキャッシュから削除したクエリ数（理想的には 0 であるべきです）	ja	0	0
688	説明を表示	ja	0	0
689	説明を含めるためにレイアウトを展開する	ja	0	0
690	説明を非表示	ja	0	0
691	説明を隠してレイアウトを縮める	ja	0	0
692	バージョン	ja	0	0
693	その他	ja	0	0
694	互換性なし	ja	0	0
695	このDrupalコアのバージョンと互換性がありません	ja	0	0
696	このバージョンはDrupalコアのバージョン !core_version と互換性がありません	ja	0	0
697	このPHPのバージョンと互換性がありません	ja	0	0
698	このモジュールはPHPバージョン @php_required を必要とし、PHPバージョン !php_version との互換性がありません。	ja	0	0
699	アンインストールできるモジュールはありません。	ja	0	0
700	スクリーンショット	ja	0	0
701	このテーマはPHPバージョン @php_required を必要とし、PHPバージョン !php_version との互換性がありません。	ja	0	0
702	@module をインストールするには、@dependencies モジュールを有効にする必要があります。	ja	0	0
703	@module をインストールするには、@dependencies モジュールを有効にする必要があります。	ja	702	1
704	System（システム）モジュールはDrupalサイトの基礎となるもので、他のモジュールやテーマによって使用される、基礎的ながら拡張可能な機能性を提供します。 キャッシュ、モジュールやテーマの有効・無効化、管理上のページの準備と表示、サイトの基本的な環境設定など、いくつかのDrupalに不可欠な要素はsystemモジュールに含まれ、管理されます。 また、多くの主要なシステムメンテナンス操作は、systemモジュールの一部です。	ja	0	0
705	systemモジュールは以下を提供します：	ja	0	0
706	<a href="@modules">モジュール</a>の有効化・無効化をサポート － Drupalは多くのコアモジュールがはじめからパッケージ化されています。 各モジュールはそれぞれ別々の機能セットを提供し、サイトの必要性に応じて有効化することができます。 Drupalコミュニティのメンバーによって寄与された豊富な追加モジュールが、<a href="@drupal-modules">Drupal.org モジュールページ</a>からダウンロードして利用できます。	ja	0	0
707	サイトのデザインやプレゼンテーションを決定する<a href="@themes">テーマ</a>の有効化・無効化をサポート － Drupalにはいくつかのテーマがはじめからパッケージ化されています。 また、寄与されたテーマが、<a href="@drupal-themes">Drupal.org のテーマページ</a>からダウンロードして利用できます。	ja	0	0
802	サイト情報	ja	0	0
804	PHP/SQLのエラー報告や、403/404を含むエラーの処理方法を設定します。	ja	0	0
708	以前に構築されたウェブページやウェブページコンポーネントを効率的に再利用する、強固な<a href="@cache-settings">キャッシュシステム</a> － Drupalは匿名ユーザによってリクエストされたページを、圧縮形式で保存します。 サイトの設定と、匿名ユーザによるトラフィック量によっては、Drupalのキャッシュシステムを利用することで、サイトのスピードを著しく増大させることができます。	ja	0	0
709	自動実行のために正しく設定された<a href="@cron">cronメンテナンスタスク</a>に依存する、一連の定期的な管理上の操作 － フィードアグリゲータ、pingや検索モジュールなど、多くの他のモジュールも<a href="@cron">cronメンテナンスタスク</a>に依存します。 より詳しい情報は、オンラインハンドブックの<a href="@handbook">configuring cron jobs（英文）</a>を参照してください。	ja	0	0
710	<a href="@date-settings">日付と時刻の設定</a>、<a href="@file-system">ファイルシステムの設定</a>、<a href="@clean-url">クリーンURLのサポート</a>、<a href="@site-info">サイトの名前やその他の情報</a>などを含む、サイトの基本的な設定オプションや、サイトを一時的にオフラインにする<a href="@site-maintenance">サイトメンテナンス</a>機能	ja	0	0
711	より詳しい情報は、オンラインハンドブックの<a href="@system">System module（英文）</a>エントリを参照するか、日本サイトの<a href="http://drupal.jp/">&nbsp;≡ Drupal Japan ≡&nbsp;</a>を訪れてみてください。	ja	0	0
712	管理セクションへようこそ。 ここではサイトがどのように機能するかをコントロールすることができます。	ja	0	0
713	このページは、各モジュールで利用できるすべての管理タスクを表示します。	ja	0	0
714	ユーザが利用可能なテーマの選択や、デフォルトのテーマを指定してください。 サイト全域の表示設定をするには、上にある「設定」をクリックしてください。 あるいは特定のテーマで、それらに優先する設定を行いたい場合は、テーマごとの「設定」をクリックしてください。 コンテンツを表示できるリージョンは、テーマによって異なる場合があることに注意してください。 サイト表示に一貫性を持たせるために、利用できるテーマを1つに絞ることも選択肢の1つです。	ja	0	0
715	サイトの外観の変更に、多くの<a href="@themes">寄与されたテーマ</a>が利用できます。	ja	0	0
716	以下の設定は <b>%template</b> テーマの表示設定をコントロールします。 このテーマでサイトを表示する際には、この設定が使用されます。 「デフォルトに戻す」をクリックすることで、このテーマの設定に<a href="@global">全般の設定</a>を適用することができます。	ja	0	0
717	以下の設定は、すべてのテーマにわたるサイト全体のデフォルトの表示設定をコントロールします。 優先させる設定を行っていないテーマでは、これらの設定が使用されます。	ja	0	0
718	モジュールはDrupalのコアの機能性を拡張するプラグインです。 モジュールを有効にするには、以下の「有効」チェックボックスにチェックを入れ、「設定の保存」ボタンをクリックしてください。 モジュールを有効にすると、新しい<a href="@permissions">権限</a>が利用可能になる場合があります。 「スロットル」チェックボックスにチェックを入れたモジュールは、サイトへのアクセスが一定数を超えた際、サーバの負荷を減少させるために一時的に無効にされます（「スロットル」チェックボックスは、Throttle（スロットル）モジュールが有効の場合にのみ利用可能です）。 	ja	0	0
719	自動スロットル機能は、Throttle（スロットル）モジュールを有効にした上で、<a href="@throttle">スロットルの設定ページ</a>で設定を行う必要があります。	ja	0	0
720	モジュールが新しいバージョンに更新された際には、<a href="@update-php">update.php</a> を必ず実行するようにしてください。	ja	0	0
721	特定のモジュールに属するすべての管理タスクは、<a href="@by-module">モジュール別の管理ページ</a>で見つけることができます。	ja	0	0
722	サイトの機能性を拡張するために、多くの<a href="@modules">寄与されたモジュール</a>が利用できます。	ja	0	0
723	すべてのキャッシュをクリアするには、<a href="@performance">パフォーマンスページ</a>のボタンをクリックしてください。	ja	0	0
724	アンインストール処理は、モジュールに関連するすべてのデータを削除します。 モジュールをアンインストールするには、はじめにモジュールを無効化する必要があります。 すべてのモジュールがこの機能をサポートするとは限りません。	ja	0	0
725	<em>Powered by Drupal</em> ブロックは、Drupalプロジェクトサイトへの任意のリンクです。 このリンクは絶対的な必要条件ではありませんが、Drupalのサポートを示すために使用することができます。	ja	0	0
726	アクションは1つのコンテンツを非掲載にしたり、ユーザをアクセス禁止にするなど、システムが行うことのできる個別のタスクです。 モジュール（トリガモジュールのような）は、特定のシステムイベント（例えば、新しい投稿の追加時やユーザのログイン時など）が生じた際、それらのアクションを実行できます。 また、モジュールによって追加のアクションが提供される場合もあります。	ja	0	0
727	アクションには単純なタイプと高度なタイプの2つがあります。 単純なアクションは追加設定を必要とせず、ここで自動的にリストされています。 高度なアクションは例えば、指定したアドレスにメール送信をしたり、1つのコンテンツ内で特定のワードをチェックするなど、単純なアクション以上のことを行うことができます。 これらのアクションを使用する前にまず、作成と設定を行う必要があります。 高度なアクションを作成するには、以下のドロップダウンからアクションを選択し、「作成」ボタンをクリックしてください。	ja	0	0
728	これらのアクションをシステムイベントに割り当てるには、<a href="@url">トリガ</a>ページへ移動してください。	ja	0	0
803	サイト名・スローガン・メールアドレス・ミッション・フロントページなどの基本的なサイト情報を設定します。	ja	0	0
729	高度なアクションは以下に、追加の設定オプションを提供します。 行われる正確なアクションを特定しやすくするために、「説明」フィールドの変更を推奨します。 この説明はアクションをシステムイベントに割り当てる際、モジュール（トリガモジュールのような）で表示されます。 例えば、単純に「メールを送信」とするより、「モデレーションチームにメールを送信」のように、より説明的にする方がよいでしょう。	ja	0	0
730	サイトのパラメータの簡潔な概観や、設置上で検出された問題をここで知ることができます。 drupal.orgのサポートフォーラムや、プロジェクトの問題点キューにサポートリクエストを提出する際、この情報をコピー＆ペーストすると役立ちます。	ja	0	0
731	お好みのテーマを指定してください。 テーマを変更するとサイトのルック＆フィールが変更されます。	ja	0	0
732	タイムゾーン	ja	0	0
733	あなたがお住まいの地域の、現在の時刻を指定してください。 指定されたタイムゾーンは、サイト全般での日時の表示に使用されます。	ja	0	0
734	Powered by Drupal	ja	0	0
735	バッジの色	ja	0	0
736	ブラック	ja	0	0
737	ブルー	ja	0	0
738	グレー	ja	0	0
739	バッジのサイズ	ja	0	0
740	小	ja	0	0
741	大	ja	0	0
742	テーマの設定	ja	0	0
743	（サイトのデフォルトテーマ）	ja	0	0
744	エラーが発生したため、設定が保存されませんでした。	ja	0	0
745	権限の設定	ja	0	0
746	cron実行時	ja	0	0
747	ユーザへメッセージを表示	ja	0	0
748	URLにリダイレクト	ja	0	0
749	高度なアクションを選択してください	ja	0	0
750	アクションのタイプ	ja	0	0
751	Drupalに利用できるアクション：	ja	0	0
752	新しい高度なアクションを利用可能にする	ja	0	0
753	作成	ja	0	0
754	この高度なアクションに固有の説明を入力してください。 この説明は、アクションと一体化したモジュール（トリガモジュールのような）のインターフェイスで表示されます。	ja	0	0
755	アクションが正常に保存されました。	ja	0	0
756	本当に、アクション %action を削除してもよろしいですか？	ja	0	0
757	この操作は元に戻すことができませんので、十分に注意して実行してください。	ja	0	0
758	アクション %action が削除されました	ja	0	0
759	孤立したアクション（%action）が削除されました。	ja	0	0
760	受信者	ja	0	0
761	メッセージを送信するメールアドレスか %author を入力してください。 %author を指定した場合、オリジナル投稿の投稿者へメールが送信されます。	ja	0	0
762	メッセージの件名を入力してください。	ja	0	0
763	送信するメッセージを記入してください。 次の変数を含めることができます： %site_name, %username, %node_url, %node_type, %title, %teaser, %body , %term_name, %term_description, %term_id, %vocabulary_name, %vocabulary_description, %vocabulary_id （すべての変数が、すべてのコンテキストで使用できるとは限りません）	ja	0	0
764	有効なメールアドレスか %author を入力してください。	ja	0	0
765	現在のユーザへ表示されるメッセージを記入してください。 次の変数を含めることができます： %site_name, %username, %node_url, %node_type, %title, %teaser, %body （すべての変数が、すべてのコンテキストで使用できるとは限りません）	ja	0	0
766	ユーザがリダイレクトされるURLを入力してください。 node/1234 のような内部リンクと、http://drupal.org のような外部リンクが使用できます。	ja	0	0
767	Powered by Drupal / オープンソースコンテンツマネージメントシステム	ja	0	0
768	ガーベッジコレクション中に、一時ファイル "%path" を削除できませんでした	ja	0	0
769	アクション %aid（%action）が削除されました	ja	0	0
770	このコンテキストで %author トークンは使用できません	ja	0	0
771	%recipient へメールが送信されました	ja	0	0
772	%recipient へメールが送信できませんでした	ja	0	0
773	サイトの環境設定	ja	0	0
774	管理セクションへのアクセス	ja	0	0
775	アクションの管理	ja	0	0
776	サイトリポートへのアクセス	ja	0	0
777	別テーマの選択	ja	0	0
778	ファイルの管理	ja	0	0
779	ファイルダウンロード	ja	0	0
780	管理セクション	ja	0	0
781	コンパクトモード	ja	0	0
782	タスク別	ja	0	0
783	モジュール別	ja	0	0
784	コンテンツの管理	ja	0	0
785	サイトのコンテンツを管理します。	ja	0	0
786	サイトの環境設定	ja	0	0
787	基本的なサイト設定オプションを調整します。	ja	0	0
788	サイトの構築	ja	0	0
789	サイトのルック＆フィールをコントロールします。	ja	0	0
790	管理ページに適用するテーマの設定をします。	ja	0	0
791	サイトに使用するテーマや、ユーザに利用を許可するテーマの設定をします。	ja	0	0
792	デフォルトのテーマを選択します。	ja	0	0
793	全般の設定	ja	0	0
794	サイトで使用するアドオンモジュールの有効・無効化をします。	ja	0	0
795	アクション	ja	0	0
796	サイト用に定義されたアクションを管理します。	ja	0	0
797	アクションの管理	ja	0	0
806	ログと警告モジュールの設定を行います。 さまざまなモジュールが異なる届け先（syslog、データベース、メールなど）に、Drupalのシステムイベントの経路を決めることができます。	ja	0	0
807	パフォーマンス	ja	0	0
808	匿名ユーザ用ページキャッシュの有効・無効化や、CSSとJSの帯域幅最適化オプションを設定します。	ja	0	0
809	ファイルシステム	ja	0	0
810	アップロードされたファイルの保存先やアクセス方法を設定します。	ja	0	0
811	画像ツールキット	ja	0	0
812	任意のツールキットをインストールした場合、利用する画像ツールキットを選択します。	ja	0	0
813	RSS配信	ja	0	0
814	フィード単位の項目数と内容（タイトル／ティーザー／全文）を設定します。	ja	0	0
815	日付と時刻	ja	0	0
816	日付と時刻の表示形式や、デフォルトのタイムゾーンを設定します。	ja	0	0
817	日付と時刻の照合	ja	0	0
818	サイトメンテナンス	ja	0	0
819	サイトメンテナンス用にオンライン・オフラインのモードを切り替えます。	ja	0	0
820	クリーンURLの有効・無効化をします。	ja	0	0
821	クリーンURLのチェック	ja	0	0
822	リポート	ja	0	0
823	システムログやその他の状況情報からリポートを表示します。	ja	0	0
824	現状報告	ja	0	0
825	サイトの稼働状況や検出された問題点に関する、現状報告の確認をします。	ja	0	0
826	cronの実行	ja	0	0
827	PHP	ja	0	0
828	SQL	ja	0	0
829	フッタ	ja	0	0
830	-1（無制限）	ja	0	0
831	バッチ（複数のHTTPリクエストで実行される処理）に関する詳細を格納します	ja	0	0
832	Drupal	ja	0	0
833	ウェブサーバ	ja	0	0
834	このサーバにインストールされているPHPは古すぎます。 Drupalは少なくともPHP %version を必要とします。	ja	0	0
835	PHP register globals	ja	0	0
836	<em>register_globals</em> が有効になっています。 Drupalでは、この設定ディレクティブを無効にする必要があります。 <em>register_globals</em> が有効の場合、サイトが安全ではなくなります。 PHPマニュアルの「<a href="http://php.net/configuration.changes">設定を変更するには</a>」に変更のための説明があります。	ja	0	0
837	有効（'@value'）	ja	0	0
838	PHPメモリ制限	ja	0	0
839	インストール処理でのエラーを防ぐために、PHPメモリ制限を %memory_minimum_limit に増やすことを検討してください。	ja	0	0
840	アップデート処理でのエラーを防ぐために、PHPメモリ制限を %memory_minimum_limit に増やすことを検討してください。	ja	0	0
841	設定次第では、Drupalは %memory_limit のPHPメモリ制限で稼働できますが、%memory_minimum_limit 以上のPHPメモリ制限を推奨します。 特に追加の拡張モジュールを使用する場合、より多くのメモリを必要とするでしょう。	ja	0	0
842	ファイル %configuration-file 内の memory_limit パラメータを編集して、メモリ制限を増やしてから、ウェブサーバを再起動してください。 （または、システム管理者やホスティングプロバイダに問い合わせてください）	ja	0	0
843	PHPメモリ制限を増やすために、システム管理者やホスティングプロバイダに問い合わせてください。	ja	0	0
844	より詳しい情報は<a href="@url">Drupal requirements（英文）</a>を参照してください。	ja	0	0
845	保護されていません	ja	0	0
846	ディレクトリ %file は変更に対して保護されていないため、セキュリティ上の危険性があります。 ディレクトリのパーミッションを書き込み禁止に変更してください。	ja	0	0
847	ファイル %file は変更に対して保護されていないため、セキュリティ上の危険性があります。 ファイルのパーミッションを書き込み禁止に変更してください。	ja	0	0
848	保護されています	ja	0	0
849	設定ファイル	ja	0	0
850	ファイルディレクトリ	ja	0	0
851	テンポラリファイルディレクトリ	ja	0	0
852	十分に保護されていません	ja	0	0
853	任意のコード実行から保護するのに役立つ、%directory ディレクトリに追加するべき推奨される .htaccess ファイルについての情報は <a href="@url">@url</a> を参照してください。	ja	0	0
854	より詳しい情報は、オンラインハンドブックの <a href="@cron-handbook">configuring cron jobs（英文）</a>を参照してください。	ja	0	0
855	cronが未実行です。 より詳しい情報は、<a href="@status">現状報告</a>を参照してください。	ja	0	0
856	未実行	ja	0	0
857	cronが未実行です。	ja	0	0
858	前回の実行 !time 前	ja	0	0
859	cronがしばらく実行されていません。	ja	0	0
860	cronメンテナンスタスク	ja	0	0
861	<a href="@cron">cronを手動で実行</a>	ja	0	0
862	書き込み不能	ja	0	0
863	ディレクトリ %directory が書き込み可能ではありません。	ja	0	0
864	<a href="@admin-file-system">ファイルシステムの設定ページ</a>で適切なディレクトリを設定するか、現在のディレクトリのパーミッションを書き込み可能にする必要があります。	ja	0	0
946	メインコンテンツの周囲に表示されるボックスを管理します。 [<a href="?q=admin/help/block" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
947	コア - 必須	ja	0	0
948	ブログ	ja	0	0
1039	火曜日	ja	0	0
1040	水曜日	ja	0	0
865	おそらくパーミッションの問題により、このディレクトリの自動作成に失敗しました。 インストールを続行するには、手作業でディレクトリを作成してパーミッションを変更するか、インストーラにディレクトリを自動的に作成できるパーミッションを与えてください。 より詳しい情報は、INSTALL.txt か<a href="@handbook_url">オンラインハンドブック（英文）</a>を参照してください。	ja	0	0
866	書き込み可能 （ダウンロード方法： <em>パブリック</em> ）	ja	0	0
867	書き込み可能 （ダウンロード方法： <em>プライベート</em> ）	ja	0	0
868	データベースの更新状況	ja	0	0
869	いくつかのモジュールには、インストールが必要なデータベーススキーマの更新があります。 直ちに<a href="@update">データベースのアップデートスクリプト</a>を実行してください。	ja	0	0
870	update.php が認証チェック無しでアクセス可能なため、セキュリティ上の危険があります。 これを回避するために、settings.php の $update_free_access を FALSE に変更してください。	ja	0	0
871	update.php へのアクセス	ja	0	0
872	有効になっていません	ja	0	0
873	アップデート通知が有効になっていません。 最新のリリースで最新の状態にしておくために、<a href="@module">モジュールの管理ページ</a>で Update status モジュールを有効にすることを<strong>強くお勧めします</strong>。 より詳しい情報は、<a href="@update">ハンドブックの Update status ページ（英文）</a>を参照してください。	ja	0	0
874	アップデート通知	ja	0	0
875	HTTPリクエストの状況	ja	0	0
876	失敗	ja	0	0
877	システムまたはネットワークの設定が、Drupalがウェブページにアクセスすることを許可していません。 これは機能性の低下につながり、原因はサーバかPHPの設定にあるかもしれません。 利用可能なアップデートに関するダウンロード情報の取得、アグリゲータフィードの取得、OpenIDを通じたログイン、その他のネットワーク依存サービスを利用するために、この問題は解決されるべきです。	ja	0	0
878	クリーンURLのテスト...	ja	0	0
879	現在のシステム設定ではこの機能をサポートしていません。 <a href="http://drupal.org/node/15365">ハンドブックのClean URLsページ（英文）</a>に、トラブルシューティングのより詳しい情報が掲載されています。	ja	0	0
880	アクション	ja	0	0
881	誠に申し訳ございませんが、@siteは現在メンテナンス中です。 恐れ入りますが暫く経ってから再度アクセスしていただきますよう、お願い申し上げます。	ja	0	0
882	MB	ja	0	0
883	緊急	ja	0	0
884	警戒	ja	0	0
885	致命的	ja	0	0
886	エラー	ja	0	0
887	警告	ja	0	0
888	ディレクトリ %directory が存在しません。	ja	0	0
889	ファイルシステム	ja	0	0
890	セキュリティ	ja	0	0
891	検証エラーが発生しましたので再試行してください。<br />このエラーが繰り返し発生する場合は、お手数ですがサイト管理者までご連絡ください。	ja	0	0
892	パスワード	ja	0	0
893	不正な選択肢が検出されました。 お手数ですが、サイト管理者までご連絡ください。	ja	0	0
894	処理中	ja	0	0
895	フォーム	ja	0	0
896	%name 要素で不正な選択肢 %choice が検出されました。	ja	0	0
897	設定の保存	ja	0	0
898	編集	ja	0	0
899	削除	ja	0	0
900	有効	ja	0	0
901	デフォルト	ja	0	0
902	ウェイト	ja	0	0
903	操作	ja	0	0
904	言語の追加	ja	0	0
905	削除	ja	0	0
906	キャンセル	ja	0	0
907	設定の保存	ja	0	0
908	言語	ja	0	0
909	N/A	ja	0	0
910	検索	ja	0	0
911	すべての言語	ja	0	0
912	インポート	ja	0	0
913	エクスポート	ja	0	0
914	言語	ja	0	0
915	メール	ja	0	0
916	ホーム	ja	0	0
917	前のページへ	ja	0	0
918	次のページへ	ja	0	0
919	新着	ja	0	0
920	ユーザプロフィールの表示	ja	0	0
921	匿名ユーザ	ja	0	0
922	タイトル	ja	0	0
923	@time前	ja	0	0
924	N/A	ja	0	0
925	URL	ja	0	0
926	保存	ja	0	0
927	表示	ja	0	0
928	この操作は元に戻すことができませんので、十分に注意して実行してください。	ja	0	0
929	なし	ja	0	0
930	使用できるHTMLタグ	ja	0	0
931	説明	ja	0	0
932	続きを読む	ja	0	0
933	カテゴリの追加	ja	0	0
934	リスト	ja	0	0
935	環境設定	ja	0	0
936	RSSフィード	ja	0	0
937	表示	ja	0	0
938	設定	ja	0	0
939	アグリゲータ	ja	0	0
940	他サイトからRSS/RDF/Atomフィードで配信されるコンテンツを収集します。 [<a href="?q=admin/help/aggregator" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
941	コア - 任意	ja	0	0
942	ブロック	ja	0	0
943	スロットル	ja	0	0
944	設定	ja	0	0
945	無効	ja	0	0
1037	日曜日	ja	0	0
1038	月曜日	ja	0	0
949	簡単にブログをつけられるようにします。 [<a href="?q=admin/help/blog" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
950	許可されるファイル拡張子（デフォルト）	ja	0	0
951	ユーザがアップロードすることのできる、デフォルトのファイル拡張子を入力してください。  拡張子には先頭のドットを含めず、空白文字で区切って指定してください。 例： jpg png gif pdf doc zip	ja	0	0
952	アップロード単位の最大ファイルサイズ（デフォルト）	ja	0	0
953	ユーザ単位の合計ファイルサイズ（デフォルト）	ja	0	0
954	ユーザがサイトに保存しておくことのできる、デフォルトの全ファイルの最大合計サイズを入力してください。	ja	0	0
955	このサーバのPHPの設定により、アップロード単位の最大ファイルサイズが %size に制限されます。	ja	0	0
956	@role用の設定	ja	0	0
957	許可されるファイルの拡張子	ja	0	0
958	ユーザがアップロードすることのできる、ファイル拡張子を入力してください。 拡張子には先頭のドットを含めず、空白文字で区切って指定してください。 例： jpg png gif pdf doc zip	ja	0	0
959	アップロード単位の最大ファイルサイズ	ja	0	0
960	ユーザ単位の合計ファイルサイズ	ja	0	0
961	コンテンツ	ja	0	0
962	ブログAPI	ja	0	0
963	XML-RPC APIをサポートする外部アプリケーションから、コンテンツを投稿できるようにします。 [<a href="?q=admin/help/blogapi" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
964	ブック	ja	0	0
965	上位	ja	0	0
966	上位の項目	ja	0	0
967	サイトページを階層やアウトラインで構成できるようにします。 [<a href="?q=admin/help/book" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
968	プレビュー	ja	0	0
969	デフォルトに戻す	ja	0	0
970	色	ja	0	0
971	特定のテーマの配色を変更できるようにします。 [<a href="?q=admin/help/color" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
972	更新オプション	ja	0	0
973	更新	ja	0	0
974	件名	ja	0	0
975	投稿者	ja	0	0
976	時間	ja	0	0
977	更新が実行されました。	ja	0	0
978	任意	ja	0	0
979	必須	ja	0	0
980	有効な日付を指定する必要があります。	ja	0	0
981	投稿者	ja	0	0
982	メール	ja	0	0
983	このフィールドの内容は非公開にされ、公表されることはありません。	ja	0	0
984	投稿日時	ja	0	0
985	状態	ja	0	0
986	掲載	ja	0	0
987	非掲載	ja	0	0
988	あなたのお名前	ja	0	0
989	コメント	ja	0	0
990	ユーザアカウントの保存中にエラーが発生しました。	ja	0	0
991	日付の新しい順	ja	0	0
992	日付の古い順	ja	0	0
993	キーワード	ja	0	0
994	アクション	ja	0	0
995	コメント(1)	ja	0	0
996	コメント(@count)	ja	995	1
997	コメント	ja	0	0
998	掲載されたコンテンツにユーザがコメントを付けられるようにします。 [<a href="?q=admin/help/comment" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
999	はい	ja	0	0
1000	いいえ	ja	0	0
1001	カテゴリ	ja	0	0
1002	選択済み	ja	0	0
1003	カテゴリの入力は必須です。	ja	0	0
1004	- 選択してください -	ja	0	0
1005	メッセージ	ja	0	0
1006	メールの送信	ja	0	0
1007	コンタクト	ja	0	0
1008	個人用とサイト用のコンタクトフォームを利用できるようにします。 [<a href="?q=admin/help/contact" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
1009	タイプ	ja	0	0
1010	日付	ja	0	0
1011	ユーザ	ja	0	0
1012	リファラ	ja	0	0
1013	ホスト名	ja	0	0
1014	フィルタ	ja	0	0
1015	リセット	ja	0	0
1016	Database logging	ja	0	0
1017	詳細	ja	0	0
1018	システムイベントをデータベースに記録します。 [<a href="?q=admin/help/dblog" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
1019	名前	ja	0	0
1020	ロール	ja	0	0
1021	ヘッダ	ja	0	0
1022	編集	ja	0	0
1023	コンテンツの表示前にさまざまなフィルタリング処理をします。 [<a href="?q=admin/help/filter" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
1024	フォーラム	ja	0	0
1025	最上位	ja	0	0
1026	返信	ja	0	0
1027	新着(1)	ja	0	0
1028	新着(@count)	ja	1027	1
1029	さまざまな話題についてスレッド形式で議論できるようにします。 [<a href="?q=admin/help/forum" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
1030	ヘルプ	ja	0	0
1031	オンラインヘルプの表示を管理します。 [<a href="?q=admin/help/help" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
1032	言語ニュートラル	ja	0	0
1033	確認	ja	0	0
1034	木曜日	ja	0	0
1035	金曜日	ja	0	0
1036	土曜日	ja	0	0
1041	ロケール	ja	0	0
1042	言語処理の機能性を加え、ユーザインターフェイスを英語以外の言語へ翻訳できるようにします。 [<a href="?q=admin/help/locale" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
1043	パス	ja	0	0
1044	メニューシステムはシステムパスのみを格納しますが、表示にはURLエイリアスを使用します。 %link_path は %normal_path として格納されました。	ja	0	0
1045	パス '@link_path' は無効、あるいはアクセスできません。	ja	0	0
1046	メニュー	ja	0	0
1047	ナビゲーション	ja	0	0
1048	プライマリリンク	ja	0	0
1049	セカンダリリンク	ja	0	0
1050	メニュー	ja	0	0
1051	管理者がサイトのナビゲーションメニューをカスタマイズできるようにします。 [<a href="?q=admin/help/menu" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
1052	本文	ja	0	0
1053	識別情報	ja	0	0
1054	無制限	ja	0	0
1055	状態	ja	0	0
1056	絞り込む	ja	0	0
1057	元に戻す	ja	0	0
1058	さらに	ja	0	0
1059	その	ja	0	0
1060	が	ja	0	0
1061	投稿はありません。	ja	0	0
1062	すべてを削除	ja	0	0
1063	コンテンツ	ja	0	0
1064	ユーザ名	ja	0	0
1065	コンテンツタイプ	ja	0	0
1066	ノード	ja	0	0
1067	コンテンツの投稿や表示など、Drupalの核となる処理をします。 [<a href="?q=admin/help/node" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
1068	OpenID	ja	0	0
1069	サイト管理者のみが新規アカウントを作成できる	ja	0	0
1070	OpenID を使用してサイトへのログインができるようになります。 [<a href="?q=admin/help/openid" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
1071	システム	ja	0	0
1072	URLのエイリアス（別名）を定義できるようにします。 [<a href="?q=admin/help/path" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
1073	PHP filter	ja	0	0
1074	埋め込まれたPHPコードやスニペットが評価（実行）されるようにします。 [<a href="?q=admin/help/php" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
1075	Ping	ja	0	0
1076	サイトが更新された際に他のサイトへ通知するようにします。 [<a href="?q=admin/help/ping" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
1077	訪問者	ja	0	0
1078	投票	ja	0	0
1079	アクティブ	ja	0	0
1080	さまざまな話題について、多肢選択の質問形式で投票ができるようにします。 [<a href="?q=admin/help/poll" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
1081	プロフィール	ja	0	0
1082	設定可能なユーザプロフィールをサポートします。 [<a href="?q=admin/help/profile" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
1083	サイト全体からキーワード検索ができるようにします。 [<a href="?q=admin/help/search" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
1084	軌跡	ja	0	0
1085	統計	ja	0	0
1086	サイトアクセスの統計情報を記録して、さまざまな形式で表示できるようにします。 [<a href="?q=admin/help/statistics" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
1087	Syslog	ja	0	0
1088	システムイベントをsyslogに記録します。 [<a href="?q=admin/help/syslog" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
1089	次に依存： !dependencies	ja	0	0
1090	次に必須： !required	ja	0	0
1091	メールアドレス	ja	0	0
1092	中程度	ja	0	0
1093	ユーザ	ja	0	0
1094	テーマ	ja	0	0
1095	モジュール	ja	0	0
1096	左サイドバー	ja	0	0
1097	右サイドバー	ja	0	0
1098	最新	ja	0	0
1099	旧式	ja	0	0
1100	管理者用の全般的なサイト設定を処理します。 [<a href="?q=admin/help/system" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
1101	タクソノミー	ja	0	0
1102	コンテンツをさまざまなカテゴリに分類できるようにします。 [<a href="?q=admin/help/taxonomy" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
1103	認証ユーザ 1 人	ja	0	0
1104	認証ユーザ @count 人	ja	1103	1
1105	サイトの混雑を制御するための自動スロットルメカニズムを処理します。 [<a href="?q=admin/help/throttle" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
1106	トラッカー	ja	0	0
1107	ユーザが最近の投稿を手早く知ることができるようにします。 [<a href="?q=admin/help/tracker" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
1108	Content translation	ja	0	0
1109	コンテンツを異なる言語に翻訳できるようにします。 [<a href="?q=admin/help/translation" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
1110	ユーザ	ja	0	0
1111	Trigger	ja	0	0
1112	特定のシステムイベント（「新規コンテンツの作成時」のような）をトリガとして、任意の行動を起こせるようにします。 [<a href="?q=admin/help/trigger" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
1113	Update status	ja	0	0
1175	コメント： %subject が更新されました。	ja	0	0
1286	最近のログ項目	ja	0	0
1114	Drupalやインストール済みのモジュールやテーマのアップデート状況を確認します。 [<a href="?q=admin/help/update" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
1115	アップロード	ja	0	0
1116	ユーザがファイルのアップロードとコンテンツへの添付ができるようにします。 [<a href="?q=admin/help/upload" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
1117	ユーザ登録やログインシステムの管理をします。 [<a href="?q=admin/help/user" title="より詳細なヘルプを読む" target="_blank">?</a>]	ja	0	0
1118	Bluemarine	ja	0	0
1119	マリンとアッシュカラーで配色されたテーブルベースのマルチカラムテーマです。	ja	0	0
1120	Chameleon	ja	0	0
1121	テーブルを最小限に抑えたライトカラーのテーマです。	ja	0	0
1122	Marvin	ja	0	0
1123	グレーで統一された箱形テーブルのテーマです。	ja	0	0
1124	Garland	ja	0	0
1125	テーブルなし、配色変更可能、マルチカラム、横幅可変のテーマです。（デフォルト）	ja	0	0
1126	Blue Lagoon （デフォルト）	ja	0	0
1127	Ash	ja	0	0
1128	Aquamarine	ja	0	0
1129	Belgian Chocolate	ja	0	0
1130	Citrus Blast	ja	0	0
1131	Cold Day	ja	0	0
1132	Greenbeam	ja	0	0
1133	Mediterrano	ja	0	0
1134	Mercury	ja	0	0
1135	Nocturnal	ja	0	0
1136	Olivia	ja	0	0
1137	Pink Plastic	ja	0	0
1138	Shiny Tomato	ja	0	0
1139	Teal Top	ja	0	0
1140	Minnelli	ja	0	0
1141	テーブルなし、配色変更可能、マルチカラム、横幅固定のテーマです。	ja	0	0
1142	Pushbutton	ja	0	0
1143	ブルーとオレンジのトーンを基調としたテーブル使用のマルチカラムテーマです。	ja	0	0
1144	Color（カラー）モジュールは、特定のテーマの配色をサイト管理者が素早く簡単に変更できるようにします。 すべてのテーマがカラーモジュールをサポートするとは限りませんが、Garland（デフォルトテーマ）とMinnelliはこの機能を利用するように設計されました。 対応するテーマでカラーモジュールを使用することにより、リンク、背景、テキスト、その他のテーマ要素の色を簡単に変更することができます。 カラーモジュールは、<a href="@url">ファイルダウンロードの方法</a>が「パブリック」に設定されていることを必要とします。	ja	0	0
1145	カラーモジュールはテーマの指定スタイルシートの内容を読み込み、変更を加えたコピーを「files」ディレクトリに保存します。 これをよく覚えておいてください。 これはテーマのスタイルシートに手作業で変更を加えた際、たとえカラーモジュールから動的に配色を変更していない場合でも、再びカラー設定を保存する必要があることを意味します。 これにより、「files」ディレクトリ内のカラーモジュールが生成したバージョンのスタイルシートを、オリジナルファイルの新しいバージョンを使用して再生成します。	ja	0	0
1146	対応するテーマのカラー設定を行うには、<a href="@themes">テーマの管理ページ</a>でテーマの「設定」リンクをクリックしてください。	ja	0	0
1147	より詳しい情報は、オンラインハンドブックの<a href="@color">Color module（英文）</a>エントリを参照するか、日本サイトの<a href="http://drupal.jp/">&nbsp;≡ Drupal Japan ≡&nbsp;</a>を訪れてみてください。	ja	0	0
1148	カラーピッカーは、<a href="@url">ダウンロードの方法</a>が「パブリック」の場合にのみ動作します。	ja	0	0
1149	配色	ja	0	0
1150	カスタム	ja	0	0
1151	カラーセット	ja	0	0
1152	ベースの色	ja	0	0
1153	リンクの色	ja	0	0
1154	ヘッダ上部	ja	0	0
1155	ヘッダ下部	ja	0	0
1156	テキストの色	ja	0	0
1157	%name は有効な 16 進数のCSSカラー値である必要があります。	ja	0	0
1158	このテーマの配色を変更するために必要な、PHPで利用できるメモリが不十分です。 少なくともさらに %size のメモリが必要です。 より詳しい情報は<a href="http://www.php.net/manual/ja/ini.core.php#ini.sect.resource-limits">PHPドキュメント</a>を参照してください。	ja	0	0
1159	PHPのGDライブラリは使用可能ですが、PNGのサポートなしでコンパイルされました。 これを修正する方法についての情報は、<a href="@url">PHPのイメージ関数リファレンス</a>を参照してください。	ja	0	0
1160	未インストール	ja	0	0
1161	PHPのGDライブラリが見つからないか、または旧式です。 これを修正する方法についての情報は、<a href="@url">PHPのイメージ関数リファレンス</a>を参照してください。	ja	0	0
1162	GDライブラリ	ja	0	0
1163	投稿者	ja	0	0
1164	投稿先	ja	0	0
1165	更新を行うコメントを1つ以上選択してください。	ja	0	0
1166	コメントはありません。	ja	0	0
1167	削除すべきコメントが無いか、選択されたコメントは別の管理者によって削除されました。	ja	0	0
1168	本当に、これらのコメントとそのすべての返信を削除してもよろしいですか？	ja	0	0
1169	コメントの削除	ja	0	0
1170	コメントが削除されました。	ja	0	0
1171	コメントはもはや存在しません。	ja	0	0
1172	本当に、コメント %title を削除してもよろしいですか？	ja	0	0
1173	このコメントに対するすべての返信は失われます。 この操作は元に戻すことができませんので、十分に注意して実行してください。	ja	0	0
1174	コメントとすべての返信が削除されました	ja	0	0
1176	存在しないコメントを削除することはできません。	ja	0	0
1177	コメント： %subject が削除されました。	ja	0	0
1178	コメントを投稿する権限がありません。	ja	0	0
1179	返信しようとしたコメントは存在しません。	ja	0	0
1180	このディスカッションは終了しました。 新しいコメントは投稿できません。	ja	0	0
1181	返信	ja	0	0
1182	コメントを表示する権限がありません。	ja	0	0
1183	Comment（コメント）モジュールは、その投稿に限定した掲示板を作成し、訪問者が投稿にコメントを付けられるようにします。 どの<a href="@content-type">コンテンツタイプ</a>にも、コメントの許可（表示／投稿）・不許可（無効）を設定できる「デフォルトのコメント設定」があります。 また、コメントの表示設定やその他のコントロールも、コンテンツタイプごとにカスタマイズすることができます。 （いくつかの表示設定は、ユーザごとにカスタマイズ可能です）	ja	0	0
1184	コメントの権限はユーザロールに割り当てられ、匿名ユーザ（または他のロール）が投稿にコメントを付けられるかどうかを決定するために使用されます。 匿名ユーザにコメントが許可された場合、入力された連絡先情報がローカルコンピュータに保存されるクッキーに保持され、以後のコメント投稿に使用されます。 コメントに返信が付いていない場合に限り、そのコメントの投稿者は任意で編集することができます。 コメントモジュールは、他のコンテンツを作成する際と同じ入力書式と利用可能なHTMLタグを使用します。	ja	0	0
1185	より詳しい情報は、オンラインハンドブックの<a href="@comment">Comment module（英文）</a>エントリを参照するか、日本サイトの<a href="http://drupal.jp/">&nbsp;≡ Drupal Japan ≡&nbsp;</a>を訪れてみてください。	ja	0	0
1186	以下はサイトに投稿された最新コメントの一覧です。 コメントの表示は「件名」、投稿者情報の表示や編集は「投稿者」、テキストの編集は「編集」の各カラムをクリックしてください。 削除したい場合は任意のチェックボックスにチェックを入れ、更新オプションで「選択されたコメントを削除する」を選択したのちに「更新」ボタンをクリックしてください。	ja	0	0
1187	以下は、サイトに投稿された掲載承認待ちコメントの一覧です。 コメントの承認（掲載）や削除をするには、任意のコメントの先頭にチェックを入れ、「更新オプション」で操作を選んだのちに「更新」ボタンをクリックしてください。 また、「件名」や「投稿者」の各カラムをクリックすると内容や投稿者情報が表示され、「編集」をクリックすると内容を編集することができます。	ja	0	0
1188	最近のコメント	ja	0	0
1189	この投稿の最初のコメントにジャンプ	ja	0	0
1190	この投稿の最初の新着コメントにジャンプ	ja	0	0
1191	新しいコメントの追加	ja	0	0
1192	このページに新規コメントを追加	ja	0	0
1193	この投稿に関する新しいコメントをつける	ja	0	0
1194	コメントの設定	ja	0	0
1195	デフォルトのコメント設定	ja	0	0
1196	表示のみ	ja	0	0
1197	表示／投稿	ja	0	0
1198	このコンテンツタイプのデフォルトのコメント設定を指定してください。 ただし、「コメントの管理」権限を持ったユーザは常に設定を変更することができます。	ja	0	0
1199	デフォルトの表示モード	ja	0	0
1200	デフォルトのコメント表示形式を指定してください。 「フラットリスト」は単に日付順に並び、「スレッドリスト」はコメントとその返信の関係が維持された状態で並びます。 「折りたたむ」はタイトルのみが表示され、「展開する」はコメント本文も表示されます。 以下で「コメント表示コントローラ」を表示するように設定した場合、これらはユーザが好みに応じて変更できるようになります。	ja	0	0
1201	デフォルトの表示順	ja	0	0
1202	デフォルトでのコメントの表示順を指定してください。 以下で「コメント表示コントローラ」を表示するように設定した場合、これはユーザが好みに応じて変更できるようになります。	ja	0	0
1203	デフォルトのページ単位のコメント数	ja	0	0
1204	各ページに表示するデフォルトのコメント数を指定してください。 指定数より多くコメントがある場合、さらに数ページに分けて表示されます。	ja	0	0
1205	コメント表示コントローラ	ja	0	0
1206	コメントの上に表示	ja	0	0
1207	コメントの下に表示	ja	0	0
1208	コメントの上下に表示	ja	0	0
1209	表示しない	ja	0	0
1210	「コメント表示コントローラ」の表示・非表示や、表示位置を指定してください。 ユーザはコントローラを使用して、好みに応じた表示モード・表示順・表示数に変更できるようになります。 ログイン中のユーザは、コメント表示コントローラでの変更がユーザ設定として保存されます。	ja	0	0
1211	匿名ユーザのコメント	ja	0	0
1212	連絡先の記入は不要	ja	0	0
1213	連絡先の記入は任意	ja	0	0
1214	連絡先の記入は必須	ja	0	0
1215	匿名ユーザがコメントする際、名前やメールアドレスの入力を求めるかどうかを指定してください。 この設定は、<a href="@url">権限の設定ページ</a>で「匿名ユーザ」に「コメントの投稿」権限が与えられている場合にのみ有効となります。	ja	0	0
1216	コメントの件名欄	ja	0	0
1217	コメントに件名を付けられるようにするかどうかを指定してください。	ja	0	0
1218	コメントのプレビュー	ja	0	0
1219	投稿前のプレビューを必須とするかどうかを指定してください。 「必須」にした場合、投稿前に「プレビュー」ボタンをクリックし、記入したコメントに目を通すことをユーザに義務づけます。	ja	0	0
1220	コメント投稿フォームの位置	ja	0	0
1221	別のページに表示	ja	0	0
1222	コンテンツやコメントの下に表示	ja	0	0
1223	投稿されたコメントはサイト管理者の承認待ちとなりました。 承認後に掲載されます。	ja	0	0
1224	コメント： 権限のないコメント投稿か、クローズされた投稿 %subject へコメントが投稿されました。	ja	0	0
1225	上位	ja	0	0
1226	返信	ja	0	0
1227	新しいコメントの投稿	ja	0	0
1228	選択されたコメントを掲載する	ja	0	0
1229	選択されたコメントを削除する	ja	0	0
1230	選択されたコメントを非掲載にする	ja	0	0
1231	有効な投稿者名を指定する必要があります。	ja	0	0
1232	登録ユーザと同じ名前は使えません。	ja	0	0
1233	名前を入力する必要があります。	ja	0	0
1234	入力されたメールアドレスは無効です。	ja	0	0
1235	メールアドレスを入力する必要があります。	ja	0	0
1236	入力されたホームページのURLは無効です。 URLは完全な記述（<code>http://example.com/directory</code>の形式）が必要です。	ja	0	0
1237	管理	ja	0	0
1238	ホームページ	ja	0	0
1239	（件名なし）	ja	0	0
1240	!a コメント／ページ	ja	0	0
1241	お好みのコメント表示方法を選び「設定の保存」をクリックすると変更が反映されます。	ja	0	0
1242	コメント表示オプション	ja	0	0
1243	<a href="@login">ログイン</a>（<a href="@register">登録</a>）してコメントを投稿	ja	0	0
1244	<a href="@login">ログイン</a>してコメントを投稿	ja	0	0
1245	投稿者：!username 投稿日時：@datetime	ja	0	0
1246	フラットリスト - 折りたたむ	ja	0	0
1247	フラットリスト - 展開する	ja	0	0
1248	スレッドリスト - 折りたたむ	ja	0	0
1249	スレッドリスト - 展開する	ja	0	0
1250	新しいコメントを保存後	ja	0	0
1251	更新したコメントを保存後	ja	0	0
1252	コメントの削除後	ja	0	0
1253	ログイン中のユーザによるコメントの表示時	ja	0	0
1254	コメントを掲載する	ja	0	0
1255	コメントを非掲載にする	ja	0	0
1256	キーワードを含むコメントを非掲載にする	ja	0	0
1257	キーワードとする文字の並びをコンマで区切って列挙してください。 ここに列挙された、いずれかの文字の並びがコメントに含まれる場合、コメントは非公開にされます。 文字の並びの大文字・小文字は区別されます。<br />例： funny, bungee jumping, "Company, Inc."（キーワードにコンマを含む場合はダブルクォートで括ります）	ja	0	0
1258	コメント： %subject が追加されました。	ja	0	0
1259	コメント %subject を掲載しました。	ja	0	0
1260	コメント %subject を非掲載にしました。	ja	0	0
1261	新規コメント(1)	ja	0	0
1262	新規コメント(@count)	ja	1261	1
1263	コメントへのアクセス	ja	0	0
1264	コメントの投稿	ja	0	0
1265	コメントの管理	ja	0	0
1266	承認不要のコメント投稿	ja	0	0
1267	投稿されたコメントの編集や削除、承認待ちコメントの許否の決定などをします。	ja	0	0
1268	掲載中のコメント	ja	0	0
1269	承認キュー	ja	0	0
1270	コメントの削除	ja	0	0
1271	コメントの編集	ja	0	0
1272	コメントに返信	ja	0	0
1273	ログエントリの最大行数	ja	0	0
1274	データベースログに保存される最大行数を指定してください。 これを超えるエントリは自動的に破棄されます。 （正しく設定された<a href="@cron">cronメンテナンスタスク</a>を必要とします）	ja	0	0
1275	ログメッセージはありません。	ja	0	0
1276	回数	ja	0	0
1277	場所	ja	0	0
1278	重大度	ja	0	0
1279	ログメッセージの絞り込み	ja	0	0
1280	絞り込み対象を選択する必要があります。	ja	0	0
1281	Dblog（ディービーログ）モジュールはシステムを監視し、権限を与えられた人が後で調査できるように、システムイベントをログに記録します。 これは、サイト上の活動を素早く把握したいサイト管理者に役立ちます。 また、ログには一連のイベントが記録されるため、サイトエラーのデバッグにも役立ちます。	ja	0	0
1282	dblogのログは、利用データ、パフォーマンスデータ、エラー、警告、操作情報を含む、単純なイベント記録の一覧です。 サイトを適切に稼働させ続けるために、管理者は定期的にdblogリポートをチェックするべきです。	ja	0	0
1283	より詳しい情報は、オンラインハンドブックの<a href="@dblog">Dblog module（英文）</a>エントリを参照するか、日本サイトの<a href="http://drupal.jp/">&nbsp;≡ Drupal Japan ≡&nbsp;</a>を訪れてみてください。	ja	0	0
1284	Dblog（ディービーログ）モジュールはウェブサイトを監視し、権限を与えられた人が後で調査できるように、システムイベントをログに記録します。 dblogのログは、利用データ、パフォーマンスデータ、エラー、警告、操作情報を含む、単純なイベント記録の一覧です。 多くの場合これが、サイト上で何が起こっているかを知らせる唯一の方法なので、定期的にdblogリポートをチェックすることは不可欠です。	ja	0	0
1285	Drupalデータベースログに記録するための設定をします。 これは、共有ホスティングでの小・中規模のサイトにとって最も一般的な方法です。 ログは管理ページで表示することができます。	ja	0	0
1287	最近記録されたイベントを表示します。	ja	0	0
1288	「ページが見つかりません」エラーの上位	ja	0	0
1289	「ページが見つかりません」エラー（404）を表示します。	ja	0	0
1290	「アクセスは拒否されました」エラーの上位	ja	0	0
1291	「アクセスは拒否されました」エラー（403）を表示します。	ja	0	0
1292	デフォルト書式はすべてのロールで利用できます	ja	0	0
1293	この書式を利用できるロールはありません	ja	0	0
1294	デフォルトの入力書式に指定	ja	0	0
1295	デフォルトの入力書式が更新されました。	ja	0	0
1296	入力書式の追加	ja	0	0
1297	この入力書式はデフォルトの入力書式に指定されているため、すべてのロールで利用可能となり、ロールの設定は変更できません。	ja	0	0
1298	この入力書式に固有の名称を入力してください。	ja	0	0
1299	この入力書式を利用できるロールにチェックを入れてください。 ただし、「フィルタの管理」権限を持ったユーザは、常にすべての入力書式が利用できることに留意してください。	ja	0	0
1300	フィルタ	ja	0	0
1301	この入力書式で使用するフィルタを指定してください。	ja	0	0
1302	書式オプションに関するより詳しい情報...	ja	0	0
1303	ガイドラインはありません。	ja	0	0
1304	以下は、投稿フォームで表示される、この入力書式のガイドラインです。 これらはフィルタの設定に応じて自動的に生成されます。	ja	0	0
1305	入力書式のガイドライン	ja	0	0
1306	入力書式の名称 %name は、すでに存在しています。 他の入力書式と重複しない名称を入力してください。	ja	0	0
1307	入力書式 %format が追加されました。	ja	0	0
1308	入力書式の設定が更新されました。	ja	0	0
1309	本当に、入力書式 %format を削除してもよろしいですか？	ja	0	0
1310	この入力書式を使ったコンテンツが残っている場合、それらはデフォルトの入力書式に切り替えられます。 この操作は元に戻すことができませんので、十分に注意して実行してください。	ja	0	0
1311	デフォルトの入力書式は削除できません。	ja	0	0
1312	入力書式 %format が削除されました。	ja	0	0
1313	%format の設定	ja	0	0
1314	設定できるものがありません。	ja	0	0
1315	%format の並び替え	ja	0	0
1316	フィルタの順序付けが保存されました。	ja	0	0
1317	入力書式	ja	0	0
1318	Filter（フィルタ）モジュールは、サイトで使用できるテキストの入力書式を管理者が設定できるようにします。 入力書式はコンテンツとコメントで許可されるHTMLタグ、コード、その他の入力を定義するとともに、悪意のあるユーザによる損害を与えかねない入力から保護する重要な機能です。 デフォルトで2つの入力書式、「Filtered HTML」（管理者の承認したHTMLタグのサブセットのみが使用可能）と、「Full HTML」（HTMLタグのフルセットが使用可能）が含まれています。 管理者が追加の入力書式を作成することもできます。	ja	0	0
1319	各入力書式はテキストを操作するためにフィルタを使用し、ほとんどの入力書式では、いくつかの異なるフィルタを特定の順序でテキストに適用します。 各フィルタは特定の用途に設計され、一般に、ユーザの入力したテキスト内の要素をそれらの表示前に追加・削除・変換します。 フィルタは実際の投稿内容は変更せず、表示前に一時的に変更した内容を出力します。 フィルタは、承認されていないHTMLタグを除去することもあれば、テキスト内でクリック可能なリンクを作るために自動的にHTMLタグを加えることもあります。	ja	0	0
1320	ユーザはコンテンツの作成や編集の際に、利用可能な入力書式の中から1つを選ぶことができます。 管理者は、ユーザロールごとの利用可能な入力書式の設定や、デフォルトの入力書式の選択を行えます。	ja	0	0
1321	より詳しい情報は、オンラインハンドブックの<a href="@filter">Filter module（英文）</a>エントリを参照するか、日本サイトの<a href="http://drupal.jp/">&nbsp;≡ Drupal Japan ≡&nbsp;</a>を訪れてみてください。	ja	0	0
1322	「入力書式」は、ユーザがDrupalに与えたテキストを処理する方法を定義します。 各入力書式はテキストを操作するためにフィルタを使用し、ほとんどの入力書式では、いくつかの異なるフィルタを特定の順序でテキストに適用します。 各フィルタは特定の用途に設計され、一般に、ユーザの入力したテキスト内の要素をそれらの表示前に追加・削除・変換します。 ユーザはコンテンツの作成や編集の際に、利用可能な入力書式の中から1つを選ぶことができます。	ja	0	0
1323	以下のリストを使用して、ロールごとの利用可能な入力書式の設定や、デフォルトの入力書式（例えば、インポートされたコンテンツに使用されます）の選択を行ってください。 デフォルトに指定された入力書式は、常にユーザが利用可能となります。 「フィルタの管理」権限を持ったユーザは、すべての入力書式が利用可能となります。	ja	0	0
1324	すべての「フィルタ」は、例えば悪意のあるHTMLの除去やURLをクリック可能にするなど、ユーザの入力に対して1つの特定の変更を行います。 この入力書式でテキストに適用したいフィルタを選んでください。 いくつかのフィルタが表示の際にコンフリクトしていることに気付いた場合、<a href="@rearrange">それらを並び替える</a>ことができます。	ja	0	0
1325	特定のフィルタの設定が見つからない場合は、はじめに<a href="@url">「編集」ページ</a>で、そのフィルタの有効化を確認してください。	ja	0	0
1389	HTMLフィルタ	ja	0	0
1390	改行コンバータ	ja	0	0
1391	URLフィルタ	ja	0	0
1392	HTMLコレクタ	ja	0	0
1707	RSS	ja	0	0
1326	柔軟なフィルタリングシステムのために、一方のフィルタ処理がもう一方のフィルタ処理を妨げる場合があります。 例えば、一般によく利用されるものに「HTMLフィルタ」（HTMLタグの除去）と「改行コンバータ」（改行を&lt;br /&gt;タグに変換）の組み合わせがあります。 この場合、改行を&lt;br /&gt;タグに変換する処理がHTMLタグの除去処理より先に行われると、変換された&lt;br /&gt;タグは除去されてしまい望んだ結果が得られないことになります。 これを避けるために、フィルタには処理の優先順位を設定することができます。	ja	0	0
1327	フィルタは上から順番に実行されます。 フィルタの順番を変更するには、「ウェイト」の値（数値が小さいほど上になります）を変更するか、名前のカラムにあるドラッグアンドドロップハンドル（十字の矢印）をつかみ（ハンドルをつかむには、ハンドルアイコン上でマウスの左ボタンを押下したままにします）、リスト中の新しい位置へフィルタをドラッグしてください。 ページ下部にある「設定の保存」ボタンをクリックするまで、変更が保存されないことに注意してください。	ja	0	0
1328	使用できるHTMLタグ： @tags	ja	0	0
1329	\n<p>このサイトではHTMLで書かれたコンテンツの投稿を許可しています。 HTMLのすべてを習得するのは気が引けるかもしれませんが、ごく少数の基本的なHTML「タグ」の使い方を習得するのはとても簡単です。 以下の表では、このサイトで利用できるタグを、一例を挙げて説明しています。</p>\n<p>より詳細な情報は、W3Cの<a href="http://www.w3.org/TR/html/">HTML Specifications（英文）</a>や、<a href="http://www.w3.org/Consortium/Translation/Japanese">W3C 仕様書等の日本語訳集</a>を参照するか、好みの検索エンジンからHTMLについて解説しているサイトを探し、それらを参考にしてください。</p>	ja	0	0
1330	アンカーは他ページへのリンク作成に使用します。	ja	0	0
1331	デフォルトで改行タグは自動的に付加されますので、このタグは改行を追加したい場合に使用してください。 このタグはその他のほとんどのタグとは異なり、開始タグと終了タグのペアでは使いません。 「XHTML 1.0」との互換性を保つために、タグの中に余分な " /" を入れてください。	ja	0	0
1332	このテキストは<br />改行されます	ja	0	0
1333	デフォルトで段落タグは自動的に付加されますので、このタグは段落タグを追加したい場合に使用してください。	ja	0	0
1334	段落 1	ja	0	0
1335	段落 2	ja	0	0
1336	強調	ja	0	0
1337	強調	ja	0	0
1338	引用	ja	0	0
1339	テキストをプログラムのソースコードとして明示するために使われます。	ja	0	0
1340	コード	ja	0	0
1341	太字	ja	0	0
1342	下線	ja	0	0
1343	斜体	ja	0	0
1344	上付き文字	ja	0	0
1345	<sup>上付き</sup>文字	ja	0	0
1346	下付き文字	ja	0	0
1347	<sub>下付き</sub>文字	ja	0	0
1348	整形済みテキスト	ja	0	0
1349	略語	ja	0	0
1350	<abbr title="デモンストレーション">デモ</abbr>	ja	0	0
1351	頭字語	ja	0	0
1352	<acronym title="Contents Management System">CMS</acronym>	ja	0	0
1353	ブロック引用	ja	0	0
1354	インライン引用	ja	0	0
1355	テーブル	ja	0	0
1356	テーブルヘッダ	ja	0	0
1357	テーブルセル	ja	0	0
1358	削除	ja	0	0
1359	挿入	ja	0	0
1360	順序付きリスト - 各リスト項目を &lt;li&gt;&lt;/li&gt; で囲み、全体を &lt;ol&gt;&lt;/ol&gt; で囲みます。	ja	0	0
1361	1番目の項目	ja	0	0
1362	2番目の項目	ja	0	0
1363	順序無しリスト - 各リスト項目を &lt;li&gt;&lt;/li&gt; で囲み、全体を &lt;ul&gt;&lt;/ul&gt; で囲みます。	ja	0	0
1364	定義リストは他の HTML リストと似ています。 定義用語を &lt;dt&gt;&lt;/dt&gt; 、その用語の説明を&lt;dd&gt;&lt;/dd&gt; で囲み、全体を &lt;dl&gt;&lt;/dl&gt; で囲みます。	ja	0	0
1365	1番目の用語	ja	0	0
1366	1番目の定義	ja	0	0
1367	2番目の用語	ja	0	0
1368	2番目の定義	ja	0	0
1369	見出し レベル2	ja	0	0
1370	見出し レベル3	ja	0	0
1371	見出し レベル4	ja	0	0
1372	見出し レベル5	ja	0	0
1373	見出し レベル6	ja	0	0
1374	タグの説明	ja	0	0
1375	記述例	ja	0	0
1376	表示例	ja	0	0
1377	%tag タグのヘルプはありません。	ja	0	0
1378	\n<p>ほとんどの特殊記号は、特に問題なく直接入力することができます。</p>\n<p>問題が生じた場合は、HTMLのエンティティ表記を使用してみてください。 例えば、&amp;amp; と入力した場合はアンド記号の「&」のように表示されます。 エンティティの全リストは、HTMLの<a href="http://www.w3.org/TR/html4/sgml/entities.html">エンティティ</a>ページを参照してください。</p><p>エンティティ表記の一例：</p>	ja	0	0
1379	アンパサンド（&amp;）	ja	0	0
1380	大なり記号（&gt;）	ja	0	0
1381	小なり記号（&lt;）	ja	0	0
1382	引用符（&quot;）	ja	0	0
1383	文字の説明	ja	0	0
1384	HTMLタグは使用できません	ja	0	0
1385	行と段落は自動的に折り返されます。	ja	0	0
1386	行と段落は自動的に認識され、&lt;br /&gt;（改行タグ）や &lt;p&gt; &lt;/p&gt;（段落の開始・終了タグ）が自動的に挿入されます。 もし段落が認識されない場合は、空行を2つ加えてください。	ja	0	0
1387	ウェブページアドレスとメールアドレスは、自動的にハイパーリンクに変換されます。	ja	0	0
1388	入力書式	ja	0	0
1393	ユーザが投稿できるHTMLタグを制限し、許可されていないタグの除去やエンティティ表記への変換を行います。 また、JavaScriptのイベント・JavaScriptのURL・CSSスタイルなどの有害な内容を、除去されないタグから取り除きます。	ja	0	0
1394	段落や改行をHTMLタグ（&lt;p&gt;と&lt;br /&gt;）に変換します。	ja	0	0
1395	ウェブとメールのアドレスをクリックできるリンクに変換します。	ja	0	0
1396	投稿内の不完全なHTMLを訂正します。	ja	0	0
1397	HTMLタグのフィルタ	ja	0	0
1398	未許可のタグを除去	ja	0	0
1399	全タグをエンティティ（&xxx;）表記に変換	ja	0	0
1400	ユーザから投稿されたコンテンツ内にある、HTMLタグの処理方法を指定してください。 「未許可のタグを除去」を選択した場合は、以下で許可されているタグ以外は除去されます。 「全タグをエンティティ（&xxx;）表記に変換」を選択した場合は、すべてのタグをエンティティ表記に変換し、文字として表示されるようにします。	ja	0	0
1401	使用を許可する任意のHTMLタグを入力してください。 これらは上記の「HTMLタグのフィルタ」で「未許可のタグを除去」を選択した場合にのみ有効で、入力されたタグは除去されないようになります。 ただし、JavaScriptのイベント属性は常に除去されます。	ja	0	0
1402	HTMLヘルプの表示	ja	0	0
1403	詳細なHTMLヘルプを表示するかどうかを指定してください。 チェックを入れると、使用が許可されているタグのうち、一部の基本的なHTMLタグに関するヘルプを「<a href="?q=filter/tips">コンテンツ作成のヒント</a>」ページに表示します。	ja	0	0
1404	検索エンジンに対するリンク効果の抑止	ja	0	0
1405	すべてのリンクに <b>rel="nofollow"</b> を追加するかどうかを指定してください。 チェックを入れると、以下のようにアンカータグに rel="nofollow" が追加されます。<pre>&lt;a href="http://drupal.jp/" <strong>rel="nofollow"</strong>&gt;≡ Drupal Japan ≡&lt;/a&gt;</pre>これは、Googleをはじめとする多くの検索サイトで、検索結果の上位にリストアップされる条件の1つを抑止する働きがあり、主にスパムリンクの効果を減少させるために利用されます。 登録ユーザが投稿したコンテンツ内の正当なリンクに対しても働くことになりますので、匿名ユーザにのみ使用できる入力書式に適用することが、おそらく最も効果的です。	ja	0	0
1406	リンクテキストの最長文字数	ja	0	0
1407	リンクテキストとして使用できる文字数の上限を入力してください。 ここで指定された文字数より長いテキストは、体裁を崩すのを防ぐために切り落とされます。 ただし、この文字数はリンクテキスト部にのみ影響し、リンク（URL 文字列）自体には影響を与えません。	ja	0	0
1408	フィルタの管理	ja	0	0
1409	入力書式	ja	0	0
1410	許可するHTMLタグを含め、ユーザによって入力されたコンテンツのフィルタ方法を設定します。 また、モジュールによって提供されたフィルタを有効化できるようにします。	ja	0	0
1411	入力書式の削除	ja	0	0
1412	コンテンツ作成のヒント	ja	0	0
1413	並べ替え	ja	0	0
1414	ヘルプトピック	ja	0	0
1415	以下の項目にヘルプがあります：	ja	0	0
1416	%module モジュール用のヘルプはありません。	ja	0	0
1417	@module 管理ページ	ja	0	0
1418	このガイドは<a href="@drupal">Drupal</a>とそのモジュールの用途や設定の状況に応じたヘルプを提供し、より大規模なオンライン<a href="@handbook">Drupalハンドブック（英文）</a>を補足します。 オンラインハンドブックはより最新の情報が含まれ、ユーザが寄稿したコメントで注釈が付けられ、すべてのDrupalドキュメントの最も信頼できる基準点としての役目を果たします。	ja	0	0
1419	Help（ヘルプ）モジュールは、<a href="@drupal">Drupal</a>とそのモジュールの用途や設定の状況に応じたヘルプを提供し、より大規模なオンライン<a href="@handbook">Drupalハンドブック（英文）</a>を補足します。 オンラインハンドブックはより最新の情報が含まれ、ユーザが寄稿したコメントで注釈が付けられ、すべてのDrupalドキュメントの最も信頼できる基準点としての役目を果たします。	ja	0	0
1420	より詳しい情報は、オンラインハンドブックの<a href="@help">Help module（英文）</a>エントリを参照するか、日本サイトの<a href="http://drupal.jp/">&nbsp;≡ Drupal Japan ≡&nbsp;</a>を訪れてみてください。	ja	0	0
1421	Locale（ロケール）モジュールは、Drupalサイトをデフォルトの英語以外の言語で提供できる（多言語サイトを特徴づける機能）ようにします。 ロケールモジュールは、テキストが表示されようとしているときにそれを調べることで機能します。 表示すべき言語で翻訳されたテキストが用意されている場合、オリジナルテキストに優先して翻訳されたテキストを表示します。 翻訳されたテキストが用意されていない場合、オリジナルテキストが表示されるとともに、翻訳者があとでレビューできるように保存されます。	ja	0	0
1422	ロケールモジュールはDrupalインターフェイス翻訳の域を超え、多言語サイトのニーズに合わせて調整された機能セットを提供します。 言語ネゴシエーションは、各リクエストに使用されたパスやドメインに基づき、サイトの言語を自動的に変更できるようにします。 ユーザは「アカウント情報」ページで好みの言語を選択することができ、サイトはブラウザの優先言語設定に合わせた表示ができるように設定できます。 サイトコンテンツは有効化された言語での作成と翻訳ができ、各投稿はその翻訳のそれぞれに、言語特有のエイリアスを持つことができます。 ロケールモジュールは翻訳されたコンテンツの管理のために、<a href="@content-help">content translation（コンテンツ翻訳）モジュール</a>と協力して機能します。	ja	0	0
1423	翻訳は次のいずれかの方法で提供できます：	ja	0	0
1424	ロケールモジュールの統合化されたウェブインターフェイスで、オリジナルテキストを翻訳します。	ja	0	0
1425	翻訳パッケージとして知られている、既存の翻訳セットからファイルをインポートします。 翻訳パッケージは Gettext Portable Object （<em>.po</em>）形式のファイルを含み、特定の言語でDrupalの特定バージョンの表示をできるようにします。 Drupalのあらゆるバージョン用のすべての言語が入手できるとは限りませんが、多くの言語用の翻訳パッケージを<a href="@translations">Drupal translationページ</a>からダウンロードすることができます。	ja	0	0
1426	既存の翻訳パッケージがあなたのニーズを満たさない場合、デスクトップ用Gettextエディタを使用してパッケージ内のGettext Portable Object（<em>.po</em>）を変更したり、新しい<em>.po</em>ファイルを作成することもできます。 ロケールモジュールの<a href="@import">インポート</a>機能は、新規作成や変更した<em>.po</em>ファイルから翻訳文字列をサイトに加えられるようにします。 <a href="@export">エクスポート</a>機能はサイトの翻訳文字列から、他の人と共有したりデスクトップ用Gettextエディタで編集できるファイルを生成します。	ja	0	0
1427	より詳しい情報は、オンラインハンドブックの<a href="@locale">Locale module（英文）</a>エントリを参照するか、日本サイトの<a href="http://drupal.jp/">&nbsp;≡ Drupal Japan ≡&nbsp;</a>を訪れてみてください。	ja	0	0
1428	このページはサイトで使用可能な言語の概観を提供します。 複数の言語が有効化されている場合、サイトインターフェイスのテキストの翻訳や、登録ユーザによる「アカウント情報」ページでの好みの言語の選択、サイト投稿者による投稿作成時の特定言語の指定ができるようになります。 サイトのデフォルト言語は、匿名訪問者や好みの言語を選択していないユーザに使用されます。	ja	0	0
1429	サイトで利用可能な各言語は、名前、オプションの言語固有のパスやドメイン、文字の表示方向などを含む言語の詳細を、「編集」リンクから設定できます。 これらの言語は、多言語サポートのコンテンツタイプで投稿を作成する際、「言語」選択に現れます。	ja	0	0
1430	追加の言語を使用可能にする（また、利用可能であれば翻訳パッケージからファイルを自動的にインポートする）には<a href="@add-language">言語の追加ページ</a>を、手作業で翻訳したい文字列を見つけるには<a href="@search">インターフェイスの翻訳ページ</a>を、個別の<em>.po</em>ファイルから翻訳を追加するには<a href="@import">インポートページ</a>を、それぞれ使用してください。 <em>.po</em>ファイルを含んだ多くの寄与された翻訳パッケージが、<a href="@translations">Drupal.orgのtranslationsページ</a>から入手できます。	ja	0	0
1431	サイトでサポートするすべての言語を加えてください。 「言語名」ドロップダウンに希望する言語が無い場合、「カスタム言語」をクリックし、手作業で言語コードとその他の詳細を与えてください。 言語コードはブラウザが適切な表示言語の決定に使用する可能性があるため、手作業で与える場合には必ず標準化された言語コードを入力してください。	ja	0	0
1432	言語ネゴシエーションの設定は、サイトのプレゼンテーション言語を決定します。 利用できるオプションは以下のとおりです：	ja	0	0
1433	<strong>なし</strong>： デフォルト言語がサイトのプレゼンテーションに使用されますが、ユーザが「アカウント情報」ページで好みの言語を選択することもできます。（利用可能な場合、ユーザが設定した好みの言語はサイトメールにも使用されます）	ja	0	0
1434	<strong>パスプレフィックスのみ</strong>： 各言語用に指定されたパスプレフィックスがある場合、一致する言語コードやカスタム文字列をパスで調べることにより、プレゼンテーション言語を決定します。 適当なプレフィックスを識別できなかった場合、デフォルト言語が使用されます。<br /><em>例： "example.com/de/contact" の場合、パス内の"de"の使用に基づき、ドイツ語をプレゼンテーション言語に設定します。</em>	ja	0	0
1435	<strong>パスプレフィックス（代替言語あり）</strong>： 各言語用に指定されたパスプレフィックスがある場合、一致する言語コードやカスタム文字列をパスで調べることにより、プレゼンテーション言語を決定します。 適当なプレフィックスを識別できなかった場合、「アカウント情報」ページでのユーザの優先言語かブラウザの言語設定により、プレゼンテーション言語を決定します。 プレゼンテーション言語が決定できない場合、デフォルト言語が使用されます。	ja	0	0
1436	<strong>ドメイン名のみ</strong>： 各言語用に指定された言語ドメインがある場合、サイトのアクセスに使用されたドメインを調べることにより、プレゼンテーション言語を決定します。 一致するものが識別されない場合、デフォルト言語が使用されます。<br /><em>例： "http://de.example.com/contact"の場合、"http://de.example.com"で使用されたドメインに基づき、プレゼンテーション言語がドイツ語に設定されます。</em>	ja	0	0
1437	言語用のパスプレフィックスやドメイン名は、<a href="@languages">使用可能な言語</a>を編集することで設定できます。 適切な一致がない場合、サイトは<a href="@languages">デフォルト言語</a>で表示されます。	ja	0	0
1438	このページは利用できる翻訳可能な文字列の概観を提供します。 Drupalはテキストグループで翻訳可能な文字列を表示します。 モジュールが、他の翻訳文字列を含んだ追加のテキストグループを定義する場合があります。 テキストグループは関連する文字列をグループ化する方法を提供するため、Drupalインターフェイスの特定範囲に翻訳活動を集中させるために利用されます。	ja	0	0
1439	追加の言語サポートを加えるためのより詳しい情報は、<a href="@languages">言語ページ</a>を参照してください。	ja	0	0
1440	このページは、個別のGettext Portable Object（<em>.po</em>）ファイルに含まれる翻訳済み文字列をインポートします。 通常は翻訳パッケージ（各パッケージにはいくつかの<em>.po</em>ファイルを含むことができます）の一部として配布され、<em>.po</em>ファイルはインポート前に、Gettext翻訳エディタを使用してオフラインでの編集を必要とする場合があります。 個別の<em>.po</em>ファイルのインポート処理には、長い時間がかかる場合があります。	ja	0	0
1441	翻訳パッケージが用意されている場合、新しいモジュールやテーマが使用可能になった際や、新しい言語を追加した際、翻訳パッケージ内の<em>.po</em>ファイルが自動的にインポートされることに注意してください。 このページでは1度に1つの<em>.po</em>ファイルをインポートできるだけなので、翻訳パッケージのダウンロードと解凍を行い、それらをDrupalを設置したディレクトリに入れ、<a href="@language-add">言語の追加</a>（パッケージ内の全<em>.po</em>ファイルを自動的にインポートします）を行う方がより単純です。 翻訳パッケージは<a href="@translations">Drupal translationページ</a>からダウンロードすることができます。	ja	0	0
1442	このページは、サイトで使用されている翻訳済みの文字列をエクスポートします。 エクスポートされるファイルは、オリジナルの文字列と翻訳が含まれる「Gettext Portable Object（<em>.po</em>）形式（他の人と翻訳を共有するために使用）」か、オリジナルの文字列のみが含まれる「Gettext Portable Object Template（<em>.pot</em>）形式（Gettext翻訳エディタで新しい翻訳を作成するのに使用）」のいずれかになります。	ja	0	0
1443	このページは翻訳者が特定の翻訳済み・未翻訳の文字列を検索したり、翻訳の作成や編集に使用できます。 （注意： 一度に多数の文字列を翻訳する場合、文字列を<a href="@export">エクスポート</a>し、Gettext翻訳エディタでオフライン編集を行う方がより便利です） 検索する文字列は、以下のオプションによって、特定の言語やテキストグループ内に制限することができます。	ja	0	0
1444	このブロックは、<a href="@languages">最低でも2つの言語が使用可能にされ</a>、<a href="@configuration">言語ネゴシエーション</a>が「なし」以外に設定されている場合にのみ表示されます。	ja	0	0
1445	内蔵インターフェイス	ja	0	0
1446	言語の設定	ja	0	0
1447	メール用のデフォルト言語と、サイト表示用の好みの言語を指定してください。	ja	0	0
1448	メール用のデフォルト言語を指定してください。	ja	0	0
1449	このエイリアスを適用する言語を指定してください。 特定の言語を指定した場合、その言語で表示する際には常にこのパスエイリアスが使用され、「すべての言語」用に設定されたパスエイリアスに優先します。	ja	0	0
1450	多言語サポート	ja	0	0
1451	このコンテンツタイプの多言語サポートを、有効にするかどうかを指定してください。 有効にした場合、<a href="!languages">使用可能な言語</a>から1つを選ぶことのできる、言語選択フィールドが編集フォームに追加されます。 無効にした場合、新しい投稿はデフォルト言語で保存されます。 このオプションの変更によって、既存のコンテンツに影響を与えることはありません	ja	0	0
1452	すべて	ja	0	0
1453	言語スイッチャー	ja	0	0
1454	言語の管理	ja	0	0
1455	インターフェイスの翻訳	ja	0	0
1456	コンテンツとユーザインターフェイスの言語を設定します。	ja	0	0
1457	言語の編集	ja	0	0
1458	インターフェイスの翻訳	ja	0	0
1459	内蔵インターフェイスやオプションの他のテキストを翻訳します。	ja	0	0
1460	概観	ja	0	0
1461	文字列の編集	ja	0	0
1462	文字列の削除	ja	0	0
1463	!long-month-name 1月	ja	0	0
1464	1月	ja	0	0
1465	!long-month-name 2月	ja	0	0
1466	2月	ja	0	0
1467	!long-month-name 3月	ja	0	0
1468	3月	ja	0	0
1469	!long-month-name 4月	ja	0	0
1470	4月	ja	0	0
1471	!long-month-name 5月	ja	0	0
1472	5月	ja	0	0
1473	!long-month-name 6月	ja	0	0
1474	6月	ja	0	0
1475	!long-month-name 7月	ja	0	0
1476	7月	ja	0	0
1477	!long-month-name 8月	ja	0	0
1478	8月	ja	0	0
1479	!long-month-name 9月	ja	0	0
1480	9月	ja	0	0
1481	!long-month-name 10月	ja	0	0
1482	10月	ja	0	0
1483	!long-month-name 11月	ja	0	0
1484	11月	ja	0	0
1485	!long-month-name 12月	ja	0	0
1486	12月	ja	0	0
1487	木	ja	0	0
1488	金	ja	0	0
1489	土	ja	0	0
1490	日	ja	0	0
1491	月	ja	0	0
1492	火	ja	0	0
1493	水	ja	0	0
1494	午前	ja	0	0
1495	午後	ja	0	0
1496	午前	ja	0	0
1497	午後	ja	0	0
1498	メニュー項目はまだありません。	ja	0	0
1499	無効	ja	0	0
1500	リセット	ja	0	0
1501	メニュー項目	ja	0	0
1502	展開	ja	0	0
1503	メニューの設定	ja	0	0
1504	このメニュー項目がリンクするパスを入力してください。 パスには %add-node のようなDrupalの内部パスや、 %drupal のような外部のURLを指定できます。 %front を入力するとフロントページへのリンクとなります。	ja	0	0
1505	メニューリンクのタイトル	ja	0	0
1506	メニューで表示される、項目に対応したリンクテキストを入力してください。	ja	0	0
1507	マウスカーソルをメニュー項目に乗せた際に表示される、簡単な説明文を入力してください。	ja	0	0
1508	この項目を有効にする場合はチェックを入れてください。 有効にされていないメニュー項目は、いかなるメニューにもリストされません。	ja	0	0
1591	本当に、コンテンツタイプ %type を削除してもよろしいですか？	ja	0	0
1509	このメニュー項目の下位にサブメニューがあり、常にそれを展開した状態で表示したい場合は、ここにチェックを入れてください。	ja	0	0
1510	メニュー内での上位となる項目を指定してください。 メニュー項目とそのすべての下位項目の階層最大深度は !maxdepth に固定されます。 メニュー内で最大深度にある項目は、上位項目として利用できなくなっています。	ja	0	0
1511	同じ階層にあるメニュー間での表示順位を決める、ウェイトを指定してください。ウェイトの数値が小さいほど上部に、大きいほど下部に配置されます。	ja	0	0
1512	メニューリンクの保存中にエラーが発生しました。	ja	0	0
1513	メニューの名前	ja	0	0
1514	このメニューの「コンピュータが扱える名前」を入力してください。 このテキストは、このメニュー用の「メニューの概観」ページのURLを構築するために使用されます。 名前には小文字・数字・ハイフンのみが含まれ、固有である必要があります。	ja	0	0
1515	本当に、カスタムメニュー %title を削除してもよろしいですか？	ja	0	0
1516	カスタムメニュー %title が削除されました。	ja	0	0
1517	メニューの名前には英小文字・数字・ハイフンのみが使用できます。	ja	0	0
1518	メニューはすでに存在します。	ja	0	0
1519	本当に、カスタムメニュー項目 %item を削除してもよろしいですか？	ja	0	0
1520	メニュー項目 %title が削除されました。	ja	0	0
1521	本当に、アイテム %item をデフォルトの値に戻してもよろしいですか？	ja	0	0
1522	すべての変更は失われます。この操作は元に戻すことができませんので、十分に注意して実行してください。	ja	0	0
1523	メニュー項目はデフォルトの設定に戻されました。	ja	0	0
1524	メニューモジュールはコンテンツの作成フォーム内で、その場でメニューリンクを作成できるようにします。 以下のオプションは、新しいリンクが加えられるデフォルトメニューを設定します。	ja	0	0
1525	コンテンツ用デフォルトメニュー	ja	0	0
1526	コンテンツの作成フォームでの、メニューオプションのデフォルトとするメニューを指定してください。	ja	0	0
1527	プライマリリンクなし	ja	0	0
1528	プライマリリンク用ソース	ja	0	0
1529	プライマリリンクとして表示するものを指定してください。	ja	0	0
1530	セカンダリリンクなし	ja	0	0
1531	セカンダリリンク用ソース	ja	0	0
1532	セカンダリリンクとして表示するものを指定してください。 セカンダリリンクにはプライマリリンク（現在は%primary）と同じメニューを指定することもできます。 その場合、アクティブなプライマリリンクの下位項目がセカンダリリンクとして表示されます。	ja	0	0
1533	カスタムメニュー %title と、すべてのメニュー項目が削除されました。	ja	0	0
1534	メニュー項目 %title が削除されました。	ja	0	0
1535	<strong>警告：</strong> 現時点で %title には 1 のメニュー項目がありますが、それは削除（システム定義の項目はリセット）されます。	ja	0	0
1536	<strong>警告：</strong> 現時点で %title に @count のメニュー項目がありますが、それらは削除（システム定義の項目はリセット）されます。	ja	1535	1
1537	Menu（メニュー）モジュールは、Drupalの強力なメニューシステムのコントロールとカスタマイズができる、インターフェイスを提供します。 メニューは、サイトのナビゲーションに使用される階層構造のリンク（メニュー項目）集で、Drupalの柔軟なブロックシステムを使用して配置や表示が行われます。 デフォルトでインストール時に<em>Navigation（ナビゲーション）</em>、<em>Primary links（プライマリリンク）</em>、<em>Secondary links（セカンダリリンク）</em>の3つのメニューが作成されます。 「ナビゲーション」メニューはサイトと共に動作し、ナビゲートに必要なほとんどのリンクを含み、多くの場合左右どちらかのサイドバー内に表示されます。 また、大部分のDrupalテーマでは、各ページのヘッダやフッタに表示される「プライマリリンク」と「セカンダリリンク」をサポートしています。 デフォルトで「プライマリリンク」と「セカンダリリンク」にメニュー項目は含まれていませんが、サイト特有のカスタムメニュー項目を含めるために設定することができます。	ja	0	0
1538	<a href="@menu">メニューページ</a>では、サイトで現在利用可能なすべてのメニューが表示されます。 メニュー項目の追加や編集、メニュー内での項目の再配置をするには、このリストからメニューを選択してください。 <a href="@add-menu">メニューの追加ページ</a>で新しいメニューを作成できます。（新しいメニューを含んだブロックも<a href="@blocks">ブロックの管理ページ</a>で有効化する必要があります)	ja	0	0
1539	より詳しい情報は、オンラインハンドブックの<a href="@menu">Menu module（英文）</a>エントリを参照するか、日本サイトの<a href="http://drupal.jp/">&nbsp;≡ Drupal Japan ≡&nbsp;</a>を訪れてみてください。	ja	0	0
1540	メニューはサイトのナビゲーションに使用されるリンク（メニュー項目）集です。 以下はサイトで現在使用可能なメニューです。 メニュー項目を管理するには、リストからメニューを選択してください。	ja	0	0
1541	新しく作成したいメニューの名称を入力してください。 新しいメニューブロックを表示するためには、<a href="@blocks">ブロックの管理ページ</a>で有効化する必要があることを忘れないでください。	ja	0	0
1592	コンテンツタイプ %name が削除されました。	ja	0	0
1593	ノード	ja	0	0
1594	コンテンツタイプ %name が追加されました。	ja	0	0
1595	コンテンツタイプ %name が削除されました。	ja	0	0
1596	1 投稿のコンテンツタイプが、%old-type から %type に変更されました。	ja	0	0
1542	メニュー項目を再配置するには、「メニュー項目」カラムにあるドラッグアンドドロップハンドル（十字の矢印）をつかみ（ハンドルをつかむには、ハンドルアイコン上でマウスの左ボタンを押下したままにします）、リスト中の新しい位置へメニュー項目（またはメニュー項目のグループ）をドラッグしてください。 ページ下部にある「設定の保存」ボタンをクリックするまで、変更が保存されないことに注意してください。	ja	0	0
1543	新しいメニュー項目のタイトルとパスを入力してください。	ja	0	0
1544	このメニュー項目を削除	ja	0	0
1545	メニューで表示される、項目に対応したリンクテキストを入力してください。 この投稿をメニューに追加したくない場合は空欄にしてください。	ja	0	0
1546	メニューの管理	ja	0	0
1547	メニュー	ja	0	0
1548	サイトのナビゲーションメニュー、プライマリリンク、セカンダリリンクのコントロールや、メニュー項目のリネームや再編成をします。	ja	0	0
1549	メニューの一覧	ja	0	0
1550	メニューの追加	ja	0	0
1551	メニューのカスタマイズ	ja	0	0
1552	項目の一覧	ja	0	0
1553	項目の追加	ja	0	0
1554	メニューの編集	ja	0	0
1555	メニューの削除	ja	0	0
1556	メニュー項目の編集	ja	0	0
1557	メニュー項目のリセット	ja	0	0
1558	メニュー項目の削除	ja	0	0
1559	ナビゲーションメニューはDrupalによって提供され、あらゆるサイトにとってメインの対話型メニューです。 通常、匿名ユーザには表示されない認証済みユーザ用の個別リンクを含む、唯一のメニューです。	ja	0	0
1560	プライマリリンクはサイトの主要なセクションを表示するために、多くの場合テーマ層において使用されます。 プライマリリンクの典型的な表現は、トップに沿ったタブになります。	ja	0	0
1561	セカンダリリンクは、リーガルノーティスやコンタクトの詳細、プライマリリンクより下位の役割を果たす副ナビゲーション項目のように、多くの場合はページ用に使用されます。	ja	0	0
1562	利用できるコンテンツタイプはありません。	ja	0	0
1563	このコンテンツタイプの「人が読める名前」を入力してください。 このテキストは「コンテンツの作成」ページのリストの一部として表示されます。 名前は大文字から始まり、文字・数字・空白文字のみが含まれることを推奨します。 この名前は固有である必要があります。	ja	0	0
1564	このコンテンツタイプの「コンピュータが扱える名前」を入力してください。 このテキストは、このコンテンツタイプ用の「コンテンツの作成」ページのURLを構築するために使用されます。 名前には小文字・数字・アンダースコア（下線）のみが含まれる必要があります。 アンダースコアは「コンテンツの作成」ページのURLを構築する際、ハイフンに変換されます。 この名前は固有である必要があります。	ja	0	0
1565	このコンテンツタイプの「コンピュータが扱える名前」です。 システム定義のコンテンツタイプのため、このフィールドは編集できません。	ja	0	0
1566	このコンテンツタイプの簡単な説明を記入してください。 このテキストは「コンテンツの作成」ページのリストの一部として表示されます。	ja	0	0
1567	投稿フォームの設定	ja	0	0
1568	タイトルフィールドのラベル	ja	0	0
1569	このコンテンツタイプにはタイトルフィールドがありません。	ja	0	0
1570	本文フィールドのラベル	ja	0	0
1571	本文フィールドに付けるラベルを入力してください。 このコンテンツタイプに本文フィールドが不要の場合は、このフィールドを空欄にしてください。	ja	0	0
1572	最少の単語数	ja	0	0
1573	有効な投稿と見なされる、本文フィールドでの最少の単語数を指定してください。 これは、短いテスト投稿など、サイトの基準に満たない投稿を除外するのに役立ちます。 <b>なお、単語数は英語のように空白文字で区切られたものを1つと数えます。 従って、日本語のように空白文字での分かち書きをしない言語では、期待される効果は得られず投稿自体ができなくなりますので、常に <em>0</em> を指定してください。</b>	ja	0	0
1574	説明や投稿のガイドライン	ja	0	0
1575	投稿フォームに記載したい追加のテキストを記入してください。 このテキストは投稿フォームの最上部に表示され、ユーザが投稿を円滑に進める手助けをしたり、なんらかの指示をするのに役立ちます。	ja	0	0
1576	ワークフローの設定	ja	0	0
1577	デフォルトオプション	ja	0	0
1578	フロントページへ掲載	ja	0	0
1579	リスト上部に固定	ja	0	0
1580	新しいリビジョンの作成	ja	0	0
1581	投稿されるコンテンツのデフォルト状態を指定してください。 ただし、「ノードの管理」権限を持ったユーザは常に設定を変更することができます。	ja	0	0
1582	コンテンツタイプの保存	ja	0	0
1583	コンテンツタイプの削除	ja	0	0
1584	タイプ %type は、すでに使用されています。	ja	0	0
1585	「コンピュータが扱える名前」には、英小文字・数字・アンダースコア（下線）のみを含むことができます。	ja	0	0
1586	無効な「コンピュータが扱える名前」です。 %invalid 以外の名前を入力してください。	ja	0	0
1587	名前 %name は、すでに使用されています。	ja	0	0
1588	コンテンツタイプ %name がデフォルト値にリセットされました。	ja	0	0
1589	コンテンツタイプ %name が更新されました。	ja	0	0
1590	コンテンツタイプ %name が追加されました。	ja	0	0
1597	@count 投稿のコンテンツタイプが、%old-type から %type に変更されました。	ja	1596	1
1598	<strong>警告：</strong> 現在サイト上に 1 の %type 投稿があります。 このコンテンツタイプを削除した場合、この投稿の正しい表示や編集ができなくなる可能性があります。	ja	0	0
1599	<strong>警告：</strong> 現在サイト上に @count の %type 投稿があります。 このコンテンツタイプを削除した場合、これらの投稿の正しい表示や編集ができなくなる可能性があります。	ja	1598	1
1600	サイトがコンテンツへのアクセス権で問題を抱えている場合、アクセス権のキャッシュを再構築する必要があるかもしれません。 アクセス権の問題で考えられる原因は、無効化されているモジュールや、アクセス権の設定変更です。 再構築すると投稿に対するすべての特権が取り除かれ、それらを現在のモジュールと設定に基づくアクセス権に置き換えます。	ja	0	0
1601	多くのコンテンツや複雑な権限設定がある場合、再構築には多少時間がかかります。 再構築の完了後、投稿は自動的に新しいアクセス権を使用します。	ja	0	0
1602	ノードアクセスの状態	ja	0	0
1603	アクセス権の再構築	ja	0	0
1604	メインページの投稿数	ja	0	0
1605	各メインページに表示するデフォルトの最大投稿数を指定してください。 メインページはフロントページ（例：node）やカテゴリごとのページ（例：taxonomy/term/5）のような、タイトルやティーザーを一覧表示するページを指します。	ja	0	0
1606	ティーザーの文字数	ja	0	0
1607	200文字	ja	0	0
1608	400文字	ja	0	0
1609	600文字	ja	0	0
1610	800文字	ja	0	0
1611	1000文字	ja	0	0
1612	1200文字	ja	0	0
1613	1400文字	ja	0	0
1614	1600文字	ja	0	0
1615	1800文字	ja	0	0
1616	2000文字	ja	0	0
1617	ティーザーに使用する最大文字数を指定してください。 Drupalは指定された文字数を基準に、長い投稿を切り取ります。 この切り取られた投稿は一般に、「ティーザー」としてメインページでの表示や、XMLフィードなどに利用されます。 ティーザーの表示を無効にしたい場合は、この文字数を「無制限」に指定してください。 この設定は新規や更新されたコンテンツにのみ影響し、既存のティーザーには影響を与えないことに留意してください。 また、文字数は英語を基準にしているため、日本語では設定値の半分以下になることにも留意してください。	ja	0	0
1618	投稿のプレビュー	ja	0	0
1619	投稿前のプレビューを必須とするかどうかを指定してください。 「必須」にした場合、投稿前に「プレビュー」ボタンをクリックし、記入した投稿に目を通すことをユーザに義務づけます。	ja	0	0
1620	本当に、サイトコンテンツの権限を再構築してもよろしいですか？	ja	0	0
1621	この操作はサイトコンテンツのすべての権限を再構築し、処理に時間がかかる場合もあります。 この操作は元に戻すことができませんので、十分に注意して実行してください。	ja	0	0
1622	掲載する	ja	0	0
1623	非掲載にする	ja	0	0
1624	フロントページへ掲載する	ja	0	0
1625	フロントページから撤去する	ja	0	0
1626	リスト上部へ固定する	ja	0	0
1627	リスト上部への固定を解除する	ja	0	0
1628	掲載	ja	0	0
1629	非掲載	ja	0	0
1630	フロントページに掲載されている	ja	0	0
1631	フロントページに掲載されていない	ja	0	0
1632	リスト上部に固定されている	ja	0	0
1633	リスト上部に固定されていない	ja	0	0
1634	翻訳が最新	ja	0	0
1635	翻訳が旧式	ja	0	0
1636	タイプ	ja	0	0
1637	カテゴリ	ja	0	0
1638	言語	ja	0	0
1639	表示項目の絞り込み	ja	0	0
1640	<em>かつ</em> <strong>%a</strong> が <strong>%b</strong>	ja	0	0
1641	<strong>%a</strong> が <strong>%b</strong>	ja	0	0
1642	アップデートはエラーに遭遇しました。	ja	0	0
1643	エラーが発生し、処理は完了しませんでした。	ja	0	0
1644	項目が選択されていません。	ja	0	0
1645	本当に、これらのアイテムを削除してもよろしいですか？	ja	0	0
1646	アイテムは削除されました。	ja	0	0
1647	1 アイテムが正常に処理されました：	ja	0	0
1648	@count アイテムが正常に処理されました：	ja	1647	1
1649	@nameの作成	ja	0	0
1650	リビジョン情報	ja	0	0
1651	ログメッセージ	ja	0	0
1652	追加や更新について残しておきたい説明やメッセージを記入してください。 他のユーザがこのページを編集する際、それを行った動機を理解するのに役立ちます。 また、自分が編集する際の備忘録としても活用できます。	ja	0	0
1653	投稿の情報	ja	0	0
1654	投稿者の名前を入力してください。 空欄にすると %anonymous の投稿として扱われます。	ja	0	0
1655	投稿日時を %time の形式で入力してください。 空欄にすると投稿した日時が使用されます。	ja	0	0
1656	掲載オプション	ja	0	0
1657	全文表示でティーザー（概要）を表示する	ja	0	0
1658	ティーザーのプレビューは、この投稿がメインページに掲載される際や、記事配信用のフィードに書き出される際に、どのように表示されるかを示しています。 <span class="no-js">分割する部分を自分で調整したい場合は、分割したい箇所に区切り記号 <b>&lt;!--break--&gt;</b> を挿入してください。</span>	ja	0	0
1659	ティーザーのプレビュー	ja	0	0
1660	全文のプレビュー	ja	0	0
1661	@type %title が作成されました。	ja	0	0
1662	@type %title が更新されました。	ja	0	0
1663	投稿が保存できませんでした。	ja	0	0
1664	本当に、%title を削除してもよろしいですか？	ja	0	0
1665	%title のリビジョン	ja	0	0
1666	リビジョン	ja	0	0
1667	!date - !username	ja	0	0
1668	現在のリビジョン	ja	0	0
1669	戻す	ja	0	0
1670	本当に、%revision-date 時点のリビジョンに戻してもよろしいですか？	ja	0	0
1671	戻す	ja	0	0
1672	%date 時点でのリビジョンのコピーです。	ja	0	0
1673	@type %title は %revision-date 時点のリビジョンに戻されました。	ja	0	0
1674	本当に、%revision-date 時点のリビジョンを削除してもよろしいですか？	ja	0	0
1675	@type %title の %revision-date 時点のリビジョンが削除されました。	ja	0	0
1676	@type： %title が追加されました。	ja	0	0
1677	@type： %title が更新されました。	ja	0	0
1678	@type： %title がリビジョン %revision に戻されました。	ja	0	0
1679	@type： %title のリビジョン %revision が削除されました。	ja	0	0
1680	コンテンツのアクセス権を再構築する必要があります。	ja	0	0
1681	コンテンツのアクセス権を再構築する必要があります。 <a href="@node_access_rebuild">このページ</a>にアクセスしてください。	ja	0	0
1682	Node（ノード）モジュールはサイトのコンテンツを管理し、すべての投稿をタイプにかかわらず「ノード」として格納します。 ノードモジュールは基本的な公開状態（掲載・フロントページに掲載・リスト上部に固定）の設定とともに、投稿の著者に関する基本的な情報を記録します。 任意で編集のリビジョンコントロールができます。 機能性を追加するために、ノードモジュールはたびたび他のモジュールによって拡張されます。	ja	0	0
1683	サイトの各投稿はノードであるとともに特定の<a href="@content-type">コンテンツタイプ</a>でもあります。 <a href="@content-type">コンテンツタイプ</a>は、それらの追加・編集ページで表示されるフィールドのタイトルや説明を含む、投稿の特性を定義するために使用されます。 各コンテンツタイプは「掲載オプション」や他のワークフローコントロール用に、異なるデフォルト設定を持つことができます。 Drupalの標準インストールでは、デフォルトで「ページ」と「ストーリー」の2つのコンテンツタイプが定義されます。 新規追加や既存コンテンツタイプの編集には、<a href="@content-type">コンテンツタイプのページ</a>を使用します。 追加のコアモジュールや拡張モジュールを有効にすると、追加コンテンツタイプが利用できるようになります。	ja	0	0
1684	<a href="@content">コンテンツの管理ページ</a>では、サイトコンテンツのレビューや管理をすることができます。 <a href="@post-settings">投稿の設定ページ</a>では、投稿表示用の特定オプションを設定することができます。 ノードモジュールは各コンテンツタイプ用に、<a href="@permissions">権限のページ</a>でロール単位に設定できる多くの権限を利用できるようにします。	ja	0	0
1685	より詳しい情報は、オンラインハンドブックの<a href="@node">Node module（英文）</a>エントリを参照するか、日本サイトの<a href="http://drupal.jp/">&nbsp;≡ Drupal Japan ≡&nbsp;</a>を訪れてみてください。	ja	0	0
1686	以下はサイトの全コンテンツタイプ一覧です。 サイトに存在するすべての投稿は、これらのコンテンツタイプの実体となります。	ja	0	0
1687	新しいコンテンツタイプを作成するには、「人が読める名前」や「コンピュータが扱える名前（タイプ）」など、必要なすべてのフィールドに入力してください。 作成後、サイトのユーザは、このコンテンツタイプの実体である投稿を作成できるようになります。	ja	0	0
1688	リビジョンは投稿の複数バージョン間の差違を追跡できるようにします。	ja	0	0
1689	この投稿が全文表示される際に概要を表示しないよう指定されましたが、概要が空欄の場合はこの設定は無視されます。	ja	0	0
1690	この投稿が全文表示される際に概要を表示しないよう指定されましたが、概要が定義されていないため、この設定は無視されました。 （概要を定義するには、概要の終わりとメインコンテンツの始まりを示す区切り文字 <em>&lt;!--break--&gt;</em> を、投稿の本文に挿入してください）	ja	0	0
1691	@type の @body_label が短すぎます。 最低でも %words の単語が必要です。	ja	0	0
1692	このコンテンツは別のユーザによって修正されました。 変更は保存できません。	ja	0	0
1693	ユーザ名 %name が存在しません。	ja	0	0
1694	@type %title が削除されました。	ja	0	0
1695	%date 時点での %title のリビジョン	ja	0	0
1696	ログ	ja	0	0
1697	コンテンツの順位	ja	0	0
1698	以下で、検索結果をリストアップする際の並び順を決定する、それぞれの要素ごとの重要度を指定してください。 数値が大きい（※1）要素の条件に合うコンテンツほど、上位にリストアップされやすくなります。 また、<b>0</b> を指定した要素は無視されます。 なお、これらの値は変更してもインデックスの再構築の必要はなく、ただちに検索結果に反映されるようになります。<br />※1 この項目は他の設定での「ウェイト」とは逆に、数値が大きいほど優先順位が高くなることに留意してください。	ja	0	0
1699	キーワードの適合率	ja	0	0
1700	投稿日時の新しさ	ja	0	0
1701	コメント数	ja	0	0
1702	参照回数	ja	0	0
1703	要素	ja	0	0
1704	続きを読む	ja	0	0
1705	!title の続きを読む	ja	0	0
1706	記事配信	ja	0	0
1708	<h1 class="title">Drupal ウェブサイトへようこそ！</h1><p>以下の手順に従って、セットアップとウェブサイトの運営を始めてください。</p>	ja	0	0
1709	<strong>ウェブサイトの各種設定</strong> 管理者アカウントでログインし、<a href="@admin">管理セクション</a>へアクセスしてください。 管理セクションではウェブサイトの全体的な<a href="@config">設定やカスタマイズ</a>を行うことができます。	ja	0	0
1710	<strong>必要な機能の有効化</strong> 次に、<a href="@modules">モジュールリスト</a>にアクセスし、目的にあった機能（モジュール）を有効化してください。 <a href="@download_modules">Drupalモジュールのダウンロードページ</a>では、コアに含まれないさまざまな機能を追加する拡張モジュールを見つけることができます。	ja	0	0
1711	<strong>ウェブサイトデザインのカスタマイズ</strong> ウェブサイトのルック＆フィールをカスタマイズするには、<a href="@themes">テーマの設定ページ</a>にアクセスしてください。 はじめから用意されているテーマから選ぶか、<a href="@download_themes">Drupalテーマのダウンロードページ</a>で好みのテーマを入手することができます。	ja	0	0
1712	<strong>コンテンツの投稿を開始</strong> さあ、<a href="@content">コンテンツを作成</a>し、ウェブサイトの運営を始めてください。 あなたが最初の投稿をフロントページに掲載するとともに、このメッセージは表示されなくなります。	ja	0	0
1713	さらに詳しい情報は、<a href="@help">ヘルプページ</a>や<a href="@handbook">オンラインDrupalハンドブック（英語）</a>を参照してください。 また、<a href="@forum">Drupal forum（英語）</a>への投稿や、<a href="@support">Support ページ（英語）</a>で広範囲にわたるサポート情報の入手ができます。</p><p>あまり英語が得意でない方は、日本サイトの<a href="http://drupal.jp/"> ≡ Drupal Japan ≡ </a>を訪れてみてください。 何か役に立つ情報があるかもしれません。	ja	0	0
1714	高度な検索	ja	0	0
1715	以下のいずれかのワードを含む	ja	0	0
1716	以下のフレーズを含む	ja	0	0
1717	以下のいずれのワードも含まない	ja	0	0
1718	カテゴリを限定	ja	0	0
1719	コンテンツタイプを限定	ja	0	0
1720	コンテンツのアクセス権の再構築	ja	0	0
1721	コンテンツの権限が再構築されました。	ja	0	0
1722	コンテンツのアクセス権が再構築されました。	ja	0	0
1723	コンテンツのアクセス権が適切に再構築されませんでした。	ja	0	0
1724	投稿者：!username 投稿日時：@datetime	ja	0	0
1725	新しい投稿の保存時、または既存の投稿の更新時	ja	0	0
1726	新しい投稿の保存後	ja	0	0
1727	更新された投稿の保存後	ja	0	0
1728	投稿の削除後	ja	0	0
1729	ログイン中のユーザによるコンテンツの表示時	ja	0	0
1730	投稿を掲載する	ja	0	0
1731	投稿を非掲載にする	ja	0	0
1732	リスト上部へ固定する	ja	0	0
1733	リスト上部への固定を解除する	ja	0	0
1734	投稿をフロントページへ掲載する	ja	0	0
1735	投稿をフロントページから撤去する	ja	0	0
1736	投稿者を変更する	ja	0	0
1737	投稿を保存する	ja	0	0
1738	キーワードを含む投稿を非掲載にする	ja	0	0
1739	所有権を割り当てたいユーザ名を指定してください。	ja	0	0
1740	有効なユーザ名を入力してください。	ja	0	0
1741	キーワードとする文字の並びをコンマで区切って列挙してください。 列挙されたいずれかの文字の並びがコメントに含まれる場合、投稿は非公開にされます。 文字の並びの大文字・小文字は区別されます。<br />例： funny, bungee jumping, "Company, Inc."（キーワードにコンマを含む場合はダブルクォートで括ります）	ja	0	0
1742	@type： %title が削除されました。	ja	0	0
1743	@type %title が掲載されました。	ja	0	0
1744	@type %title が非掲載にされました。	ja	0	0
1745	@type %title がリスト上部に固定されました。	ja	0	0
1746	@type %title がリスト上部への固定を解除されました。	ja	0	0
1747	@type %title がフロントページに掲載されました。	ja	0	0
1748	@type %title がフロントページから撤去されました。	ja	0	0
1749	@type %title が保存されました。	ja	0	0
1750	@type %title の所有者がuid %name に変更されました。	ja	0	0
1751	コンテンツタイプの管理	ja	0	0
1752	ノードの管理	ja	0	0
1753	コンテンツへのアクセス	ja	0	0
1754	リビジョンの表示	ja	0	0
1755	リビジョンの復帰	ja	0	0
1756	サイトのコンテンツを表示・編集・削除します。	ja	0	0
1757	投稿の設定	ja	0	0
1758	ティーザーの長さや投稿前プレビューの義務づけ、フロントページに表示する投稿数など、投稿に関する振る舞いをコントロールします。	ja	0	0
1759	投稿を管理するためのコンテンツタイプを管理（フロントページへの掲載やコメントの設定など、デフォルトの状態を含む）します。	ja	0	0
1760	コンテンツタイプの追加	ja	0	0
1761	コンテンツの作成	ja	0	0
1762	リビジョン	ja	0	0
1763	以前のリビジョンに戻す	ja	0	0
1764	以前のリビジョンを削除	ja	0	0
1765	ブックコンテンツの作成	ja	0	0
1766	ページコンテンツの作成	ja	0	0
1767	ストーリーコンテンツの作成	ja	0	0
1768	任意のブックコンテンツの削除	ja	0	0
1769	任意のページコンテンツの削除	ja	0	0
1770	任意のストーリーコンテンツの削除	ja	0	0
1771	自分のブックコンテンツの削除	ja	0	0
1772	自分のページコンテンツの削除	ja	0	0
1773	自分のストーリーコンテンツの削除	ja	0	0
1774	リビジョンの削除	ja	0	0
1775	任意のブックコンテンツの編集	ja	0	0
1776	任意のページコンテンツの編集	ja	0	0
1777	任意のストーリーコンテンツの編集	ja	0	0
1778	自分のブックコンテンツの編集	ja	0	0
1779	自分のページコンテンツの編集	ja	0	0
1780	自分のストーリーコンテンツの編集	ja	0	0
1781	新規アカウントの作成	ja	0	0
1782	表示するユーザの絞り込み	ja	0	0
1783	<em>かつ</em> その <strong>%property</strong> が <strong>%value</strong>	ja	0	0
1784	<strong>%property</strong> が <strong>%value</strong>	ja	0	0
1785	ユーザ登録から	ja	0	0
1786	前回のアクセス	ja	0	0
1787	ブロック	ja	0	0
1788	アクティブ	ja	0	0
1789	ユーザが選択されていません。	ja	0	0
1790	ユーザ登録の設定	ja	0	0
1791	新規アカウントの登録方法	ja	0	0
1792	訪問者が新規アカウントを作成できる（管理者の承認は<b>不要</b>）	ja	0	0
1793	訪問者が新規アカウントを作成できる（管理者の承認が<b>必要</b>）	ja	0	0
1794	訪問者がアカウントを作成する際にメールの確認が必要	ja	0	0
1795	ユーザが入力したメールアドレスの有効性を、確認するかどうかを指定してください。 チェックを入れると、新しいユーザはシステムが自動生成したパスワードをメールで受け取り、それを使用することでログインできるようになります。 チェックを入れない場合、新しいユーザ自身が任意のパスワードを登録し、その直後からログインできるようになります。	ja	0	0
1796	ユーザ登録のガイドライン	ja	0	0
1797	ユーザ登録の際にユーザへ提示したいテキストを記入してください。<br />\nこのテキストはユーザ登録フォームの一番上に表示され、ユーザ登録を円滑に進めてもらうための説明などを掲示するのに役立ちます。	ja	0	0
1798	ユーザ宛メールの設定	ja	0	0
1799	サイトで新規ユーザ登録があった際には常に、Drupalはメールを送信します。 また任意で、その他のアカウントアクション後にユーザへ通知することができます。 シンプルなテンプレートを使用し、サイトの特定のニーズに合うように通知メールをカスタマイズできます。	ja	0	0
1800	<br>\n利用可能な変数:	ja	0	0
1801	管理者の作成した新規ユーザへのウェルカム	ja	0	0
1802	管理者が作成した新しいユーザアカウントへ送信する、ウェルカムメールのメッセージをカスタマイズしてください。	ja	0	0
1803	承認不要の新規ユーザへのウェルカム	ja	0	0
1804	管理者による承認が不要の場合に登録と同時に新しいユーザへ送信する、ウェルカムメールのメッセージをカスタマイズしてください。	ja	0	0
1805	管理者の承認待ち新規ユーザへのウェルカム	ja	0	0
1806	管理者による承認が必要な場合に登録と同時に新しいユーザへ送信する、ウェルカムメールのメッセージをカスタマイズしてください。	ja	0	0
1807	パスワード再発行メール	ja	0	0
1808	パスワードの再発行を要求したユーザへ送信する、メールのメッセージをカスタマイズしてください。	ja	0	0
1809	アカウントの有効化メール	ja	0	0
1810	管理者による承認が必要なサイトで、すでに登録されたユーザのアカウントを管理者が有効化した際にユーザへ送信する、メールのメッセージのカスタマイズと、送信するかどうかを指定してください。	ja	0	0
1811	アカウントが有効化された際にユーザへ通知	ja	0	0
1812	アカウントブロックのメール	ja	0	0
1813	アカウントがブロックされた際にユーザへ送信する、メールのメッセージのカスタマイズと、送信するかどうかを指定してください。	ja	0	0
1814	アカウントがブロックされた際にユーザへ通知	ja	0	0
1815	アカウント削除のメール	ja	0	0
1816	アカウントが削除された際にユーザへ送信する、メールのメッセージのカスタマイズと、送信するかどうかを指定してください。	ja	0	0
1817	アカウントが削除された際にユーザへ通知	ja	0	0
1818	署名	ja	0	0
1819	署名のサポート	ja	0	0
1820	ユーザアバター	ja	0	0
1821	ユーザアバターのサポート	ja	0	0
1822	ユーザアバター画像のパス	ja	0	0
1823	アバター画像を保存する、ディレクトリ <b>%dir</b> でのサブディレクトリを入力してください。	ja	0	0
1824	デフォルトのユーザアバター	ja	0	0
1825	独自のユーザアバターを選択していないユーザに表示される、デフォルトのユーザアバター画像のパスを入力してください。（ 例： misc/druplicon-small.png ）<br />指定しない場合は空欄にしてください。	ja	0	0
1826	ユーザアバターの最大画像サイズ	ja	0	0
1827	ユーザアバターとして使用できる画像サイズの上限を、ピクセル単位で入力してください。<br />（例えば、<b>100*80</b> までに制限したい場合は <b>100x80</b> と入力してください）	ja	0	0
1828	ユーザアバターの最大ファイルサイズ	ja	0	0
1829	ユーザアバターとして使用できるファイルサイズの上限を、KB（キロバイト）単位で入力してください。<br />（例えば、<b>30KB</b> までに制限したい場合は <b>30</b> と入力してください）	ja	0	0
1830	ユーザアバターのガイドライン	ja	0	0
1831	アバターに関してユーザに提示したいテキストを記入してください。<br />\nこのテキストはユーザアバターのアップロードフォームに表示される、デフォルトのガイドラインに追加されます。 ユーザが作業を円滑に進めるられるように、アップロードに関する説明などを掲示するのに役立ちます。	ja	0	0
1832	権限の保存	ja	0	0
1833	変更内容が保存されました。	ja	0	0
1834	@module モジュール	ja	0	0
1835	権限	ja	0	0
1836	ロール名	ja	0	0
1837	このロールの名称を入力してください。<br /> 例： 「モデレータ」「フォーラム管理者」「サイト設計者」	ja	0	0
1838	ロールの保存	ja	0	0
1839	ロールの削除	ja	0	0
1840	ロールの追加	ja	0	0
1841	ロール名 %name はすでに存在します。 別のロール名を選んでください。	ja	0	0
1842	有効なロール名を指定してください。	ja	0	0
1843	ロール名が変更されました。	ja	0	0
1844	ロールが削除されました。	ja	0	0
1845	ロールが追加されました。	ja	0	0
1846	ルールの追加	ja	0	0
1847	ルールの保存	ja	0	0
1848	アクセスタイプ	ja	0	0
1849	許可	ja	0	0
1850	拒否	ja	0	0
1851	ホスト	ja	0	0
1852	ルールタイプ	ja	0	0
1853	マスク	ja	0	0
1854	0文字以上にマッチ	ja	0	0
1855	ちょうど1文字にマッチ	ja	0	0
1856	アクセスルールが保存されました。	ja	0	0
1857	アクセスルールが追加されました。	ja	0	0
1858	値が入力されていません。 テストしたい文字列を入力し、再試行してください。	ja	0	0
1859	ここに「ユーザ名」を入力してチェックのボタンを押すと、そのユーザ名が許可されるか、あるいは拒否されるかを、設定されているアクセスルールに基づいて調べることができます。	ja	0	0
1860	ユーザ名のチェック	ja	0	0
1861	ここに「メールアドレス」を入力してチェックのボタンを押すと、そのメールアドレスが許可されるか、あるいは拒否されるかを、設定されているアクセスルールに基づいて調べることができます。	ja	0	0
1862	メールアドレスのチェック	ja	0	0
1863	ここに「ホスト名」か「IPアドレス」を入力してチェックのボタンを押すと、そのホスト名やIPアドレスが許可されるか、あるいは拒否されるかを、設定されているアクセスルールに基づいて調べることができます。	ja	0	0
1864	ホスト名（またはIPアドレス）のチェック	ja	0	0
1865	ユーザ名 %name は<b>拒否</b>されます。	ja	0	0
1866	ユーザ名 %name は<b>許可</b>されます。	ja	0	0
1867	メールアドレス %mail は<b>拒否</b>されます。	ja	0	0
1868	メールアドレス %mail は<b>許可</b>されます。	ja	0	0
1869	ホスト名（またはIPアドレス） %host は<b>拒否</b>されます。	ja	0	0
1870	ホスト名（またはIPアドレス） %host は<b>許可</b>されます。	ja	0	0
1871	ユーザ名	ja	0	0
1872	メールアドレス	ja	0	0
1873	ホスト	ja	0	0
1874	本当に、@type のルール %rule を削除してもよろしいですか？	ja	0	0
1875	アクセスルールが削除されました。	ja	0	0
1876	許可	ja	0	0
1877	拒否	ja	0	0
1878	現在のところアクセスルールはありません。	ja	0	0
1879	該当するユーザはいません。	ja	0	0
1880	権限の編集	ja	0	0
1881	ロールの編集	ja	0	0
1882	固定	ja	0	0
1883	ユーザ名またはメールアドレス	ja	0	0
1884	パスワード再発行メールを送信	ja	0	0
1885	%name が新しいパスワードをリクエストすることはできません。	ja	0	0
1886	%name はユーザ名やメールアドレスとして認識できません。	ja	0	0
1887	あなたのメールアドレスへ、パスワード初期化用のご案内を送信いたしました。	ja	0	0
1888	すでにワンタイムログインリンクを使ってログインしていますので、もはやこのリンクは不要です。	ja	0	0
1889	ワンタイムログインをブロックされたアカウントに使用しようとしました。	ja	0	0
1890	このワンタイムログインリンクは、すでに期限が切れています。<br />再度の発行を希望する場合は、以下のフォームからリクエストしてください。	ja	0	0
1891	すでにワンタイムログインリンクを使ってログインしていますので、もはやこのリンクは不要です。 お好みのパスワードに変更してください。	ja	0	0
1892	<p>これは %expiration_date まで有効な %user_name さん用のワンタイムログインです。</p><p>このボタンをクリックしてサイトにログインし、パスワードを変更してください。</p>	ja	0	0
1893	このログインを使用できるのは1回限りです。	ja	0	0
1894	ログイン	ja	0	0
1895	このワンタイムログインリンクはすでに使用済みか、期限が切れています。<br />再度の発行を希望する場合は、以下のフォームからリクエストしてください。	ja	0	0
1896	保護されたユーザフィールドを改ざんしようとする、悪意のある試みが検知されました。	ja	0	0
1897	本当に、%name さんのアカウントを削除してもよろしいですか？	ja	0	0
1982	このページで管理者が新しいユーザを登録することができます。 ユーザのメールアドレスとユーザ名は固有である必要があります。	ja	0	0
1898	このユーザが投稿したすべてのコンテンツは、属性が匿名ユーザに変更されます。<br />この操作は元に戻すことができませんので、十分に注意して実行してください。	ja	0	0
1899	%name が削除されました。	ja	0	0
1900	%name（%email）さんにパスワード初期化用の案内メールが送信されました。	ja	0	0
1901	%name さんが %timestamp にワンタイムログインリンクを使用しました。	ja	0	0
1902	%name さんのセッションが終了しました。	ja	0	0
1903	ユーザ名の入力は必須です。	ja	0	0
1904	ユーザ名の先頭に空白文字は使えません。	ja	0	0
1905	ユーザ名の末尾に空白文字は使えません。	ja	0	0
1906	ユーザ名に連続した複数の空白文字を含めることはできません。	ja	0	0
1907	ユーザ名に不正な文字が含まれています。	ja	0	0
1908	ユーザ名 %name は長すぎます： %max文字以下である必要があります。	ja	0	0
1909	メールアドレスの入力は必須です。	ja	0	0
1910	メールアドレス %mail が有効ではありません。	ja	0	0
1911	ユーザアバター画像のアップロードに失敗しました： ディレクトリ %directory が存在しないか、書き込み可能ではありません。	ja	0	0
1912	履歴	ja	0	0
1913	アカウントの設定	ja	0	0
1914	新規ユーザアカウントの作成	ja	0	0
1915	パスワードの再発行	ja	0	0
1916	パスワードを再発行するためのメールをリクエスト	ja	0	0
1917	ユーザログイン	ja	0	0
1918	新しいユーザ	ja	0	0
1919	オンライン状況	ja	0	0
1920	表示するユーザ数	ja	0	0
1921	ユーザの活動時間	ja	0	0
1922	ユーザがオンラインであると見なす時間を指定してください。 最後にページを表示してからこの時間が経過するまで、そのユーザはオンラインであると見なされます。	ja	0	0
1923	ユーザリストの表示数	ja	0	0
1924	現在オンラインのユーザを、最大で何人まで表示するかを指定してください。	ja	0	0
1925	<ul><li>%members</li><li>%visitors</li></ul>	ja	0	0
1926	<ul><li>%members</li><li>%visitors</li></ul>	ja	0	0
1927	オンラインのユーザ	ja	0	0
1928	@userさんのユーザアバター	ja	0	0
1929	アカウント情報	ja	0	0
1930	@sでのユーザ名を入力してください。	ja	0	0
1931	パスワードを入力してください。	ja	0	0
1932	ユーザ名 %name はまだアクティブ化されていないか、ブロックされています。	ja	0	0
1933	ユーザ名 %name の利用は留保されています。	ja	0	0
1934	未承認のユーザ名またはパスワードです。<br /><a href="@password">パスワードをお忘れですか？ 再発行を希望する場合はここをクリックしてください。</a>	ja	0	0
1935	ユーザ名 %name は予約されたメールアドレスを使用して登録されました。 そのため、ログインすることはできません。	ja	0	0
1936	アカウント情報	ja	0	0
1937	空白文字は使用できますが、ピリオド・ハイフン・アンダースコア以外の句読点は使用できません。	ja	0	0
1938	受信可能な、あなたのメールアドレスを入力してください。 サイトからのすべてのメールは、このアドレス宛に送信されます。 入力されたメールアドレスは非公開にされ、特定のニュースや通知をメールで受け取りたい場合や、管理者からの連絡、あるいはパスワード再発行メールの送信にのみ使用されます。	ja	0	0
1939	現在のパスワードを変更したい場合は、両方のフィールドに新しいパスワードを入力してください。	ja	0	0
1940	上の両方のフィールドに新しいアカウントのパスワードを入力してください。	ja	0	0
1941	ブロック	ja	0	0
1942	署名の設定	ja	0	0
1943	署名	ja	0	0
1944	コメントに表示したい署名を記入してください。 この署名はコメント投稿の際にフォームに自動挿入されます。	ja	0	0
1945	署名の入力書式はアクセス権のないフォーマットに設定されました。 このページを保存する際にアクセス権のあるフォーマットに変更されます。	ja	0	0
1946	ユーザアバター	ja	0	0
1947	ユーザアバターの削除	ja	0	0
1948	現在のユーザアバターを削除したい場合は、ここにチェックを入れてください。	ja	0	0
1949	ユーザアバターのアップロード	ja	0	0
1950	あなたの顔写真やアイコンなど、ユーザアバターとして使用したい画像ファイルへのパスを入力してください。<br />画像サイズは %dimensions、ファイルサイズは %size KB までに制限されます。	ja	0	0
1951	ユーザ名 %name はすでに登録されています。	ja	0	0
1952	ユーザ名 %name の使用は許可されていません。	ja	0	0
1953	メールアドレス %email はすでに登録されています。<br /><a href="@password">パスワードをお忘れですか？ 再発行を希望する場合はここをクリックしてください。</a>	ja	0	0
1954	メールアドレス %email の使用は許可されていません。	ja	0	0
1955	!usernameさん !siteへようこそ	ja	0	0
1983	新規や既存のアカウントに対して、ユーザ名・メールアドレス・ホスト名・IPアドレスによるアクセスルールを設定できます。 「拒否」のルールに一致して「許可」のルールに一致しないアカウントは、作成やログインができなくなります（ただし、ログイン中のアカウントがログアウトさせられることはありません）。 ホスト名やIPアドレスを使用したルールは、ユーザ登録の際だけでなく、すべてのページ表示に対しても効力を発揮します。	ja	0	0
1956	!usernameさん\n\n!siteへのご登録ありがとうございます。\n以下のユーザ名とパスワードを使って、今すぐ当サイトへログイン\nできます。\nログイン用フォーム： !login_uri\n\nユーザ名　： !username\nパスワード： !password\n\n以下のリンクをクリックするか、ブラウザへコピー＆ペーストして\nログインすることもできます。\n\nログインURL： !login_url\n（ただし、このリンクからログインできるのは1回限りです）\n\nログイン後にパスワードの変更を行うこともできます。\nパスワード変更用フォーム： !edit_uri\n\n\n--  !site	ja	0	0
1957	!siteでのアカウントが管理者により発行されました	ja	0	0
1958	!usernameさん\n\n!siteでのアカウントが管理者により発行されました。\n以下のユーザ名とパスワードを使って、今すぐ当サイトへログイン\nできます。\nログイン用フォーム： !login_uri\n\nユーザ名　： !username\nパスワード： !password\n\n以下のリンクをクリックするか、ブラウザへコピー＆ペーストして\nログインすることもできます。\n\nログインURL： !login_url\n（ただし、このリンクからログインできるのは1回限りです）\n\nログイン後にパスワードの変更を行うこともできます。\nパスワード変更用フォーム： !edit_uri\n\n\n--  !site	ja	0	0
1959	!usernameさん !siteへようこそ（管理者の承認待ち）	ja	0	0
1960	!usernameさん\n\n!siteへのご登録ありがとうございます。\nあなたのアカウント申請は、現在のところ承認待ちとなっております。\n承認された場合、ログイン方法やパスワードの設定方法などの詳細を含む、\n別のメールがあなた宛に送信されます。\n\n\n--  !site	ja	0	0
1961	!usernameさんがアカウントの申請を行いました。\n\n!edit_uri	ja	0	0
1962	!siteでの!usernameさんのパスワード再設定方法	ja	0	0
1963	!usernameさん\n\nあなたの!siteでのアカウントで、パスワード再発行のリクエストが\nありました。\n以下のリンクをクリックするか、ブラウザへコピー＆ペーストして\n今すぐ !uri_brief へログインすることができます。\n\nログインURL： !login_url\n\nこれはワンタイムログインリンクです。\n有効期限は1日限りとなり、それ以降は期限切れのため使用不可能\nとなります。\n\nログインすると以下のURLにリダイレクトされ、希望するパスワードに変更\nすることができます。\n\nパスワード変更用フォーム： !edit_uri	ja	0	0
1964	!siteでの!usernameさんのアカウント詳細（承認済）	ja	0	0
1965	!usernameさん\n\n!siteでのあなたのアカウントが有効化されました。\n\n以下のリンクをクリックするか、ブラウザへコピー＆ペーストして\n今すぐログインすることができます。\n\nログインURL： !login_url\n\nこれはワンタイムログインリンクです。\nログインすると以下のURLにリダイレクトされ、希望するパスワードに変更\nすることができます。\n\nパスワード変更用フォーム： !edit_uri\n\nパスワードの設定後は、以下のユーザ名を使用してログインフォームから\nログインできます。\n\nユーザ名： !username\nログイン用フォーム： !login_uri\n	ja	0	0
1966	!siteでの!usernameさんのアカウント詳細（ブロック）	ja	0	0
1967	!usernameさん\n\nあなたの!siteでのアカウントはブロックされました。	ja	0	0
1968	!siteでの!usernameさんのアカウント詳細（削除）	ja	0	0
1969	!usernameさん\n\nあなたの!siteでのアカウントは削除されました。	ja	0	0
1970	選択されたユーザのブロックを解除	ja	0	0
1971	選択されたユーザをブロック	ja	0	0
1972	選択されたユーザを削除	ja	0	0
1973	選択されたユーザをロールへ追加	ja	0	0
1974	選択されたユーザをロールから削除	ja	0	0
1975	本当に、これらのユーザを削除してもよろしいですか？	ja	0	0
1976	ユーザは削除されました。	ja	0	0
1977	User（ユーザ）モジュールはユーザの登録やログイン・ログアウトをはじめとして、ユーザ管理に関するさまざまな機能を提供します。 ユーザは登録することで自分のアカウントを持ち、投稿したコンテンツがアカウントに関連付けられるようになります。 また、未登録のユーザとは別のロールに所属することで、サイトでのさまざまな権限を与えられるなど、多くの特典を得ることができます。<br />ユーザモジュールは管理者がユーザに与えたい権限を、きめ細かに設定してグループ化できる「ロール」をサポートします。 未登録のユーザも含め、それぞれのユーザは1つ以上のロールに所属することになります。 デフォルトでは、「匿名ユーザ」（ログインしていないユーザ）と「認証済みユーザ」（ログインしているユーザ）の2種類のロールが用意され、ユーザはログインの状態によってどちらかに所属することになります。	ja	0	0
1978	ユーザは投稿したコンテンツに自分の名前やニックネームを使うことや、それぞれの「アカウント情報」ページから個人的な環境設定をすることができます。 ユーザはローカル（このサイト）でのユーザ名とパスワードを使用するか、任意でOpenID（1つのユーザ名とパスワードで、多くのサイトに安全な方法でログインすることができます）を通じて認証する必要があります。 設定によっては、他のDrupalサイトのユーザ名とパスワードを使用したり、他のサイト固有のメカニズムを通じて認証することもできます。	ja	0	0
1979	サイトにアクセスしている訪問者には、クッキー（cookie）に格納される固有のID（セッションID）が割り当てられます。 クッキーには個人的な情報は含まれませんが、サーバから情報を取り出すためのキーの機能を果たします。 サイトを使用する際、ユーザはクッキーを有効にする必要があります。	ja	0	0
1980	より詳しい情報は、オンラインハンドブックの<a href="@user">User module（英文）</a>エントリを参照するか、日本サイトの<a href="http://drupal.jp/">&nbsp;≡ Drupal Japan ≡&nbsp;</a>を訪れてみてください。	ja	0	0
1981	Drupalはユーザの登録やログイン・ログアウト、ユーザプロフィールの保守などを行うことができます。 サイトのユーザはユーザアカウントを取得してログインするまで、投稿するコンテンツに自分の名前やニックネームを使うことはできません。	ja	0	0
1984	権限を設定することで、ユーザがサイト上で行えることをコントロールすることができます。 <a href="@role">ロールのページ</a>で定義された各ロールは、以下で設定された権限のグループを持ちます。 例えば「管理者」として分類したユーザに対しては管理を分担するために「ノードの管理」権限を与え、一般の「認証済みユーザ」にはその権限を与えないということができます。 この機能をうまく利用すると、例えばユーザを有料と無料とに分類し、無料のユーザには見ることのできない情報を、有料のユーザにのみ提供することもできます。 また、信頼できるユーザにさまざまな管理権限を与え、サイト管理上の負担を分担するために利用することもできます。	ja	0	0
1985	<p>ロールはDrupalのセキュリティや管理を微調整できるようにします。 ロールは<a href="@permissions">ユーザの権限</a>に定義されたとおりに、特定の特権を持つユーザのグループを定義します。 ロールの例として、「匿名ユーザ」「認証済みユーザ」「モデレータ」「管理者」などが挙げられます。 以下で、さまざまなロールの「ロール名」を定義できます。 定義済みロールの削除は「権限の編集」から行えます。</p><p>Drupalはデフォルトで2つのロールが定義されています:</p>\n      <ul>\n      <li>匿名ユーザ： ユーザアカウントを持っていないか、未認証のユーザが所属します。</li>\n      <li>認証済みユーザ： すべてのログイン中のユーザが、自動的に所属します。</li>\n      </ul>	ja	0	0
1986	簡単なパターンを入力して検索ボタンをクリックすると、そのパターンに一致するユーザ名やメールアドレスを検索できます。 例えば「<b>ta</b>」の場合、「<b>ta</b>ro」「<b>ta</b>ro@example.com」「<b>ta</b>naka」「nari<b>ta</b>」「ki<b>ta</b>mura」など、<b>ta</b> をどこかに含むユーザ名やメールアドレスがヒットします。 また「<b>ta*</b>」の場合、「<b>ta</b>ro」「<b>ta</b>naka」など、<b>ta</b> で始まるユーザ名やメールアドレスのみがヒットします。 （<b>*</b> はすべての文字に一致するワイルドカードです）	ja	0	0
1987	ロール	ja	0	0
1988	権限	ja	0	0
1989	パスワードの強度：	ja	0	0
1990	低い	ja	0	0
1991	高い	ja	0	0
1992	最低でも6文字以上を含むパスワードを選ぶことをお勧めします。 またパスワードには、数字、句読点、大文字と小文字を混在させるべきです。	ja	0	0
1993	パスワードの安全性を高めるための十分な変化が含まれていません： 次のことを試みてください	ja	0	0
1994	大文字と小文字を混在させる。	ja	0	0
1995	数字を加える。	ja	0	0
1996	句読点を加える。	ja	0	0
1997	ユーザ名とは異なるパスワードを選ぶことをお勧めします。	ja	0	0
1998	パスワードの一致：	ja	0	0
1999	ユーザアカウントの作成後	ja	0	0
2000	ユーザプロフィールの更新後	ja	0	0
2001	ユーザの削除後	ja	0	0
2002	ユーザのログイン後	ja	0	0
2003	ユーザのログアウト後	ja	0	0
2004	ユーザプロフィールが閲覧された際	ja	0	0
2005	現在のユーザをブロックする	ja	0	0
2006	現在のユーザのIPアドレスをアクセス禁止にする	ja	0	0
2007	Drupalへようこそ。 あなたは現在、サイトを完全に制御できるユーザ #1 としてログインしています。	ja	0	0
2008	</p><p>あなたのパスワードは <strong>%pass</strong> です。 以下でパスワードの変更ができます。</p>	ja	0	0
2009	<a href="@url">%name</a>さんの新しいアカウントが作成されました。 メールは送信されていません。	ja	0	0
2010	正常に登録されました。 あなたは現在、ログインしています。	ja	0	0
2011	パスワードを含む案内が、新規ユーザ<a href="@url">%name</a>さんにメール送信されました。	ja	0	0
2012	あなたのメールアドレス宛に、パスワードを含むご案内メールを送信いたしました。	ja	0	0
2013	アカウントをご申請いただき、ありがとうございます。 あなたのアカウントは現在、サイト管理者の承認待ちとなっております。<br />さしあたり、あなたのメールアドレス宛にご案内を含むウェルカムメッセージが送信されました。	ja	0	0
2014	新規アカウントをユーザへ通知する	ja	0	0
2015	%user さんがログインに失敗しました。	ja	0	0
2016	%name さんのセッションが開始されました。	ja	0	0
2017	新しい外部ユーザ： %name さん（モジュール %module を使用）	ja	0	0
2018	ユーザが削除されました： %name さん (%email)	ja	0	0
2019	ユーザ %name さんがブロックされました。	ja	0	0
2020	IPアドレス %ip がアクセス禁止になりました。	ja	0	0
2021	新規ユーザ： %name さん (%email)	ja	0	0
2022	ゲストユーザ 1 人	ja	0	0
2023	ゲストユーザ @count 人	ja	2022	1
2024	権限の管理	ja	0	0
2025	ユーザの管理	ja	0	0
2026	ユーザプロフィールへのアクセス	ja	0	0
2027	自分のユーザ名の変更	ja	0	0
2028	ユーザ名の自動補完	ja	0	0
2029	ユーザアカウント	ja	0	0
2030	パスワードのリセット	ja	0	0
2031	ユーザの管理	ja	0	0
2032	サイトのユーザやグループ、アクセス権などを管理します。	ja	0	0
2033	ユーザの一覧表示、追加、編集をします。	ja	0	0
2034	ユーザの追加	ja	0	0
2035	ユーザの設定	ja	0	0
2036	ユーザ登録の条件やメールの内容、ユーザアバターなどを含めた、デフォルトでのユーザの振る舞いを設定します。	ja	0	0
2037	権限	ja	0	0
2038	ロールの権限を選択して、さまざまな機能へのアクセス権を決定します。	ja	0	0
2039	ロールの一覧表示、追加、編集をします。	ja	0	0
2040	ロールの編集	ja	0	0
2041	アクセスルール	ja	0	0
2042	ユーザ名、メールアドレス、IPアドレスによるアクセス許否ルールの一覧表示と作成をします。	ja	0	0
2043	ルールのチェック	ja	0	0
2044	ルールの編集	ja	0	0
2045	ルールの削除	ja	0	0
2046	ログアウト	ja	0	0
2047	アカウント	ja	0	0
2048	匿名ユーザ	ja	0	0
2049	認証済みユーザ	ja	0	0
2050	ボキャブラリの編集	ja	0	0
2051	タームのリスト	ja	0	0
2052	タームの追加	ja	0	0
2053	利用できるボキャブラリはありません。	ja	0	0
2054	ボキャブラリの名称	ja	0	0
2055	ボキャブラリの名称を入力してください。 例：<em>タグ</em>	ja	0	0
2056	このボキャブラリについての説明を記入してください。 モジュールによって、この項目を利用する場合があります。	ja	0	0
2057	ヘルプテキスト	ja	0	0
2058	タームを選択する際、ユーザに提示する指示を記入してください。 例：<em>ワードのコンマ区切りのリストを入力してください。</em>	ja	0	0
2059	このボキャブラリを使用して分類する、コンテンツタイプを指定してください。	ja	0	0
2060	タグ	ja	0	0
2061	フリータギングを許可するかどうかを指定してください。 チェックを入れると、投稿の際にコンマで区切ったタグリストを入力することで、ユーザがタームを作成できるようになります。	ja	0	0
2062	複数選択	ja	0	0
2063	このボキャブラリ内の複数のタームを投稿が持つことを、許可するかどうかを指定してください。 なお、「タグ」は常に複数のタームを持てます。	ja	0	0
2064	このボキャブラリ内のタームを最低でも1つは投稿に持たせることを、必須とするかどうかを指定してください。	ja	0	0
2065	ボキャブラリの表示順位を決める、ウェイトを指定してください。ウェイトの数値が小さいほど上部に、大きいほど下部に配置されます。	ja	0	0
2066	新しいボキャブラリ %name が作成されました。	ja	0	0
2067	ボキャブラリ %name が更新されました。	ja	0	0
2068	%vocabulary 内のターム	ja	0	0
2069	利用できるタームはありません。	ja	0	0
2070	アルファベット順にリセット	ja	0	0
2071	%vocabulary にタームを追加	ja	0	0
2072	タームの名称	ja	0	0
2073	このタームの名称を入力してください。<br />例えば、このタームが「スポーツ」というボキャブラリに含まれる場合は「野球」や「サッカー」、「動物」ならば「イヌ」や「ネコ」、「フルーツ」ならば「リンゴ」や「バナナ」といったように、含まれるボキャブラリに関連したものを指定するのが一般的です。	ja	0	0
2074	このタームについての説明を記入してください。 これはタクソノミーやタームのページ、RSSフィードで表示されます。	ja	0	0
2075	高度なオプション	ja	0	0
2076	上位	ja	0	0
2077	上位のターム	ja	0	0
2078	関連するターム	ja	0	0
2079	シノニム（同義語）	ja	0	0
2080	このタームのシノニム（同義語）を行単位で入力してください。	ja	0	0
2081	タームの表示順位を決める、ウェイトを指定してください。ウェイトの数値が小さいほど上部に、大きいほど下部に配置されます。	ja	0	0
2082	ウェイトは数値である必要があります。	ja	0	0
2083	新しいターム %term が作成されました。	ja	0	0
2084	ターム %term が更新されました。	ja	0	0
2085	複数のタームを上位に設定しますか？	ja	0	0
2086	タームに複数の上位タームを加えた場合、ボキャブラリ %vocabulary はすべてのタームで複数の上位タームを探すことになります。 ドラッグ＆ドロップのアウトラインインターフェイスを使用する際、複数の上位タームはサポートされないため、このオプションを有効にするとドラッグ＆ドロップは無効になります。 このため複数の上位タームを持たせる場合、上位タームの設定はタームの編集フォームからのみとなります。	ja	0	0
2087	このボキャブラリ内のタームに対する上位タームを複数から単数に減らすことによって、いつでもドラッグ＆ドロップのインターフェイスを再度有効にすることができます。	ja	0	0
2088	複数の上位を設定	ja	0	0
2089	本当に、ターム %title を削除してもよろしいですか？	ja	0	0
2090	タームを削除すると、下位に含まれるすべてのタームも削除されます。<br />この操作は元に戻すことができませんので、十分に注意して実行してください。	ja	0	0
2091	ターム %name が削除されました。	ja	0	0
2092	本当に、ボキャブラリ %title を削除してもよろしいですか？	ja	0	0
2093	ボキャブラリを削除すると、含まれるすべてのタームも削除されます。<br />この操作は元に戻すことができませんので、十分に注意して実行してください。	ja	0	0
2094	ボキャブラリ %name が削除されました。	ja	0	0
2095	本当に、ボキャブラリ %title をアルファベット順にリセットしてもよろしいですか？	ja	0	0
2096	ボキャブラリをリセットすると独自の順序付けはすべて破棄され、アイテムはアルファベット順に並べ替えられます。	ja	0	0
2097	ボキャブラリ %name はアルファベット順にリセットされました。	ja	0	0
2098	タクソノミー	ja	0	0
2099	- 選択されていません -	ja	0	0
2100	- なし -	ja	0	0
2101	このコンテンツを表現する言葉を入力してください。 ここに入力された言葉はそのままタームとなり、それを使用したカテゴリにコンテンツが分類されます。 複数の言葉を指定したい場合は、それぞれの言葉をコンマで区切って入力してください。 また、指定したい言葉の中にコンマが含まれる場合は <b>"Co., Ltd."</b> のように引用符で括ってください。&nbsp;&nbsp;例： Drupal, CMS, ブログ, "Drupal Japan Co., Ltd."	ja	0	0
2102	ボキャブラリ	ja	0	0
2103	ボキャブラリ %name をこの方法で修正することはできません。	ja	0	0
2104	現在のところ、このカテゴリに投稿はありません。	ja	0	0
2105	Taxonomy（タクソノミー）モジュールは、様々な分類方式を使用してコンテンツを分類できるようにします。 フリータギングボキャブラリは、一般にブログやソーシャルブックマークに見られるように、ユーザが投稿する際にその場で作成されます。 コントロールボキャブラリは、異なるターム間で複数の関連を持つ複雑な階層構造にも、管理者に定義されたタームの候補リストにも利用できます。 これらの方法は異なるコンテンツタイプに適用でき、コンテンツを分類し提示する強力で柔軟な方法を作成するために、相互に組み合わせることもできます。	ja	0	0
2106	例えばレシピサイトを作成する場合、食事の種類と準備時間の両方で投稿を分類するといいでしょう。 それぞれのボキャブラリは、あらゆる可能な組み合わせに対してタグを作る代わりに、単独で各基準を使用して分類することができるようにします。	ja	0	0
2107	食事の種類： <em>前菜, メインコース, サラダ, デザート</em>	ja	0	0
2108	準備時間： <em>0-30分, 30-60分, 1-2時間, 2時間以上</em>	ja	0	0
2109	それぞれのタクソノミーターム（他のシステムではよく「カテゴリ」や「タグ」と呼ばれます）は、投稿の一覧と、対応するRSSフィードを自動的に提供します。 これらのタクソノミーやタームのURLは、タームで分類された投稿のANDとORの一覧を生成するために、操作することができます。 本レシピサイトの例では、タームを単独または他と組み合わせて使用することにより、「メインコース」「30分レシピ」「30分メインコースと前菜」などを表示するページの作成が容易になります。 タームの表示や構成用に、コアモジュールの振る舞いの変更や拡張ができる、かなりの数の寄与されたモジュールがあります。	ja	0	0
2110	タームは管理インターフェイスから、親子（上位／下位）関係で組織化することもできます。 例として国々を親（上位）、その地政学的な地域を子（下位）としてグループ化するボキャブラリが挙げられます。 タクソノミーモジュールはまた、例えば「トルコ」を「中東」と「ヨーロッパ」の両方に配置するような、階層構造の高度な実装を実現します。	ja	0	0
2111	タクソノミーモジュールはシノニム（同義語）と関連するターム（関連語）の使用をサポートしますが、直接この機能性を利用することはありません。 しかしながらオプションの拡張モジュールでは、これらの拡張機能を完全に利用することができます。	ja	0	0
2112	より詳しい情報は、オンラインハンドブックの<a href="@taxonomy">Taxonomy module（英文）</a>エントリを参照するか、日本サイトの<a href="http://drupal.jp/">&nbsp;≡ Drupal Japan ≡&nbsp;</a>を訪れてみてください。	ja	0	0
2113	タクソノミーモジュールは、タグや管理者定義のタームを使用してコンテンツを分類できるようにします。 それは多くの拡張機能を備えた、コンテンツを分類するための柔軟なツールです。 はじめに、タームやタグを保持するための「ボキャブラリ」を作成してください。 あらゆるものを保持するフリータギングボキャブラリや、 例えば「国々」や「色」などのようにコンテンツの様々な特性を定義する、個別のコントロールボキャブラリを作成できます。	ja	0	0
2114	サイトで定義されているボキャブラリの設定やレビュー、または含まれるターム（タグ）の一覧や管理に、以下のリストを使用してください。 「タイプ」カラムに表示されているように、ボキャブラリは任意で特定のコンテンツタイプに関連付けることができ、関連付けられたボキャブラリはそのタイプの投稿の作成や編集の際に表示されます。 同じコンテンツタイプに関連付けられた複数のボキャブラリは、以下に表示された順序で表示されます。 ボキャブラリの順序を変更するには、「名前」カラムにあるドラッグアンドドロップハンドル（十字の矢印）をつかみ（ハンドルをつかむには、ハンドルアイコン上でマウスの左ボタンを押下したままにします）、リスト中の新しい位置へドラッグしてください。 ページ下部にある「保存」ボタンをクリックするまで、変更が保存されないことに注意してください。	ja	0	0
2115	%capital_name はフリータギングボキャブラリです。 タームの名前や説明を変更するには、タームの隣にある「編集」リンクをクリックしてください。	ja	0	0
2116	%capital_name はフラットなボキャブラリです。 テーブルの左側にあるハンドルを使用することにより、%name ボキャブラリ内のタームを整理できます。 タームの名前や説明を変更するには、タームの隣にある「編集」リンクをクリックしてください。	ja	0	0
2117	%capital_name は単階層構造のボキャブラリです。 テーブルの左側にあるハンドルを使用することにより、%name ボキャブラリ内のタームを整理できます。 タームの名前や説明を変更するには、タームの隣にある「編集」リンクをクリックしてください。	ja	0	0
2118	%capital_name は多階層構造のボキャブラリです。 タームの名前や説明を変更するには、タームの隣にある「編集」リンクをクリックしてください。 多階層構造のドラッグ＆ドロップはサポートされていませんが、単一の下位のみを含むように各タームを編集することにより、ドラッグ＆ドロップのサポートを再度有効にすることができます。	ja	0	0
2183	インストールされたモジュールとテーマの情報と新しいバージョンのリリースに関して、<a href="@available_updates">入手可能なアップデート</a>ページを参照してください。	ja	0	0
2119	ボキャブラリを管理者とユーザにどのように提示し、どのコンテンツタイプを分類するかを定義してください。 タグは、投稿の際にコンマ区切りのリストを入力することにより、ユーザがタームの作成をできるようにします。 タグが許可されていない場合、タームは「タクソノミーの管理」権限を持つユーザのみが作成でき、選択リストから選ぶようになります。	ja	0	0
2120	新しいタームをデータベースへ保存後	ja	0	0
2121	更新されたタームをデータベースへ保存後	ja	0	0
2122	タームの削除後	ja	0	0
2123	タクソノミーの管理	ja	0	0
2124	コンテンツのタグ付けや分類を管理します。	ja	0	0
2125	ボキャブラリの追加	ja	0	0
2126	ボキャブラリの編集	ja	0	0
2127	タームの編集	ja	0	0
2128	タクソノミーターム	ja	0	0
2129	タクソノミーの自動補完	ja	0	0
2130	タームのリスト	ja	0	0
2131	タームの追加	ja	0	0
2132	不明	ja	0	0
2133	安全ではないプロジェクト	ja	0	0
2134	このプロジェクトはDrupalセキュリティチームによって安全でないと標示され、もはやダウンロードはできません。 このプロジェクトに含まれたすべてを早急に無効にすることを、強く推奨します！	ja	0	0
2135	廃止されたプロジェクト	ja	0	0
2136	このプロジェクトは廃止され、もはやダウンロードはできません。 このプロジェクトに含まれたすべてを無効にすることを、強く推奨します！	ja	0	0
2137	サポートされていないプロジェクト	ja	0	0
2138	このプロジェクトはもはやサポートされず、もはやダウンロードはできません。 このプロジェクトに含まれたすべてを無効にすることを、強く推奨します！	ja	0	0
2139	入手可能な最新版データの取得に失敗しました	ja	0	0
2140	入手可能なリリースが見つかりません	ja	0	0
2141	廃止されたリリース	ja	0	0
2142	現在インストールされているリリースは廃止され、もはやダウンロードはできません。 このリリースに含まれたすべてを無効にするか、アップグレードすることを強く推奨します！	ja	0	0
2143	サポートされていないリリース	ja	0	0
2144	現在インストールされているリリースはサポートされず、もはやダウンロードはできません。 このリリースに含まれたすべてを無効にするか、アップグレードすることを強く推奨します！	ja	0	0
2145	未知のリリース日付	ja	0	0
2146	無効な情報	ja	0	0
2147	すべての入手可能な新しいリリースと最新版に関する情報の取得を試みました。	ja	0	0
2148	入手可能な新しいリリースと最新版に関する情報が取得できませんでした。	ja	0	0
2149	アップデート	ja	0	0
2150	前回の確認： @time前	ja	0	0
2151	前回の確認： 未実行	ja	0	0
2152	手動で確認	ja	0	0
2153	OK	ja	0	0
2154	セキュリティアップデートが必須です！	ja	0	0
2155	廃止されました！	ja	0	0
2156	サポートされません！	ja	0	0
2157	最新版を入手できます	ja	0	0
2158	推奨バージョン：	ja	0	0
2159	セキュリティアップデート：	ja	0	0
2160	最新バージョン：	ja	0	0
2161	開発バージョン：	ja	0	0
2162	同じく入手可能：	ja	0	0
2163	次を含みます： %includes	ja	0	0
2164	Drupalコア	ja	0	0
2165	無効化モジュール	ja	0	0
2166	無効化テーマ	ja	0	0
2167	ダウンロード	ja	0	0
2168	リリースノート	ja	0	0
2169	最新版が入手可能な際に通知するメールアドレス	ja	0	0
2170	最新版が入手可能な際に通知するメールアドレスを、行単位で入力してください。 サイトで利用できる最新版を確認し見つかった場合、入力されたユーザリストにメールで通知されます。 空欄の場合は送信されません。	ja	0	0
2171	最新版の確認	ja	0	0
2172	毎日	ja	0	0
2173	毎週	ja	0	0
2174	更新を確認する頻度を指定してください。 現在インストールされているモジュールやテーマの新しいリリースを、選択された頻度で自動的に確認します。	ja	0	0
2175	メール通知のしきい値	ja	0	0
2176	すべての最新バージョン	ja	0	0
2177	セキュリティアップデートのみ	ja	0	0
2178	セキュリティアップデートが入手できる場合にのみメール通知を行うか、すべての最新バージョンについての通知を行うかを選択してください。 Drupalコアや、インストール済みのモジュールやテーマの最新版が入手できる場合は、常に<a href="@status_report">現状報告</a>ページでメッセージが表示され、セキュリティアップデートがある場合は管理ページでエラーメッセージが表示されます。	ja	0	0
2179	%email は有効なメールアドレスではありません。	ja	0	0
2180	%emails は有効なメールアドレスではありません。	ja	0	0
2181	インストール済みモジュールやテーマの入手可能な最新版に関する情報を、ここで確認することができます。 それぞれのモジュールやテーマは、名前が重複する場合や、複数のモジュールやテーマを含むこともある、「プロジェクト」の一部であることに注意してください。	ja	0	0
2182	サイトの機能性の拡張や外観の変更をするために、多くの寄与された<a href="@modules">モジュール</a>や<a href="@themes">テーマ</a>が利用できます。	ja	0	0
2184	Update status（更新状況）モジュールは、定期的にサイトのソフトウェア（寄与されたモジュールやテーマを含む）の新しいバージョンを確認し、入手可能な最新版への注意を呼びかけます。	ja	0	0
2185	新しいリリースがダウンロードできるようになった際、<a href="@update-report">入手可能な最新版の報告</a>で警告されます。 アップデート確認の更新頻度と通知の設定を、<a href="@update-settings">更新状況モジュールの設定ページ</a>で設定することができます。	ja	0	0
2186	この情報を提供するために、匿名の利用統計がdrupal.orgに送信されることに注意してください。 これを望まない場合、<a href="@modules">モジュールの管理ページ</a>でUpdate statusモジュールを無効化することができます。	ja	0	0
2187	より詳しい情報は、オンラインハンドブックの<a href="@update">Update status module（英文）</a>エントリを参照するか、日本サイトの<a href="http://drupal.jp/">&nbsp;≡ Drupal Japan ≡&nbsp;</a>を訪れてみてください。	ja	0	0
2188	Drupalコアの更新状況	ja	0	0
2189	更新データがありません	ja	0	0
2190	モジュールとテーマの更新状況	ja	0	0
2191	安全ではありません！	ja	0	0
2192	サポートされていないリリース	ja	0	0
2193	状況を確定できません	ja	0	0
2194	（バージョン @version が入手可能）	ja	0	0
2195	現在インストールされているモジュールやテーマ用の、新しいリリースに関する情報がありません。 最新版を確認するには定期的な<a href="@run_cron">cronの実行</a>か、または<a href="@check_manually">手動で確認</a>できます。 利用可能な最新版の確認には時間がかかる場合もありますが、しばらくお待ちください。	ja	0	0
2196	!site_name で利用可能な新しいリリース	ja	0	0
2197	より詳細な情報は「入手可能な最新版」ページを参照してください：	ja	0	0
2198	利用中のDrupalバージョンのセキュリティアップデートが入手可能です。 サーバの安全性を確保するために、早急に更新するべきです！	ja	0	0
2199	利用中のモジュールやテーマのセキュリティアップデートが入手可能です。 サーバの安全性を確保するために、早急に更新するべきです！	ja	0	0
2200	利用中のDrupalバージョンは廃止され、もはやダウンロードはできません。 アップグレードすることを強く推奨します！	ja	0	0
2201	少なくとも1つのモジュールやテーマのインストール済みバージョンは廃止され、もはやダウンロードはできません。 アップグレードするか、無効にすることを強く推奨します！	ja	0	0
2202	利用中のDrupalバージョンは、もはやサポートされていません。 アップグレードすることを強く推奨します！	ja	0	0
2203	少なくとも1つのモジュールやテーマのインストール済みバージョンは、もはやサポートされていません。 アップグレードするか、無効にすることを強く推奨します！ 詳細はプロジェクトのホームページを参照してください。	ja	0	0
2204	利用中のDrupalバージョンの最新版が入手可能です。 サイトを適切に機能させ続けるために、できるだけ早く更新するべきです。	ja	0	0
2205	利用中の1つ以上のモジュールやテーマの最新版が入手可能です。 サイトを適切に機能させ続けるために、できるだけ早く更新するべきです。	ja	0	0
2206	利用中のDrupalバージョンの、入手可能な最新版の状況を確定中に問題がありました。	ja	0	0
2207	1つ以上のモジュールやテーマの、入手可能な最新版の状況を確定中に問題がありました。	ja	0	0
2208	より詳しい情報は<a href="@available_updates">入手可能な最新版</a>ページを参照してください。	ja	0	0
2209	入手可能な最新版	ja	0	0
2210	インストール済みモジュールとテーマの、入手可能な最新版に関する状況報告を取得します。	ja	0	0
2211	手動更新確認	ja	0	0
\.


--
-- Data for Name: menu_custom; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY menu_custom (menu_name, title, description) FROM stdin;
navigation	ナビゲーション	ナビゲーションメニューはDrupalによって提供され、あらゆるサイトにとってメインの対話型メニューです。 通常、匿名ユーザには表示されない認証済みユーザ用の個別リンクを含む、唯一のメニューです。
primary-links	プライマリリンク	プライマリリンクはサイトの主要なセクションを表示するために、多くの場合テーマ層において使用されます。 プライマリリンクの典型的な表現は、トップに沿ったタブになります。
secondary-links	セカンダリリンク	セカンダリリンクは、リーガルノーティスやコンタクトの詳細、プライマリリンクより下位の役割を果たす副ナビゲーション項目のように、多くの場合はページ用に使用されます。
\.


--
-- Data for Name: menu_links; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY menu_links (menu_name, mlid, plid, link_path, router_path, link_title, options, module, hidden, external, has_children, expanded, weight, depth, customized, p1, p2, p3, p4, p5, p6, p7, p8, p9, updated) FROM stdin;
navigation	28	10	admin/content/node	admin/content/node	Content	a:1:{s:10:"attributes";a:1:{s:5:"title";s:43:"View, edit, and delete your site's content.";}}	system	0	0	0	0	0	3	0	2	10	28	0	0	0	0	0	0	0
navigation	1	0	batch	batch		a:0:{}	system	-1	0	0	0	0	1	0	1	0	0	0	0	0	0	0	0	0
navigation	4	0	logout	logout	Log out	a:0:{}	system	0	0	0	0	10	1	0	4	0	0	0	0	0	0	0	0	0
navigation	5	0	rss.xml	rss.xml	RSS feed	a:0:{}	system	-1	0	0	0	0	1	0	5	0	0	0	0	0	0	0	0	0
navigation	6	0	user	user	User account	a:0:{}	system	-1	0	0	0	0	1	0	6	0	0	0	0	0	0	0	0	0
navigation	7	0	node/%	node/%		a:0:{}	system	-1	0	0	0	0	1	0	7	0	0	0	0	0	0	0	0	0
navigation	8	2	admin/compact	admin/compact	Compact mode	a:0:{}	system	-1	0	0	0	0	2	0	2	8	0	0	0	0	0	0	0	0
navigation	11	0	node/add	node/add	Create content	a:0:{}	system	0	0	1	0	1	1	0	11	0	0	0	0	0	0	0	0	0
navigation	12	0	comment/delete	comment/delete	Delete comment	a:0:{}	system	-1	0	0	0	0	1	0	12	0	0	0	0	0	0	0	0	0
navigation	19	0	user/autocomplete	user/autocomplete	User autocomplete	a:0:{}	system	-1	0	0	0	0	1	0	19	0	0	0	0	0	0	0	0	0
navigation	13	0	comment/edit	comment/edit	Edit comment	a:0:{}	system	-1	0	0	0	0	1	0	13	0	0	0	0	0	0	0	0	0
navigation	14	0	system/files	system/files	File download	a:0:{}	system	-1	0	0	0	0	1	0	14	0	0	0	0	0	0	0	0	0
navigation	26	18	admin/settings/clean-urls	admin/settings/clean-urls	Clean URLs	a:1:{s:10:"attributes";a:1:{s:5:"title";s:43:"Enable or disable clean URLs for your site.";}}	system	0	0	0	0	0	3	0	2	18	26	0	0	0	0	0	0	0
navigation	20	2	admin/user	admin/user	User management	a:1:{s:10:"attributes";a:1:{s:5:"title";s:61:"Manage your site's users, groups and access to site features.";}}	system	0	0	1	0	0	2	0	2	20	0	0	0	0	0	0	0	0
navigation	27	10	admin/content/comment	admin/content/comment	Comments	a:1:{s:10:"attributes";a:1:{s:5:"title";s:61:"List and edit site comments and the comment moderation queue.";}}	system	0	0	0	0	0	3	0	2	10	27	0	0	0	0	0	0	0
navigation	25	17	admin/build/block	admin/build/block	Blocks	a:1:{s:10:"attributes";a:1:{s:5:"title";s:79:"Configure what block content appears in your site's sidebars and other regions.";}}	system	0	0	0	0	0	3	0	2	17	25	0	0	0	0	0	0	0
navigation	35	18	admin/settings/image-toolkit	admin/settings/image-toolkit	Image toolkit	a:1:{s:10:"attributes";a:1:{s:5:"title";s:74:"Choose which image toolkit to use if you have installed optional toolkits.";}}	system	0	0	0	0	0	3	0	2	18	35	0	0	0	0	0	0	0
navigation	30	18	admin/settings/date-time	admin/settings/date-time	Date and time	a:1:{s:10:"attributes";a:1:{s:5:"title";s:89:"Settings for how Drupal displays date and time, as well as the system's default timezone.";}}	system	0	0	0	0	0	3	0	2	18	30	0	0	0	0	0	0	0
navigation	3	0	node	node	Content	a:0:{}	system	-1	0	0	0	0	1	0	3	0	0	0	0	0	0	0	0	0
navigation	24	18	admin/settings/admin	admin/settings/admin	Administration theme	a:1:{s:10:"attributes";a:1:{s:5:"title";s:55:"Settings for how your administrative pages should look.";}}	system	0	0	0	0	0	3	0	2	18	24	0	0	0	0	0	0	0
navigation	17	2	admin/build	admin/build	Site building	a:1:{s:10:"attributes";a:1:{s:5:"title";s:38:"Control how your site looks and feels.";}}	system	0	0	1	0	-10	2	0	2	17	0	0	0	0	0	0	0	0
navigation	29	10	admin/content/types	admin/content/types	Content types	a:1:{s:10:"attributes";a:1:{s:5:"title";s:82:"Manage posts by content type, including default status, front page promotion, etc.";}}	system	0	0	0	0	0	3	0	2	10	29	0	0	0	0	0	0	0
navigation	2	0	admin	admin	Administer	a:0:{}	system	0	0	1	0	9	1	0	2	0	0	0	0	0	0	0	0	0
navigation	34	18	admin/settings/file-system	admin/settings/file-system	File system	a:1:{s:10:"attributes";a:1:{s:5:"title";s:68:"Tell Drupal where to store uploaded files and how they are accessed.";}}	system	0	0	0	0	0	3	0	2	18	34	0	0	0	0	0	0	0
navigation	32	21	user/%/delete	user/%/delete	Delete	a:0:{}	system	-1	0	0	0	0	2	0	21	32	0	0	0	0	0	0	0	0
navigation	15	2	admin/help	admin/help	Help	a:0:{}	system	0	0	0	0	9	2	0	2	15	0	0	0	0	0	0	0	0
navigation	9	0	filter/tips	filter/tips	Compose tips	a:0:{}	system	1	0	0	0	0	1	0	9	0	0	0	0	0	0	0	0	0
navigation	23	18	admin/settings/actions	admin/settings/actions	Actions	a:1:{s:10:"attributes";a:1:{s:5:"title";s:41:"Manage the actions defined for your site.";}}	system	0	0	0	0	0	3	0	2	18	23	0	0	0	0	0	0	0
navigation	22	20	admin/user/rules	admin/user/rules	Access rules	a:1:{s:10:"attributes";a:1:{s:5:"title";s:80:"List and create rules to disallow usernames, e-mail addresses, and IP addresses.";}}	system	0	0	0	0	0	3	0	2	20	22	0	0	0	0	0	0	0
navigation	21	0	user/%	user/%	My account	a:0:{}	system	0	0	0	0	0	1	0	21	0	0	0	0	0	0	0	0	0
navigation	16	2	admin/reports	admin/reports	Reports	a:1:{s:10:"attributes";a:1:{s:5:"title";s:59:"View reports from system logs and other status information.";}}	system	0	0	1	0	5	2	0	2	16	0	0	0	0	0	0	0	0
navigation	18	2	admin/settings	admin/settings	Site configuration	a:1:{s:10:"attributes";a:1:{s:5:"title";s:40:"Adjust basic site configuration options.";}}	system	0	0	1	0	-5	2	0	2	18	0	0	0	0	0	0	0	0
navigation	10	2	admin/content	admin/content	Content management	a:1:{s:10:"attributes";a:1:{s:5:"title";s:27:"Manage your site's content.";}}	system	0	0	1	0	-10	2	0	2	10	0	0	0	0	0	0	0	0
navigation	33	18	admin/settings/error-reporting	admin/settings/error-reporting	Error reporting	a:1:{s:10:"attributes";a:1:{s:5:"title";s:93:"Control how Drupal deals with errors including 403/404 errors as well as PHP error reporting.";}}	system	0	0	0	0	0	3	0	2	18	33	0	0	0	0	0	0	0
navigation	31	0	node/%/delete	node/%/delete	Delete	a:0:{}	system	-1	0	0	0	1	1	0	31	0	0	0	0	0	0	0	0	0
navigation	67	25	admin/build/block/delete	admin/build/block/delete	Delete block	a:0:{}	system	-1	0	0	0	0	4	0	2	17	25	67	0	0	0	0	0	0
navigation	48	16	admin/reports/status	admin/reports/status	Status report	a:1:{s:10:"attributes";a:1:{s:5:"title";s:74:"Get a status report about your site's operation and any detected problems.";}}	system	0	0	0	0	10	3	0	2	16	48	0	0	0	0	0	0	0
navigation	40	18	admin/settings/performance	admin/settings/performance	Performance	a:1:{s:10:"attributes";a:1:{s:5:"title";s:101:"Enable or disable page caching for anonymous users and set CSS and JS bandwidth optimization options.";}}	system	0	0	0	0	0	3	0	2	18	40	0	0	0	0	0	0	0
navigation	41	20	admin/user/permissions	admin/user/permissions	Permissions	a:1:{s:10:"attributes";a:1:{s:5:"title";s:64:"Determine access to features by selecting permissions for roles.";}}	system	0	0	0	0	0	3	0	2	20	41	0	0	0	0	0	0	0
navigation	43	10	admin/content/rss-publishing	admin/content/rss-publishing	RSS publishing	a:1:{s:10:"attributes";a:1:{s:5:"title";s:92:"Configure the number of items per feed and whether feeds should be titles/teasers/full-text.";}}	system	0	0	0	0	0	3	0	2	10	43	0	0	0	0	0	0	0
navigation	44	0	comment/reply/%	comment/reply/%	Reply to comment	a:0:{}	system	-1	0	0	0	0	1	0	44	0	0	0	0	0	0	0	0	0
navigation	112	16	admin/reports/updates	admin/reports/updates	Available updates	a:1:{s:10:"attributes";a:1:{s:5:"title";s:82:"Get a status report about available updates for your installed modules and themes.";}}	system	0	0	0	0	10	3	0	2	16	112	0	0	0	0	0	0	0
navigation	66	30	admin/settings/date-time/lookup	admin/settings/date-time/lookup	Date and time lookup	a:0:{}	system	-1	0	0	0	0	4	0	2	18	30	66	0	0	0	0	0	0
navigation	47	18	admin/settings/site-maintenance	admin/settings/site-maintenance	Site maintenance	a:1:{s:10:"attributes";a:1:{s:5:"title";s:63:"Take the site off-line for maintenance or bring it back online.";}}	system	0	0	0	0	0	3	0	2	18	47	0	0	0	0	0	0	0
navigation	38	17	admin/build/menu	admin/build/menu	Menus	a:1:{s:10:"attributes";a:1:{s:5:"title";s:116:"Control your site's navigation menu, primary links and secondary links, as well as rename and reorganize menu items.";}}	system	0	0	1	0	0	3	0	2	17	38	0	0	0	0	0	0	0
navigation	39	17	admin/build/modules	admin/build/modules	Modules	a:1:{s:10:"attributes";a:1:{s:5:"title";s:47:"Enable or disable add-on modules for your site.";}}	system	0	0	0	0	0	3	0	2	17	39	0	0	0	0	0	0	0
navigation	50	20	admin/user/settings	admin/user/settings	User settings	a:1:{s:10:"attributes";a:1:{s:5:"title";s:101:"Configure default behavior of users, including registration requirements, e-mails, and user pictures.";}}	system	0	0	0	0	0	3	0	2	20	50	0	0	0	0	0	0	0
navigation	51	20	admin/user/user	admin/user/user	Users	a:1:{s:10:"attributes";a:1:{s:5:"title";s:26:"List, add, and edit users.";}}	system	0	0	0	0	0	3	0	2	20	51	0	0	0	0	0	0	0
navigation	52	15	admin/help/block	admin/help/block	block	a:0:{}	system	-1	0	0	0	0	3	0	2	15	52	0	0	0	0	0	0	0
navigation	53	15	admin/help/color	admin/help/color	color	a:0:{}	system	-1	0	0	0	0	3	0	2	15	53	0	0	0	0	0	0	0
navigation	54	15	admin/help/comment	admin/help/comment	comment	a:0:{}	system	-1	0	0	0	0	3	0	2	15	54	0	0	0	0	0	0	0
navigation	55	15	admin/help/filter	admin/help/filter	filter	a:0:{}	system	-1	0	0	0	0	3	0	2	15	55	0	0	0	0	0	0	0
navigation	56	15	admin/help/help	admin/help/help	help	a:0:{}	system	-1	0	0	0	0	3	0	2	15	56	0	0	0	0	0	0	0
navigation	57	15	admin/help/menu	admin/help/menu	menu	a:0:{}	system	-1	0	0	0	0	3	0	2	15	57	0	0	0	0	0	0	0
navigation	58	15	admin/help/node	admin/help/node	node	a:0:{}	system	-1	0	0	0	0	3	0	2	15	58	0	0	0	0	0	0	0
navigation	59	15	admin/help/system	admin/help/system	system	a:0:{}	system	-1	0	0	0	0	3	0	2	15	59	0	0	0	0	0	0	0
navigation	60	15	admin/help/user	admin/help/user	user	a:0:{}	system	-1	0	0	0	0	3	0	2	15	60	0	0	0	0	0	0	0
navigation	61	36	admin/settings/filters/%	admin/settings/filters/%		a:0:{}	system	-1	0	0	0	0	4	0	2	18	36	61	0	0	0	0	0	0
navigation	62	26	admin/settings/clean-urls/check	admin/settings/clean-urls/check	Clean URL check	a:0:{}	system	-1	0	0	0	0	4	0	2	18	26	62	0	0	0	0	0	0
navigation	63	23	admin/settings/actions/configure	admin/settings/actions/configure	Configure an advanced action	a:0:{}	system	-1	0	0	0	0	4	0	2	18	23	63	0	0	0	0	0	0
navigation	64	25	admin/build/block/configure	admin/build/block/configure	Configure block	a:0:{}	system	-1	0	0	0	0	4	0	2	17	25	64	0	0	0	0	0	0
navigation	65	17	admin/build/menu-customize/%	admin/build/menu-customize/%	Customize menu	a:0:{}	system	-1	0	0	0	0	3	0	2	17	65	0	0	0	0	0	0	0
navigation	37	18	admin/settings/logging	admin/settings/logging	Logging and alerts	a:1:{s:10:"attributes";a:1:{s:5:"title";s:156:"Settings for logging and alerts modules. Various modules can route Drupal's system events to different destination, such as syslog, database, email, ...etc.";}}	system	0	0	1	0	0	3	0	2	18	37	0	0	0	0	0	0	0
navigation	45	20	admin/user/roles	admin/user/roles	Roles	a:1:{s:10:"attributes";a:1:{s:5:"title";s:30:"List, edit, or add user roles.";}}	system	0	0	0	0	0	3	0	2	20	45	0	0	0	0	0	0	0
navigation	46	18	admin/settings/site-information	admin/settings/site-information	Site information	a:1:{s:10:"attributes";a:1:{s:5:"title";s:107:"Change basic site information, such as the site name, slogan, e-mail address, mission, front page and more.";}}	system	0	0	0	0	0	3	0	2	18	46	0	0	0	0	0	0	0
navigation	49	17	admin/build/themes	admin/build/themes	Themes	a:1:{s:10:"attributes";a:1:{s:5:"title";s:57:"Change which theme your site uses or allows users to set.";}}	system	0	0	0	0	0	3	0	2	17	49	0	0	0	0	0	0	0
navigation	77	23	admin/settings/actions/delete/%	admin/settings/actions/delete/%	Delete action	a:1:{s:10:"attributes";a:1:{s:5:"title";s:17:"Delete an action.";}}	system	-1	0	0	0	0	4	0	2	18	23	77	0	0	0	0	0	0
navigation	78	0	admin/build/menu-customize/%/delete	admin/build/menu-customize/%/delete	Delete menu	a:0:{}	system	-1	0	0	0	0	1	0	78	0	0	0	0	0	0	0	0	0
navigation	72	48	admin/reports/status/php	admin/reports/status/php	PHP	a:0:{}	system	-1	0	0	0	0	4	0	2	16	48	72	0	0	0	0	0	0
navigation	73	42	admin/content/node-settings/rebuild	admin/content/node-settings/rebuild	Rebuild permissions	a:0:{}	system	-1	0	0	0	0	4	0	2	10	42	73	0	0	0	0	0	0
navigation	97	16	admin/reports/access-denied	admin/reports/access-denied	Top 'access denied' errors	a:1:{s:10:"attributes";a:1:{s:5:"title";s:35:"View 'access denied' errors (403s).";}}	system	0	0	0	0	0	3	0	2	16	97	0	0	0	0	0	0	0
navigation	98	16	admin/reports/page-not-found	admin/reports/page-not-found	Top 'page not found' errors	a:1:{s:10:"attributes";a:1:{s:5:"title";s:36:"View 'page not found' errors (404s).";}}	system	0	0	0	0	0	3	0	2	16	98	0	0	0	0	0	0	0
navigation	93	18	admin/settings/language	admin/settings/language	Languages	a:1:{s:10:"attributes";a:1:{s:5:"title";s:55:"Configure languages for content and the user interface.";}}	system	0	0	0	0	0	3	0	2	18	93	0	0	0	0	0	0	0
navigation	94	16	admin/reports/dblog	admin/reports/dblog	Recent log entries	a:1:{s:10:"attributes";a:1:{s:5:"title";s:43:"View events that have recently been logged.";}}	system	0	0	0	0	-1	3	0	2	16	94	0	0	0	0	0	0	0
navigation	101	15	admin/help/locale	admin/help/locale	locale	a:0:{}	system	-1	0	0	0	0	3	0	2	15	101	0	0	0	0	0	0	0
navigation	102	15	admin/help/taxonomy	admin/help/taxonomy	taxonomy	a:0:{}	system	-1	0	0	0	0	3	0	2	15	102	0	0	0	0	0	0	0
navigation	68	36	admin/settings/filters/delete	admin/settings/filters/delete	Delete input format	a:0:{}	system	-1	0	0	0	0	4	0	2	18	36	68	0	0	0	0	0	0
navigation	69	22	admin/user/rules/delete	admin/user/rules/delete	Delete rule	a:0:{}	system	-1	0	0	0	0	4	0	2	20	22	69	0	0	0	0	0	0
navigation	70	45	admin/user/roles/edit	admin/user/roles/edit	Edit role	a:0:{}	system	-1	0	0	0	0	4	0	2	20	45	70	0	0	0	0	0	0
navigation	71	22	admin/user/rules/edit	admin/user/rules/edit	Edit rule	a:0:{}	system	-1	0	0	0	0	4	0	2	20	22	71	0	0	0	0	0	0
navigation	79	25	admin/build/block/list/js	admin/build/block/list/js	JavaScript List Form	a:0:{}	system	-1	0	0	0	0	4	0	2	17	25	79	0	0	0	0	0	0
navigation	80	39	admin/build/modules/list/confirm	admin/build/modules/list/confirm	List	a:0:{}	system	-1	0	0	0	0	4	0	2	17	39	80	0	0	0	0	0	0
navigation	74	23	admin/settings/actions/orphan	admin/settings/actions/orphan	Remove orphans	a:0:{}	system	-1	0	0	0	0	4	0	2	18	23	74	0	0	0	0	0	0
navigation	75	48	admin/reports/status/run-cron	admin/reports/status/run-cron	Run cron	a:0:{}	system	-1	0	0	0	0	4	0	2	16	48	75	0	0	0	0	0	0
navigation	76	48	admin/reports/status/sql	admin/reports/status/sql	SQL	a:0:{}	system	-1	0	0	0	0	4	0	2	16	48	76	0	0	0	0	0	0
navigation	99	17	admin/build/translate	admin/build/translate	Translate interface	a:1:{s:10:"attributes";a:1:{s:5:"title";s:59:"Translate the built in interface and optionally other text.";}}	system	0	0	0	0	0	3	0	2	17	99	0	0	0	0	0	0	0
navigation	100	15	admin/help/dblog	admin/help/dblog	dblog	a:0:{}	system	-1	0	0	0	0	3	0	2	15	100	0	0	0	0	0	0	0
navigation	89	38	admin/build/menu-customize/navigation	admin/build/menu-customize/%	ナビゲーション	a:0:{}	menu	0	0	0	0	0	4	0	2	17	38	89	0	0	0	0	0	0
navigation	88	38	admin/build/menu/item/%/reset	admin/build/menu/item/%/reset	Reset menu item	a:0:{}	system	-1	0	0	0	0	4	0	2	17	38	88	0	0	0	0	0	0
navigation	90	38	admin/build/menu-customize/primary-links	admin/build/menu-customize/%	プライマリリンク	a:0:{}	menu	0	0	0	0	0	4	0	2	17	38	90	0	0	0	0	0	0
navigation	91	38	admin/build/menu-customize/secondary-links	admin/build/menu-customize/%	セカンダリリンク	a:0:{}	menu	0	0	0	0	0	4	0	2	17	38	91	0	0	0	0	0	0
navigation	81	0	user/reset/%/%/%	user/reset/%/%/%	Reset password	a:0:{}	system	-1	0	0	0	0	1	0	81	0	0	0	0	0	0	0	0	0
navigation	82	39	admin/build/modules/uninstall/confirm	admin/build/modules/uninstall/confirm	Uninstall	a:0:{}	system	-1	0	0	0	0	4	0	2	17	39	82	0	0	0	0	0	0
navigation	83	0	node/%/revisions/%/delete	node/%/revisions/%/delete	Delete earlier revision	a:0:{}	system	-1	0	0	0	0	1	0	83	0	0	0	0	0	0	0	0	0
navigation	84	0	node/%/revisions/%/revert	node/%/revisions/%/revert	Revert to earlier revision	a:0:{}	system	-1	0	0	0	0	1	0	84	0	0	0	0	0	0	0	0	0
navigation	85	0	node/%/revisions/%/view	node/%/revisions/%/view	Revisions	a:0:{}	system	-1	0	0	0	0	1	0	85	0	0	0	0	0	0	0	0	0
navigation	86	38	admin/build/menu/item/%/delete	admin/build/menu/item/%/delete	Delete menu item	a:0:{}	system	-1	0	0	0	0	4	0	2	17	38	86	0	0	0	0	0	0
navigation	87	38	admin/build/menu/item/%/edit	admin/build/menu/item/%/edit	Edit menu item	a:0:{}	system	-1	0	0	0	0	4	0	2	17	38	87	0	0	0	0	0	0
navigation	95	10	admin/content/taxonomy	admin/content/taxonomy	Taxonomy	a:1:{s:10:"attributes";a:1:{s:5:"title";s:67:"Manage tagging, categorization, and classification of your content.";}}	system	0	0	0	0	0	3	0	2	10	95	0	0	0	0	0	0	0
navigation	96	0	taxonomy/term/%	taxonomy/term/%	Taxonomy term	a:0:{}	system	-1	0	0	0	0	1	0	96	0	0	0	0	0	0	0	0	0
navigation	92	0	taxonomy/autocomplete	taxonomy/autocomplete	Autocomplete taxonomy	a:0:{}	system	-1	0	0	0	0	1	0	92	0	0	0	0	0	0	0	0	0
navigation	118	10	admin/content/node-type/page	admin/content/node-type/page	ページ	a:0:{}	system	-1	0	0	0	0	3	0	2	10	118	0	0	0	0	0	0	0
navigation	106	93	admin/settings/language/delete/%	admin/settings/language/delete/%	Confirm	a:0:{}	system	-1	0	0	0	0	4	0	2	18	93	106	0	0	0	0	0	0
navigation	103	37	admin/settings/logging/dblog	admin/settings/logging/dblog	Database logging	a:1:{s:10:"attributes";a:1:{s:5:"title";s:169:"Settings for logging to the Drupal database logs. This is the most common method for small to medium sites on shared hosting. The logs are viewable from the admin pages.";}}	system	0	0	0	0	0	4	0	2	18	37	103	0	0	0	0	0	0
navigation	119	0	admin/content/node-type/page/delete	admin/content/node-type/page/delete	Delete	a:0:{}	system	-1	0	0	0	0	1	0	119	0	0	0	0	0	0	0	0	0
navigation	120	0	admin/content/node-type/story/delete	admin/content/node-type/story/delete	Delete	a:0:{}	system	-1	0	0	0	0	1	0	120	0	0	0	0	0	0	0	0	0
navigation	107	99	admin/build/translate/delete/%	admin/build/translate/delete/%	Delete string	a:0:{}	system	-1	0	0	0	0	4	0	2	17	99	107	0	0	0	0	0	0
navigation	108	93	admin/settings/language/edit/%	admin/settings/language/edit/%	Edit language	a:0:{}	system	-1	0	0	0	0	4	0	2	18	93	108	0	0	0	0	0	0
navigation	113	15	admin/help/update	admin/help/update	update	a:0:{}	system	-1	0	0	0	0	3	0	2	15	113	0	0	0	0	0	0	0
navigation	114	11	node/add/story	node/add/story	ストーリー	a:1:{s:10:"attributes";a:1:{s:5:"title";s:495:"<em>ストーリー</em> （形の上では <em>ページ</em> と同様）は、「お知らせ」や「ニュース」のようなコンテンツの表示・作成に理想的です。 プレスリリース、サイトの告知、略式のブログのようなエントリは、すべて <em>ストーリー</em> で作成できます。 デフォルトで <em>ストーリー</em> エントリは、自動的にフロントページに掲載され、コメントの投稿を許可します。";}}	system	0	0	0	0	0	2	0	11	114	0	0	0	0	0	0	0	0
navigation	115	11	node/add/page	node/add/page	ページ	a:1:{s:10:"attributes";a:1:{s:5:"title";s:414:"<em>ページ</em> （形の上では <em>ストーリー</em> と同様）は、例えば「サイトについて」のような、めったに変更のない情報（静的ページ）を作成・表示するための簡単な方法です。 デフォルトで <em>ページ</em> エントリは、訪問者のコメントを許可せず、フロントページに掲載されないようになっています。";}}	system	0	0	0	0	0	2	0	11	115	0	0	0	0	0	0	0	0
navigation	36	18	admin/settings/filters	admin/settings/filters	Input formats	a:1:{s:10:"attributes";a:1:{s:5:"title";s:127:"Configure how content input by users is filtered, including allowed HTML tags. Also allows enabling of module-provided filters.";}}	system	0	0	0	0	0	3	0	2	18	36	0	0	0	0	0	0	0
navigation	104	16	admin/reports/event/%	admin/reports/event/%	Details	a:0:{}	system	-1	0	0	0	0	3	0	2	16	104	0	0	0	0	0	0	0
navigation	105	95	admin/content/taxonomy/%	admin/content/taxonomy/%	List terms	a:0:{}	system	-1	0	0	0	0	4	0	2	10	95	105	0	0	0	0	0	0
navigation	116	112	admin/reports/updates/check	admin/reports/updates/check	Manual update check	a:0:{}	system	-1	0	0	0	0	4	0	2	16	112	116	0	0	0	0	0	0
navigation	42	10	admin/content/node-settings	admin/content/node-settings	Post settings	a:1:{s:10:"attributes";a:1:{s:5:"title";s:126:"Control posting behavior, such as teaser length, requiring previews before posting, and the number of posts on the front page.";}}	system	0	0	0	0	0	3	0	2	10	42	0	0	0	0	0	0	0
navigation	117	10	admin/content/node-type/story	admin/content/node-type/story	ストーリー	a:0:{}	system	-1	0	0	0	0	3	0	2	10	117	0	0	0	0	0	0	0
navigation	109	99	admin/build/translate/edit/%	admin/build/translate/edit/%	Edit string	a:0:{}	system	-1	0	0	0	0	4	0	2	17	99	109	0	0	0	0	0	0
navigation	110	95	admin/content/taxonomy/edit/term	admin/content/taxonomy/edit/term	Edit term	a:0:{}	system	-1	0	0	0	0	4	0	2	10	95	110	0	0	0	0	0	0
navigation	111	95	admin/content/taxonomy/edit/vocabulary/%	admin/content/taxonomy/edit/vocabulary/%	Edit vocabulary	a:0:{}	system	-1	0	0	0	0	4	0	2	10	95	111	0	0	0	0	0	0
\.


--
-- Data for Name: menu_router; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY menu_router (path, load_functions, to_arg_functions, access_callback, access_arguments, page_callback, page_arguments, fit, number_parts, tab_parent, tab_root, title, title_callback, title_arguments, type, block_callback, description, "position", weight, file) FROM stdin;
user			1	a:0:{}	user_page	a:0:{}	1	1		user	User account	t		4				0	modules/user/user.pages.inc
user/login			user_is_anonymous	a:0:{}	user_page	a:0:{}	3	2	user	user	Log in	t		136				0	modules/user/user.pages.inc
system/files			1	a:0:{}	file_download	a:0:{}	3	2		system/files	File download	t		4				0	
taxonomy/autocomplete			user_access	a:1:{i:0;s:14:"access content";}	taxonomy_autocomplete	a:0:{}	3	2		taxonomy/autocomplete	Autocomplete taxonomy	t		4				0	modules/taxonomy/taxonomy.pages.inc
admin/by-module			user_access	a:1:{i:0;s:27:"access administration pages";}	system_admin_by_module	a:0:{}	3	2	admin	admin	By module	t		128				2	modules/system/system.admin.inc
admin/by-task			user_access	a:1:{i:0;s:27:"access administration pages";}	system_main_admin_page	a:0:{}	3	2	admin	admin	By task	t		136				0	modules/system/system.admin.inc
admin/compact			user_access	a:1:{i:0;s:27:"access administration pages";}	system_admin_compact_page	a:0:{}	3	2		admin/compact	Compact mode	t		4				0	modules/system/system.admin.inc
filter/tips			1	a:0:{}	filter_tips_long	a:0:{}	3	2		filter/tips	Compose tips	t		20				0	modules/filter/filter.pages.inc
node/add			_node_add_access	a:0:{}	node_add_page	a:0:{}	3	2		node/add	Create content	t		6				1	modules/node/node.pages.inc
comment/delete			user_access	a:1:{i:0;s:19:"administer comments";}	comment_delete	a:0:{}	3	2		comment/delete	Delete comment	t		4				0	modules/comment/comment.admin.inc
comment/edit			user_access	a:1:{i:0;s:13:"post comments";}	comment_edit	a:0:{}	3	2		comment/edit	Edit comment	t		4				0	modules/comment/comment.pages.inc
admin/help			user_access	a:1:{i:0;s:27:"access administration pages";}	help_main	a:0:{}	3	2		admin/help	Help	t		6				9	modules/help/help.admin.inc
user/register			user_register_access	a:0:{}	drupal_get_form	a:1:{i:0;s:13:"user_register";}	3	2	user	user	Create new account	t		128				0	modules/user/user.pages.inc
user/password			user_is_anonymous	a:0:{}	drupal_get_form	a:1:{i:0;s:9:"user_pass";}	3	2	user	user	Request new password	t		128				0	modules/user/user.pages.inc
user/autocomplete			user_access	a:1:{i:0;s:20:"access user profiles";}	user_autocomplete	a:0:{}	3	2		user/autocomplete	User autocomplete	t		4				0	modules/user/user.pages.inc
admin/content			user_access	a:1:{i:0;s:27:"access administration pages";}	system_admin_menu_block_page	a:0:{}	3	2		admin/content	Content management	t		6		Manage your site's content.	left	-10	modules/system/system.admin.inc
admin/reports			user_access	a:1:{i:0;s:19:"access site reports";}	system_admin_menu_block_page	a:0:{}	3	2		admin/reports	Reports	t		6		View reports from system logs and other status information.	left	5	modules/system/system.admin.inc
admin/build			user_access	a:1:{i:0;s:27:"access administration pages";}	system_admin_menu_block_page	a:0:{}	3	2		admin/build	Site building	t		6		Control how your site looks and feels.	right	-10	modules/system/system.admin.inc
admin/settings			user_access	a:1:{i:0;s:27:"access administration pages";}	system_settings_overview	a:0:{}	3	2		admin/settings	Site configuration	t		6		Adjust basic site configuration options.	right	-5	modules/system/system.admin.inc
node/%	a:1:{i:1;s:9:"node_load";}		node_access	a:2:{i:0;s:4:"view";i:1;i:1;}	node_page_view	a:1:{i:0;i:1;}	2	2		node/%		node_page_title	a:1:{i:0;i:1;}	4				0	
admin/user			user_access	a:1:{i:0;s:27:"access administration pages";}	system_admin_menu_block_page	a:0:{}	3	2		admin/user	User management	t		6		Manage your site's users, groups and access to site features.	left	0	modules/system/system.admin.inc
user/%	a:1:{i:1;s:22:"user_uid_optional_load";}	a:1:{i:1;s:24:"user_uid_optional_to_arg";}	user_view_access	a:1:{i:0;i:1;}	user_view	a:1:{i:0;i:1;}	2	2		user/%	My account	user_page_title	a:1:{i:0;i:1;}	6				0	modules/user/user.pages.inc
node/%/view	a:1:{i:1;s:9:"node_load";}		node_access	a:2:{i:0;s:4:"view";i:1;i:1;}	node_page_view	a:1:{i:0;i:1;}	5	3	node/%	node/%	View	t		136				-10	
user/%/view	a:1:{i:1;s:9:"user_load";}		user_view_access	a:1:{i:0;i:1;}	user_view	a:1:{i:0;i:1;}	5	3	user/%	user/%	View	t		136				-10	modules/user/user.pages.inc
admin/settings/actions			user_access	a:1:{i:0;s:18:"administer actions";}	system_actions_manage	a:0:{}	7	3		admin/settings/actions	Actions	t		6		Manage the actions defined for your site.		0	
admin/user/rules			user_access	a:1:{i:0;s:22:"administer permissions";}	user_admin_access	a:0:{}	7	3		admin/user/rules	Access rules	t		6		List and create rules to disallow usernames, e-mail addresses, and IP addresses.		0	modules/user/user.admin.inc
admin/reports/updates			user_access	a:1:{i:0;s:29:"administer site configuration";}	update_status	a:0:{}	7	3		admin/reports/updates	Available updates	t		6		Get a status report about available updates for your installed modules and themes.		10	modules/update/update.report.inc
admin/build/block			user_access	a:1:{i:0;s:17:"administer blocks";}	block_admin_display	a:0:{}	7	3		admin/build/block	Blocks	t		6		Configure what block content appears in your site's sidebars and other regions.		0	modules/block/block.admin.inc
admin/content/comment			user_access	a:1:{i:0;s:19:"administer comments";}	comment_admin	a:0:{}	7	3		admin/content/comment	Comments	t		6		List and edit site comments and the comment moderation queue.		0	modules/comment/comment.admin.inc
admin/content/types			user_access	a:1:{i:0;s:24:"administer content types";}	node_overview_types	a:0:{}	7	3		admin/content/types	Content types	t		6		Manage posts by content type, including default status, front page promotion, etc.		0	modules/node/content_types.inc
admin/settings/language			user_access	a:1:{i:0;s:20:"administer languages";}	locale_inc_callback	a:2:{i:0;s:15:"drupal_get_form";i:1;s:30:"locale_languages_overview_form";}	7	3		admin/settings/language	Languages	t		6		Configure languages for content and the user interface.		0	
admin/settings/logging			user_access	a:1:{i:0;s:29:"administer site configuration";}	system_logging_overview	a:0:{}	7	3		admin/settings/logging	Logging and alerts	t		6		Settings for logging and alerts modules. Various modules can route Drupal's system events to different destination, such as syslog, database, email, ...etc.		0	modules/system/system.admin.inc
admin/reports/dblog			user_access	a:1:{i:0;s:19:"access site reports";}	dblog_overview	a:0:{}	7	3		admin/reports/dblog	Recent log entries	t		6		View events that have recently been logged.		-1	modules/dblog/dblog.admin.inc
admin/reports/status			user_access	a:1:{i:0;s:29:"administer site configuration";}	system_status	a:0:{}	7	3		admin/reports/status	Status report	t		6		Get a status report about your site's operation and any detected problems.		10	modules/system/system.admin.inc
taxonomy/term/%	a:1:{i:2;N;}		user_access	a:1:{i:0;s:14:"access content";}	taxonomy_term_page	a:1:{i:0;i:2;}	6	3		taxonomy/term/%	Taxonomy term	t		4				0	modules/taxonomy/taxonomy.pages.inc
admin/build/translate			user_access	a:1:{i:0;s:19:"translate interface";}	locale_inc_callback	a:1:{i:0;s:32:"locale_translate_overview_screen";}	7	3		admin/build/translate	Translate interface	t		6		Translate the built in interface and optionally other text.		0	
admin/help/block			user_access	a:1:{i:0;s:27:"access administration pages";}	help_page	a:1:{i:0;i:2;}	7	3		admin/help/block	block	t		4				0	modules/help/help.admin.inc
admin/help/color			user_access	a:1:{i:0;s:27:"access administration pages";}	help_page	a:1:{i:0;i:2;}	7	3		admin/help/color	color	t		4				0	modules/help/help.admin.inc
admin/help/comment			user_access	a:1:{i:0;s:27:"access administration pages";}	help_page	a:1:{i:0;i:2;}	7	3		admin/help/comment	comment	t		4				0	modules/help/help.admin.inc
admin/help/dblog			user_access	a:1:{i:0;s:27:"access administration pages";}	help_page	a:1:{i:0;i:2;}	7	3		admin/help/dblog	dblog	t		4				0	modules/help/help.admin.inc
admin/help/filter			user_access	a:1:{i:0;s:27:"access administration pages";}	help_page	a:1:{i:0;i:2;}	7	3		admin/help/filter	filter	t		4				0	modules/help/help.admin.inc
admin/help/help			user_access	a:1:{i:0;s:27:"access administration pages";}	help_page	a:1:{i:0;i:2;}	7	3		admin/help/help	help	t		4				0	modules/help/help.admin.inc
admin/help/locale			user_access	a:1:{i:0;s:27:"access administration pages";}	help_page	a:1:{i:0;i:2;}	7	3		admin/help/locale	locale	t		4				0	modules/help/help.admin.inc
admin/help/menu			user_access	a:1:{i:0;s:27:"access administration pages";}	help_page	a:1:{i:0;i:2;}	7	3		admin/help/menu	menu	t		4				0	modules/help/help.admin.inc
admin/help/node			user_access	a:1:{i:0;s:27:"access administration pages";}	help_page	a:1:{i:0;i:2;}	7	3		admin/help/node	node	t		4				0	modules/help/help.admin.inc
admin/help/system			user_access	a:1:{i:0;s:27:"access administration pages";}	help_page	a:1:{i:0;i:2;}	7	3		admin/help/system	system	t		4				0	modules/help/help.admin.inc
admin/help/taxonomy			user_access	a:1:{i:0;s:27:"access administration pages";}	help_page	a:1:{i:0;i:2;}	7	3		admin/help/taxonomy	taxonomy	t		4				0	modules/help/help.admin.inc
admin/help/update			user_access	a:1:{i:0;s:27:"access administration pages";}	help_page	a:1:{i:0;i:2;}	7	3		admin/help/update	update	t		4				0	modules/help/help.admin.inc
admin/help/user			user_access	a:1:{i:0;s:27:"access administration pages";}	help_page	a:1:{i:0;i:2;}	7	3		admin/help/user	user	t		4				0	modules/help/help.admin.inc
admin/settings/clean-urls			user_access	a:1:{i:0;s:29:"administer site configuration";}	drupal_get_form	a:1:{i:0;s:25:"system_clean_url_settings";}	7	3		admin/settings/clean-urls	Clean URLs	t		6		Enable or disable clean URLs for your site.		0	modules/system/system.admin.inc
admin/content/node			user_access	a:1:{i:0;s:16:"administer nodes";}	drupal_get_form	a:1:{i:0;s:18:"node_admin_content";}	7	3		admin/content/node	Content	t		6		View, edit, and delete your site's content.		0	modules/node/node.admin.inc
admin/settings/date-time			user_access	a:1:{i:0;s:29:"administer site configuration";}	drupal_get_form	a:1:{i:0;s:25:"system_date_time_settings";}	7	3		admin/settings/date-time	Date and time	t		6		Settings for how Drupal displays date and time, as well as the system's default timezone.		0	modules/system/system.admin.inc
node/%/delete	a:1:{i:1;s:9:"node_load";}		node_access	a:2:{i:0;s:6:"delete";i:1;i:1;}	drupal_get_form	a:2:{i:0;s:19:"node_delete_confirm";i:1;i:1;}	5	3		node/%/delete	Delete	t		4				1	modules/node/node.pages.inc
user/%/delete	a:1:{i:1;s:9:"user_load";}		user_delete_access	a:1:{i:0;i:1;}	drupal_get_form	a:2:{i:0;s:19:"user_confirm_delete";i:1;i:1;}	5	3		user/%/delete	Delete	t		4				0	modules/user/user.pages.inc
node/%/edit	a:1:{i:1;s:9:"node_load";}		node_access	a:2:{i:0;s:6:"update";i:1;i:1;}	node_page_edit	a:1:{i:0;i:1;}	5	3	node/%	node/%	Edit	t		128				1	modules/node/node.pages.inc
admin/settings/error-reporting			user_access	a:1:{i:0;s:29:"administer site configuration";}	drupal_get_form	a:1:{i:0;s:31:"system_error_reporting_settings";}	7	3		admin/settings/error-reporting	Error reporting	t		6		Control how Drupal deals with errors including 403/404 errors as well as PHP error reporting.		0	modules/system/system.admin.inc
admin/settings/file-system			user_access	a:1:{i:0;s:29:"administer site configuration";}	drupal_get_form	a:1:{i:0;s:27:"system_file_system_settings";}	7	3		admin/settings/file-system	File system	t		6		Tell Drupal where to store uploaded files and how they are accessed.		0	modules/system/system.admin.inc
admin/build/modules/list			user_access	a:1:{i:0;s:29:"administer site configuration";}	drupal_get_form	a:1:{i:0;s:14:"system_modules";}	15	4	admin/build/modules	admin/build/modules	List	t		136				0	modules/system/system.admin.inc
admin/settings/image-toolkit			user_access	a:1:{i:0;s:29:"administer site configuration";}	drupal_get_form	a:1:{i:0;s:29:"system_image_toolkit_settings";}	7	3		admin/settings/image-toolkit	Image toolkit	t		6		Choose which image toolkit to use if you have installed optional toolkits.		0	modules/system/system.admin.inc
admin/settings/filters			user_access	a:1:{i:0;s:18:"administer filters";}	drupal_get_form	a:1:{i:0;s:21:"filter_admin_overview";}	7	3		admin/settings/filters	Input formats	t		6		Configure how content input by users is filtered, including allowed HTML tags. Also allows enabling of module-provided filters.		0	modules/filter/filter.admin.inc
node			user_access	a:1:{i:0;s:14:"access content";}	node_page_default	a:0:{}	1	1		node	Content	t		4				0	
rss.xml			user_access	a:1:{i:0;s:14:"access content";}	node_feed	a:0:{}	1	1		rss.xml	RSS feed	t		4				0	
batch			1	a:0:{}	system_batch_page	a:0:{}	1	1		batch		t		4				0	modules/system/system.admin.inc
admin			user_access	a:1:{i:0;s:27:"access administration pages";}	system_main_admin_page	a:0:{}	1	1		admin	Administer	t		6				9	modules/system/system.admin.inc
logout			user_is_logged_in	a:0:{}	user_logout	a:0:{}	1	1		logout	Log out	t		6				10	modules/user/user.pages.inc
admin/build/menu			user_access	a:1:{i:0;s:15:"administer menu";}	menu_overview_page	a:0:{}	7	3		admin/build/menu	Menus	t		6		Control your site's navigation menu, primary links and secondary links, as well as rename and reorganize menu items.		0	modules/menu/menu.admin.inc
admin/build/modules			user_access	a:1:{i:0;s:29:"administer site configuration";}	drupal_get_form	a:1:{i:0;s:14:"system_modules";}	7	3		admin/build/modules	Modules	t		6		Enable or disable add-on modules for your site.		0	modules/system/system.admin.inc
admin/settings/performance			user_access	a:1:{i:0;s:29:"administer site configuration";}	drupal_get_form	a:1:{i:0;s:27:"system_performance_settings";}	7	3		admin/settings/performance	Performance	t		6		Enable or disable page caching for anonymous users and set CSS and JS bandwidth optimization options.		0	modules/system/system.admin.inc
admin/user/permissions			user_access	a:1:{i:0;s:22:"administer permissions";}	drupal_get_form	a:1:{i:0;s:15:"user_admin_perm";}	7	3		admin/user/permissions	Permissions	t		6		Determine access to features by selecting permissions for roles.		0	modules/user/user.admin.inc
admin/content/node-settings			user_access	a:1:{i:0;s:16:"administer nodes";}	drupal_get_form	a:1:{i:0;s:14:"node_configure";}	7	3		admin/content/node-settings	Post settings	t		6		Control posting behavior, such as teaser length, requiring previews before posting, and the number of posts on the front page.		0	modules/node/node.admin.inc
admin/content/rss-publishing			user_access	a:1:{i:0;s:29:"administer site configuration";}	drupal_get_form	a:1:{i:0;s:25:"system_rss_feeds_settings";}	7	3		admin/content/rss-publishing	RSS publishing	t		6		Configure the number of items per feed and whether feeds should be titles/teasers/full-text.		0	modules/system/system.admin.inc
comment/reply/%	a:1:{i:2;s:9:"node_load";}		node_access	a:2:{i:0;s:4:"view";i:1;i:2;}	comment_reply	a:1:{i:0;i:2;}	6	3		comment/reply/%	Reply to comment	t		4				0	modules/comment/comment.pages.inc
node/%/revisions	a:1:{i:1;s:9:"node_load";}		_node_revision_access	a:1:{i:0;i:1;}	node_revision_overview	a:1:{i:0;i:1;}	5	3	node/%	node/%	Revisions	t		128				2	modules/node/node.pages.inc
admin/user/roles			user_access	a:1:{i:0;s:22:"administer permissions";}	drupal_get_form	a:1:{i:0;s:19:"user_admin_new_role";}	7	3		admin/user/roles	Roles	t		6		List, edit, or add user roles.		0	modules/user/user.admin.inc
admin/settings/site-information			user_access	a:1:{i:0;s:29:"administer site configuration";}	drupal_get_form	a:1:{i:0;s:32:"system_site_information_settings";}	7	3		admin/settings/site-information	Site information	t		6		Change basic site information, such as the site name, slogan, e-mail address, mission, front page and more.		0	modules/system/system.admin.inc
admin/settings/site-maintenance			user_access	a:1:{i:0;s:29:"administer site configuration";}	drupal_get_form	a:1:{i:0;s:32:"system_site_maintenance_settings";}	7	3		admin/settings/site-maintenance	Site maintenance	t		6		Take the site off-line for maintenance or bring it back online.		0	modules/system/system.admin.inc
admin/content/taxonomy			user_access	a:1:{i:0;s:19:"administer taxonomy";}	drupal_get_form	a:1:{i:0;s:30:"taxonomy_overview_vocabularies";}	7	3		admin/content/taxonomy	Taxonomy	t		6		Manage tagging, categorization, and classification of your content.		0	modules/taxonomy/taxonomy.admin.inc
admin/build/themes			user_access	a:1:{i:0;s:29:"administer site configuration";}	drupal_get_form	a:2:{i:0;s:18:"system_themes_form";i:1;N;}	7	3		admin/build/themes	Themes	t		6		Change which theme your site uses or allows users to set.		0	modules/system/system.admin.inc
admin/reports/access-denied			user_access	a:1:{i:0;s:19:"access site reports";}	dblog_top	a:1:{i:0;s:13:"access denied";}	7	3		admin/reports/access-denied	Top 'access denied' errors	t		6		View 'access denied' errors (403s).		0	modules/dblog/dblog.admin.inc
admin/reports/page-not-found			user_access	a:1:{i:0;s:19:"access site reports";}	dblog_top	a:1:{i:0;s:14:"page not found";}	7	3		admin/reports/page-not-found	Top 'page not found' errors	t		6		View 'page not found' errors (404s).		0	modules/dblog/dblog.admin.inc
admin/user/settings			user_access	a:1:{i:0;s:16:"administer users";}	drupal_get_form	a:1:{i:0;s:19:"user_admin_settings";}	7	3		admin/user/settings	User settings	t		6		Configure default behavior of users, including registration requirements, e-mails, and user pictures.		0	modules/user/user.admin.inc
admin/user/user			user_access	a:1:{i:0;s:16:"administer users";}	user_admin	a:1:{i:0;s:4:"list";}	7	3		admin/user/user	Users	t		6		List, add, and edit users.		0	modules/user/user.admin.inc
user/%/edit	a:1:{i:1;a:1:{s:18:"user_category_load";a:2:{i:0;s:4:"%map";i:1;s:6:"%index";}}}		user_edit_access	a:1:{i:0;i:1;}	user_edit	a:1:{i:0;i:1;}	5	3	user/%	user/%	Edit	t		128				0	modules/user/user.pages.inc
admin/settings/admin			user_access	a:1:{i:0;s:29:"administer site configuration";}	drupal_get_form	a:1:{i:0;s:27:"system_admin_theme_settings";}	7	3		admin/settings/admin	Administration theme	t		6	system_admin_theme_settings	Settings for how your administrative pages should look.	left	0	modules/system/system.admin.inc
node/add/story			node_access	a:2:{i:0;s:6:"create";i:1;s:5:"story";}	node_add	a:1:{i:0;i:2;}	7	3		node/add/story	ストーリー	check_plain		6		<em>ストーリー</em> （形の上では <em>ページ</em> と同様）は、「お知らせ」や「ニュース」のようなコンテンツの表示・作成に理想的です。 プレスリリース、サイトの告知、略式のブログのようなエントリは、すべて <em>ストーリー</em> で作成できます。 デフォルトで <em>ストーリー</em> エントリは、自動的にフロントページに掲載され、コメントの投稿を許可します。		0	modules/node/node.pages.inc
node/add/page			node_access	a:2:{i:0;s:6:"create";i:1;s:4:"page";}	node_add	a:1:{i:0;i:2;}	7	3		node/add/page	ページ	check_plain		6		<em>ページ</em> （形の上では <em>ストーリー</em> と同様）は、例えば「サイトについて」のような、めったに変更のない情報（静的ページ）を作成・表示するための簡単な方法です。 デフォルトで <em>ページ</em> エントリは、訪問者のコメントを許可せず、フロントページに掲載されないようになっています。		0	modules/node/node.pages.inc
admin/build/block/list			user_access	a:1:{i:0;s:17:"administer blocks";}	block_admin_display	a:0:{}	15	4	admin/build/block	admin/build/block	List	t		136				-10	modules/block/block.admin.inc
admin/content/node/overview			user_access	a:1:{i:0;s:16:"administer nodes";}	drupal_get_form	a:1:{i:0;s:18:"node_admin_content";}	15	4	admin/content/node	admin/content/node	List	t		136				-10	modules/node/node.admin.inc
admin/content/types/list			user_access	a:1:{i:0;s:24:"administer content types";}	node_overview_types	a:0:{}	15	4	admin/content/types	admin/content/types	List	t		136				-10	modules/node/content_types.inc
admin/content/taxonomy/list			user_access	a:1:{i:0;s:19:"administer taxonomy";}	drupal_get_form	a:1:{i:0;s:30:"taxonomy_overview_vocabularies";}	15	4	admin/content/taxonomy	admin/content/taxonomy	List	t		136				-10	modules/taxonomy/taxonomy.admin.inc
admin/user/rules/list			user_access	a:1:{i:0;s:22:"administer permissions";}	user_admin_access	a:0:{}	15	4	admin/user/rules	admin/user/rules	List	t		136				-10	modules/user/user.admin.inc
admin/settings/filters/list			user_access	a:1:{i:0;s:18:"administer filters";}	drupal_get_form	a:1:{i:0;s:21:"filter_admin_overview";}	15	4	admin/settings/filters	admin/settings/filters	List	t		136				0	modules/filter/filter.admin.inc
admin/user/user/list			user_access	a:1:{i:0;s:16:"administer users";}	user_admin	a:1:{i:0;s:4:"list";}	15	4	admin/user/user	admin/user/user	List	t		136				-10	modules/user/user.admin.inc
admin/settings/language/overview			user_access	a:1:{i:0;s:20:"administer languages";}	locale_inc_callback	a:2:{i:0;s:15:"drupal_get_form";i:1;s:30:"locale_languages_overview_form";}	15	4	admin/settings/language	admin/settings/language	List	t		136				0	
admin/build/translate/overview			user_access	a:1:{i:0;s:19:"translate interface";}	locale_inc_callback	a:1:{i:0;s:32:"locale_translate_overview_screen";}	15	4	admin/build/translate	admin/build/translate	Overview	t		136				0	
admin/content/comment/new			user_access	a:1:{i:0;s:19:"administer comments";}	comment_admin	a:0:{}	15	4	admin/content/comment	admin/content/comment	Published comments	t		136				-10	modules/comment/comment.admin.inc
user/%/edit/account	a:1:{i:1;a:1:{s:18:"user_category_load";a:2:{i:0;s:4:"%map";i:1;s:6:"%index";}}}		user_edit_access	a:1:{i:0;i:1;}	user_edit	a:1:{i:0;i:1;}	11	4	user/%/edit	user/%	Account	t		136				0	modules/user/user.pages.inc
admin/build/themes/select			user_access	a:1:{i:0;s:29:"administer site configuration";}	drupal_get_form	a:2:{i:0;s:18:"system_themes_form";i:1;N;}	15	4	admin/build/themes	admin/build/themes	List	t		136		Select the default theme.		-1	modules/system/system.admin.inc
admin/build/menu/list			user_access	a:1:{i:0;s:15:"administer menu";}	menu_overview_page	a:0:{}	15	4	admin/build/menu	admin/build/menu	List menus	t		136				-10	modules/menu/menu.admin.inc
admin/build/themes/settings			user_access	a:1:{i:0;s:29:"administer site configuration";}	drupal_get_form	a:1:{i:0;s:21:"system_theme_settings";}	15	4	admin/build/themes	admin/build/themes	Configure	t		128				0	modules/system/system.admin.inc
admin/settings/actions/manage			user_access	a:1:{i:0;s:18:"administer actions";}	system_actions_manage	a:0:{}	15	4	admin/settings/actions	admin/settings/actions	Manage actions	t		136		Manage the actions defined for your site.		-2	
admin/settings/actions/orphan			user_access	a:1:{i:0;s:18:"administer actions";}	system_actions_remove_orphans	a:0:{}	15	4		admin/settings/actions/orphan	Remove orphans	t		4				0	
admin/build/modules/uninstall			user_access	a:1:{i:0;s:29:"administer site configuration";}	drupal_get_form	a:1:{i:0;s:24:"system_modules_uninstall";}	15	4	admin/build/modules	admin/build/modules	Uninstall	t		128				0	modules/system/system.admin.inc
admin/settings/filters/add			user_access	a:1:{i:0;s:18:"administer filters";}	filter_admin_format_page	a:0:{}	15	4	admin/settings/filters	admin/settings/filters	Add input format	t		128				1	modules/filter/filter.admin.inc
admin/settings/language/add			user_access	a:1:{i:0;s:20:"administer languages";}	locale_inc_callback	a:1:{i:0;s:27:"locale_languages_add_screen";}	15	4	admin/settings/language	admin/settings/language	Add language	t		128				5	
admin/user/rules/add			user_access	a:1:{i:0;s:22:"administer permissions";}	user_admin_access_add	a:0:{}	15	4	admin/user/rules	admin/user/rules	Add rule	t		128				0	modules/user/user.admin.inc
admin/user/user/create			user_access	a:1:{i:0;s:16:"administer users";}	user_admin	a:1:{i:0;s:6:"create";}	15	4	admin/user/user	admin/user/user	Add user	t		128				0	modules/user/user.admin.inc
admin/content/comment/approval			user_access	a:1:{i:0;s:19:"administer comments";}	comment_admin	a:1:{i:0;s:8:"approval";}	15	4	admin/content/comment	admin/content/comment	Approval queue	t		128				0	modules/comment/comment.admin.inc
admin/user/rules/check			user_access	a:1:{i:0;s:22:"administer permissions";}	user_admin_access_check	a:0:{}	15	4	admin/user/rules	admin/user/rules	Check rules	t		128				0	modules/user/user.admin.inc
admin/settings/clean-urls/check			1	a:0:{}	drupal_json	a:1:{i:0;a:1:{s:6:"status";b:1;}}	15	4		admin/settings/clean-urls/check	Clean URL check	t		4				0	
admin/settings/language/configure			user_access	a:1:{i:0;s:20:"administer languages";}	locale_inc_callback	a:2:{i:0;s:15:"drupal_get_form";i:1;s:31:"locale_languages_configure_form";}	15	4	admin/settings/language	admin/settings/language	Configure	t		128				10	
admin/settings/actions/configure			user_access	a:1:{i:0;s:18:"administer actions";}	drupal_get_form	a:1:{i:0;s:24:"system_actions_configure";}	15	4		admin/settings/actions/configure	Configure an advanced action	t		4				0	
admin/settings/date-time/lookup			user_access	a:1:{i:0;s:29:"administer site configuration";}	system_date_time_lookup	a:0:{}	15	4		admin/settings/date-time/lookup	Date and time lookup	t		4				0	modules/system/system.admin.inc
admin/user/roles/edit			user_access	a:1:{i:0;s:22:"administer permissions";}	drupal_get_form	a:1:{i:0;s:15:"user_admin_role";}	15	4		admin/user/roles/edit	Edit role	t		4				0	modules/user/user.admin.inc
admin/user/rules/edit			user_access	a:1:{i:0;s:22:"administer permissions";}	user_admin_access_edit	a:0:{}	15	4		admin/user/rules/edit	Edit rule	t		4				0	modules/user/user.admin.inc
admin/build/translate/export			user_access	a:1:{i:0;s:19:"translate interface";}	locale_inc_callback	a:1:{i:0;s:30:"locale_translate_export_screen";}	15	4	admin/build/translate	admin/build/translate	Export	t		128				30	
admin/build/translate/import			user_access	a:1:{i:0;s:19:"translate interface";}	locale_inc_callback	a:2:{i:0;s:15:"drupal_get_form";i:1;s:28:"locale_translate_import_form";}	15	4	admin/build/translate	admin/build/translate	Import	t		128				20	
admin/reports/updates/list			user_access	a:1:{i:0;s:29:"administer site configuration";}	update_status	a:0:{}	15	4	admin/reports/updates	admin/reports/updates	List	t		136				0	modules/update/update.report.inc
admin/reports/updates/check			user_access	a:1:{i:0;s:29:"administer site configuration";}	update_manual_status	a:0:{}	15	4		admin/reports/updates/check	Manual update check	t		4				0	modules/update/update.fetch.inc
admin/reports/status/php			user_access	a:1:{i:0;s:29:"administer site configuration";}	system_php	a:0:{}	15	4		admin/reports/status/php	PHP	t		4				0	modules/system/system.admin.inc
admin/content/node-settings/rebuild			user_access	a:1:{i:0;s:27:"access administration pages";}	drupal_get_form	a:1:{i:0;s:30:"node_configure_rebuild_confirm";}	15	4		admin/content/node-settings/rebuild	Rebuild permissions	t		4				0	modules/node/node.admin.inc
admin/reports/status/run-cron			user_access	a:1:{i:0;s:29:"administer site configuration";}	system_run_cron	a:0:{}	15	4		admin/reports/status/run-cron	Run cron	t		4				0	modules/system/system.admin.inc
admin/reports/status/sql			user_access	a:1:{i:0;s:29:"administer site configuration";}	system_sql	a:0:{}	15	4		admin/reports/status/sql	SQL	t		4				0	modules/system/system.admin.inc
admin/build/translate/search			user_access	a:1:{i:0;s:19:"translate interface";}	locale_inc_callback	a:1:{i:0;s:28:"locale_translate_seek_screen";}	15	4	admin/build/translate	admin/build/translate	Search	t		128				10	
admin/build/block/add			user_access	a:1:{i:0;s:17:"administer blocks";}	drupal_get_form	a:1:{i:0;s:20:"block_add_block_form";}	15	4	admin/build/block	admin/build/block	Add block	t		128				0	modules/block/block.admin.inc
admin/content/types/add			user_access	a:1:{i:0;s:24:"administer content types";}	drupal_get_form	a:1:{i:0;s:14:"node_type_form";}	15	4	admin/content/types	admin/content/types	Add content type	t		128				0	modules/node/content_types.inc
admin/build/menu/add			user_access	a:1:{i:0;s:15:"administer menu";}	drupal_get_form	a:2:{i:0;s:14:"menu_edit_menu";i:1;s:3:"add";}	15	4	admin/build/menu	admin/build/menu	Add menu	t		128				0	modules/menu/menu.admin.inc
admin/build/block/configure			user_access	a:1:{i:0;s:17:"administer blocks";}	drupal_get_form	a:1:{i:0;s:21:"block_admin_configure";}	15	4		admin/build/block/configure	Configure block	t		4				0	modules/block/block.admin.inc
admin/build/block/delete			user_access	a:1:{i:0;s:17:"administer blocks";}	drupal_get_form	a:1:{i:0;s:16:"block_box_delete";}	15	4		admin/build/block/delete	Delete block	t		4				0	modules/block/block.admin.inc
admin/settings/filters/delete			user_access	a:1:{i:0;s:18:"administer filters";}	drupal_get_form	a:1:{i:0;s:19:"filter_admin_delete";}	15	4		admin/settings/filters/delete	Delete input format	t		4				0	modules/filter/filter.admin.inc
admin/user/rules/delete			user_access	a:1:{i:0;s:22:"administer permissions";}	drupal_get_form	a:1:{i:0;s:32:"user_admin_access_delete_confirm";}	15	4		admin/user/rules/delete	Delete rule	t		4				0	modules/user/user.admin.inc
admin/reports/event/%	a:1:{i:3;N;}		user_access	a:1:{i:0;s:19:"access site reports";}	dblog_event	a:1:{i:0;i:3;}	14	4		admin/reports/event/%	Details	t		4				0	modules/dblog/dblog.admin.inc
admin/content/taxonomy/%	a:1:{i:3;s:24:"taxonomy_vocabulary_load";}		user_access	a:1:{i:0;s:19:"administer taxonomy";}	drupal_get_form	a:2:{i:0;s:23:"taxonomy_overview_terms";i:1;i:3;}	14	4		admin/content/taxonomy/%	List terms	t		4				0	modules/taxonomy/taxonomy.admin.inc
admin/build/menu/settings			user_access	a:1:{i:0;s:15:"administer menu";}	drupal_get_form	a:1:{i:0;s:14:"menu_configure";}	15	4	admin/build/menu	admin/build/menu	Settings	t		128				5	modules/menu/menu.admin.inc
admin/reports/updates/settings			user_access	a:1:{i:0;s:29:"administer site configuration";}	drupal_get_form	a:1:{i:0;s:15:"update_settings";}	15	4	admin/reports/updates	admin/reports/updates	Settings	t		128				0	modules/update/update.settings.inc
admin/content/node-type/story			user_access	a:1:{i:0;s:24:"administer content types";}	drupal_get_form	a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:5:"story";s:4:"name";s:15:"ストーリー";s:6:"module";s:4:"node";s:11:"description";s:495:"<em>ストーリー</em> （形の上では <em>ページ</em> と同様）は、「お知らせ」や「ニュース」のようなコンテンツの表示・作成に理想的です。 プレスリリース、サイトの告知、略式のブログのようなエントリは、すべて <em>ストーリー</em> で作成できます。 デフォルトで <em>ストーリー</em> エントリは、自動的にフロントページに掲載され、コメントの投稿を許可します。";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:12:"タイトル";s:8:"has_body";s:1:"1";s:10:"body_label";s:6:"本文";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:5:"story";}}	15	4		admin/content/node-type/story	ストーリー	t		4				0	modules/node/content_types.inc
admin/content/node-type/page			user_access	a:1:{i:0;s:24:"administer content types";}	drupal_get_form	a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:4:"page";s:4:"name";s:9:"ページ";s:6:"module";s:4:"node";s:11:"description";s:414:"<em>ページ</em> （形の上では <em>ストーリー</em> と同様）は、例えば「サイトについて」のような、めったに変更のない情報（静的ページ）を作成・表示するための簡単な方法です。 デフォルトで <em>ページ</em> エントリは、訪問者のコメントを許可せず、フロントページに掲載されないようになっています。";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:12:"タイトル";s:8:"has_body";s:1:"1";s:10:"body_label";s:6:"本文";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:4:"page";}}	15	4		admin/content/node-type/page	ページ	t		4				0	modules/node/content_types.inc
admin/settings/logging/dblog			user_access	a:1:{i:0;s:29:"administer site configuration";}	drupal_get_form	a:1:{i:0;s:20:"dblog_admin_settings";}	15	4		admin/settings/logging/dblog	Database logging	t		6		Settings for logging to the Drupal database logs. This is the most common method for small to medium sites on shared hosting. The logs are viewable from the admin pages.		0	modules/dblog/dblog.admin.inc
admin/settings/filters/%	a:1:{i:3;s:18:"filter_format_load";}		user_access	a:1:{i:0;s:18:"administer filters";}	filter_admin_format_page	a:1:{i:0;i:3;}	14	4		admin/settings/filters/%		filter_admin_format_title	a:1:{i:0;i:3;}	4				0	modules/filter/filter.admin.inc
admin/build/menu-customize/%	a:1:{i:3;s:9:"menu_load";}		user_access	a:1:{i:0;s:15:"administer menu";}	drupal_get_form	a:2:{i:0;s:18:"menu_overview_form";i:1;i:3;}	14	4		admin/build/menu-customize/%	Customize menu	menu_overview_title	a:1:{i:0;i:3;}	4				0	modules/menu/menu.admin.inc
node/%/revisions/%/revert	a:2:{i:1;a:1:{s:9:"node_load";a:1:{i:0;i:3;}}i:3;N;}		_node_revision_access	a:2:{i:0;i:1;i:1;s:6:"update";}	drupal_get_form	a:2:{i:0;s:28:"node_revision_revert_confirm";i:1;i:1;}	21	5		node/%/revisions/%/revert	Revert to earlier revision	t		4				0	modules/node/node.pages.inc
admin/build/menu/item/%/delete	a:1:{i:4;s:14:"menu_link_load";}		user_access	a:1:{i:0;s:15:"administer menu";}	menu_item_delete_page	a:1:{i:0;i:4;}	61	6		admin/build/menu/item/%/delete	Delete menu item	t		4				0	modules/menu/menu.admin.inc
admin/build/menu/item/%/edit	a:1:{i:4;s:14:"menu_link_load";}		user_access	a:1:{i:0;s:15:"administer menu";}	drupal_get_form	a:4:{i:0;s:14:"menu_edit_item";i:1;s:4:"edit";i:2;i:4;i:3;N;}	61	6		admin/build/menu/item/%/edit	Edit menu item	t		4				0	modules/menu/menu.admin.inc
admin/content/node-type/page/edit			user_access	a:1:{i:0;s:24:"administer content types";}	drupal_get_form	a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:4:"page";s:4:"name";s:9:"ページ";s:6:"module";s:4:"node";s:11:"description";s:414:"<em>ページ</em> （形の上では <em>ストーリー</em> と同様）は、例えば「サイトについて」のような、めったに変更のない情報（静的ページ）を作成・表示するための簡単な方法です。 デフォルトで <em>ページ</em> エントリは、訪問者のコメントを許可せず、フロントページに掲載されないようになっています。";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:12:"タイトル";s:8:"has_body";s:1:"1";s:10:"body_label";s:6:"本文";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:4:"page";}}	31	5	admin/content/node-type/page	admin/content/node-type/page	Edit	t		136				0	modules/node/content_types.inc
admin/content/node-type/story/edit			user_access	a:1:{i:0;s:24:"administer content types";}	drupal_get_form	a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:5:"story";s:4:"name";s:15:"ストーリー";s:6:"module";s:4:"node";s:11:"description";s:495:"<em>ストーリー</em> （形の上では <em>ページ</em> と同様）は、「お知らせ」や「ニュース」のようなコンテンツの表示・作成に理想的です。 プレスリリース、サイトの告知、略式のブログのようなエントリは、すべて <em>ストーリー</em> で作成できます。 デフォルトで <em>ストーリー</em> エントリは、自動的にフロントページに掲載され、コメントの投稿を許可します。";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:12:"タイトル";s:8:"has_body";s:1:"1";s:10:"body_label";s:6:"本文";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:5:"story";}}	31	5	admin/content/node-type/story	admin/content/node-type/story	Edit	t		136				0	modules/node/content_types.inc
admin/build/themes/settings/global			user_access	a:1:{i:0;s:29:"administer site configuration";}	drupal_get_form	a:1:{i:0;s:21:"system_theme_settings";}	31	5	admin/build/themes/settings	admin/build/themes	Global settings	t		136				-1	modules/system/system.admin.inc
admin/content/taxonomy/%/list	a:1:{i:3;s:24:"taxonomy_vocabulary_load";}		user_access	a:1:{i:0;s:19:"administer taxonomy";}	drupal_get_form	a:2:{i:0;s:23:"taxonomy_overview_terms";i:1;i:3;}	29	5	admin/content/taxonomy/%	admin/content/taxonomy/%	List	t		136				-10	modules/taxonomy/taxonomy.admin.inc
admin/settings/filters/%/edit	a:1:{i:3;s:18:"filter_format_load";}		user_access	a:1:{i:0;s:18:"administer filters";}	filter_admin_format_page	a:1:{i:0;i:3;}	29	5	admin/settings/filters/%	admin/settings/filters/%	Edit	t		136				0	modules/filter/filter.admin.inc
admin/build/modules/list/confirm			user_access	a:1:{i:0;s:29:"administer site configuration";}	drupal_get_form	a:1:{i:0;s:14:"system_modules";}	31	5		admin/build/modules/list/confirm	List	t		4				0	modules/system/system.admin.inc
admin/build/menu-customize/%/list	a:1:{i:3;s:9:"menu_load";}		user_access	a:1:{i:0;s:15:"administer menu";}	drupal_get_form	a:2:{i:0;s:18:"menu_overview_form";i:1;i:3;}	29	5	admin/build/menu-customize/%	admin/build/menu-customize/%	List items	t		136				-10	modules/menu/menu.admin.inc
admin/build/modules/uninstall/confirm			user_access	a:1:{i:0;s:29:"administer site configuration";}	drupal_get_form	a:1:{i:0;s:24:"system_modules_uninstall";}	31	5		admin/build/modules/uninstall/confirm	Uninstall	t		4				0	modules/system/system.admin.inc
admin/build/themes/settings/bluemarine			_system_themes_access	a:1:{i:0;O:8:"stdClass":10:{s:8:"filename";s:33:"themes/bluemarine/bluemarine.info";s:8:"basename";s:15:"bluemarine.info";s:4:"name";s:10:"bluemarine";s:4:"info";a:13:{s:4:"name";s:10:"Bluemarine";s:11:"description";s:66:"Table-based multi-column theme with a marine and ash color scheme.";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/bluemarine/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/bluemarine/script.js";}s:10:"screenshot";s:32:"themes/bluemarine/screenshot.png";s:3:"php";s:5:"4.3.5";}s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"prefix";s:11:"phptemplate";s:8:"template";b:1;s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/bluemarine/style.css";}}s:6:"engine";s:11:"phptemplate";s:6:"status";i:0;}}	drupal_get_form	a:2:{i:0;s:21:"system_theme_settings";i:1;s:10:"bluemarine";}	31	5	admin/build/themes/settings	admin/build/themes	Bluemarine	t		128				0	modules/system/system.admin.inc
admin/build/themes/settings/chameleon			_system_themes_access	a:1:{i:0;O:8:"stdClass":9:{s:8:"filename";s:31:"themes/chameleon/chameleon.info";s:8:"basename";s:14:"chameleon.info";s:4:"name";s:9:"chameleon";s:4:"info";a:12:{s:4:"name";s:9:"Chameleon";s:11:"description";s:42:"Minimalist tabled theme with light colors.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:8:"features";a:4:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:9:"style.css";s:26:"themes/chameleon/style.css";s:10:"common.css";s:27:"themes/chameleon/common.css";}}s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:7:"scripts";a:1:{s:9:"script.js";s:26:"themes/chameleon/script.js";}s:10:"screenshot";s:31:"themes/chameleon/screenshot.png";s:3:"php";s:5:"4.3.5";}s:5:"owner";s:32:"themes/chameleon/chameleon.theme";s:6:"prefix";s:9:"chameleon";s:10:"sub_themes";a:1:{s:6:"marvin";s:6:"Marvin";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:9:"style.css";s:26:"themes/chameleon/style.css";s:10:"common.css";s:27:"themes/chameleon/common.css";}}s:6:"status";i:0;}}	drupal_get_form	a:2:{i:0;s:21:"system_theme_settings";i:1;s:9:"chameleon";}	31	5	admin/build/themes/settings	admin/build/themes	Chameleon	t		128				0	modules/system/system.admin.inc
admin/settings/language/delete/%	a:1:{i:4;N;}		user_access	a:1:{i:0;s:20:"administer languages";}	locale_inc_callback	a:3:{i:0;s:15:"drupal_get_form";i:1;s:28:"locale_languages_delete_form";i:2;i:4;}	30	5		admin/settings/language/delete/%	Confirm	t		4				0	
admin/content/taxonomy/edit/vocabulary/%	a:1:{i:5;s:24:"taxonomy_vocabulary_load";}		user_access	a:1:{i:0;s:19:"administer taxonomy";}	taxonomy_admin_vocabulary_edit	a:1:{i:0;i:5;}	62	6		admin/content/taxonomy/edit/vocabulary/%	Edit vocabulary	t		4				0	modules/taxonomy/taxonomy.admin.inc
admin/build/menu/item/%/reset	a:1:{i:4;s:14:"menu_link_load";}		user_access	a:1:{i:0;s:15:"administer menu";}	drupal_get_form	a:2:{i:0;s:23:"menu_reset_item_confirm";i:1;i:4;}	61	6		admin/build/menu/item/%/reset	Reset menu item	t		4				0	modules/menu/menu.admin.inc
admin/content/node-type/page/delete			user_access	a:1:{i:0;s:24:"administer content types";}	drupal_get_form	a:2:{i:0;s:24:"node_type_delete_confirm";i:1;O:8:"stdClass":14:{s:4:"type";s:4:"page";s:4:"name";s:9:"ページ";s:6:"module";s:4:"node";s:11:"description";s:414:"<em>ページ</em> （形の上では <em>ストーリー</em> と同様）は、例えば「サイトについて」のような、めったに変更のない情報（静的ページ）を作成・表示するための簡単な方法です。 デフォルトで <em>ページ</em> エントリは、訪問者のコメントを許可せず、フロントページに掲載されないようになっています。";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:12:"タイトル";s:8:"has_body";s:1:"1";s:10:"body_label";s:6:"本文";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:4:"page";}}	31	5		admin/content/node-type/page/delete	Delete	t		4				0	modules/node/content_types.inc
admin/content/node-type/story/delete			user_access	a:1:{i:0;s:24:"administer content types";}	drupal_get_form	a:2:{i:0;s:24:"node_type_delete_confirm";i:1;O:8:"stdClass":14:{s:4:"type";s:5:"story";s:4:"name";s:15:"ストーリー";s:6:"module";s:4:"node";s:11:"description";s:495:"<em>ストーリー</em> （形の上では <em>ページ</em> と同様）は、「お知らせ」や「ニュース」のようなコンテンツの表示・作成に理想的です。 プレスリリース、サイトの告知、略式のブログのようなエントリは、すべて <em>ストーリー</em> で作成できます。 デフォルトで <em>ストーリー</em> エントリは、自動的にフロントページに掲載され、コメントの投稿を許可します。";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:12:"タイトル";s:8:"has_body";s:1:"1";s:10:"body_label";s:6:"本文";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:5:"story";}}	31	5		admin/content/node-type/story/delete	Delete	t		4				0	modules/node/content_types.inc
admin/build/translate/delete/%	a:1:{i:4;N;}		user_access	a:1:{i:0;s:19:"translate interface";}	locale_inc_callback	a:2:{i:0;s:28:"locale_translate_delete_page";i:1;i:4;}	30	5		admin/build/translate/delete/%	Delete string	t		4				0	
admin/settings/language/edit/%	a:1:{i:4;N;}		user_access	a:1:{i:0;s:20:"administer languages";}	locale_inc_callback	a:3:{i:0;s:15:"drupal_get_form";i:1;s:26:"locale_languages_edit_form";i:2;i:4;}	30	5		admin/settings/language/edit/%	Edit language	t		4				0	
admin/build/translate/edit/%	a:1:{i:4;N;}		user_access	a:1:{i:0;s:19:"translate interface";}	locale_inc_callback	a:3:{i:0;s:15:"drupal_get_form";i:1;s:26:"locale_translate_edit_form";i:2;i:4;}	30	5		admin/build/translate/edit/%	Edit string	t		4				0	
admin/content/taxonomy/edit/term			user_access	a:1:{i:0;s:19:"administer taxonomy";}	taxonomy_admin_term_edit	a:0:{}	31	5		admin/content/taxonomy/edit/term	Edit term	t		4				0	modules/taxonomy/taxonomy.admin.inc
admin/build/themes/settings/garland			_system_themes_access	a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:27:"themes/garland/garland.info";s:8:"basename";s:12:"garland.info";s:4:"name";s:7:"garland";s:4:"info";a:13:{s:4:"name";s:7:"Garland";s:11:"description";s:66:"Tableless, recolorable, multi-column, fluid width theme (default).";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:24:"themes/garland/script.js";}s:10:"screenshot";s:29:"themes/garland/screenshot.png";s:3:"php";s:5:"4.3.5";}s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"prefix";s:11:"phptemplate";s:8:"template";b:1;s:10:"sub_themes";a:1:{s:8:"minnelli";s:8:"Minnelli";}s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:6:"engine";s:11:"phptemplate";s:6:"status";i:0;}}	drupal_get_form	a:2:{i:0;s:21:"system_theme_settings";i:1;s:7:"garland";}	31	5	admin/build/themes/settings	admin/build/themes	Garland	t		128				0	modules/system/system.admin.inc
admin/build/block/list/js			user_access	a:1:{i:0;s:17:"administer blocks";}	block_admin_display_js	a:0:{}	31	5		admin/build/block/list/js	JavaScript List Form	t		4				0	modules/block/block.admin.inc
admin/build/themes/settings/marvin			_system_themes_access	a:1:{i:0;O:8:"stdClass":9:{s:8:"filename";s:35:"themes/chameleon/marvin/marvin.info";s:8:"basename";s:11:"marvin.info";s:4:"name";s:6:"marvin";s:4:"info";a:13:{s:4:"name";s:6:"Marvin";s:11:"description";s:31:"Boxy tabled theme in all grays.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:10:"base theme";s:9:"chameleon";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:33:"themes/chameleon/marvin/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/chameleon/marvin/script.js";}s:10:"screenshot";s:38:"themes/chameleon/marvin/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"base_themes";a:1:{s:9:"chameleon";s:9:"Chameleon";}s:6:"prefix";s:6:"marvin";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:33:"themes/chameleon/marvin/style.css";}}s:10:"base_theme";s:9:"chameleon";s:6:"status";i:0;}}	drupal_get_form	a:2:{i:0;s:21:"system_theme_settings";i:1;s:6:"marvin";}	31	5	admin/build/themes/settings	admin/build/themes	Marvin	t		128				0	modules/system/system.admin.inc
admin/content/taxonomy/%/add/term	a:1:{i:3;s:24:"taxonomy_vocabulary_load";}		user_access	a:1:{i:0;s:19:"administer taxonomy";}	taxonomy_add_term_page	a:1:{i:0;i:3;}	59	6	admin/content/taxonomy/%	admin/content/taxonomy/%	Add term	t		128				0	modules/taxonomy/taxonomy.admin.inc
admin/build/themes/settings/minnelli			_system_themes_access	a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:37:"themes/garland/minnelli/minnelli.info";s:8:"basename";s:13:"minnelli.info";s:4:"name";s:8:"minnelli";s:4:"info";a:14:{s:4:"name";s:8:"Minnelli";s:11:"description";s:56:"Tableless, recolorable, multi-column, fixed width theme.";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:10:"base theme";s:7:"garland";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:12:"minnelli.css";s:36:"themes/garland/minnelli/minnelli.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/garland/minnelli/script.js";}s:10:"screenshot";s:38:"themes/garland/minnelli/screenshot.png";s:3:"php";s:5:"4.3.5";s:6:"engine";s:11:"phptemplate";}s:11:"base_themes";a:1:{s:7:"garland";s:7:"Garland";}s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"prefix";s:11:"phptemplate";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:12:"minnelli.css";s:36:"themes/garland/minnelli/minnelli.css";}}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:7:"garland";s:6:"status";i:0;}}	drupal_get_form	a:2:{i:0;s:21:"system_theme_settings";i:1;s:8:"minnelli";}	31	5	admin/build/themes/settings	admin/build/themes	Minnelli	t		128				0	modules/system/system.admin.inc
admin/build/themes/settings/pushbutton			_system_themes_access	a:1:{i:0;O:8:"stdClass":10:{s:8:"filename";s:33:"themes/pushbutton/pushbutton.info";s:8:"basename";s:15:"pushbutton.info";s:4:"name";s:10:"pushbutton";s:4:"info";a:13:{s:4:"name";s:10:"Pushbutton";s:11:"description";s:52:"Tabled, multi-column theme in blue and orange tones.";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/pushbutton/script.js";}s:10:"screenshot";s:32:"themes/pushbutton/screenshot.png";s:3:"php";s:5:"4.3.5";}s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"prefix";s:11:"phptemplate";s:8:"template";b:1;s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:6:"engine";s:11:"phptemplate";s:6:"status";i:0;}}	drupal_get_form	a:2:{i:0;s:21:"system_theme_settings";i:1;s:10:"pushbutton";}	31	5	admin/build/themes/settings	admin/build/themes	Pushbutton	t		128				0	modules/system/system.admin.inc
admin/build/menu-customize/%/add	a:1:{i:3;s:9:"menu_load";}		user_access	a:1:{i:0;s:15:"administer menu";}	drupal_get_form	a:4:{i:0;s:14:"menu_edit_item";i:1;s:3:"add";i:2;N;i:3;i:3;}	29	5	admin/build/menu-customize/%	admin/build/menu-customize/%	Add item	t		128				0	modules/menu/menu.admin.inc
admin/build/block/list/bluemarine			_block_themes_access	a:1:{i:0;O:8:"stdClass":10:{s:8:"filename";s:33:"themes/bluemarine/bluemarine.info";s:8:"basename";s:15:"bluemarine.info";s:4:"name";s:10:"bluemarine";s:4:"info";a:13:{s:4:"name";s:10:"Bluemarine";s:11:"description";s:66:"Table-based multi-column theme with a marine and ash color scheme.";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/bluemarine/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/bluemarine/script.js";}s:10:"screenshot";s:32:"themes/bluemarine/screenshot.png";s:3:"php";s:5:"4.3.5";}s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"prefix";s:11:"phptemplate";s:8:"template";b:1;s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/bluemarine/style.css";}}s:6:"engine";s:11:"phptemplate";s:6:"status";i:0;}}	block_admin_display	a:1:{i:0;s:10:"bluemarine";}	31	5	admin/build/block/list	admin/build/block	Bluemarine	t		128				0	modules/block/block.admin.inc
admin/build/block/list/chameleon			_block_themes_access	a:1:{i:0;O:8:"stdClass":9:{s:8:"filename";s:31:"themes/chameleon/chameleon.info";s:8:"basename";s:14:"chameleon.info";s:4:"name";s:9:"chameleon";s:4:"info";a:12:{s:4:"name";s:9:"Chameleon";s:11:"description";s:42:"Minimalist tabled theme with light colors.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:8:"features";a:4:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:9:"style.css";s:26:"themes/chameleon/style.css";s:10:"common.css";s:27:"themes/chameleon/common.css";}}s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:7:"scripts";a:1:{s:9:"script.js";s:26:"themes/chameleon/script.js";}s:10:"screenshot";s:31:"themes/chameleon/screenshot.png";s:3:"php";s:5:"4.3.5";}s:5:"owner";s:32:"themes/chameleon/chameleon.theme";s:6:"prefix";s:9:"chameleon";s:10:"sub_themes";a:1:{s:6:"marvin";s:6:"Marvin";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:9:"style.css";s:26:"themes/chameleon/style.css";s:10:"common.css";s:27:"themes/chameleon/common.css";}}s:6:"status";i:0;}}	block_admin_display	a:1:{i:0;s:9:"chameleon";}	31	5	admin/build/block/list	admin/build/block	Chameleon	t		128				0	modules/block/block.admin.inc
admin/settings/filters/%/configure	a:1:{i:3;s:18:"filter_format_load";}		user_access	a:1:{i:0;s:18:"administer filters";}	filter_admin_configure_page	a:1:{i:0;i:3;}	29	5	admin/settings/filters/%	admin/settings/filters/%	Configure	t		128				1	modules/filter/filter.admin.inc
admin/settings/actions/delete/%	a:1:{i:4;s:12:"actions_load";}		user_access	a:1:{i:0;s:18:"administer actions";}	drupal_get_form	a:2:{i:0;s:26:"system_actions_delete_form";i:1;i:4;}	30	5		admin/settings/actions/delete/%	Delete action	t		4		Delete an action.		0	
admin/build/menu-customize/%/delete	a:1:{i:3;s:9:"menu_load";}		user_access	a:1:{i:0;s:15:"administer menu";}	menu_delete_menu_page	a:1:{i:0;i:3;}	29	5		admin/build/menu-customize/%/delete	Delete menu	t		4				0	modules/menu/menu.admin.inc
admin/build/menu-customize/%/edit	a:1:{i:3;s:9:"menu_load";}		user_access	a:1:{i:0;s:15:"administer menu";}	drupal_get_form	a:3:{i:0;s:14:"menu_edit_menu";i:1;s:4:"edit";i:2;i:3;}	29	5	admin/build/menu-customize/%	admin/build/menu-customize/%	Edit menu	t		128				0	modules/menu/menu.admin.inc
admin/build/block/list/garland			_block_themes_access	a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:27:"themes/garland/garland.info";s:8:"basename";s:12:"garland.info";s:4:"name";s:7:"garland";s:4:"info";a:13:{s:4:"name";s:7:"Garland";s:11:"description";s:66:"Tableless, recolorable, multi-column, fluid width theme (default).";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:24:"themes/garland/script.js";}s:10:"screenshot";s:29:"themes/garland/screenshot.png";s:3:"php";s:5:"4.3.5";}s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"prefix";s:11:"phptemplate";s:8:"template";b:1;s:10:"sub_themes";a:1:{s:8:"minnelli";s:8:"Minnelli";}s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:6:"engine";s:11:"phptemplate";s:6:"status";i:0;}}	block_admin_display	a:1:{i:0;s:7:"garland";}	31	5	admin/build/block/list	admin/build/block	Garland	t		136				-10	modules/block/block.admin.inc
admin/build/block/list/marvin			_block_themes_access	a:1:{i:0;O:8:"stdClass":9:{s:8:"filename";s:35:"themes/chameleon/marvin/marvin.info";s:8:"basename";s:11:"marvin.info";s:4:"name";s:6:"marvin";s:4:"info";a:13:{s:4:"name";s:6:"Marvin";s:11:"description";s:31:"Boxy tabled theme in all grays.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:10:"base theme";s:9:"chameleon";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:33:"themes/chameleon/marvin/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/chameleon/marvin/script.js";}s:10:"screenshot";s:38:"themes/chameleon/marvin/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"base_themes";a:1:{s:9:"chameleon";s:9:"Chameleon";}s:6:"prefix";s:6:"marvin";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:33:"themes/chameleon/marvin/style.css";}}s:10:"base_theme";s:9:"chameleon";s:6:"status";i:0;}}	block_admin_display	a:1:{i:0;s:6:"marvin";}	31	5	admin/build/block/list	admin/build/block	Marvin	t		128				0	modules/block/block.admin.inc
admin/build/block/list/minnelli			_block_themes_access	a:1:{i:0;O:8:"stdClass":11:{s:8:"filename";s:37:"themes/garland/minnelli/minnelli.info";s:8:"basename";s:13:"minnelli.info";s:4:"name";s:8:"minnelli";s:4:"info";a:14:{s:4:"name";s:8:"Minnelli";s:11:"description";s:56:"Tableless, recolorable, multi-column, fixed width theme.";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:10:"base theme";s:7:"garland";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:12:"minnelli.css";s:36:"themes/garland/minnelli/minnelli.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/garland/minnelli/script.js";}s:10:"screenshot";s:38:"themes/garland/minnelli/screenshot.png";s:3:"php";s:5:"4.3.5";s:6:"engine";s:11:"phptemplate";}s:11:"base_themes";a:1:{s:7:"garland";s:7:"Garland";}s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"prefix";s:11:"phptemplate";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:12:"minnelli.css";s:36:"themes/garland/minnelli/minnelli.css";}}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:7:"garland";s:6:"status";i:0;}}	block_admin_display	a:1:{i:0;s:8:"minnelli";}	31	5	admin/build/block/list	admin/build/block	Minnelli	t		128				0	modules/block/block.admin.inc
admin/build/block/list/pushbutton			_block_themes_access	a:1:{i:0;O:8:"stdClass":10:{s:8:"filename";s:33:"themes/pushbutton/pushbutton.info";s:8:"basename";s:15:"pushbutton.info";s:4:"name";s:10:"pushbutton";s:4:"info";a:13:{s:4:"name";s:10:"Pushbutton";s:11:"description";s:52:"Tabled, multi-column theme in blue and orange tones.";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/pushbutton/script.js";}s:10:"screenshot";s:32:"themes/pushbutton/screenshot.png";s:3:"php";s:5:"4.3.5";}s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"prefix";s:11:"phptemplate";s:8:"template";b:1;s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:6:"engine";s:11:"phptemplate";s:6:"status";i:0;}}	block_admin_display	a:1:{i:0;s:10:"pushbutton";}	31	5	admin/build/block/list	admin/build/block	Pushbutton	t		128				0	modules/block/block.admin.inc
admin/settings/filters/%/order	a:1:{i:3;s:18:"filter_format_load";}		user_access	a:1:{i:0;s:18:"administer filters";}	filter_admin_order_page	a:1:{i:0;i:3;}	29	5	admin/settings/filters/%	admin/settings/filters/%	Rearrange	t		128				2	modules/filter/filter.admin.inc
user/reset/%/%/%	a:3:{i:2;N;i:3;N;i:4;N;}		1	a:0:{}	drupal_get_form	a:4:{i:0;s:15:"user_pass_reset";i:1;i:2;i:2;i:3;i:3;i:4;}	24	5		user/reset/%/%/%	Reset password	t		4				0	modules/user/user.pages.inc
admin/content/taxonomy/add/vocabulary			user_access	a:1:{i:0;s:19:"administer taxonomy";}	drupal_get_form	a:1:{i:0;s:24:"taxonomy_form_vocabulary";}	31	5	admin/content/taxonomy	admin/content/taxonomy	Add vocabulary	t		128				0	modules/taxonomy/taxonomy.admin.inc
node/%/revisions/%/view	a:2:{i:1;a:1:{s:9:"node_load";a:1:{i:0;i:3;}}i:3;N;}		_node_revision_access	a:1:{i:0;i:1;}	node_show	a:3:{i:0;i:1;i:1;N;i:2;b:1;}	21	5		node/%/revisions/%/view	Revisions	t		4				0	
node/%/revisions/%/delete	a:2:{i:1;a:1:{s:9:"node_load";a:1:{i:0;i:3;}}i:3;N;}		_node_revision_access	a:2:{i:0;i:1;i:1;s:6:"delete";}	drupal_get_form	a:2:{i:0;s:28:"node_revision_delete_confirm";i:1;i:1;}	21	5		node/%/revisions/%/delete	Delete earlier revision	t		4				0	modules/node/node.pages.inc
\.


--
-- Data for Name: node; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY node (nid, vid, type, language, title, uid, status, created, changed, comment, promote, moderate, sticky, tnid, translate) FROM stdin;
\.


--
-- Data for Name: node_access; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY node_access (nid, gid, realm, grant_view, grant_update, grant_delete) FROM stdin;
0	0	all	1	0	0
\.


--
-- Data for Name: node_comment_statistics; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY node_comment_statistics (nid, last_comment_timestamp, last_comment_name, last_comment_uid, comment_count) FROM stdin;
\.


--
-- Data for Name: node_counter; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY node_counter (nid, totalcount, daycount, "timestamp") FROM stdin;
\.


--
-- Data for Name: node_revisions; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY node_revisions (nid, vid, uid, title, body, teaser, log, "timestamp", format) FROM stdin;
\.


--
-- Data for Name: node_type; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY node_type (type, name, module, description, help, has_title, title_label, has_body, body_label, min_word_count, custom, modified, locked, orig_type) FROM stdin;
page	ページ	node	<em>ページ</em> （形の上では <em>ストーリー</em> と同様）は、例えば「サイトについて」のような、めったに変更のない情報（静的ページ）を作成・表示するための簡単な方法です。 デフォルトで <em>ページ</em> エントリは、訪問者のコメントを許可せず、フロントページに掲載されないようになっています。		1	タイトル	1	本文	0	1	1	0	page
story	ストーリー	node	<em>ストーリー</em> （形の上では <em>ページ</em> と同様）は、「お知らせ」や「ニュース」のようなコンテンツの表示・作成に理想的です。 プレスリリース、サイトの告知、略式のブログのようなエントリは、すべて <em>ストーリー</em> で作成できます。 デフォルトで <em>ストーリー</em> エントリは、自動的にフロントページに掲載され、コメントの投稿を許可します。		1	タイトル	1	本文	0	1	1	0	story
\.


--
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY permission (pid, rid, perm, tid) FROM stdin;
1	1	access content	0
2	2	access comments, access content, post comments, post comments without approval	0
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY role (rid, name) FROM stdin;
1	anonymous user
2	authenticated user
\.


--
-- Data for Name: semaphore; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY semaphore (name, value, expire) FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY sessions (uid, sid, hostname, "timestamp", cache, session) FROM stdin;
1	9dso7di8b1ab5f0dbvb3c9j932	10.0.2.2	1423744451	0	messages|s:0:"";
\.


--
-- Data for Name: system; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY system (filename, name, type, owner, status, throttle, bootstrap, schema_version, weight, info) FROM stdin;
themes/bluemarine/bluemarine.info	bluemarine	theme	themes/engines/phptemplate/phptemplate.engine	0	0	0	-1	0	a:13:{s:4:"name";s:10:"Bluemarine";s:11:"description";s:66:"Table-based multi-column theme with a marine and ash color scheme.";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/bluemarine/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/bluemarine/script.js";}s:10:"screenshot";s:32:"themes/bluemarine/screenshot.png";s:3:"php";s:5:"4.3.5";}
themes/garland/minnelli/minnelli.info	minnelli	theme	themes/engines/phptemplate/phptemplate.engine	0	0	0	-1	0	a:14:{s:4:"name";s:8:"Minnelli";s:11:"description";s:56:"Tableless, recolorable, multi-column, fixed width theme.";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:10:"base theme";s:7:"garland";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:12:"minnelli.css";s:36:"themes/garland/minnelli/minnelli.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/garland/minnelli/script.js";}s:10:"screenshot";s:38:"themes/garland/minnelli/screenshot.png";s:3:"php";s:5:"4.3.5";s:6:"engine";s:11:"phptemplate";}
themes/chameleon/marvin/marvin.info	marvin	theme		0	0	0	-1	0	a:13:{s:4:"name";s:6:"Marvin";s:11:"description";s:31:"Boxy tabled theme in all grays.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:10:"base theme";s:9:"chameleon";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:33:"themes/chameleon/marvin/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:33:"themes/chameleon/marvin/script.js";}s:10:"screenshot";s:38:"themes/chameleon/marvin/screenshot.png";s:3:"php";s:5:"4.3.5";}
themes/chameleon/chameleon.info	chameleon	theme	themes/chameleon/chameleon.theme	0	0	0	-1	0	a:12:{s:4:"name";s:9:"Chameleon";s:11:"description";s:42:"Minimalist tabled theme with light colors.";s:7:"regions";a:2:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";}s:8:"features";a:4:{i:0;s:4:"logo";i:1;s:7:"favicon";i:2;s:4:"name";i:3;s:6:"slogan";}s:11:"stylesheets";a:1:{s:3:"all";a:2:{s:9:"style.css";s:26:"themes/chameleon/style.css";s:10:"common.css";s:27:"themes/chameleon/common.css";}}s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:7:"scripts";a:1:{s:9:"script.js";s:26:"themes/chameleon/script.js";}s:10:"screenshot";s:31:"themes/chameleon/screenshot.png";s:3:"php";s:5:"4.3.5";}
themes/pushbutton/pushbutton.info	pushbutton	theme	themes/engines/phptemplate/phptemplate.engine	0	0	0	-1	0	a:13:{s:4:"name";s:10:"Pushbutton";s:11:"description";s:52:"Tabled, multi-column theme in blue and orange tones.";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:27:"themes/pushbutton/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/pushbutton/script.js";}s:10:"screenshot";s:32:"themes/pushbutton/screenshot.png";s:3:"php";s:5:"4.3.5";}
themes/garland/garland.info	garland	theme	themes/engines/phptemplate/phptemplate.engine	1	0	0	-1	0	a:13:{s:4:"name";s:7:"Garland";s:11:"description";s:66:"Tableless, recolorable, multi-column, fluid width theme (default).";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:2:{s:3:"all";a:1:{s:9:"style.css";s:24:"themes/garland/style.css";}s:5:"print";a:1:{s:9:"print.css";s:24:"themes/garland/print.css";}}s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:24:"themes/garland/script.js";}s:10:"screenshot";s:29:"themes/garland/screenshot.png";s:3:"php";s:5:"4.3.5";}
modules/aggregator/aggregator.module	aggregator	module		0	0	0	-1	0	a:10:{s:4:"name";s:10:"Aggregator";s:11:"description";s:57:"Aggregates syndicated content (RSS, RDF, and Atom feeds).";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
modules/block/block.module	block	module		1	0	0	0	0	a:10:{s:4:"name";s:5:"Block";s:11:"description";s:62:"Controls the boxes that are displayed around the main content.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
modules/system/system.module	system	module		1	0	0	6055	0	a:10:{s:4:"name";s:6:"System";s:11:"description";s:54:"Handles general site configuration for administrators.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
modules/book/book.module	book	module		0	0	0	-1	0	a:10:{s:4:"name";s:4:"Book";s:11:"description";s:63:"Allows users to structure site pages in a hierarchy or outline.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
modules/color/color.module	color	module		1	0	0	6001	0	a:10:{s:4:"name";s:5:"Color";s:11:"description";s:61:"Allows the user to change the color scheme of certain themes.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
modules/dblog/dblog.module	dblog	module		1	0	0	6000	0	a:10:{s:4:"name";s:16:"Database logging";s:11:"description";s:47:"Logs and records system events to the database.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
modules/help/help.module	help	module		1	0	0	0	0	a:10:{s:4:"name";s:4:"Help";s:11:"description";s:35:"Manages the display of online help.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
modules/path/path.module	path	module		0	0	0	-1	0	a:10:{s:4:"name";s:4:"Path";s:11:"description";s:28:"Allows users to rename URLs.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
modules/php/php.module	php	module		0	0	0	-1	0	a:10:{s:4:"name";s:10:"PHP filter";s:11:"description";s:50:"Allows embedded PHP code/snippets to be evaluated.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
modules/ping/ping.module	ping	module		0	0	0	-1	0	a:10:{s:4:"name";s:4:"Ping";s:11:"description";s:51:"Alerts other sites when your site has been updated.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
modules/poll/poll.module	poll	module		0	0	0	-1	0	a:10:{s:4:"name";s:4:"Poll";s:11:"description";s:95:"Allows your site to capture votes on different topics in the form of multiple choice questions.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
modules/blogapi/blogapi.module	blogapi	module		0	0	0	-1	0	a:10:{s:4:"name";s:8:"Blog API";s:11:"description";s:79:"Allows users to post content using applications that support XML-RPC blog APIs.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
modules/comment/comment.module	comment	module		1	0	0	6005	0	a:10:{s:4:"name";s:7:"Comment";s:11:"description";s:57:"Allows users to comment on and discuss published content.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
modules/contact/contact.module	contact	module		0	0	0	-1	0	a:10:{s:4:"name";s:7:"Contact";s:11:"description";s:61:"Enables the use of both personal and site-wide contact forms.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
modules/filter/filter.module	filter	module		1	0	0	0	0	a:10:{s:4:"name";s:6:"Filter";s:11:"description";s:60:"Handles the filtering of content in preparation for display.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
modules/forum/forum.module	forum	module		0	0	0	-1	0	a:10:{s:4:"name";s:5:"Forum";s:11:"description";s:50:"Enables threaded discussions about general topics.";s:12:"dependencies";a:2:{i:0;s:8:"taxonomy";i:1;s:7:"comment";}s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
modules/locale/locale.module	locale	module		1	0	0	6007	0	a:10:{s:4:"name";s:6:"Locale";s:11:"description";s:119:"Adds language handling functionality and enables the translation of the user interface to languages other than English.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
modules/menu/menu.module	menu	module		1	0	0	0	0	a:10:{s:4:"name";s:4:"Menu";s:11:"description";s:60:"Allows administrators to customize the site navigation menu.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
modules/node/node.module	node	module		1	0	0	0	0	a:10:{s:4:"name";s:4:"Node";s:11:"description";s:66:"Allows content to be submitted to the site and displayed on pages.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
modules/openid/openid.module	openid	module		0	0	0	-1	0	a:10:{s:4:"name";s:6:"OpenID";s:11:"description";s:48:"Allows users to log into your site using OpenID.";s:7:"version";s:4:"6.34";s:7:"package";s:15:"Core - optional";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
modules/taxonomy/taxonomy.module	taxonomy	module		1	0	0	0	0	a:10:{s:4:"name";s:8:"Taxonomy";s:11:"description";s:38:"Enables the categorization of content.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
modules/throttle/throttle.module	throttle	module		0	0	0	-1	0	a:10:{s:4:"name";s:8:"Throttle";s:11:"description";s:66:"Handles the auto-throttling mechanism, to control site congestion.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
modules/tracker/tracker.module	tracker	module		0	0	0	-1	0	a:10:{s:4:"name";s:7:"Tracker";s:11:"description";s:43:"Enables tracking of recent posts for users.";s:12:"dependencies";a:1:{i:0;s:7:"comment";}s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
modules/translation/translation.module	translation	module		0	0	0	-1	0	a:10:{s:4:"name";s:19:"Content translation";s:11:"description";s:57:"Allows content to be translated into different languages.";s:12:"dependencies";a:1:{i:0;s:6:"locale";}s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
modules/profile/profile.module	profile	module		0	0	0	-1	0	a:10:{s:4:"name";s:7:"Profile";s:11:"description";s:36:"Supports configurable user profiles.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
modules/trigger/trigger.module	trigger	module		0	0	0	-1	0	a:10:{s:4:"name";s:7:"Trigger";s:11:"description";s:90:"Enables actions to be fired on certain system events, such as when new content is created.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
modules/upload/upload.module	upload	module		0	0	0	-1	0	a:10:{s:4:"name";s:6:"Upload";s:11:"description";s:51:"Allows users to upload and attach files to content.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
modules/update/update.module	update	module		1	0	0	6000	0	a:10:{s:4:"name";s:13:"Update status";s:11:"description";s:88:"Checks the status of available updates for Drupal and your installed modules and themes.";s:7:"version";s:4:"6.34";s:7:"package";s:15:"Core - optional";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
modules/search/search.module	search	module		0	0	0	-1	0	a:10:{s:4:"name";s:6:"Search";s:11:"description";s:36:"Enables site-wide keyword searching.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
modules/statistics/statistics.module	statistics	module		0	0	0	-1	0	a:10:{s:4:"name";s:10:"Statistics";s:11:"description";s:37:"Logs access statistics for your site.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
modules/blog/blog.module	blog	module		0	0	0	-1	0	a:10:{s:4:"name";s:4:"Blog";s:11:"description";s:69:"Enables keeping easily and regularly updated user web pages or blogs.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
modules/syslog/syslog.module	syslog	module		0	0	0	-1	0	a:10:{s:4:"name";s:6:"Syslog";s:11:"description";s:41:"Logs and records system events to syslog.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
modules/user/user.module	user	module		1	0	0	0	0	a:10:{s:4:"name";s:4:"User";s:11:"description";s:47:"Manages the user registration and login system.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.34";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1416429457";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}
\.


--
-- Data for Name: term_data; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY term_data (tid, vid, name, description, weight) FROM stdin;
\.


--
-- Data for Name: term_hierarchy; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY term_hierarchy (tid, parent) FROM stdin;
\.


--
-- Data for Name: term_node; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY term_node (nid, vid, tid) FROM stdin;
\.


--
-- Data for Name: term_relation; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY term_relation (trid, tid1, tid2) FROM stdin;
\.


--
-- Data for Name: term_synonym; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY term_synonym (tsid, tid, name) FROM stdin;
\.


--
-- Data for Name: url_alias; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY url_alias (pid, src, dst, language) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY users (uid, name, pass, mail, mode, sort, threshold, theme, signature, signature_format, created, access, login, status, timezone, language, picture, init, data) FROM stdin;
0				0	0	0			0	0	0	0	0	\N				\N
1	admin	21232f297a57a5a743894a0e4a801fc3	admin@example.com	0	0	0			0	1423744401	1423744450	1423744449	1	\N			admin@example.com	a:0:{}
\.


--
-- Data for Name: users_roles; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY users_roles (uid, rid) FROM stdin;
\.


--
-- Data for Name: variable; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY variable (name, value) FROM stdin;
theme_default	s:7:"garland";
filter_html_1	i:1;
node_options_forum	a:1:{i:0;s:6:"status";}
file_directory_temp	s:4:"/tmp";
drupal_private_key	s:43:"pohWRoFCDqwxhZMMVAEdkZRxqonpPVfUmXNARv8k0Z4";
language_count	i:2;
language_default	O:8:"stdClass":11:{s:8:"language";s:2:"ja";s:4:"name";s:8:"Japanese";s:6:"native";s:9:"日本語";s:9:"direction";s:1:"0";s:7:"enabled";s:1:"1";s:7:"plurals";s:1:"2";s:7:"formula";s:7:"($n!=1)";s:6:"domain";s:0:"";s:6:"prefix";s:2:"ja";s:6:"weight";s:1:"0";s:10:"javascript";s:32:"44b13db58decc911aa3da99f4e3746b8";}
javascript_parsed	a:6:{i:0;s:14:"misc/jquery.js";i:1;s:14:"misc/drupal.js";i:2;s:16:"misc/progress.js";i:3;s:13:"misc/batch.js";i:4;s:20:"modules/user/user.js";i:5;s:24:"modules/system/system.js";}
site_name	s:9:"localhost";
site_mail	s:17:"admin@example.com";
date_default_timezone	s:5:"32400";
user_email_verification	b:1;
clean_url	i:0;
install_time	i:1423744449;
node_options_page	a:1:{i:0;s:6:"status";}
comment_page	i:0;
theme_settings	a:1:{s:21:"toggle_node_info_page";b:0;}
date_format_short_custom	s:11:"Y/m/d - H:i";
date_format_medium	s:16:"Y/m/d（D） H:i";
date_format_medium_custom	s:16:"Y/m/d（D） H:i";
date_format_long	s:23:"Y年m月d日（D） H:i";
date_format_long_custom	s:23:"Y年m月d日（D） H:i";
menu_masks	a:17:{i:0;i:62;i:1;i:61;i:2;i:59;i:3;i:31;i:4;i:30;i:5;i:29;i:6;i:24;i:7;i:21;i:8;i:15;i:9;i:14;i:10;i:11;i:11;i:7;i:12;i:6;i:13;i:5;i:14;i:3;i:15;i:2;i:16;i:1;}
menu_rebuild_needed	b:1;
css_js_query_string	s:20:"g0000000000000000000";
install_profile	s:8:"Japanese";
install_task	s:4:"done";
menu_expanded	a:0:{}
\.


--
-- Data for Name: vocabulary; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY vocabulary (vid, name, description, help, relations, hierarchy, multiple, required, tags, module, weight) FROM stdin;
\.


--
-- Data for Name: vocabulary_node_types; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY vocabulary_node_types (vid, type) FROM stdin;
\.


--
-- Data for Name: watchdog; Type: TABLE DATA; Schema: public; Owner: drupal
--

COPY watchdog (wid, uid, type, message, variables, severity, link, location, referer, hostname, "timestamp") FROM stdin;
1	0	locale	The %language language (%code) has been created.	a:2:{s:9:"%language";s:8:"Japanese";s:5:"%code";s:2:"ja";}	5		http://localhost:8080/drupal/install.php?locale=ja&profile=Japanese	http://localhost:8080/drupal/install.php?locale=ja&profile=Japanese&op=start&id=1	10.0.2.2	1423744403
2	0	locale	Created JavaScript translation file for the language %language.	a:1:{s:9:"%language";s:9:"日本語";}	5		http://localhost:8080/drupal/install.php?locale=ja&profile=Japanese	http://localhost:8080/drupal/install.php?locale=ja&profile=Japanese&op=start&id=2	10.0.2.2	1423744409
3	1	user	Session opened for %name.	a:1:{s:5:"%name";s:5:"admin";}	5		http://localhost:8080/drupal/install.php?locale=ja&profile=Japanese	http://localhost:8080/drupal/install.php?locale=ja&profile=Japanese	10.0.2.2	1423744449
4	1	actions	Action '%action' added.	a:1:{s:7:"%action";s:27:"コメントを掲載する";}	5		http://localhost:8080/drupal/install.php?locale=ja&profile=Japanese	http://localhost:8080/drupal/install.php?locale=ja&profile=Japanese&op=start&id=3	10.0.2.2	1423744451
5	1	actions	Action '%action' added.	a:1:{s:7:"%action";s:33:"コメントを非掲載にする";}	5		http://localhost:8080/drupal/install.php?locale=ja&profile=Japanese	http://localhost:8080/drupal/install.php?locale=ja&profile=Japanese&op=start&id=3	10.0.2.2	1423744451
6	1	actions	Action '%action' added.	a:1:{s:7:"%action";s:21:"投稿を掲載する";}	5		http://localhost:8080/drupal/install.php?locale=ja&profile=Japanese	http://localhost:8080/drupal/install.php?locale=ja&profile=Japanese&op=start&id=3	10.0.2.2	1423744451
7	1	actions	Action '%action' added.	a:1:{s:7:"%action";s:27:"投稿を非掲載にする";}	5		http://localhost:8080/drupal/install.php?locale=ja&profile=Japanese	http://localhost:8080/drupal/install.php?locale=ja&profile=Japanese&op=start&id=3	10.0.2.2	1423744451
8	1	actions	Action '%action' added.	a:1:{s:7:"%action";s:30:"リスト上部へ固定する";}	5		http://localhost:8080/drupal/install.php?locale=ja&profile=Japanese	http://localhost:8080/drupal/install.php?locale=ja&profile=Japanese&op=start&id=3	10.0.2.2	1423744451
9	1	actions	Action '%action' added.	a:1:{s:7:"%action";s:42:"リスト上部への固定を解除する";}	5		http://localhost:8080/drupal/install.php?locale=ja&profile=Japanese	http://localhost:8080/drupal/install.php?locale=ja&profile=Japanese&op=start&id=3	10.0.2.2	1423744451
10	1	actions	Action '%action' added.	a:1:{s:7:"%action";s:45:"投稿をフロントページへ掲載する";}	5		http://localhost:8080/drupal/install.php?locale=ja&profile=Japanese	http://localhost:8080/drupal/install.php?locale=ja&profile=Japanese&op=start&id=3	10.0.2.2	1423744451
11	1	actions	Action '%action' added.	a:1:{s:7:"%action";s:48:"投稿をフロントページから撤去する";}	5		http://localhost:8080/drupal/install.php?locale=ja&profile=Japanese	http://localhost:8080/drupal/install.php?locale=ja&profile=Japanese&op=start&id=3	10.0.2.2	1423744451
12	1	actions	Action '%action' added.	a:1:{s:7:"%action";s:21:"投稿を保存する";}	5		http://localhost:8080/drupal/install.php?locale=ja&profile=Japanese	http://localhost:8080/drupal/install.php?locale=ja&profile=Japanese&op=start&id=3	10.0.2.2	1423744451
13	1	actions	Action '%action' added.	a:1:{s:7:"%action";s:39:"現在のユーザをブロックする";}	5		http://localhost:8080/drupal/install.php?locale=ja&profile=Japanese	http://localhost:8080/drupal/install.php?locale=ja&profile=Japanese&op=start&id=3	10.0.2.2	1423744451
14	1	actions	Action '%action' added.	a:1:{s:7:"%action";s:65:"現在のユーザのIPアドレスをアクセス禁止にする";}	5		http://localhost:8080/drupal/install.php?locale=ja&profile=Japanese	http://localhost:8080/drupal/install.php?locale=ja&profile=Japanese&op=start&id=3	10.0.2.2	1423744451
\.


--
-- Name: access_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY access
    ADD CONSTRAINT access_pkey PRIMARY KEY (aid);


--
-- Name: actions_aid_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY actions_aid
    ADD CONSTRAINT actions_aid_pkey PRIMARY KEY (aid);


--
-- Name: actions_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY actions
    ADD CONSTRAINT actions_pkey PRIMARY KEY (aid);


--
-- Name: authmap_authname_key; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY authmap
    ADD CONSTRAINT authmap_authname_key UNIQUE (authname);


--
-- Name: authmap_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY authmap
    ADD CONSTRAINT authmap_pkey PRIMARY KEY (aid);


--
-- Name: batch_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY batch
    ADD CONSTRAINT batch_pkey PRIMARY KEY (bid);


--
-- Name: blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY blocks
    ADD CONSTRAINT blocks_pkey PRIMARY KEY (bid);


--
-- Name: blocks_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY blocks_roles
    ADD CONSTRAINT blocks_roles_pkey PRIMARY KEY (module, delta, rid);


--
-- Name: blocks_tmd_key; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY blocks
    ADD CONSTRAINT blocks_tmd_key UNIQUE (theme, module, delta);


--
-- Name: boxes_info_key; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY boxes
    ADD CONSTRAINT boxes_info_key UNIQUE (info);


--
-- Name: boxes_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY boxes
    ADD CONSTRAINT boxes_pkey PRIMARY KEY (bid);


--
-- Name: cache_block_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY cache_block
    ADD CONSTRAINT cache_block_pkey PRIMARY KEY (cid);


--
-- Name: cache_filter_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY cache_filter
    ADD CONSTRAINT cache_filter_pkey PRIMARY KEY (cid);


--
-- Name: cache_form_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY cache_form
    ADD CONSTRAINT cache_form_pkey PRIMARY KEY (cid);


--
-- Name: cache_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY cache_menu
    ADD CONSTRAINT cache_menu_pkey PRIMARY KEY (cid);


--
-- Name: cache_page_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY cache_page
    ADD CONSTRAINT cache_page_pkey PRIMARY KEY (cid);


--
-- Name: cache_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (cid);


--
-- Name: cache_update_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY cache_update
    ADD CONSTRAINT cache_update_pkey PRIMARY KEY (cid);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (cid);


--
-- Name: files_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY files
    ADD CONSTRAINT files_pkey PRIMARY KEY (fid);


--
-- Name: filter_formats_name_key; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY filter_formats
    ADD CONSTRAINT filter_formats_name_key UNIQUE (name);


--
-- Name: filter_formats_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY filter_formats
    ADD CONSTRAINT filter_formats_pkey PRIMARY KEY (format);


--
-- Name: filters_fmd_key; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY filters
    ADD CONSTRAINT filters_fmd_key UNIQUE (format, module, delta);


--
-- Name: filters_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY filters
    ADD CONSTRAINT filters_pkey PRIMARY KEY (fid);


--
-- Name: flood_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY flood
    ADD CONSTRAINT flood_pkey PRIMARY KEY (fid);


--
-- Name: history_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY history
    ADD CONSTRAINT history_pkey PRIMARY KEY (uid, nid);


--
-- Name: languages_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (language);


--
-- Name: locales_source_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY locales_source
    ADD CONSTRAINT locales_source_pkey PRIMARY KEY (lid);


--
-- Name: locales_target_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY locales_target
    ADD CONSTRAINT locales_target_pkey PRIMARY KEY (language, lid, plural);


--
-- Name: menu_custom_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY menu_custom
    ADD CONSTRAINT menu_custom_pkey PRIMARY KEY (menu_name);


--
-- Name: menu_links_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY menu_links
    ADD CONSTRAINT menu_links_pkey PRIMARY KEY (mlid);


--
-- Name: menu_router_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY menu_router
    ADD CONSTRAINT menu_router_pkey PRIMARY KEY (path);


--
-- Name: node_access_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY node_access
    ADD CONSTRAINT node_access_pkey PRIMARY KEY (nid, gid, realm);


--
-- Name: node_comment_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY node_comment_statistics
    ADD CONSTRAINT node_comment_statistics_pkey PRIMARY KEY (nid);


--
-- Name: node_counter_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY node_counter
    ADD CONSTRAINT node_counter_pkey PRIMARY KEY (nid);


--
-- Name: node_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY node
    ADD CONSTRAINT node_pkey PRIMARY KEY (nid);


--
-- Name: node_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY node_revisions
    ADD CONSTRAINT node_revisions_pkey PRIMARY KEY (vid);


--
-- Name: node_type_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY node_type
    ADD CONSTRAINT node_type_pkey PRIMARY KEY (type);


--
-- Name: node_vid_key; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY node
    ADD CONSTRAINT node_vid_key UNIQUE (vid);


--
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (pid);


--
-- Name: role_name_key; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_name_key UNIQUE (name);


--
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (rid);


--
-- Name: semaphore_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY semaphore
    ADD CONSTRAINT semaphore_pkey PRIMARY KEY (name);


--
-- Name: sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (sid);


--
-- Name: system_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY system
    ADD CONSTRAINT system_pkey PRIMARY KEY (filename);


--
-- Name: term_data_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY term_data
    ADD CONSTRAINT term_data_pkey PRIMARY KEY (tid);


--
-- Name: term_hierarchy_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY term_hierarchy
    ADD CONSTRAINT term_hierarchy_pkey PRIMARY KEY (tid, parent);


--
-- Name: term_node_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY term_node
    ADD CONSTRAINT term_node_pkey PRIMARY KEY (tid, vid);


--
-- Name: term_relation_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY term_relation
    ADD CONSTRAINT term_relation_pkey PRIMARY KEY (trid);


--
-- Name: term_relation_tid1_tid2_key; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY term_relation
    ADD CONSTRAINT term_relation_tid1_tid2_key UNIQUE (tid1, tid2);


--
-- Name: term_synonym_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY term_synonym
    ADD CONSTRAINT term_synonym_pkey PRIMARY KEY (tsid);


--
-- Name: url_alias_dst_language_pid_key; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY url_alias
    ADD CONSTRAINT url_alias_dst_language_pid_key UNIQUE (dst, language, pid);


--
-- Name: url_alias_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY url_alias
    ADD CONSTRAINT url_alias_pkey PRIMARY KEY (pid);


--
-- Name: users_name_key; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (uid);


--
-- Name: users_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY users_roles
    ADD CONSTRAINT users_roles_pkey PRIMARY KEY (uid, rid);


--
-- Name: variable_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY variable
    ADD CONSTRAINT variable_pkey PRIMARY KEY (name);


--
-- Name: vocabulary_node_types_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY vocabulary_node_types
    ADD CONSTRAINT vocabulary_node_types_pkey PRIMARY KEY (type, vid);


--
-- Name: vocabulary_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY vocabulary
    ADD CONSTRAINT vocabulary_pkey PRIMARY KEY (vid);


--
-- Name: watchdog_pkey; Type: CONSTRAINT; Schema: public; Owner: drupal; Tablespace: 
--

ALTER TABLE ONLY watchdog
    ADD CONSTRAINT watchdog_pkey PRIMARY KEY (wid);


--
-- Name: batch_token_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX batch_token_idx ON batch USING btree (token);


--
-- Name: blocks_list_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX blocks_list_idx ON blocks USING btree (theme, status, region, weight, module);


--
-- Name: blocks_roles_rid_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX blocks_roles_rid_idx ON blocks_roles USING btree (rid);


--
-- Name: cache_block_expire_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX cache_block_expire_idx ON cache_block USING btree (expire);


--
-- Name: cache_expire_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX cache_expire_idx ON cache USING btree (expire);


--
-- Name: cache_filter_expire_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX cache_filter_expire_idx ON cache_filter USING btree (expire);


--
-- Name: cache_form_expire_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX cache_form_expire_idx ON cache_form USING btree (expire);


--
-- Name: cache_menu_expire_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX cache_menu_expire_idx ON cache_menu USING btree (expire);


--
-- Name: cache_page_expire_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX cache_page_expire_idx ON cache_page USING btree (expire);


--
-- Name: cache_update_expire_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX cache_update_expire_idx ON cache_update USING btree (expire);


--
-- Name: comments_comment_uid_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX comments_comment_uid_idx ON comments USING btree (uid);


--
-- Name: comments_nid_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX comments_nid_idx ON comments USING btree (nid);


--
-- Name: comments_pid_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX comments_pid_idx ON comments USING btree (pid);


--
-- Name: comments_status_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX comments_status_idx ON comments USING btree (status);


--
-- Name: files_status_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX files_status_idx ON files USING btree (status);


--
-- Name: files_timestamp_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX files_timestamp_idx ON files USING btree ("timestamp");


--
-- Name: files_uid_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX files_uid_idx ON files USING btree (uid);


--
-- Name: filters_list_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX filters_list_idx ON filters USING btree (format, weight, module, delta);


--
-- Name: flood_allow_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX flood_allow_idx ON flood USING btree (event, hostname, "timestamp");


--
-- Name: history_nid_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX history_nid_idx ON history USING btree (nid);


--
-- Name: languages_list_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX languages_list_idx ON languages USING btree (weight, name);


--
-- Name: locales_source_source_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX locales_source_source_idx ON locales_source USING btree (substr(source, 1, 30));


--
-- Name: locales_target_lid_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX locales_target_lid_idx ON locales_target USING btree (lid);


--
-- Name: locales_target_plid_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX locales_target_plid_idx ON locales_target USING btree (plid);


--
-- Name: locales_target_plural_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX locales_target_plural_idx ON locales_target USING btree (plural);


--
-- Name: menu_links_menu_parents_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX menu_links_menu_parents_idx ON menu_links USING btree (menu_name, p1, p2, p3, p4, p5, p6, p7, p8, p9);


--
-- Name: menu_links_menu_plid_expand_child_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX menu_links_menu_plid_expand_child_idx ON menu_links USING btree (menu_name, plid, expanded, has_children);


--
-- Name: menu_links_path_menu_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX menu_links_path_menu_idx ON menu_links USING btree (substr((link_path)::text, 1, 128), menu_name);


--
-- Name: menu_links_router_path_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX menu_links_router_path_idx ON menu_links USING btree (substr((router_path)::text, 1, 128));


--
-- Name: menu_router_fit_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX menu_router_fit_idx ON menu_router USING btree (fit);


--
-- Name: menu_router_tab_parent_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX menu_router_tab_parent_idx ON menu_router USING btree (tab_parent);


--
-- Name: menu_router_tab_root_weight_title_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX menu_router_tab_root_weight_title_idx ON menu_router USING btree (substr((tab_root)::text, 1, 64), weight, title);


--
-- Name: node_comment_statistics_comment_count_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX node_comment_statistics_comment_count_idx ON node_comment_statistics USING btree (comment_count);


--
-- Name: node_comment_statistics_last_comment_uid_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX node_comment_statistics_last_comment_uid_idx ON node_comment_statistics USING btree (last_comment_uid);


--
-- Name: node_comment_statistics_node_comment_timestamp_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX node_comment_statistics_node_comment_timestamp_idx ON node_comment_statistics USING btree (last_comment_timestamp);


--
-- Name: node_node_changed_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX node_node_changed_idx ON node USING btree (changed);


--
-- Name: node_node_created_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX node_node_created_idx ON node USING btree (created);


--
-- Name: node_node_moderate_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX node_node_moderate_idx ON node USING btree (moderate);


--
-- Name: node_node_promote_status_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX node_node_promote_status_idx ON node USING btree (promote, status);


--
-- Name: node_node_status_type_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX node_node_status_type_idx ON node USING btree (status, type, nid);


--
-- Name: node_node_title_type_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX node_node_title_type_idx ON node USING btree (title, substr((type)::text, 1, 4));


--
-- Name: node_node_type_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX node_node_type_idx ON node USING btree (substr((type)::text, 1, 4));


--
-- Name: node_revisions_nid_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX node_revisions_nid_idx ON node_revisions USING btree (nid);


--
-- Name: node_revisions_uid_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX node_revisions_uid_idx ON node_revisions USING btree (uid);


--
-- Name: node_tnid_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX node_tnid_idx ON node USING btree (tnid);


--
-- Name: node_translate_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX node_translate_idx ON node USING btree (translate);


--
-- Name: node_uid_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX node_uid_idx ON node USING btree (uid);


--
-- Name: permission_rid_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX permission_rid_idx ON permission USING btree (rid);


--
-- Name: semaphore_expire_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX semaphore_expire_idx ON semaphore USING btree (expire);


--
-- Name: sessions_timestamp_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX sessions_timestamp_idx ON sessions USING btree ("timestamp");


--
-- Name: sessions_uid_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX sessions_uid_idx ON sessions USING btree (uid);


--
-- Name: system_bootstrap_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX system_bootstrap_idx ON system USING btree (substr((type)::text, 1, 12), status, bootstrap, weight, filename);


--
-- Name: system_modules_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX system_modules_idx ON system USING btree (substr((type)::text, 1, 12), status, weight, filename);


--
-- Name: system_type_name_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX system_type_name_idx ON system USING btree (substr((type)::text, 1, 12), name);


--
-- Name: term_data_taxonomy_tree_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX term_data_taxonomy_tree_idx ON term_data USING btree (vid, weight, name);


--
-- Name: term_data_vid_name_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX term_data_vid_name_idx ON term_data USING btree (vid, name);


--
-- Name: term_hierarchy_parent_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX term_hierarchy_parent_idx ON term_hierarchy USING btree (parent);


--
-- Name: term_node_nid_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX term_node_nid_idx ON term_node USING btree (nid);


--
-- Name: term_node_vid_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX term_node_vid_idx ON term_node USING btree (vid);


--
-- Name: term_relation_tid2_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX term_relation_tid2_idx ON term_relation USING btree (tid2);


--
-- Name: term_synonym_name_tid_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX term_synonym_name_tid_idx ON term_synonym USING btree (name, tid);


--
-- Name: term_synonym_tid_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX term_synonym_tid_idx ON term_synonym USING btree (tid);


--
-- Name: url_alias_src_language_pid_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX url_alias_src_language_pid_idx ON url_alias USING btree (src, language, pid);


--
-- Name: users_access_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX users_access_idx ON users USING btree (access);


--
-- Name: users_created_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX users_created_idx ON users USING btree (created);


--
-- Name: users_mail_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX users_mail_idx ON users USING btree (mail);


--
-- Name: users_roles_rid_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX users_roles_rid_idx ON users_roles USING btree (rid);


--
-- Name: vocabulary_list_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX vocabulary_list_idx ON vocabulary USING btree (weight, name);


--
-- Name: vocabulary_node_types_vid_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX vocabulary_node_types_vid_idx ON vocabulary_node_types USING btree (vid);


--
-- Name: watchdog_type_idx; Type: INDEX; Schema: public; Owner: drupal; Tablespace: 
--

CREATE INDEX watchdog_type_idx ON watchdog USING btree (type);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

