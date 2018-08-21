--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Debian 10.5-1.pgdg90+1)
-- Dumped by pg_dump version 10.5 (Debian 10.5-1.pgdg90+1)

-- Started on 2018-08-15 09:08:22 UTC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12980)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 4580 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 369 (class 1259 OID 18200)
-- Name: accounts; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.accounts (
    id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    amount numeric(10,2),
    currency character varying NOT NULL,
    project_id integer NOT NULL,
    assigned_to_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.accounts OWNER TO redmine;

--
-- TOC entry 368 (class 1259 OID 18198)
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_id_seq OWNER TO redmine;

--
-- TOC entry 4581 (class 0 OID 0)
-- Dependencies: 368
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;


--
-- TOC entry 305 (class 1259 OID 17650)
-- Name: acl_ajax_counters; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.acl_ajax_counters (
    id integer NOT NULL,
    token character varying,
    options text
);


ALTER TABLE public.acl_ajax_counters OWNER TO redmine;

--
-- TOC entry 304 (class 1259 OID 17648)
-- Name: acl_ajax_counters_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.acl_ajax_counters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acl_ajax_counters_id_seq OWNER TO redmine;

--
-- TOC entry 4582 (class 0 OID 0)
-- Dependencies: 304
-- Name: acl_ajax_counters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.acl_ajax_counters_id_seq OWNED BY public.acl_ajax_counters.id;


--
-- TOC entry 353 (class 1259 OID 18039)
-- Name: addresses; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.addresses (
    id integer NOT NULL,
    street1 character varying,
    street2 character varying,
    city character varying,
    region character varying,
    postcode character varying,
    country_code character varying(2),
    full_address text,
    address_type character varying(16),
    addressable_id integer,
    addressable_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.addresses OWNER TO redmine;

--
-- TOC entry 352 (class 1259 OID 18037)
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.addresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.addresses_id_seq OWNER TO redmine;

--
-- TOC entry 4583 (class 0 OID 0)
-- Dependencies: 352
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;


--
-- TOC entry 319 (class 1259 OID 17759)
-- Name: agile_colors; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.agile_colors (
    id integer NOT NULL,
    container_id integer,
    container_type character varying,
    color character varying
);


ALTER TABLE public.agile_colors OWNER TO redmine;

--
-- TOC entry 318 (class 1259 OID 17757)
-- Name: agile_colors_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.agile_colors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agile_colors_id_seq OWNER TO redmine;

--
-- TOC entry 4584 (class 0 OID 0)
-- Dependencies: 318
-- Name: agile_colors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.agile_colors_id_seq OWNED BY public.agile_colors.id;


--
-- TOC entry 317 (class 1259 OID 17749)
-- Name: agile_data; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.agile_data (
    id integer NOT NULL,
    issue_id integer,
    "position" integer,
    story_points integer
);


ALTER TABLE public.agile_data OWNER TO redmine;

--
-- TOC entry 316 (class 1259 OID 17747)
-- Name: agile_data_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.agile_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agile_data_id_seq OWNER TO redmine;

--
-- TOC entry 4585 (class 0 OID 0)
-- Dependencies: 316
-- Name: agile_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.agile_data_id_seq OWNED BY public.agile_data.id;


--
-- TOC entry 301 (class 1259 OID 17626)
-- Name: api_log_for_plugins; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.api_log_for_plugins (
    id integer NOT NULL,
    plugin_code text NOT NULL,
    error_code integer,
    description text,
    controller text,
    action text,
    params text,
    user_id integer,
    served boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.api_log_for_plugins OWNER TO redmine;

--
-- TOC entry 300 (class 1259 OID 17624)
-- Name: api_log_for_plugins_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.api_log_for_plugins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_log_for_plugins_id_seq OWNER TO redmine;

--
-- TOC entry 4586 (class 0 OID 0)
-- Dependencies: 300
-- Name: api_log_for_plugins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.api_log_for_plugins_id_seq OWNED BY public.api_log_for_plugins.id;


--
-- TOC entry 198 (class 1259 OID 16395)
-- Name: attachments; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.attachments (
    id integer NOT NULL,
    container_id integer,
    container_type character varying(30),
    filename character varying DEFAULT ''::character varying NOT NULL,
    disk_filename character varying DEFAULT ''::character varying NOT NULL,
    filesize bigint DEFAULT 0 NOT NULL,
    content_type character varying DEFAULT ''::character varying,
    digest character varying(64) DEFAULT ''::character varying NOT NULL,
    downloads integer DEFAULT 0 NOT NULL,
    author_id integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    description character varying,
    disk_directory character varying,
    us_group_id integer
);


ALTER TABLE public.attachments OWNER TO redmine;

--
-- TOC entry 197 (class 1259 OID 16393)
-- Name: attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.attachments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attachments_id_seq OWNER TO redmine;

--
-- TOC entry 4587 (class 0 OID 0)
-- Dependencies: 197
-- Name: attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.attachments_id_seq OWNED BY public.attachments.id;


--
-- TOC entry 200 (class 1259 OID 16415)
-- Name: auth_sources; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.auth_sources (
    id integer NOT NULL,
    type character varying(30) DEFAULT ''::character varying NOT NULL,
    name character varying(60) DEFAULT ''::character varying NOT NULL,
    host character varying(60),
    port integer,
    account character varying,
    account_password character varying DEFAULT ''::character varying,
    base_dn character varying(255),
    attr_login character varying(30),
    attr_firstname character varying(30),
    attr_lastname character varying(30),
    attr_mail character varying(30),
    onthefly_register boolean DEFAULT false NOT NULL,
    tls boolean DEFAULT false NOT NULL,
    filter text,
    timeout integer
);


ALTER TABLE public.auth_sources OWNER TO redmine;

--
-- TOC entry 199 (class 1259 OID 16413)
-- Name: auth_sources_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.auth_sources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_sources_id_seq OWNER TO redmine;

--
-- TOC entry 4588 (class 0 OID 0)
-- Dependencies: 199
-- Name: auth_sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.auth_sources_id_seq OWNED BY public.auth_sources.id;


--
-- TOC entry 269 (class 1259 OID 16977)
-- Name: boards; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.boards (
    id integer NOT NULL,
    project_id integer NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    description character varying,
    "position" integer,
    topics_count integer DEFAULT 0 NOT NULL,
    messages_count integer DEFAULT 0 NOT NULL,
    last_message_id integer,
    parent_id integer
);


ALTER TABLE public.boards OWNER TO redmine;

--
-- TOC entry 268 (class 1259 OID 16975)
-- Name: boards_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.boards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.boards_id_seq OWNER TO redmine;

--
-- TOC entry 4589 (class 0 OID 0)
-- Dependencies: 268
-- Name: boards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.boards_id_seq OWNED BY public.boards.id;


--
-- TOC entry 262 (class 1259 OID 16924)
-- Name: changes; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.changes (
    id integer NOT NULL,
    changeset_id integer NOT NULL,
    action character varying(1) DEFAULT ''::character varying NOT NULL,
    path text NOT NULL,
    from_path text,
    from_revision character varying,
    revision character varying,
    branch character varying
);


ALTER TABLE public.changes OWNER TO redmine;

--
-- TOC entry 261 (class 1259 OID 16922)
-- Name: changes_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.changes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.changes_id_seq OWNER TO redmine;

--
-- TOC entry 4590 (class 0 OID 0)
-- Dependencies: 261
-- Name: changes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.changes_id_seq OWNED BY public.changes.id;


--
-- TOC entry 284 (class 1259 OID 17374)
-- Name: changeset_parents; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.changeset_parents (
    changeset_id integer NOT NULL,
    parent_id integer NOT NULL
);


ALTER TABLE public.changeset_parents OWNER TO redmine;

--
-- TOC entry 260 (class 1259 OID 16912)
-- Name: changesets; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.changesets (
    id integer NOT NULL,
    repository_id integer NOT NULL,
    revision character varying NOT NULL,
    committer character varying,
    committed_on timestamp without time zone NOT NULL,
    comments text,
    commit_date date,
    scmid character varying,
    user_id integer
);


ALTER TABLE public.changesets OWNER TO redmine;

--
-- TOC entry 259 (class 1259 OID 16910)
-- Name: changesets_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.changesets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.changesets_id_seq OWNER TO redmine;

--
-- TOC entry 4591 (class 0 OID 0)
-- Dependencies: 259
-- Name: changesets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.changesets_id_seq OWNED BY public.changesets.id;


--
-- TOC entry 265 (class 1259 OID 16957)
-- Name: changesets_issues; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.changesets_issues (
    changeset_id integer NOT NULL,
    issue_id integer NOT NULL
);


ALTER TABLE public.changesets_issues OWNER TO redmine;

--
-- TOC entry 323 (class 1259 OID 17789)
-- Name: checklist_template_categories; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.checklist_template_categories (
    id integer NOT NULL,
    name character varying,
    "position" integer DEFAULT 1
);


ALTER TABLE public.checklist_template_categories OWNER TO redmine;

--
-- TOC entry 322 (class 1259 OID 17787)
-- Name: checklist_template_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.checklist_template_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.checklist_template_categories_id_seq OWNER TO redmine;

--
-- TOC entry 4592 (class 0 OID 0)
-- Dependencies: 322
-- Name: checklist_template_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.checklist_template_categories_id_seq OWNED BY public.checklist_template_categories.id;


--
-- TOC entry 325 (class 1259 OID 17801)
-- Name: checklist_templates; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.checklist_templates (
    id integer NOT NULL,
    name character varying,
    project_id integer,
    category_id integer,
    user_id integer,
    is_public boolean,
    template_items text,
    is_default boolean DEFAULT false,
    tracker_id integer
);


ALTER TABLE public.checklist_templates OWNER TO redmine;

--
-- TOC entry 324 (class 1259 OID 17799)
-- Name: checklist_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.checklist_templates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.checklist_templates_id_seq OWNER TO redmine;

--
-- TOC entry 4593 (class 0 OID 0)
-- Dependencies: 324
-- Name: checklist_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.checklist_templates_id_seq OWNED BY public.checklist_templates.id;


--
-- TOC entry 321 (class 1259 OID 17776)
-- Name: checklists; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.checklists (
    id integer NOT NULL,
    is_done boolean DEFAULT false,
    subject character varying(512),
    "position" integer DEFAULT 1,
    issue_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.checklists OWNER TO redmine;

--
-- TOC entry 320 (class 1259 OID 17774)
-- Name: checklists_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.checklists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.checklists_id_seq OWNER TO redmine;

--
-- TOC entry 4594 (class 0 OID 0)
-- Dependencies: 320
-- Name: checklists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.checklists_id_seq OWNED BY public.checklists.id;


--
-- TOC entry 242 (class 1259 OID 16750)
-- Name: comments; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    commented_type character varying(30) DEFAULT ''::character varying NOT NULL,
    commented_id integer DEFAULT 0 NOT NULL,
    author_id integer DEFAULT 0 NOT NULL,
    comments text,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL
);


ALTER TABLE public.comments OWNER TO redmine;

--
-- TOC entry 241 (class 1259 OID 16748)
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO redmine;

--
-- TOC entry 4595 (class 0 OID 0)
-- Dependencies: 241
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- TOC entry 327 (class 1259 OID 17828)
-- Name: contacts; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.contacts (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    middle_name character varying,
    company character varying,
    phone character varying,
    email character varying,
    website character varying,
    skype_name character varying,
    birthday date,
    avatar character varying,
    background text,
    job_title character varying,
    is_company boolean DEFAULT false,
    author_id integer DEFAULT 0 NOT NULL,
    assigned_to_id integer,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    cached_tag_list character varying,
    visibility integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.contacts OWNER TO redmine;

--
-- TOC entry 328 (class 1259 OID 17845)
-- Name: contacts_deals; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.contacts_deals (
    deal_id integer,
    contact_id integer
);


ALTER TABLE public.contacts_deals OWNER TO redmine;

--
-- TOC entry 326 (class 1259 OID 17826)
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_id_seq OWNER TO redmine;

--
-- TOC entry 4596 (class 0 OID 0)
-- Dependencies: 326
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;


--
-- TOC entry 329 (class 1259 OID 17850)
-- Name: contacts_issues; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.contacts_issues (
    issue_id integer DEFAULT 0 NOT NULL,
    contact_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.contacts_issues OWNER TO redmine;

--
-- TOC entry 330 (class 1259 OID 17857)
-- Name: contacts_projects; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.contacts_projects (
    project_id integer DEFAULT 0 NOT NULL,
    contact_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.contacts_projects OWNER TO redmine;

--
-- TOC entry 351 (class 1259 OID 17989)
-- Name: contacts_queries; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.contacts_queries (
    id integer NOT NULL,
    project_id integer,
    name character varying DEFAULT ''::character varying NOT NULL,
    filters text,
    user_id integer DEFAULT 0 NOT NULL,
    is_public boolean DEFAULT false NOT NULL,
    column_names text,
    sort_criteria text,
    group_by character varying,
    type character varying
);


ALTER TABLE public.contacts_queries OWNER TO redmine;

--
-- TOC entry 350 (class 1259 OID 17987)
-- Name: contacts_queries_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.contacts_queries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_queries_id_seq OWNER TO redmine;

--
-- TOC entry 4597 (class 0 OID 0)
-- Dependencies: 350
-- Name: contacts_queries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.contacts_queries_id_seq OWNED BY public.contacts_queries.id;


--
-- TOC entry 349 (class 1259 OID 17975)
-- Name: contacts_settings; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.contacts_settings (
    id integer NOT NULL,
    name character varying,
    value text,
    project_id integer,
    updated_on timestamp without time zone
);


ALTER TABLE public.contacts_settings OWNER TO redmine;

--
-- TOC entry 348 (class 1259 OID 17973)
-- Name: contacts_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.contacts_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_settings_id_seq OWNER TO redmine;

--
-- TOC entry 4598 (class 0 OID 0)
-- Dependencies: 348
-- Name: contacts_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.contacts_settings_id_seq OWNED BY public.contacts_settings.id;


--
-- TOC entry 295 (class 1259 OID 17558)
-- Name: custom_field_enumerations; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.custom_field_enumerations (
    id integer NOT NULL,
    custom_field_id integer NOT NULL,
    name character varying NOT NULL,
    active boolean DEFAULT true NOT NULL,
    "position" integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.custom_field_enumerations OWNER TO redmine;

--
-- TOC entry 294 (class 1259 OID 17556)
-- Name: custom_field_enumerations_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.custom_field_enumerations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.custom_field_enumerations_id_seq OWNER TO redmine;

--
-- TOC entry 4599 (class 0 OID 0)
-- Dependencies: 294
-- Name: custom_field_enumerations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.custom_field_enumerations_id_seq OWNED BY public.custom_field_enumerations.id;


--
-- TOC entry 202 (class 1259 OID 16429)
-- Name: custom_fields; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.custom_fields (
    id integer NOT NULL,
    type character varying(30) DEFAULT ''::character varying NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    field_format character varying(30) DEFAULT ''::character varying NOT NULL,
    possible_values text,
    regexp character varying DEFAULT ''::character varying,
    min_length integer,
    max_length integer,
    is_required boolean DEFAULT false NOT NULL,
    is_for_all boolean DEFAULT false NOT NULL,
    is_filter boolean DEFAULT false NOT NULL,
    "position" integer,
    searchable boolean DEFAULT false,
    default_value text,
    editable boolean DEFAULT true,
    visible boolean DEFAULT true NOT NULL,
    multiple boolean DEFAULT false,
    format_store text,
    description text,
    ajaxable boolean DEFAULT false,
    acl_trim_multiple boolean
);


ALTER TABLE public.custom_fields OWNER TO redmine;

--
-- TOC entry 201 (class 1259 OID 16427)
-- Name: custom_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.custom_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.custom_fields_id_seq OWNER TO redmine;

--
-- TOC entry 4600 (class 0 OID 0)
-- Dependencies: 201
-- Name: custom_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.custom_fields_id_seq OWNED BY public.custom_fields.id;


--
-- TOC entry 203 (class 1259 OID 16446)
-- Name: custom_fields_projects; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.custom_fields_projects (
    custom_field_id integer DEFAULT 0 NOT NULL,
    project_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.custom_fields_projects OWNER TO redmine;

--
-- TOC entry 286 (class 1259 OID 17449)
-- Name: custom_fields_roles; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.custom_fields_roles (
    custom_field_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.custom_fields_roles OWNER TO redmine;

--
-- TOC entry 204 (class 1259 OID 16451)
-- Name: custom_fields_trackers; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.custom_fields_trackers (
    custom_field_id integer DEFAULT 0 NOT NULL,
    tracker_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.custom_fields_trackers OWNER TO redmine;

--
-- TOC entry 206 (class 1259 OID 16458)
-- Name: custom_values; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.custom_values (
    id integer NOT NULL,
    customized_type character varying(30) DEFAULT ''::character varying NOT NULL,
    customized_id integer DEFAULT 0 NOT NULL,
    custom_field_id integer DEFAULT 0 NOT NULL,
    value text
);


ALTER TABLE public.custom_values OWNER TO redmine;

--
-- TOC entry 205 (class 1259 OID 16456)
-- Name: custom_values_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.custom_values_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.custom_values_id_seq OWNER TO redmine;

--
-- TOC entry 4601 (class 0 OID 0)
-- Dependencies: 205
-- Name: custom_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.custom_values_id_seq OWNED BY public.custom_values.id;


--
-- TOC entry 334 (class 1259 OID 17882)
-- Name: deal_categories; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.deal_categories (
    id integer NOT NULL,
    name character varying NOT NULL,
    project_id integer
);


ALTER TABLE public.deal_categories OWNER TO redmine;

--
-- TOC entry 333 (class 1259 OID 17880)
-- Name: deal_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.deal_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deal_categories_id_seq OWNER TO redmine;

--
-- TOC entry 4602 (class 0 OID 0)
-- Dependencies: 333
-- Name: deal_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.deal_categories_id_seq OWNED BY public.deal_categories.id;


--
-- TOC entry 336 (class 1259 OID 17894)
-- Name: deal_processes; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.deal_processes (
    id integer NOT NULL,
    deal_id integer NOT NULL,
    author_id integer NOT NULL,
    old_value integer,
    value integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.deal_processes OWNER TO redmine;

--
-- TOC entry 335 (class 1259 OID 17892)
-- Name: deal_processes_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.deal_processes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deal_processes_id_seq OWNER TO redmine;

--
-- TOC entry 4603 (class 0 OID 0)
-- Dependencies: 335
-- Name: deal_processes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.deal_processes_id_seq OWNED BY public.deal_processes.id;


--
-- TOC entry 338 (class 1259 OID 17904)
-- Name: deal_statuses; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.deal_statuses (
    id integer NOT NULL,
    name character varying NOT NULL,
    "position" integer,
    is_default boolean DEFAULT false NOT NULL,
    color integer DEFAULT 11184810 NOT NULL,
    status_type integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.deal_statuses OWNER TO redmine;

--
-- TOC entry 337 (class 1259 OID 17902)
-- Name: deal_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.deal_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deal_statuses_id_seq OWNER TO redmine;

--
-- TOC entry 4604 (class 0 OID 0)
-- Dependencies: 337
-- Name: deal_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.deal_statuses_id_seq OWNED BY public.deal_statuses.id;


--
-- TOC entry 339 (class 1259 OID 17917)
-- Name: deal_statuses_projects; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.deal_statuses_projects (
    project_id integer DEFAULT 0 NOT NULL,
    deal_status_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.deal_statuses_projects OWNER TO redmine;

--
-- TOC entry 332 (class 1259 OID 17866)
-- Name: deals; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.deals (
    id integer NOT NULL,
    name character varying,
    background text,
    currency character varying,
    duration integer DEFAULT 1,
    price numeric(20,2),
    price_type integer,
    project_id integer,
    author_id integer,
    assigned_to_id integer,
    status_id integer,
    contact_id integer,
    category_id integer,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    due_date timestamp without time zone,
    probability integer
);


ALTER TABLE public.deals OWNER TO redmine;

--
-- TOC entry 331 (class 1259 OID 17864)
-- Name: deals_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.deals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deals_id_seq OWNER TO redmine;

--
-- TOC entry 4605 (class 0 OID 0)
-- Dependencies: 331
-- Name: deals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.deals_id_seq OWNED BY public.deals.id;


--
-- TOC entry 355 (class 1259 OID 18052)
-- Name: deals_issues; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.deals_issues (
    id integer NOT NULL,
    issue_id integer DEFAULT 0 NOT NULL,
    deal_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.deals_issues OWNER TO redmine;

--
-- TOC entry 354 (class 1259 OID 18050)
-- Name: deals_issues_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.deals_issues_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deals_issues_id_seq OWNER TO redmine;

--
-- TOC entry 4606 (class 0 OID 0)
-- Dependencies: 354
-- Name: deals_issues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.deals_issues_id_seq OWNED BY public.deals_issues.id;


--
-- TOC entry 377 (class 1259 OID 18263)
-- Name: departments; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.departments (
    id integer NOT NULL,
    parent_id integer,
    lft integer,
    rgt integer,
    name character varying,
    background text,
    head_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.departments OWNER TO redmine;

--
-- TOC entry 376 (class 1259 OID 18261)
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.departments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departments_id_seq OWNER TO redmine;

--
-- TOC entry 4607 (class 0 OID 0)
-- Dependencies: 376
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.departments_id_seq OWNED BY public.departments.id;


--
-- TOC entry 208 (class 1259 OID 16472)
-- Name: documents; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.documents (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    category_id integer DEFAULT 0 NOT NULL,
    title character varying DEFAULT ''::character varying NOT NULL,
    description text,
    created_on timestamp without time zone
);


ALTER TABLE public.documents OWNER TO redmine;

--
-- TOC entry 207 (class 1259 OID 16470)
-- Name: documents_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.documents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documents_id_seq OWNER TO redmine;

--
-- TOC entry 4608 (class 0 OID 0)
-- Dependencies: 207
-- Name: documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.documents_id_seq OWNED BY public.documents.id;


--
-- TOC entry 299 (class 1259 OID 17603)
-- Name: easy_entity_assignments; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.easy_entity_assignments (
    id integer NOT NULL,
    entity_from_id integer,
    entity_from_type character varying,
    entity_to_id integer,
    entity_to_type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.easy_entity_assignments OWNER TO redmine;

--
-- TOC entry 298 (class 1259 OID 17601)
-- Name: easy_entity_assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.easy_entity_assignments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_entity_assignments_id_seq OWNER TO redmine;

--
-- TOC entry 4609 (class 0 OID 0)
-- Dependencies: 298
-- Name: easy_entity_assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.easy_entity_assignments_id_seq OWNED BY public.easy_entity_assignments.id;


--
-- TOC entry 307 (class 1259 OID 17661)
-- Name: easy_instant_messages; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.easy_instant_messages (
    id integer NOT NULL,
    sender_id integer,
    recipient_id integer,
    content text,
    sender_ip character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    unread boolean DEFAULT true
);


ALTER TABLE public.easy_instant_messages OWNER TO redmine;

--
-- TOC entry 306 (class 1259 OID 17659)
-- Name: easy_instant_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.easy_instant_messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_instant_messages_id_seq OWNER TO redmine;

--
-- TOC entry 4610 (class 0 OID 0)
-- Dependencies: 306
-- Name: easy_instant_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.easy_instant_messages_id_seq OWNED BY public.easy_instant_messages.id;


--
-- TOC entry 297 (class 1259 OID 17585)
-- Name: easy_settings; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.easy_settings (
    id integer NOT NULL,
    type character varying,
    name character varying,
    value text,
    project_id integer
);


ALTER TABLE public.easy_settings OWNER TO redmine;

--
-- TOC entry 296 (class 1259 OID 17583)
-- Name: easy_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.easy_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_settings_id_seq OWNER TO redmine;

--
-- TOC entry 4611 (class 0 OID 0)
-- Dependencies: 296
-- Name: easy_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.easy_settings_id_seq OWNED BY public.easy_settings.id;


--
-- TOC entry 288 (class 1259 OID 17476)
-- Name: email_addresses; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.email_addresses (
    id integer NOT NULL,
    user_id integer NOT NULL,
    address character varying NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    notify boolean DEFAULT true NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL
);


ALTER TABLE public.email_addresses OWNER TO redmine;

--
-- TOC entry 287 (class 1259 OID 17474)
-- Name: email_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.email_addresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_addresses_id_seq OWNER TO redmine;

--
-- TOC entry 4612 (class 0 OID 0)
-- Dependencies: 287
-- Name: email_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.email_addresses_id_seq OWNED BY public.email_addresses.id;


--
-- TOC entry 275 (class 1259 OID 17042)
-- Name: enabled_modules; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.enabled_modules (
    id integer NOT NULL,
    project_id integer,
    name character varying NOT NULL
);


ALTER TABLE public.enabled_modules OWNER TO redmine;

--
-- TOC entry 274 (class 1259 OID 17040)
-- Name: enabled_modules_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.enabled_modules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enabled_modules_id_seq OWNER TO redmine;

--
-- TOC entry 4613 (class 0 OID 0)
-- Dependencies: 274
-- Name: enabled_modules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.enabled_modules_id_seq OWNED BY public.enabled_modules.id;


--
-- TOC entry 210 (class 1259 OID 16487)
-- Name: enumerations; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.enumerations (
    id integer NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    "position" integer,
    is_default boolean DEFAULT false NOT NULL,
    type character varying,
    active boolean DEFAULT true NOT NULL,
    project_id integer,
    parent_id integer,
    position_name character varying(30)
);


ALTER TABLE public.enumerations OWNER TO redmine;

--
-- TOC entry 209 (class 1259 OID 16485)
-- Name: enumerations_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.enumerations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enumerations_id_seq OWNER TO redmine;

--
-- TOC entry 4614 (class 0 OID 0)
-- Dependencies: 209
-- Name: enumerations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.enumerations_id_seq OWNED BY public.enumerations.id;


--
-- TOC entry 311 (class 1259 OID 17696)
-- Name: eq_pinned_queries; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.eq_pinned_queries (
    id integer NOT NULL,
    query_id integer NOT NULL,
    user_id integer,
    "position" integer
);


ALTER TABLE public.eq_pinned_queries OWNER TO redmine;

--
-- TOC entry 310 (class 1259 OID 17694)
-- Name: eq_pinned_queries_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.eq_pinned_queries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.eq_pinned_queries_id_seq OWNER TO redmine;

--
-- TOC entry 4615 (class 0 OID 0)
-- Dependencies: 310
-- Name: eq_pinned_queries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.eq_pinned_queries_id_seq OWNED BY public.eq_pinned_queries.id;


--
-- TOC entry 312 (class 1259 OID 17714)
-- Name: eq_queries_hide_in_projects; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.eq_queries_hide_in_projects (
    query_id integer NOT NULL,
    project_id integer NOT NULL
);


ALTER TABLE public.eq_queries_hide_in_projects OWNER TO redmine;

--
-- TOC entry 313 (class 1259 OID 17720)
-- Name: eq_queries_show_in_projects; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.eq_queries_show_in_projects (
    query_id integer NOT NULL,
    project_id integer NOT NULL
);


ALTER TABLE public.eq_queries_show_in_projects OWNER TO redmine;

--
-- TOC entry 359 (class 1259 OID 18082)
-- Name: expenses; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.expenses (
    id integer NOT NULL,
    expense_date date,
    price numeric(10,2) DEFAULT 0 NOT NULL,
    description text,
    contact_id integer,
    author_id integer,
    project_id integer,
    status_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    assigned_to_id integer,
    currency character varying,
    is_billable boolean DEFAULT true,
    tax numeric(6,4)
);


ALTER TABLE public.expenses OWNER TO redmine;

--
-- TOC entry 358 (class 1259 OID 18080)
-- Name: expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.expenses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.expenses_id_seq OWNER TO redmine;

--
-- TOC entry 4616 (class 0 OID 0)
-- Dependencies: 358
-- Name: expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.expenses_id_seq OWNED BY public.expenses.id;


--
-- TOC entry 367 (class 1259 OID 18191)
-- Name: favorite_projects; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.favorite_projects (
    id integer NOT NULL,
    project_id integer,
    user_id integer
);


ALTER TABLE public.favorite_projects OWNER TO redmine;

--
-- TOC entry 366 (class 1259 OID 18189)
-- Name: favorite_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.favorite_projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.favorite_projects_id_seq OWNER TO redmine;

--
-- TOC entry 4617 (class 0 OID 0)
-- Dependencies: 366
-- Name: favorite_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.favorite_projects_id_seq OWNED BY public.favorite_projects.id;


--
-- TOC entry 315 (class 1259 OID 17738)
-- Name: global_roles; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.global_roles (
    id integer NOT NULL,
    user_id integer,
    role_id integer
);


ALTER TABLE public.global_roles OWNER TO redmine;

--
-- TOC entry 314 (class 1259 OID 17736)
-- Name: global_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.global_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.global_roles_id_seq OWNER TO redmine;

--
-- TOC entry 4618 (class 0 OID 0)
-- Dependencies: 314
-- Name: global_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.global_roles_id_seq OWNED BY public.global_roles.id;


--
-- TOC entry 283 (class 1259 OID 17212)
-- Name: groups_users; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.groups_users (
    group_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.groups_users OWNER TO redmine;

--
-- TOC entry 293 (class 1259 OID 17524)
-- Name: import_items; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.import_items (
    id integer NOT NULL,
    import_id integer NOT NULL,
    "position" integer NOT NULL,
    obj_id integer,
    message text
);


ALTER TABLE public.import_items OWNER TO redmine;

--
-- TOC entry 292 (class 1259 OID 17522)
-- Name: import_items_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.import_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.import_items_id_seq OWNER TO redmine;

--
-- TOC entry 4619 (class 0 OID 0)
-- Dependencies: 292
-- Name: import_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.import_items_id_seq OWNED BY public.import_items.id;


--
-- TOC entry 291 (class 1259 OID 17512)
-- Name: imports; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.imports (
    id integer NOT NULL,
    type character varying,
    user_id integer NOT NULL,
    filename character varying,
    settings text,
    total_items integer,
    finished boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.imports OWNER TO redmine;

--
-- TOC entry 290 (class 1259 OID 17510)
-- Name: imports_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.imports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.imports_id_seq OWNER TO redmine;

--
-- TOC entry 4620 (class 0 OID 0)
-- Dependencies: 290
-- Name: imports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.imports_id_seq OWNED BY public.imports.id;


--
-- TOC entry 361 (class 1259 OID 18098)
-- Name: invoice_lines; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.invoice_lines (
    id integer NOT NULL,
    invoice_id integer,
    "position" integer,
    quantity numeric(10,2) DEFAULT 1 NOT NULL,
    description text,
    tax numeric(10,2),
    price numeric(10,2) DEFAULT 0 NOT NULL,
    units character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    discount numeric(6,4),
    product_id integer
);


ALTER TABLE public.invoice_lines OWNER TO redmine;

--
-- TOC entry 360 (class 1259 OID 18096)
-- Name: invoice_lines_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.invoice_lines_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invoice_lines_id_seq OWNER TO redmine;

--
-- TOC entry 4621 (class 0 OID 0)
-- Dependencies: 360
-- Name: invoice_lines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.invoice_lines_id_seq OWNED BY public.invoice_lines.id;


--
-- TOC entry 363 (class 1259 OID 18126)
-- Name: invoice_payments; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.invoice_payments (
    id integer NOT NULL,
    amount numeric(10,2),
    payment_date timestamp without time zone,
    invoice_id integer,
    description character varying,
    author_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.invoice_payments OWNER TO redmine;

--
-- TOC entry 362 (class 1259 OID 18124)
-- Name: invoice_payments_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.invoice_payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invoice_payments_id_seq OWNER TO redmine;

--
-- TOC entry 4622 (class 0 OID 0)
-- Dependencies: 362
-- Name: invoice_payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.invoice_payments_id_seq OWNED BY public.invoice_payments.id;


--
-- TOC entry 365 (class 1259 OID 18165)
-- Name: invoice_templates; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.invoice_templates (
    id integer NOT NULL,
    name character varying,
    project_id integer,
    content text,
    description character varying,
    author_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.invoice_templates OWNER TO redmine;

--
-- TOC entry 364 (class 1259 OID 18163)
-- Name: invoice_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.invoice_templates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invoice_templates_id_seq OWNER TO redmine;

--
-- TOC entry 4623 (class 0 OID 0)
-- Dependencies: 364
-- Name: invoice_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.invoice_templates_id_seq OWNED BY public.invoice_templates.id;


--
-- TOC entry 357 (class 1259 OID 18064)
-- Name: invoices; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.invoices (
    id integer NOT NULL,
    number character varying,
    invoice_date timestamp without time zone,
    discount numeric(10,2) DEFAULT 0 NOT NULL,
    discount_type integer DEFAULT 0 NOT NULL,
    description text,
    due_date timestamp without time zone,
    language character varying,
    currency character varying,
    status_id integer,
    contact_id integer,
    project_id integer,
    assigned_to_id integer,
    author_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    subject character varying,
    amount numeric(10,2) DEFAULT 0 NOT NULL,
    comments_count integer,
    paid_date timestamp without time zone,
    balance numeric(10,2) DEFAULT 0,
    type character varying,
    order_number character varying,
    template_id integer,
    is_recurring boolean DEFAULT false,
    recurring_period character varying,
    recurring_occurrences integer,
    recurring_action integer,
    recurring_profile_id integer,
    recurring_number integer
);


ALTER TABLE public.invoices OWNER TO redmine;

--
-- TOC entry 356 (class 1259 OID 18062)
-- Name: invoices_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.invoices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invoices_id_seq OWNER TO redmine;

--
-- TOC entry 4624 (class 0 OID 0)
-- Dependencies: 356
-- Name: invoices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.invoices_id_seq OWNED BY public.invoices.id;


--
-- TOC entry 212 (class 1259 OID 16497)
-- Name: issue_categories; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.issue_categories (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    name character varying(60) DEFAULT ''::character varying NOT NULL,
    assigned_to_id integer
);


ALTER TABLE public.issue_categories OWNER TO redmine;

--
-- TOC entry 211 (class 1259 OID 16495)
-- Name: issue_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.issue_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_categories_id_seq OWNER TO redmine;

--
-- TOC entry 4625 (class 0 OID 0)
-- Dependencies: 211
-- Name: issue_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.issue_categories_id_seq OWNED BY public.issue_categories.id;


--
-- TOC entry 417 (class 1259 OID 18567)
-- Name: issue_reads; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.issue_reads (
    id integer NOT NULL,
    user_id integer,
    issue_id integer,
    read_date timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.issue_reads OWNER TO redmine;

--
-- TOC entry 416 (class 1259 OID 18565)
-- Name: issue_reads_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.issue_reads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_reads_id_seq OWNER TO redmine;

--
-- TOC entry 4626 (class 0 OID 0)
-- Dependencies: 416
-- Name: issue_reads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.issue_reads_id_seq OWNED BY public.issue_reads.id;


--
-- TOC entry 267 (class 1259 OID 16963)
-- Name: issue_relations; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.issue_relations (
    id integer NOT NULL,
    issue_from_id integer NOT NULL,
    issue_to_id integer NOT NULL,
    relation_type character varying DEFAULT ''::character varying NOT NULL,
    delay integer
);


ALTER TABLE public.issue_relations OWNER TO redmine;

--
-- TOC entry 266 (class 1259 OID 16961)
-- Name: issue_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.issue_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_relations_id_seq OWNER TO redmine;

--
-- TOC entry 4627 (class 0 OID 0)
-- Dependencies: 266
-- Name: issue_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.issue_relations_id_seq OWNED BY public.issue_relations.id;


--
-- TOC entry 214 (class 1259 OID 16523)
-- Name: issue_statuses; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.issue_statuses (
    id integer NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    is_closed boolean DEFAULT false NOT NULL,
    "position" integer,
    default_done_ratio integer
);


ALTER TABLE public.issue_statuses OWNER TO redmine;

--
-- TOC entry 213 (class 1259 OID 16521)
-- Name: issue_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.issue_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_statuses_id_seq OWNER TO redmine;

--
-- TOC entry 4628 (class 0 OID 0)
-- Dependencies: 213
-- Name: issue_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.issue_statuses_id_seq OWNED BY public.issue_statuses.id;


--
-- TOC entry 216 (class 1259 OID 16535)
-- Name: issues; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.issues (
    id integer NOT NULL,
    tracker_id integer NOT NULL,
    project_id integer NOT NULL,
    subject character varying DEFAULT ''::character varying NOT NULL,
    description text,
    due_date date,
    category_id integer,
    status_id integer NOT NULL,
    assigned_to_id integer,
    priority_id integer NOT NULL,
    fixed_version_id integer,
    author_id integer NOT NULL,
    lock_version integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    start_date date,
    done_ratio integer DEFAULT 0 NOT NULL,
    estimated_hours double precision,
    parent_id integer,
    root_id integer,
    lft integer,
    rgt integer,
    is_private boolean DEFAULT false NOT NULL,
    closed_on timestamp without time zone
);


ALTER TABLE public.issues OWNER TO redmine;

--
-- TOC entry 215 (class 1259 OID 16533)
-- Name: issues_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.issues_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issues_id_seq OWNER TO redmine;

--
-- TOC entry 4629 (class 0 OID 0)
-- Dependencies: 215
-- Name: issues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.issues_id_seq OWNED BY public.issues.id;


--
-- TOC entry 238 (class 1259 OID 16714)
-- Name: journal_details; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.journal_details (
    id integer NOT NULL,
    journal_id integer DEFAULT 0 NOT NULL,
    property character varying(30) DEFAULT ''::character varying NOT NULL,
    prop_key character varying(30) DEFAULT ''::character varying NOT NULL,
    old_value text,
    value text
);


ALTER TABLE public.journal_details OWNER TO redmine;

--
-- TOC entry 237 (class 1259 OID 16712)
-- Name: journal_details_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.journal_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.journal_details_id_seq OWNER TO redmine;

--
-- TOC entry 4630 (class 0 OID 0)
-- Dependencies: 237
-- Name: journal_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.journal_details_id_seq OWNED BY public.journal_details.id;


--
-- TOC entry 236 (class 1259 OID 16700)
-- Name: journals; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.journals (
    id integer NOT NULL,
    journalized_id integer DEFAULT 0 NOT NULL,
    journalized_type character varying(30) DEFAULT ''::character varying NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    notes text,
    created_on timestamp without time zone NOT NULL,
    private_notes boolean DEFAULT false NOT NULL,
    updated_on timestamp without time zone
);


ALTER TABLE public.journals OWNER TO redmine;

--
-- TOC entry 235 (class 1259 OID 16698)
-- Name: journals_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.journals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.journals_id_seq OWNER TO redmine;

--
-- TOC entry 4631 (class 0 OID 0)
-- Dependencies: 235
-- Name: journals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.journals_id_seq OWNED BY public.journals.id;


--
-- TOC entry 282 (class 1259 OID 17206)
-- Name: member_roles; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.member_roles (
    id integer NOT NULL,
    member_id integer NOT NULL,
    role_id integer NOT NULL,
    inherited_from integer
);


ALTER TABLE public.member_roles OWNER TO redmine;

--
-- TOC entry 281 (class 1259 OID 17204)
-- Name: member_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.member_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.member_roles_id_seq OWNER TO redmine;

--
-- TOC entry 4632 (class 0 OID 0)
-- Dependencies: 281
-- Name: member_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.member_roles_id_seq OWNED BY public.member_roles.id;


--
-- TOC entry 218 (class 1259 OID 16554)
-- Name: members; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.members (
    id integer NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    mail_notification boolean DEFAULT false NOT NULL
);


ALTER TABLE public.members OWNER TO redmine;

--
-- TOC entry 217 (class 1259 OID 16552)
-- Name: members_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.members_id_seq OWNER TO redmine;

--
-- TOC entry 4633 (class 0 OID 0)
-- Dependencies: 217
-- Name: members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.members_id_seq OWNED BY public.members.id;


--
-- TOC entry 271 (class 1259 OID 16993)
-- Name: messages; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    board_id integer NOT NULL,
    parent_id integer,
    subject character varying DEFAULT ''::character varying NOT NULL,
    content text,
    author_id integer,
    replies_count integer DEFAULT 0 NOT NULL,
    last_reply_id integer,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL,
    locked boolean DEFAULT false,
    sticky integer DEFAULT 0
);


ALTER TABLE public.messages OWNER TO redmine;

--
-- TOC entry 270 (class 1259 OID 16991)
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO redmine;

--
-- TOC entry 4634 (class 0 OID 0)
-- Dependencies: 270
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- TOC entry 220 (class 1259 OID 16565)
-- Name: news; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.news (
    id integer NOT NULL,
    project_id integer,
    title character varying(60) DEFAULT ''::character varying NOT NULL,
    summary character varying(255) DEFAULT ''::character varying,
    description text,
    author_id integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    comments_count integer DEFAULT 0 NOT NULL,
    uncommentable boolean DEFAULT false
);


ALTER TABLE public.news OWNER TO redmine;

--
-- TOC entry 219 (class 1259 OID 16563)
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_id_seq OWNER TO redmine;

--
-- TOC entry 4635 (class 0 OID 0)
-- Dependencies: 219
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;


--
-- TOC entry 341 (class 1259 OID 17925)
-- Name: notes; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.notes (
    id integer NOT NULL,
    subject character varying,
    content text,
    source_id integer,
    source_type character varying,
    author_id integer,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    type_id integer
);


ALTER TABLE public.notes OWNER TO redmine;

--
-- TOC entry 340 (class 1259 OID 17923)
-- Name: notes_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.notes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notes_id_seq OWNER TO redmine;

--
-- TOC entry 4636 (class 0 OID 0)
-- Dependencies: 340
-- Name: notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.notes_id_seq OWNED BY public.notes.id;


--
-- TOC entry 278 (class 1259 OID 17168)
-- Name: open_id_authentication_associations; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.open_id_authentication_associations (
    id integer NOT NULL,
    issued integer,
    lifetime integer,
    handle character varying,
    assoc_type character varying,
    server_url bytea,
    secret bytea
);


ALTER TABLE public.open_id_authentication_associations OWNER TO redmine;

--
-- TOC entry 277 (class 1259 OID 17166)
-- Name: open_id_authentication_associations_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.open_id_authentication_associations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.open_id_authentication_associations_id_seq OWNER TO redmine;

--
-- TOC entry 4637 (class 0 OID 0)
-- Dependencies: 277
-- Name: open_id_authentication_associations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.open_id_authentication_associations_id_seq OWNED BY public.open_id_authentication_associations.id;


--
-- TOC entry 280 (class 1259 OID 17179)
-- Name: open_id_authentication_nonces; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.open_id_authentication_nonces (
    id integer NOT NULL,
    "timestamp" integer NOT NULL,
    server_url character varying,
    salt character varying NOT NULL
);


ALTER TABLE public.open_id_authentication_nonces OWNER TO redmine;

--
-- TOC entry 279 (class 1259 OID 17177)
-- Name: open_id_authentication_nonces_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.open_id_authentication_nonces_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.open_id_authentication_nonces_id_seq OWNER TO redmine;

--
-- TOC entry 4638 (class 0 OID 0)
-- Dependencies: 279
-- Name: open_id_authentication_nonces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.open_id_authentication_nonces_id_seq OWNED BY public.open_id_authentication_nonces.id;


--
-- TOC entry 373 (class 1259 OID 18222)
-- Name: operation_categories; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.operation_categories (
    id integer NOT NULL,
    name character varying NOT NULL,
    "position" integer,
    parent_id integer,
    lft integer,
    rgt integer,
    code character varying
);


ALTER TABLE public.operation_categories OWNER TO redmine;

--
-- TOC entry 372 (class 1259 OID 18220)
-- Name: operation_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.operation_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.operation_categories_id_seq OWNER TO redmine;

--
-- TOC entry 4639 (class 0 OID 0)
-- Dependencies: 372
-- Name: operation_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.operation_categories_id_seq OWNED BY public.operation_categories.id;


--
-- TOC entry 375 (class 1259 OID 18233)
-- Name: operation_objects; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.operation_objects (
    id integer NOT NULL,
    operation_id integer,
    operationable_id integer,
    operationable_type character varying,
    created_at timestamp without time zone
);


ALTER TABLE public.operation_objects OWNER TO redmine;

--
-- TOC entry 374 (class 1259 OID 18231)
-- Name: operation_objects_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.operation_objects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.operation_objects_id_seq OWNER TO redmine;

--
-- TOC entry 4640 (class 0 OID 0)
-- Dependencies: 374
-- Name: operation_objects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.operation_objects_id_seq OWNED BY public.operation_objects.id;


--
-- TOC entry 371 (class 1259 OID 18211)
-- Name: operations; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.operations (
    id integer NOT NULL,
    amount numeric(10,2) NOT NULL,
    category_id integer NOT NULL,
    account_id integer NOT NULL,
    contact_id integer,
    comments_count integer,
    operation_date timestamp without time zone NOT NULL,
    author_id integer NOT NULL,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    assigned_to_id integer,
    is_approved boolean DEFAULT false NOT NULL,
    income boolean DEFAULT true
);


ALTER TABLE public.operations OWNER TO redmine;

--
-- TOC entry 370 (class 1259 OID 18209)
-- Name: operations_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.operations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.operations_id_seq OWNER TO redmine;

--
-- TOC entry 4641 (class 0 OID 0)
-- Dependencies: 370
-- Name: operations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.operations_id_seq OWNED BY public.operations.id;


--
-- TOC entry 393 (class 1259 OID 18380)
-- Name: order_statuses; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.order_statuses (
    id integer NOT NULL,
    name character varying,
    "position" integer,
    is_default boolean DEFAULT false NOT NULL,
    is_closed boolean DEFAULT false NOT NULL,
    color integer
);


ALTER TABLE public.order_statuses OWNER TO redmine;

--
-- TOC entry 392 (class 1259 OID 18378)
-- Name: order_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.order_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_statuses_id_seq OWNER TO redmine;

--
-- TOC entry 4642 (class 0 OID 0)
-- Dependencies: 392
-- Name: order_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.order_statuses_id_seq OWNED BY public.order_statuses.id;


--
-- TOC entry 391 (class 1259 OID 18362)
-- Name: orders; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    number character varying,
    subject character varying,
    order_date timestamp without time zone,
    closed_date timestamp without time zone,
    currency character varying,
    contact_id integer,
    status_id integer,
    assigned_to_id integer,
    author_id integer,
    project_id integer,
    comments_count integer,
    description text,
    amount numeric(10,2) DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.orders OWNER TO redmine;

--
-- TOC entry 390 (class 1259 OID 18360)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO redmine;

--
-- TOC entry 4643 (class 0 OID 0)
-- Dependencies: 390
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 381 (class 1259 OID 18295)
-- Name: people_announcements; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.people_announcements (
    id integer NOT NULL,
    description character varying,
    start_date date,
    end_date date,
    frequency character varying,
    kind character varying,
    active boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.people_announcements OWNER TO redmine;

--
-- TOC entry 380 (class 1259 OID 18293)
-- Name: people_announcements_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.people_announcements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.people_announcements_id_seq OWNER TO redmine;

--
-- TOC entry 4644 (class 0 OID 0)
-- Dependencies: 380
-- Name: people_announcements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.people_announcements_id_seq OWNED BY public.people_announcements.id;


--
-- TOC entry 385 (class 1259 OID 18319)
-- Name: people_holidays; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.people_holidays (
    id integer NOT NULL,
    name character varying,
    start_date date,
    end_date date,
    description text,
    is_workday boolean,
    created_on timestamp without time zone,
    updated_on timestamp without time zone
);


ALTER TABLE public.people_holidays OWNER TO redmine;

--
-- TOC entry 384 (class 1259 OID 18317)
-- Name: people_holidays_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.people_holidays_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.people_holidays_id_seq OWNER TO redmine;

--
-- TOC entry 4645 (class 0 OID 0)
-- Dependencies: 384
-- Name: people_holidays_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.people_holidays_id_seq OWNED BY public.people_holidays.id;


--
-- TOC entry 379 (class 1259 OID 18276)
-- Name: people_information; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.people_information (
    user_id integer NOT NULL,
    phone character varying,
    address character varying,
    skype character varying,
    birthday date,
    job_title character varying,
    company character varying,
    middlename character varying,
    gender smallint,
    twitter character varying,
    facebook character varying,
    linkedin character varying,
    background text,
    appearance_date date,
    department_id integer,
    is_system boolean DEFAULT false,
    manager_id integer
);


ALTER TABLE public.people_information OWNER TO redmine;

--
-- TOC entry 378 (class 1259 OID 18274)
-- Name: people_information_user_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.people_information_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.people_information_user_id_seq OWNER TO redmine;

--
-- TOC entry 4646 (class 0 OID 0)
-- Dependencies: 378
-- Name: people_information_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.people_information_user_id_seq OWNED BY public.people_information.user_id;


--
-- TOC entry 383 (class 1259 OID 18307)
-- Name: people_work_experiences; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.people_work_experiences (
    id integer NOT NULL,
    previous_company_name character varying,
    job_title character varying,
    from_date timestamp without time zone,
    to_date timestamp without time zone,
    description text,
    user_id integer
);


ALTER TABLE public.people_work_experiences OWNER TO redmine;

--
-- TOC entry 382 (class 1259 OID 18305)
-- Name: people_work_experiences_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.people_work_experiences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.people_work_experiences_id_seq OWNER TO redmine;

--
-- TOC entry 4647 (class 0 OID 0)
-- Dependencies: 382
-- Name: people_work_experiences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.people_work_experiences_id_seq OWNED BY public.people_work_experiences.id;


--
-- TOC entry 397 (class 1259 OID 18408)
-- Name: product_categories; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.product_categories (
    id integer NOT NULL,
    name character varying,
    code character varying,
    parent_id integer,
    lft integer,
    rgt integer
);


ALTER TABLE public.product_categories OWNER TO redmine;

--
-- TOC entry 396 (class 1259 OID 18406)
-- Name: product_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.product_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_categories_id_seq OWNER TO redmine;

--
-- TOC entry 4648 (class 0 OID 0)
-- Dependencies: 396
-- Name: product_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.product_categories_id_seq OWNED BY public.product_categories.id;


--
-- TOC entry 389 (class 1259 OID 18346)
-- Name: product_lines; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.product_lines (
    id integer NOT NULL,
    container_id integer,
    container_type character varying,
    product_id integer,
    description text,
    quantity numeric(10,2) DEFAULT 0,
    tax numeric(6,4),
    discount numeric(6,4),
    price numeric(10,2) DEFAULT 0,
    "position" integer
);


ALTER TABLE public.product_lines OWNER TO redmine;

--
-- TOC entry 388 (class 1259 OID 18344)
-- Name: product_lines_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.product_lines_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_lines_id_seq OWNER TO redmine;

--
-- TOC entry 4649 (class 0 OID 0)
-- Dependencies: 388
-- Name: product_lines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.product_lines_id_seq OWNED BY public.product_lines.id;


--
-- TOC entry 387 (class 1259 OID 18330)
-- Name: products; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.products (
    id integer NOT NULL,
    code character varying,
    name character varying NOT NULL,
    description text,
    status_id integer DEFAULT 1 NOT NULL,
    currency character varying(5),
    price numeric(10,2),
    amount numeric(10,2),
    author_id integer,
    project_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    category_id integer
);


ALTER TABLE public.products OWNER TO redmine;

--
-- TOC entry 395 (class 1259 OID 18396)
-- Name: products_bundles; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.products_bundles (
    id integer NOT NULL,
    bundle_id integer,
    product_id integer
);


ALTER TABLE public.products_bundles OWNER TO redmine;

--
-- TOC entry 394 (class 1259 OID 18394)
-- Name: products_bundles_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.products_bundles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_bundles_id_seq OWNER TO redmine;

--
-- TOC entry 4650 (class 0 OID 0)
-- Dependencies: 394
-- Name: products_bundles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.products_bundles_id_seq OWNED BY public.products_bundles.id;


--
-- TOC entry 386 (class 1259 OID 18328)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO redmine;

--
-- TOC entry 4651 (class 0 OID 0)
-- Dependencies: 386
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 222 (class 1259 OID 16601)
-- Name: projects; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    description text,
    homepage character varying DEFAULT ''::character varying,
    is_public boolean DEFAULT true NOT NULL,
    parent_id integer,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    identifier character varying,
    status integer DEFAULT 1 NOT NULL,
    lft integer,
    rgt integer,
    inherit_members boolean DEFAULT false NOT NULL,
    default_version_id integer,
    default_assigned_to_id integer
);


ALTER TABLE public.projects OWNER TO redmine;

--
-- TOC entry 221 (class 1259 OID 16599)
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO redmine;

--
-- TOC entry 4652 (class 0 OID 0)
-- Dependencies: 221
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- TOC entry 276 (class 1259 OID 17097)
-- Name: projects_trackers; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.projects_trackers (
    project_id integer DEFAULT 0 NOT NULL,
    tracker_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.projects_trackers OWNER TO redmine;

--
-- TOC entry 244 (class 1259 OID 16773)
-- Name: queries; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.queries (
    id integer NOT NULL,
    project_id integer,
    name character varying DEFAULT ''::character varying NOT NULL,
    filters text,
    user_id integer DEFAULT 0 NOT NULL,
    column_names text,
    sort_criteria text,
    group_by character varying,
    type character varying,
    visibility integer DEFAULT 0,
    options text,
    category_id integer,
    eq_counter boolean DEFAULT false,
    sub_project boolean DEFAULT false
);


ALTER TABLE public.queries OWNER TO redmine;

--
-- TOC entry 243 (class 1259 OID 16771)
-- Name: queries_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.queries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.queries_id_seq OWNER TO redmine;

--
-- TOC entry 4653 (class 0 OID 0)
-- Dependencies: 243
-- Name: queries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.queries_id_seq OWNED BY public.queries.id;


--
-- TOC entry 285 (class 1259 OID 17435)
-- Name: queries_roles; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.queries_roles (
    query_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.queries_roles OWNER TO redmine;

--
-- TOC entry 309 (class 1259 OID 17685)
-- Name: query_categories; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.query_categories (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    author_id integer,
    "position" integer
);


ALTER TABLE public.query_categories OWNER TO redmine;

--
-- TOC entry 308 (class 1259 OID 17683)
-- Name: query_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.query_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.query_categories_id_seq OWNER TO redmine;

--
-- TOC entry 4654 (class 0 OID 0)
-- Dependencies: 308
-- Name: query_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.query_categories_id_seq OWNED BY public.query_categories.id;


--
-- TOC entry 403 (class 1259 OID 18450)
-- Name: questions; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.questions (
    id integer NOT NULL,
    subject character varying,
    content text,
    section_id integer,
    status_id integer,
    author_id integer,
    featured boolean DEFAULT false,
    locked boolean DEFAULT false,
    cached_weighted_score integer DEFAULT 0,
    comments_count integer DEFAULT 0,
    answers_count integer DEFAULT 0,
    views integer DEFAULT 0,
    total_views integer DEFAULT 0,
    created_on timestamp without time zone,
    updated_on timestamp without time zone
);


ALTER TABLE public.questions OWNER TO redmine;

--
-- TOC entry 407 (class 1259 OID 18484)
-- Name: questions_answers; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.questions_answers (
    id integer NOT NULL,
    content text,
    author_id integer,
    question_id integer,
    accepted boolean DEFAULT false,
    cached_weighted_score integer DEFAULT 0,
    comments_count integer DEFAULT 0,
    created_on timestamp without time zone,
    updated_on timestamp without time zone
);


ALTER TABLE public.questions_answers OWNER TO redmine;

--
-- TOC entry 406 (class 1259 OID 18482)
-- Name: questions_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.questions_answers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_answers_id_seq OWNER TO redmine;

--
-- TOC entry 4655 (class 0 OID 0)
-- Dependencies: 406
-- Name: questions_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.questions_answers_id_seq OWNED BY public.questions_answers.id;


--
-- TOC entry 402 (class 1259 OID 18448)
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_id_seq OWNER TO redmine;

--
-- TOC entry 4656 (class 0 OID 0)
-- Dependencies: 402
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;


--
-- TOC entry 405 (class 1259 OID 18471)
-- Name: questions_sections; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.questions_sections (
    id integer NOT NULL,
    name character varying,
    description text,
    project_id integer,
    section_type character varying,
    "position" integer
);


ALTER TABLE public.questions_sections OWNER TO redmine;

--
-- TOC entry 404 (class 1259 OID 18469)
-- Name: questions_sections_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.questions_sections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_sections_id_seq OWNER TO redmine;

--
-- TOC entry 4657 (class 0 OID 0)
-- Dependencies: 404
-- Name: questions_sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.questions_sections_id_seq OWNED BY public.questions_sections.id;


--
-- TOC entry 409 (class 1259 OID 18501)
-- Name: questions_statuses; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.questions_statuses (
    id integer NOT NULL,
    name character varying,
    is_closed boolean DEFAULT false,
    color character varying,
    "position" integer
);


ALTER TABLE public.questions_statuses OWNER TO redmine;

--
-- TOC entry 408 (class 1259 OID 18499)
-- Name: questions_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.questions_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_statuses_id_seq OWNER TO redmine;

--
-- TOC entry 4658 (class 0 OID 0)
-- Dependencies: 408
-- Name: questions_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.questions_statuses_id_seq OWNED BY public.questions_statuses.id;


--
-- TOC entry 347 (class 1259 OID 17962)
-- Name: recently_vieweds; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.recently_vieweds (
    id integer NOT NULL,
    viewer_id integer,
    viewed_id integer,
    viewed_type character varying,
    views_count integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.recently_vieweds OWNER TO redmine;

--
-- TOC entry 346 (class 1259 OID 17960)
-- Name: recently_vieweds_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.recently_vieweds_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recently_vieweds_id_seq OWNER TO redmine;

--
-- TOC entry 4659 (class 0 OID 0)
-- Dependencies: 346
-- Name: recently_vieweds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.recently_vieweds_id_seq OWNED BY public.recently_vieweds.id;


--
-- TOC entry 246 (class 1259 OID 16787)
-- Name: repositories; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.repositories (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    url character varying DEFAULT ''::character varying NOT NULL,
    login character varying(60) DEFAULT ''::character varying,
    password character varying DEFAULT ''::character varying,
    root_url character varying(255) DEFAULT ''::character varying,
    type character varying,
    path_encoding character varying(64),
    log_encoding character varying(64),
    extra_info text,
    identifier character varying,
    is_default boolean DEFAULT false,
    created_on timestamp without time zone
);


ALTER TABLE public.repositories OWNER TO redmine;

--
-- TOC entry 245 (class 1259 OID 16785)
-- Name: repositories_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.repositories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repositories_id_seq OWNER TO redmine;

--
-- TOC entry 4660 (class 0 OID 0)
-- Dependencies: 245
-- Name: repositories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.repositories_id_seq OWNED BY public.repositories.id;


--
-- TOC entry 224 (class 1259 OID 16617)
-- Name: roles; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    "position" integer,
    assignable boolean DEFAULT true,
    builtin integer DEFAULT 0 NOT NULL,
    permissions text,
    issues_visibility character varying(30) DEFAULT 'default'::character varying NOT NULL,
    users_visibility character varying(30) DEFAULT 'all'::character varying NOT NULL,
    time_entries_visibility character varying(30) DEFAULT 'all'::character varying NOT NULL,
    all_roles_managed boolean DEFAULT true NOT NULL,
    settings text
);


ALTER TABLE public.roles OWNER TO redmine;

--
-- TOC entry 223 (class 1259 OID 16615)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO redmine;

--
-- TOC entry 4661 (class 0 OID 0)
-- Dependencies: 223
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 289 (class 1259 OID 17506)
-- Name: roles_managed_roles; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.roles_managed_roles (
    role_id integer NOT NULL,
    managed_role_id integer NOT NULL
);


ALTER TABLE public.roles_managed_roles OWNER TO redmine;

--
-- TOC entry 196 (class 1259 OID 16386)
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO redmine;

--
-- TOC entry 303 (class 1259 OID 17639)
-- Name: sessions; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    session_id character varying,
    data text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.sessions OWNER TO redmine;

--
-- TOC entry 302 (class 1259 OID 17637)
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO redmine;

--
-- TOC entry 4662 (class 0 OID 0)
-- Dependencies: 302
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- TOC entry 248 (class 1259 OID 16800)
-- Name: settings; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.settings (
    id integer NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    value text,
    updated_on timestamp without time zone
);


ALTER TABLE public.settings OWNER TO redmine;

--
-- TOC entry 247 (class 1259 OID 16798)
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.settings_id_seq OWNER TO redmine;

--
-- TOC entry 4663 (class 0 OID 0)
-- Dependencies: 247
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- TOC entry 345 (class 1259 OID 17949)
-- Name: taggings; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.taggings (
    id integer NOT NULL,
    tag_id integer,
    taggable_id integer,
    taggable_type character varying,
    created_at timestamp without time zone
);


ALTER TABLE public.taggings OWNER TO redmine;

--
-- TOC entry 344 (class 1259 OID 17947)
-- Name: taggings_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.taggings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggings_id_seq OWNER TO redmine;

--
-- TOC entry 4664 (class 0 OID 0)
-- Dependencies: 344
-- Name: taggings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.taggings_id_seq OWNED BY public.taggings.id;


--
-- TOC entry 343 (class 1259 OID 17938)
-- Name: tags; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.tags OWNER TO redmine;

--
-- TOC entry 342 (class 1259 OID 17936)
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO redmine;

--
-- TOC entry 4665 (class 0 OID 0)
-- Dependencies: 342
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- TOC entry 258 (class 1259 OID 16902)
-- Name: time_entries; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.time_entries (
    id integer NOT NULL,
    project_id integer NOT NULL,
    user_id integer NOT NULL,
    issue_id integer,
    hours double precision NOT NULL,
    comments character varying(1024),
    activity_id integer NOT NULL,
    spent_on date NOT NULL,
    tyear integer NOT NULL,
    tmonth integer NOT NULL,
    tweek integer NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL
);


ALTER TABLE public.time_entries OWNER TO redmine;

--
-- TOC entry 257 (class 1259 OID 16900)
-- Name: time_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.time_entries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.time_entries_id_seq OWNER TO redmine;

--
-- TOC entry 4666 (class 0 OID 0)
-- Dependencies: 257
-- Name: time_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.time_entries_id_seq OWNED BY public.time_entries.id;


--
-- TOC entry 226 (class 1259 OID 16626)
-- Name: tokens; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.tokens (
    id integer NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    action character varying(30) DEFAULT ''::character varying NOT NULL,
    value character varying(40) DEFAULT ''::character varying NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone
);


ALTER TABLE public.tokens OWNER TO redmine;

--
-- TOC entry 225 (class 1259 OID 16624)
-- Name: tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tokens_id_seq OWNER TO redmine;

--
-- TOC entry 4667 (class 0 OID 0)
-- Dependencies: 225
-- Name: tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;


--
-- TOC entry 228 (class 1259 OID 16637)
-- Name: trackers; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.trackers (
    id integer NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    is_in_chlog boolean DEFAULT false NOT NULL,
    "position" integer,
    is_in_roadmap boolean DEFAULT true NOT NULL,
    fields_bits integer DEFAULT 0,
    default_status_id integer
);


ALTER TABLE public.trackers OWNER TO redmine;

--
-- TOC entry 227 (class 1259 OID 16635)
-- Name: trackers_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.trackers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trackers_id_seq OWNER TO redmine;

--
-- TOC entry 4668 (class 0 OID 0)
-- Dependencies: 227
-- Name: trackers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.trackers_id_seq OWNED BY public.trackers.id;


--
-- TOC entry 413 (class 1259 OID 18535)
-- Name: uc_browser_restrictions; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.uc_browser_restrictions (
    id integer NOT NULL,
    name character varying,
    condition character varying,
    version character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.uc_browser_restrictions OWNER TO redmine;

--
-- TOC entry 412 (class 1259 OID 18533)
-- Name: uc_browser_restrictions_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.uc_browser_restrictions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.uc_browser_restrictions_id_seq OWNER TO redmine;

--
-- TOC entry 4669 (class 0 OID 0)
-- Dependencies: 412
-- Name: uc_browser_restrictions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.uc_browser_restrictions_id_seq OWNED BY public.uc_browser_restrictions.id;


--
-- TOC entry 411 (class 1259 OID 18515)
-- Name: uc_periods; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.uc_periods (
    id integer NOT NULL,
    begin_date timestamp without time zone,
    end_date timestamp without time zone,
    custom_message text,
    turned_on boolean DEFAULT false,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_id integer NOT NULL,
    notify boolean DEFAULT false
);


ALTER TABLE public.uc_periods OWNER TO redmine;

--
-- TOC entry 410 (class 1259 OID 18513)
-- Name: uc_periods_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.uc_periods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.uc_periods_id_seq OWNER TO redmine;

--
-- TOC entry 4670 (class 0 OID 0)
-- Dependencies: 410
-- Name: uc_periods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.uc_periods_id_seq OWNED BY public.uc_periods.id;


--
-- TOC entry 415 (class 1259 OID 18546)
-- Name: uc_restrictions; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.uc_restrictions (
    id integer NOT NULL,
    uc_period_id integer,
    controller character varying DEFAULT ''::character varying,
    action character varying DEFAULT ''::character varying,
    timestamps character varying DEFAULT 'f'::character varying
);


ALTER TABLE public.uc_restrictions OWNER TO redmine;

--
-- TOC entry 414 (class 1259 OID 18544)
-- Name: uc_restrictions_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.uc_restrictions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.uc_restrictions_id_seq OWNER TO redmine;

--
-- TOC entry 4671 (class 0 OID 0)
-- Dependencies: 414
-- Name: uc_restrictions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.uc_restrictions_id_seq OWNED BY public.uc_restrictions.id;


--
-- TOC entry 240 (class 1259 OID 16730)
-- Name: user_preferences; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.user_preferences (
    id integer NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    others text,
    hide_mail boolean DEFAULT true,
    time_zone character varying,
    favourite_project_id integer,
    usability text
);


ALTER TABLE public.user_preferences OWNER TO redmine;

--
-- TOC entry 239 (class 1259 OID 16728)
-- Name: user_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.user_preferences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_preferences_id_seq OWNER TO redmine;

--
-- TOC entry 4672 (class 0 OID 0)
-- Dependencies: 239
-- Name: user_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.user_preferences_id_seq OWNED BY public.user_preferences.id;


--
-- TOC entry 230 (class 1259 OID 16647)
-- Name: users; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.users (
    id integer NOT NULL,
    login character varying DEFAULT ''::character varying NOT NULL,
    hashed_password character varying(40) DEFAULT ''::character varying NOT NULL,
    firstname character varying(30) DEFAULT ''::character varying NOT NULL,
    lastname character varying(255) DEFAULT ''::character varying NOT NULL,
    admin boolean DEFAULT false NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    last_login_on timestamp without time zone,
    language character varying(5) DEFAULT ''::character varying,
    auth_source_id integer,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    type character varying,
    identity_url character varying,
    mail_notification character varying DEFAULT ''::character varying NOT NULL,
    salt character varying(64),
    must_change_passwd boolean DEFAULT false NOT NULL,
    passwd_changed_on timestamp without time zone
);


ALTER TABLE public.users OWNER TO redmine;

--
-- TOC entry 229 (class 1259 OID 16645)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO redmine;

--
-- TOC entry 4673 (class 0 OID 0)
-- Dependencies: 229
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 232 (class 1259 OID 16664)
-- Name: versions; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.versions (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    description character varying DEFAULT ''::character varying,
    effective_date date,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    wiki_page_title character varying,
    status character varying DEFAULT 'open'::character varying,
    sharing character varying DEFAULT 'none'::character varying NOT NULL
);


ALTER TABLE public.versions OWNER TO redmine;

--
-- TOC entry 231 (class 1259 OID 16662)
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.versions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.versions_id_seq OWNER TO redmine;

--
-- TOC entry 4674 (class 0 OID 0)
-- Dependencies: 231
-- Name: versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.versions_id_seq OWNED BY public.versions.id;


--
-- TOC entry 401 (class 1259 OID 18437)
-- Name: viewings; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.viewings (
    id integer NOT NULL,
    viewer_id integer,
    viewed_id integer,
    viewed_type character varying,
    ip character varying(24),
    created_at timestamp without time zone
);


ALTER TABLE public.viewings OWNER TO redmine;

--
-- TOC entry 400 (class 1259 OID 18435)
-- Name: viewings_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.viewings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.viewings_id_seq OWNER TO redmine;

--
-- TOC entry 4675 (class 0 OID 0)
-- Dependencies: 400
-- Name: viewings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.viewings_id_seq OWNED BY public.viewings.id;


--
-- TOC entry 399 (class 1259 OID 18422)
-- Name: votes; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.votes (
    id integer NOT NULL,
    votable_id integer,
    votable_type character varying,
    voter_id integer,
    voter_type character varying,
    vote_flag boolean,
    vote_scope character varying,
    vote_weight integer,
    vote_ip character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.votes OWNER TO redmine;

--
-- TOC entry 398 (class 1259 OID 18420)
-- Name: votes_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.votes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.votes_id_seq OWNER TO redmine;

--
-- TOC entry 4676 (class 0 OID 0)
-- Dependencies: 398
-- Name: votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.votes_id_seq OWNED BY public.votes.id;


--
-- TOC entry 264 (class 1259 OID 16946)
-- Name: watchers; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.watchers (
    id integer NOT NULL,
    watchable_type character varying DEFAULT ''::character varying NOT NULL,
    watchable_id integer DEFAULT 0 NOT NULL,
    user_id integer
);


ALTER TABLE public.watchers OWNER TO redmine;

--
-- TOC entry 263 (class 1259 OID 16944)
-- Name: watchers_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.watchers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.watchers_id_seq OWNER TO redmine;

--
-- TOC entry 4677 (class 0 OID 0)
-- Dependencies: 263
-- Name: watchers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.watchers_id_seq OWNED BY public.watchers.id;


--
-- TOC entry 256 (class 1259 OID 16880)
-- Name: wiki_content_versions; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.wiki_content_versions (
    id integer NOT NULL,
    wiki_content_id integer NOT NULL,
    page_id integer NOT NULL,
    author_id integer,
    data bytea,
    compression character varying(6) DEFAULT ''::character varying,
    comments character varying(1024) DEFAULT ''::character varying,
    updated_on timestamp without time zone NOT NULL,
    version integer NOT NULL
);


ALTER TABLE public.wiki_content_versions OWNER TO redmine;

--
-- TOC entry 255 (class 1259 OID 16878)
-- Name: wiki_content_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.wiki_content_versions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wiki_content_versions_id_seq OWNER TO redmine;

--
-- TOC entry 4678 (class 0 OID 0)
-- Dependencies: 255
-- Name: wiki_content_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.wiki_content_versions_id_seq OWNED BY public.wiki_content_versions.id;


--
-- TOC entry 254 (class 1259 OID 16867)
-- Name: wiki_contents; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.wiki_contents (
    id integer NOT NULL,
    page_id integer NOT NULL,
    author_id integer,
    text text,
    comments character varying(1024) DEFAULT ''::character varying,
    updated_on timestamp without time zone NOT NULL,
    version integer NOT NULL
);


ALTER TABLE public.wiki_contents OWNER TO redmine;

--
-- TOC entry 253 (class 1259 OID 16865)
-- Name: wiki_contents_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.wiki_contents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wiki_contents_id_seq OWNER TO redmine;

--
-- TOC entry 4679 (class 0 OID 0)
-- Dependencies: 253
-- Name: wiki_contents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.wiki_contents_id_seq OWNED BY public.wiki_contents.id;


--
-- TOC entry 252 (class 1259 OID 16858)
-- Name: wiki_pages; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.wiki_pages (
    id integer NOT NULL,
    wiki_id integer NOT NULL,
    title character varying(255) NOT NULL,
    created_on timestamp without time zone NOT NULL,
    protected boolean DEFAULT false NOT NULL,
    parent_id integer
);


ALTER TABLE public.wiki_pages OWNER TO redmine;

--
-- TOC entry 251 (class 1259 OID 16856)
-- Name: wiki_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.wiki_pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wiki_pages_id_seq OWNER TO redmine;

--
-- TOC entry 4680 (class 0 OID 0)
-- Dependencies: 251
-- Name: wiki_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.wiki_pages_id_seq OWNED BY public.wiki_pages.id;


--
-- TOC entry 273 (class 1259 OID 17030)
-- Name: wiki_redirects; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.wiki_redirects (
    id integer NOT NULL,
    wiki_id integer NOT NULL,
    title character varying,
    redirects_to character varying,
    created_on timestamp without time zone NOT NULL,
    redirects_to_wiki_id integer NOT NULL
);


ALTER TABLE public.wiki_redirects OWNER TO redmine;

--
-- TOC entry 272 (class 1259 OID 17028)
-- Name: wiki_redirects_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.wiki_redirects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wiki_redirects_id_seq OWNER TO redmine;

--
-- TOC entry 4681 (class 0 OID 0)
-- Dependencies: 272
-- Name: wiki_redirects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.wiki_redirects_id_seq OWNED BY public.wiki_redirects.id;


--
-- TOC entry 250 (class 1259 OID 16848)
-- Name: wikis; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.wikis (
    id integer NOT NULL,
    project_id integer NOT NULL,
    start_page character varying(255) NOT NULL,
    status integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.wikis OWNER TO redmine;

--
-- TOC entry 249 (class 1259 OID 16846)
-- Name: wikis_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.wikis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wikis_id_seq OWNER TO redmine;

--
-- TOC entry 4682 (class 0 OID 0)
-- Dependencies: 249
-- Name: wikis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.wikis_id_seq OWNED BY public.wikis.id;


--
-- TOC entry 234 (class 1259 OID 16679)
-- Name: workflows; Type: TABLE; Schema: public; Owner: redmine
--

CREATE TABLE public.workflows (
    id integer NOT NULL,
    tracker_id integer DEFAULT 0 NOT NULL,
    old_status_id integer DEFAULT 0 NOT NULL,
    new_status_id integer DEFAULT 0 NOT NULL,
    role_id integer DEFAULT 0 NOT NULL,
    assignee boolean DEFAULT false NOT NULL,
    author boolean DEFAULT false NOT NULL,
    type character varying(30),
    field_name character varying(30),
    rule character varying(30)
);


ALTER TABLE public.workflows OWNER TO redmine;

--
-- TOC entry 233 (class 1259 OID 16677)
-- Name: workflows_id_seq; Type: SEQUENCE; Schema: public; Owner: redmine
--

CREATE SEQUENCE public.workflows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflows_id_seq OWNER TO redmine;

--
-- TOC entry 4683 (class 0 OID 0)
-- Dependencies: 233
-- Name: workflows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: redmine
--

ALTER SEQUENCE public.workflows_id_seq OWNED BY public.workflows.id;


--
-- TOC entry 3738 (class 2604 OID 18203)
-- Name: accounts id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);


--
-- TOC entry 3677 (class 2604 OID 17653)
-- Name: acl_ajax_counters id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.acl_ajax_counters ALTER COLUMN id SET DEFAULT nextval('public.acl_ajax_counters_id_seq'::regclass);


--
-- TOC entry 3719 (class 2604 OID 18042)
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


--
-- TOC entry 3684 (class 2604 OID 17762)
-- Name: agile_colors id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.agile_colors ALTER COLUMN id SET DEFAULT nextval('public.agile_colors_id_seq'::regclass);


--
-- TOC entry 3683 (class 2604 OID 17752)
-- Name: agile_data id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.agile_data ALTER COLUMN id SET DEFAULT nextval('public.agile_data_id_seq'::regclass);


--
-- TOC entry 3674 (class 2604 OID 17629)
-- Name: api_log_for_plugins id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.api_log_for_plugins ALTER COLUMN id SET DEFAULT nextval('public.api_log_for_plugins_id_seq'::regclass);


--
-- TOC entry 3488 (class 2604 OID 16398)
-- Name: attachments id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.attachments ALTER COLUMN id SET DEFAULT nextval('public.attachments_id_seq'::regclass);


--
-- TOC entry 3496 (class 2604 OID 16418)
-- Name: auth_sources id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.auth_sources ALTER COLUMN id SET DEFAULT nextval('public.auth_sources_id_seq'::regclass);


--
-- TOC entry 3647 (class 2604 OID 16980)
-- Name: boards id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.boards ALTER COLUMN id SET DEFAULT nextval('public.boards_id_seq'::regclass);


--
-- TOC entry 3640 (class 2604 OID 16927)
-- Name: changes id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.changes ALTER COLUMN id SET DEFAULT nextval('public.changes_id_seq'::regclass);


--
-- TOC entry 3639 (class 2604 OID 16915)
-- Name: changesets id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.changesets ALTER COLUMN id SET DEFAULT nextval('public.changesets_id_seq'::regclass);


--
-- TOC entry 3688 (class 2604 OID 17792)
-- Name: checklist_template_categories id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.checklist_template_categories ALTER COLUMN id SET DEFAULT nextval('public.checklist_template_categories_id_seq'::regclass);


--
-- TOC entry 3690 (class 2604 OID 17804)
-- Name: checklist_templates id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.checklist_templates ALTER COLUMN id SET DEFAULT nextval('public.checklist_templates_id_seq'::regclass);


--
-- TOC entry 3685 (class 2604 OID 17779)
-- Name: checklists id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.checklists ALTER COLUMN id SET DEFAULT nextval('public.checklists_id_seq'::regclass);


--
-- TOC entry 3610 (class 2604 OID 16753)
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- TOC entry 3693 (class 2604 OID 17831)
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);


--
-- TOC entry 3717 (class 2604 OID 17992)
-- Name: contacts_queries id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.contacts_queries ALTER COLUMN id SET DEFAULT nextval('public.contacts_queries_id_seq'::regclass);


--
-- TOC entry 3714 (class 2604 OID 17978)
-- Name: contacts_settings id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.contacts_settings ALTER COLUMN id SET DEFAULT nextval('public.contacts_settings_id_seq'::regclass);


--
-- TOC entry 3669 (class 2604 OID 17561)
-- Name: custom_field_enumerations id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.custom_field_enumerations ALTER COLUMN id SET DEFAULT nextval('public.custom_field_enumerations_id_seq'::regclass);


--
-- TOC entry 3502 (class 2604 OID 16432)
-- Name: custom_fields id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.custom_fields ALTER COLUMN id SET DEFAULT nextval('public.custom_fields_id_seq'::regclass);


--
-- TOC entry 3519 (class 2604 OID 16461)
-- Name: custom_values id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.custom_values ALTER COLUMN id SET DEFAULT nextval('public.custom_values_id_seq'::regclass);


--
-- TOC entry 3702 (class 2604 OID 17885)
-- Name: deal_categories id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.deal_categories ALTER COLUMN id SET DEFAULT nextval('public.deal_categories_id_seq'::regclass);


--
-- TOC entry 3703 (class 2604 OID 17897)
-- Name: deal_processes id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.deal_processes ALTER COLUMN id SET DEFAULT nextval('public.deal_processes_id_seq'::regclass);


--
-- TOC entry 3705 (class 2604 OID 17907)
-- Name: deal_statuses id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.deal_statuses ALTER COLUMN id SET DEFAULT nextval('public.deal_statuses_id_seq'::regclass);


--
-- TOC entry 3700 (class 2604 OID 17869)
-- Name: deals id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.deals ALTER COLUMN id SET DEFAULT nextval('public.deals_id_seq'::regclass);


--
-- TOC entry 3720 (class 2604 OID 18055)
-- Name: deals_issues id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.deals_issues ALTER COLUMN id SET DEFAULT nextval('public.deals_issues_id_seq'::regclass);


--
-- TOC entry 3744 (class 2604 OID 18266)
-- Name: departments id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.departments ALTER COLUMN id SET DEFAULT nextval('public.departments_id_seq'::regclass);


--
-- TOC entry 3523 (class 2604 OID 16475)
-- Name: documents id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.documents ALTER COLUMN id SET DEFAULT nextval('public.documents_id_seq'::regclass);


--
-- TOC entry 3673 (class 2604 OID 17606)
-- Name: easy_entity_assignments id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.easy_entity_assignments ALTER COLUMN id SET DEFAULT nextval('public.easy_entity_assignments_id_seq'::regclass);


--
-- TOC entry 3678 (class 2604 OID 17664)
-- Name: easy_instant_messages id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.easy_instant_messages ALTER COLUMN id SET DEFAULT nextval('public.easy_instant_messages_id_seq'::regclass);


--
-- TOC entry 3672 (class 2604 OID 17588)
-- Name: easy_settings id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.easy_settings ALTER COLUMN id SET DEFAULT nextval('public.easy_settings_id_seq'::regclass);


--
-- TOC entry 3663 (class 2604 OID 17479)
-- Name: email_addresses id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.email_addresses ALTER COLUMN id SET DEFAULT nextval('public.email_addresses_id_seq'::regclass);


--
-- TOC entry 3657 (class 2604 OID 17045)
-- Name: enabled_modules id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.enabled_modules ALTER COLUMN id SET DEFAULT nextval('public.enabled_modules_id_seq'::regclass);


--
-- TOC entry 3527 (class 2604 OID 16490)
-- Name: enumerations id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.enumerations ALTER COLUMN id SET DEFAULT nextval('public.enumerations_id_seq'::regclass);


--
-- TOC entry 3681 (class 2604 OID 17699)
-- Name: eq_pinned_queries id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.eq_pinned_queries ALTER COLUMN id SET DEFAULT nextval('public.eq_pinned_queries_id_seq'::regclass);


--
-- TOC entry 3729 (class 2604 OID 18085)
-- Name: expenses id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.expenses ALTER COLUMN id SET DEFAULT nextval('public.expenses_id_seq'::regclass);


--
-- TOC entry 3737 (class 2604 OID 18194)
-- Name: favorite_projects id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.favorite_projects ALTER COLUMN id SET DEFAULT nextval('public.favorite_projects_id_seq'::regclass);


--
-- TOC entry 3682 (class 2604 OID 17741)
-- Name: global_roles id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.global_roles ALTER COLUMN id SET DEFAULT nextval('public.global_roles_id_seq'::regclass);


--
-- TOC entry 3668 (class 2604 OID 17527)
-- Name: import_items id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.import_items ALTER COLUMN id SET DEFAULT nextval('public.import_items_id_seq'::regclass);


--
-- TOC entry 3666 (class 2604 OID 17515)
-- Name: imports id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.imports ALTER COLUMN id SET DEFAULT nextval('public.imports_id_seq'::regclass);


--
-- TOC entry 3732 (class 2604 OID 18101)
-- Name: invoice_lines id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.invoice_lines ALTER COLUMN id SET DEFAULT nextval('public.invoice_lines_id_seq'::regclass);


--
-- TOC entry 3735 (class 2604 OID 18129)
-- Name: invoice_payments id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.invoice_payments ALTER COLUMN id SET DEFAULT nextval('public.invoice_payments_id_seq'::regclass);


--
-- TOC entry 3736 (class 2604 OID 18168)
-- Name: invoice_templates id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.invoice_templates ALTER COLUMN id SET DEFAULT nextval('public.invoice_templates_id_seq'::regclass);


--
-- TOC entry 3723 (class 2604 OID 18067)
-- Name: invoices id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.invoices ALTER COLUMN id SET DEFAULT nextval('public.invoices_id_seq'::regclass);


--
-- TOC entry 3532 (class 2604 OID 16500)
-- Name: issue_categories id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.issue_categories ALTER COLUMN id SET DEFAULT nextval('public.issue_categories_id_seq'::regclass);


--
-- TOC entry 3788 (class 2604 OID 18570)
-- Name: issue_reads id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.issue_reads ALTER COLUMN id SET DEFAULT nextval('public.issue_reads_id_seq'::regclass);


--
-- TOC entry 3645 (class 2604 OID 16966)
-- Name: issue_relations id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.issue_relations ALTER COLUMN id SET DEFAULT nextval('public.issue_relations_id_seq'::regclass);


--
-- TOC entry 3534 (class 2604 OID 16526)
-- Name: issue_statuses id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.issue_statuses ALTER COLUMN id SET DEFAULT nextval('public.issue_statuses_id_seq'::regclass);


--
-- TOC entry 3537 (class 2604 OID 16538)
-- Name: issues id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.issues ALTER COLUMN id SET DEFAULT nextval('public.issues_id_seq'::regclass);


--
-- TOC entry 3603 (class 2604 OID 16717)
-- Name: journal_details id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.journal_details ALTER COLUMN id SET DEFAULT nextval('public.journal_details_id_seq'::regclass);


--
-- TOC entry 3598 (class 2604 OID 16703)
-- Name: journals id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.journals ALTER COLUMN id SET DEFAULT nextval('public.journals_id_seq'::regclass);


--
-- TOC entry 3662 (class 2604 OID 17209)
-- Name: member_roles id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.member_roles ALTER COLUMN id SET DEFAULT nextval('public.member_roles_id_seq'::regclass);


--
-- TOC entry 3542 (class 2604 OID 16557)
-- Name: members id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.members ALTER COLUMN id SET DEFAULT nextval('public.members_id_seq'::regclass);


--
-- TOC entry 3653 (class 2604 OID 16996)
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- TOC entry 3546 (class 2604 OID 16568)
-- Name: news id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);


--
-- TOC entry 3710 (class 2604 OID 17928)
-- Name: notes id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.notes ALTER COLUMN id SET DEFAULT nextval('public.notes_id_seq'::regclass);


--
-- TOC entry 3660 (class 2604 OID 17171)
-- Name: open_id_authentication_associations id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.open_id_authentication_associations ALTER COLUMN id SET DEFAULT nextval('public.open_id_authentication_associations_id_seq'::regclass);


--
-- TOC entry 3661 (class 2604 OID 17182)
-- Name: open_id_authentication_nonces id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.open_id_authentication_nonces ALTER COLUMN id SET DEFAULT nextval('public.open_id_authentication_nonces_id_seq'::regclass);


--
-- TOC entry 3742 (class 2604 OID 18225)
-- Name: operation_categories id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.operation_categories ALTER COLUMN id SET DEFAULT nextval('public.operation_categories_id_seq'::regclass);


--
-- TOC entry 3743 (class 2604 OID 18236)
-- Name: operation_objects id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.operation_objects ALTER COLUMN id SET DEFAULT nextval('public.operation_objects_id_seq'::regclass);


--
-- TOC entry 3739 (class 2604 OID 18214)
-- Name: operations id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.operations ALTER COLUMN id SET DEFAULT nextval('public.operations_id_seq'::regclass);


--
-- TOC entry 3758 (class 2604 OID 18383)
-- Name: order_statuses id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.order_statuses ALTER COLUMN id SET DEFAULT nextval('public.order_statuses_id_seq'::regclass);


--
-- TOC entry 3756 (class 2604 OID 18365)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3747 (class 2604 OID 18298)
-- Name: people_announcements id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.people_announcements ALTER COLUMN id SET DEFAULT nextval('public.people_announcements_id_seq'::regclass);


--
-- TOC entry 3750 (class 2604 OID 18322)
-- Name: people_holidays id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.people_holidays ALTER COLUMN id SET DEFAULT nextval('public.people_holidays_id_seq'::regclass);


--
-- TOC entry 3745 (class 2604 OID 18279)
-- Name: people_information user_id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.people_information ALTER COLUMN user_id SET DEFAULT nextval('public.people_information_user_id_seq'::regclass);


--
-- TOC entry 3749 (class 2604 OID 18310)
-- Name: people_work_experiences id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.people_work_experiences ALTER COLUMN id SET DEFAULT nextval('public.people_work_experiences_id_seq'::regclass);


--
-- TOC entry 3762 (class 2604 OID 18411)
-- Name: product_categories id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.product_categories ALTER COLUMN id SET DEFAULT nextval('public.product_categories_id_seq'::regclass);


--
-- TOC entry 3753 (class 2604 OID 18349)
-- Name: product_lines id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.product_lines ALTER COLUMN id SET DEFAULT nextval('public.product_lines_id_seq'::regclass);


--
-- TOC entry 3751 (class 2604 OID 18333)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 3761 (class 2604 OID 18399)
-- Name: products_bundles id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.products_bundles ALTER COLUMN id SET DEFAULT nextval('public.products_bundles_id_seq'::regclass);


--
-- TOC entry 3552 (class 2604 OID 16604)
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- TOC entry 3616 (class 2604 OID 16776)
-- Name: queries id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.queries ALTER COLUMN id SET DEFAULT nextval('public.queries_id_seq'::regclass);


--
-- TOC entry 3680 (class 2604 OID 17688)
-- Name: query_categories id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.query_categories ALTER COLUMN id SET DEFAULT nextval('public.query_categories_id_seq'::regclass);


--
-- TOC entry 3765 (class 2604 OID 18453)
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);


--
-- TOC entry 3774 (class 2604 OID 18487)
-- Name: questions_answers id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.questions_answers ALTER COLUMN id SET DEFAULT nextval('public.questions_answers_id_seq'::regclass);


--
-- TOC entry 3773 (class 2604 OID 18474)
-- Name: questions_sections id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.questions_sections ALTER COLUMN id SET DEFAULT nextval('public.questions_sections_id_seq'::regclass);


--
-- TOC entry 3778 (class 2604 OID 18504)
-- Name: questions_statuses id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.questions_statuses ALTER COLUMN id SET DEFAULT nextval('public.questions_statuses_id_seq'::regclass);


--
-- TOC entry 3713 (class 2604 OID 17965)
-- Name: recently_vieweds id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.recently_vieweds ALTER COLUMN id SET DEFAULT nextval('public.recently_vieweds_id_seq'::regclass);


--
-- TOC entry 3621 (class 2604 OID 16790)
-- Name: repositories id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.repositories ALTER COLUMN id SET DEFAULT nextval('public.repositories_id_seq'::regclass);


--
-- TOC entry 3558 (class 2604 OID 16620)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 3676 (class 2604 OID 17642)
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- TOC entry 3628 (class 2604 OID 16803)
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- TOC entry 3712 (class 2604 OID 17952)
-- Name: taggings id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.taggings ALTER COLUMN id SET DEFAULT nextval('public.taggings_id_seq'::regclass);


--
-- TOC entry 3711 (class 2604 OID 17941)
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- TOC entry 3638 (class 2604 OID 16905)
-- Name: time_entries id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.time_entries ALTER COLUMN id SET DEFAULT nextval('public.time_entries_id_seq'::regclass);


--
-- TOC entry 3566 (class 2604 OID 16629)
-- Name: tokens id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);


--
-- TOC entry 3570 (class 2604 OID 16640)
-- Name: trackers id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.trackers ALTER COLUMN id SET DEFAULT nextval('public.trackers_id_seq'::regclass);


--
-- TOC entry 3783 (class 2604 OID 18538)
-- Name: uc_browser_restrictions id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.uc_browser_restrictions ALTER COLUMN id SET DEFAULT nextval('public.uc_browser_restrictions_id_seq'::regclass);


--
-- TOC entry 3780 (class 2604 OID 18518)
-- Name: uc_periods id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.uc_periods ALTER COLUMN id SET DEFAULT nextval('public.uc_periods_id_seq'::regclass);


--
-- TOC entry 3784 (class 2604 OID 18549)
-- Name: uc_restrictions id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.uc_restrictions ALTER COLUMN id SET DEFAULT nextval('public.uc_restrictions_id_seq'::regclass);


--
-- TOC entry 3607 (class 2604 OID 16733)
-- Name: user_preferences id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.user_preferences ALTER COLUMN id SET DEFAULT nextval('public.user_preferences_id_seq'::regclass);


--
-- TOC entry 3575 (class 2604 OID 16650)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3586 (class 2604 OID 16667)
-- Name: versions id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.versions ALTER COLUMN id SET DEFAULT nextval('public.versions_id_seq'::regclass);


--
-- TOC entry 3764 (class 2604 OID 18440)
-- Name: viewings id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.viewings ALTER COLUMN id SET DEFAULT nextval('public.viewings_id_seq'::regclass);


--
-- TOC entry 3763 (class 2604 OID 18425)
-- Name: votes id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.votes ALTER COLUMN id SET DEFAULT nextval('public.votes_id_seq'::regclass);


--
-- TOC entry 3642 (class 2604 OID 16949)
-- Name: watchers id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.watchers ALTER COLUMN id SET DEFAULT nextval('public.watchers_id_seq'::regclass);


--
-- TOC entry 3635 (class 2604 OID 16883)
-- Name: wiki_content_versions id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.wiki_content_versions ALTER COLUMN id SET DEFAULT nextval('public.wiki_content_versions_id_seq'::regclass);


--
-- TOC entry 3633 (class 2604 OID 16870)
-- Name: wiki_contents id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.wiki_contents ALTER COLUMN id SET DEFAULT nextval('public.wiki_contents_id_seq'::regclass);


--
-- TOC entry 3632 (class 2604 OID 16861)
-- Name: wiki_pages id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.wiki_pages ALTER COLUMN id SET DEFAULT nextval('public.wiki_pages_id_seq'::regclass);


--
-- TOC entry 3656 (class 2604 OID 17033)
-- Name: wiki_redirects id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.wiki_redirects ALTER COLUMN id SET DEFAULT nextval('public.wiki_redirects_id_seq'::regclass);


--
-- TOC entry 3629 (class 2604 OID 16851)
-- Name: wikis id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.wikis ALTER COLUMN id SET DEFAULT nextval('public.wikis_id_seq'::regclass);


--
-- TOC entry 3591 (class 2604 OID 16682)
-- Name: workflows id; Type: DEFAULT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.workflows ALTER COLUMN id SET DEFAULT nextval('public.workflows_id_seq'::regclass);


--
-- TOC entry 4524 (class 0 OID 18200)
-- Dependencies: 369
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.accounts (id, name, description, amount, currency, project_id, assigned_to_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4460 (class 0 OID 17650)
-- Dependencies: 305
-- Data for Name: acl_ajax_counters; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.acl_ajax_counters (id, token, options) FROM stdin;
1	17e931ec4650adbf9dd1e740717854fc	---\n:action_name: ui_assigned_issues_count\n:period: 0\n:params: \n
2	8afabb878df82ab70b90895578e6c8e8	---\n:action_name: ui_unread_issues_count\n:period: 0\n:params: \n
3	3086ee8126035e5e23490275a08f0258	---\n:action_name: ui_updated_issues_count\n:period: 0\n:params: \n
\.


--
-- TOC entry 4508 (class 0 OID 18039)
-- Dependencies: 353
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.addresses (id, street1, street2, city, region, postcode, country_code, full_address, address_type, addressable_id, addressable_type, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4474 (class 0 OID 17759)
-- Dependencies: 319
-- Data for Name: agile_colors; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.agile_colors (id, container_id, container_type, color) FROM stdin;
\.


--
-- TOC entry 4472 (class 0 OID 17749)
-- Dependencies: 317
-- Data for Name: agile_data; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.agile_data (id, issue_id, "position", story_points) FROM stdin;
\.


--
-- TOC entry 4456 (class 0 OID 17626)
-- Dependencies: 301
-- Data for Name: api_log_for_plugins; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.api_log_for_plugins (id, plugin_code, error_code, description, controller, action, params, user_id, served, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4353 (class 0 OID 16395)
-- Dependencies: 198
-- Data for Name: attachments; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory, us_group_id) FROM stdin;
\.


--
-- TOC entry 4355 (class 0 OID 16415)
-- Dependencies: 200
-- Data for Name: auth_sources; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.auth_sources (id, type, name, host, port, account, account_password, base_dn, attr_login, attr_firstname, attr_lastname, attr_mail, onthefly_register, tls, filter, timeout) FROM stdin;
\.


--
-- TOC entry 4424 (class 0 OID 16977)
-- Dependencies: 269
-- Data for Name: boards; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.boards (id, project_id, name, description, "position", topics_count, messages_count, last_message_id, parent_id) FROM stdin;
\.


--
-- TOC entry 4417 (class 0 OID 16924)
-- Dependencies: 262
-- Data for Name: changes; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.changes (id, changeset_id, action, path, from_path, from_revision, revision, branch) FROM stdin;
\.


--
-- TOC entry 4439 (class 0 OID 17374)
-- Dependencies: 284
-- Data for Name: changeset_parents; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.changeset_parents (changeset_id, parent_id) FROM stdin;
\.


--
-- TOC entry 4415 (class 0 OID 16912)
-- Dependencies: 260
-- Data for Name: changesets; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.changesets (id, repository_id, revision, committer, committed_on, comments, commit_date, scmid, user_id) FROM stdin;
\.


--
-- TOC entry 4420 (class 0 OID 16957)
-- Dependencies: 265
-- Data for Name: changesets_issues; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.changesets_issues (changeset_id, issue_id) FROM stdin;
\.


--
-- TOC entry 4478 (class 0 OID 17789)
-- Dependencies: 323
-- Data for Name: checklist_template_categories; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.checklist_template_categories (id, name, "position") FROM stdin;
\.


--
-- TOC entry 4480 (class 0 OID 17801)
-- Dependencies: 325
-- Data for Name: checklist_templates; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.checklist_templates (id, name, project_id, category_id, user_id, is_public, template_items, is_default, tracker_id) FROM stdin;
\.


--
-- TOC entry 4476 (class 0 OID 17776)
-- Dependencies: 321
-- Data for Name: checklists; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.checklists (id, is_done, subject, "position", issue_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4397 (class 0 OID 16750)
-- Dependencies: 242
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.comments (id, commented_type, commented_id, author_id, comments, created_on, updated_on) FROM stdin;
\.


--
-- TOC entry 4482 (class 0 OID 17828)
-- Dependencies: 327
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.contacts (id, first_name, last_name, middle_name, company, phone, email, website, skype_name, birthday, avatar, background, job_title, is_company, author_id, assigned_to_id, created_on, updated_on, cached_tag_list, visibility) FROM stdin;
\.


--
-- TOC entry 4483 (class 0 OID 17845)
-- Dependencies: 328
-- Data for Name: contacts_deals; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.contacts_deals (deal_id, contact_id) FROM stdin;
\.


--
-- TOC entry 4484 (class 0 OID 17850)
-- Dependencies: 329
-- Data for Name: contacts_issues; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.contacts_issues (issue_id, contact_id) FROM stdin;
\.


--
-- TOC entry 4485 (class 0 OID 17857)
-- Dependencies: 330
-- Data for Name: contacts_projects; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.contacts_projects (project_id, contact_id) FROM stdin;
\.


--
-- TOC entry 4506 (class 0 OID 17989)
-- Dependencies: 351
-- Data for Name: contacts_queries; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.contacts_queries (id, project_id, name, filters, user_id, is_public, column_names, sort_criteria, group_by, type) FROM stdin;
\.


--
-- TOC entry 4504 (class 0 OID 17975)
-- Dependencies: 349
-- Data for Name: contacts_settings; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.contacts_settings (id, name, value, project_id, updated_on) FROM stdin;
\.


--
-- TOC entry 4450 (class 0 OID 17558)
-- Dependencies: 295
-- Data for Name: custom_field_enumerations; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.custom_field_enumerations (id, custom_field_id, name, active, "position") FROM stdin;
\.


--
-- TOC entry 4357 (class 0 OID 16429)
-- Dependencies: 202
-- Data for Name: custom_fields; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.custom_fields (id, type, name, field_format, possible_values, regexp, min_length, max_length, is_required, is_for_all, is_filter, "position", searchable, default_value, editable, visible, multiple, format_store, description, ajaxable, acl_trim_multiple) FROM stdin;
\.


--
-- TOC entry 4358 (class 0 OID 16446)
-- Dependencies: 203
-- Data for Name: custom_fields_projects; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.custom_fields_projects (custom_field_id, project_id) FROM stdin;
\.


--
-- TOC entry 4441 (class 0 OID 17449)
-- Dependencies: 286
-- Data for Name: custom_fields_roles; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.custom_fields_roles (custom_field_id, role_id) FROM stdin;
\.


--
-- TOC entry 4359 (class 0 OID 16451)
-- Dependencies: 204
-- Data for Name: custom_fields_trackers; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.custom_fields_trackers (custom_field_id, tracker_id) FROM stdin;
\.


--
-- TOC entry 4361 (class 0 OID 16458)
-- Dependencies: 206
-- Data for Name: custom_values; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.custom_values (id, customized_type, customized_id, custom_field_id, value) FROM stdin;
\.


--
-- TOC entry 4489 (class 0 OID 17882)
-- Dependencies: 334
-- Data for Name: deal_categories; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.deal_categories (id, name, project_id) FROM stdin;
\.


--
-- TOC entry 4491 (class 0 OID 17894)
-- Dependencies: 336
-- Data for Name: deal_processes; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.deal_processes (id, deal_id, author_id, old_value, value, created_at) FROM stdin;
\.


--
-- TOC entry 4493 (class 0 OID 17904)
-- Dependencies: 338
-- Data for Name: deal_statuses; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.deal_statuses (id, name, "position", is_default, color, status_type) FROM stdin;
\.


--
-- TOC entry 4494 (class 0 OID 17917)
-- Dependencies: 339
-- Data for Name: deal_statuses_projects; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.deal_statuses_projects (project_id, deal_status_id) FROM stdin;
\.


--
-- TOC entry 4487 (class 0 OID 17866)
-- Dependencies: 332
-- Data for Name: deals; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.deals (id, name, background, currency, duration, price, price_type, project_id, author_id, assigned_to_id, status_id, contact_id, category_id, created_on, updated_on, due_date, probability) FROM stdin;
\.


--
-- TOC entry 4510 (class 0 OID 18052)
-- Dependencies: 355
-- Data for Name: deals_issues; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.deals_issues (id, issue_id, deal_id) FROM stdin;
\.


--
-- TOC entry 4532 (class 0 OID 18263)
-- Dependencies: 377
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.departments (id, parent_id, lft, rgt, name, background, head_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4363 (class 0 OID 16472)
-- Dependencies: 208
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.documents (id, project_id, category_id, title, description, created_on) FROM stdin;
\.


--
-- TOC entry 4454 (class 0 OID 17603)
-- Dependencies: 299
-- Data for Name: easy_entity_assignments; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.easy_entity_assignments (id, entity_from_id, entity_from_type, entity_to_id, entity_to_type, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4462 (class 0 OID 17661)
-- Dependencies: 307
-- Data for Name: easy_instant_messages; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.easy_instant_messages (id, sender_id, recipient_id, content, sender_ip, created_at, updated_at, unread) FROM stdin;
\.


--
-- TOC entry 4452 (class 0 OID 17585)
-- Dependencies: 297
-- Data for Name: easy_settings; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.easy_settings (id, type, name, value, project_id) FROM stdin;
\.


--
-- TOC entry 4443 (class 0 OID 17476)
-- Dependencies: 288
-- Data for Name: email_addresses; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.email_addresses (id, user_id, address, is_default, notify, created_on, updated_on) FROM stdin;
1	1	admin@example.net	t	t	2018-08-15 08:59:02.998716	2018-08-15 08:59:02.998716
\.


--
-- TOC entry 4430 (class 0 OID 17042)
-- Dependencies: 275
-- Data for Name: enabled_modules; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.enabled_modules (id, project_id, name) FROM stdin;
\.


--
-- TOC entry 4365 (class 0 OID 16487)
-- Dependencies: 210
-- Data for Name: enumerations; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.enumerations (id, name, "position", is_default, type, active, project_id, parent_id, position_name) FROM stdin;
1	Low	1	f	IssuePriority	t	\N	\N	lowest
2	Normal	2	t	IssuePriority	t	\N	\N	default
3	High	3	f	IssuePriority	t	\N	\N	high3
4	Urgent	4	f	IssuePriority	t	\N	\N	high2
5	Immediate	5	f	IssuePriority	t	\N	\N	highest
6	User documentation	1	f	DocumentCategory	t	\N	\N	\N
7	Technical documentation	2	f	DocumentCategory	t	\N	\N	\N
8	Design	1	f	TimeEntryActivity	t	\N	\N	\N
9	Development	2	f	TimeEntryActivity	t	\N	\N	\N
\.


--
-- TOC entry 4466 (class 0 OID 17696)
-- Dependencies: 311
-- Data for Name: eq_pinned_queries; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.eq_pinned_queries (id, query_id, user_id, "position") FROM stdin;
\.


--
-- TOC entry 4467 (class 0 OID 17714)
-- Dependencies: 312
-- Data for Name: eq_queries_hide_in_projects; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.eq_queries_hide_in_projects (query_id, project_id) FROM stdin;
\.


--
-- TOC entry 4468 (class 0 OID 17720)
-- Dependencies: 313
-- Data for Name: eq_queries_show_in_projects; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.eq_queries_show_in_projects (query_id, project_id) FROM stdin;
\.


--
-- TOC entry 4514 (class 0 OID 18082)
-- Dependencies: 359
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.expenses (id, expense_date, price, description, contact_id, author_id, project_id, status_id, created_at, updated_at, assigned_to_id, currency, is_billable, tax) FROM stdin;
\.


--
-- TOC entry 4522 (class 0 OID 18191)
-- Dependencies: 367
-- Data for Name: favorite_projects; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.favorite_projects (id, project_id, user_id) FROM stdin;
\.


--
-- TOC entry 4470 (class 0 OID 17738)
-- Dependencies: 315
-- Data for Name: global_roles; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.global_roles (id, user_id, role_id) FROM stdin;
\.


--
-- TOC entry 4438 (class 0 OID 17212)
-- Dependencies: 283
-- Data for Name: groups_users; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.groups_users (group_id, user_id) FROM stdin;
\.


--
-- TOC entry 4448 (class 0 OID 17524)
-- Dependencies: 293
-- Data for Name: import_items; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.import_items (id, import_id, "position", obj_id, message) FROM stdin;
\.


--
-- TOC entry 4446 (class 0 OID 17512)
-- Dependencies: 291
-- Data for Name: imports; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.imports (id, type, user_id, filename, settings, total_items, finished, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4516 (class 0 OID 18098)
-- Dependencies: 361
-- Data for Name: invoice_lines; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.invoice_lines (id, invoice_id, "position", quantity, description, tax, price, units, created_at, updated_at, discount, product_id) FROM stdin;
\.


--
-- TOC entry 4518 (class 0 OID 18126)
-- Dependencies: 363
-- Data for Name: invoice_payments; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.invoice_payments (id, amount, payment_date, invoice_id, description, author_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4520 (class 0 OID 18165)
-- Dependencies: 365
-- Data for Name: invoice_templates; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.invoice_templates (id, name, project_id, content, description, author_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4512 (class 0 OID 18064)
-- Dependencies: 357
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.invoices (id, number, invoice_date, discount, discount_type, description, due_date, language, currency, status_id, contact_id, project_id, assigned_to_id, author_id, created_at, updated_at, subject, amount, comments_count, paid_date, balance, type, order_number, template_id, is_recurring, recurring_period, recurring_occurrences, recurring_action, recurring_profile_id, recurring_number) FROM stdin;
\.


--
-- TOC entry 4367 (class 0 OID 16497)
-- Dependencies: 212
-- Data for Name: issue_categories; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.issue_categories (id, project_id, name, assigned_to_id) FROM stdin;
\.


--
-- TOC entry 4572 (class 0 OID 18567)
-- Dependencies: 417
-- Data for Name: issue_reads; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.issue_reads (id, user_id, issue_id, read_date, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4422 (class 0 OID 16963)
-- Dependencies: 267
-- Data for Name: issue_relations; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.issue_relations (id, issue_from_id, issue_to_id, relation_type, delay) FROM stdin;
\.


--
-- TOC entry 4369 (class 0 OID 16523)
-- Dependencies: 214
-- Data for Name: issue_statuses; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.issue_statuses (id, name, is_closed, "position", default_done_ratio) FROM stdin;
1	New	f	1	\N
2	In Progress	f	2	\N
3	Resolved	f	3	\N
4	Feedback	f	4	\N
5	Closed	t	5	\N
6	Rejected	t	6	\N
\.


--
-- TOC entry 4371 (class 0 OID 16535)
-- Dependencies: 216
-- Data for Name: issues; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) FROM stdin;
\.


--
-- TOC entry 4393 (class 0 OID 16714)
-- Dependencies: 238
-- Data for Name: journal_details; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.journal_details (id, journal_id, property, prop_key, old_value, value) FROM stdin;
\.


--
-- TOC entry 4391 (class 0 OID 16700)
-- Dependencies: 236
-- Data for Name: journals; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes, updated_on) FROM stdin;
\.


--
-- TOC entry 4437 (class 0 OID 17206)
-- Dependencies: 282
-- Data for Name: member_roles; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.member_roles (id, member_id, role_id, inherited_from) FROM stdin;
\.


--
-- TOC entry 4373 (class 0 OID 16554)
-- Dependencies: 218
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.members (id, user_id, project_id, created_on, mail_notification) FROM stdin;
\.


--
-- TOC entry 4426 (class 0 OID 16993)
-- Dependencies: 271
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.messages (id, board_id, parent_id, subject, content, author_id, replies_count, last_reply_id, created_on, updated_on, locked, sticky) FROM stdin;
\.


--
-- TOC entry 4375 (class 0 OID 16565)
-- Dependencies: 220
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.news (id, project_id, title, summary, description, author_id, created_on, comments_count, uncommentable) FROM stdin;
\.


--
-- TOC entry 4496 (class 0 OID 17925)
-- Dependencies: 341
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.notes (id, subject, content, source_id, source_type, author_id, created_on, updated_on, type_id) FROM stdin;
\.


--
-- TOC entry 4433 (class 0 OID 17168)
-- Dependencies: 278
-- Data for Name: open_id_authentication_associations; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.open_id_authentication_associations (id, issued, lifetime, handle, assoc_type, server_url, secret) FROM stdin;
\.


--
-- TOC entry 4435 (class 0 OID 17179)
-- Dependencies: 280
-- Data for Name: open_id_authentication_nonces; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.open_id_authentication_nonces (id, "timestamp", server_url, salt) FROM stdin;
\.


--
-- TOC entry 4528 (class 0 OID 18222)
-- Dependencies: 373
-- Data for Name: operation_categories; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.operation_categories (id, name, "position", parent_id, lft, rgt, code) FROM stdin;
\.


--
-- TOC entry 4530 (class 0 OID 18233)
-- Dependencies: 375
-- Data for Name: operation_objects; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.operation_objects (id, operation_id, operationable_id, operationable_type, created_at) FROM stdin;
\.


--
-- TOC entry 4526 (class 0 OID 18211)
-- Dependencies: 371
-- Data for Name: operations; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.operations (id, amount, category_id, account_id, contact_id, comments_count, operation_date, author_id, description, created_at, updated_at, assigned_to_id, is_approved, income) FROM stdin;
\.


--
-- TOC entry 4548 (class 0 OID 18380)
-- Dependencies: 393
-- Data for Name: order_statuses; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.order_statuses (id, name, "position", is_default, is_closed, color) FROM stdin;
\.


--
-- TOC entry 4546 (class 0 OID 18362)
-- Dependencies: 391
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.orders (id, number, subject, order_date, closed_date, currency, contact_id, status_id, assigned_to_id, author_id, project_id, comments_count, description, amount, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4536 (class 0 OID 18295)
-- Dependencies: 381
-- Data for Name: people_announcements; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.people_announcements (id, description, start_date, end_date, frequency, kind, active, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4540 (class 0 OID 18319)
-- Dependencies: 385
-- Data for Name: people_holidays; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.people_holidays (id, name, start_date, end_date, description, is_workday, created_on, updated_on) FROM stdin;
\.


--
-- TOC entry 4534 (class 0 OID 18276)
-- Dependencies: 379
-- Data for Name: people_information; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.people_information (user_id, phone, address, skype, birthday, job_title, company, middlename, gender, twitter, facebook, linkedin, background, appearance_date, department_id, is_system, manager_id) FROM stdin;
1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N
\.


--
-- TOC entry 4538 (class 0 OID 18307)
-- Dependencies: 383
-- Data for Name: people_work_experiences; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.people_work_experiences (id, previous_company_name, job_title, from_date, to_date, description, user_id) FROM stdin;
\.


--
-- TOC entry 4552 (class 0 OID 18408)
-- Dependencies: 397
-- Data for Name: product_categories; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.product_categories (id, name, code, parent_id, lft, rgt) FROM stdin;
\.


--
-- TOC entry 4544 (class 0 OID 18346)
-- Dependencies: 389
-- Data for Name: product_lines; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.product_lines (id, container_id, container_type, product_id, description, quantity, tax, discount, price, "position") FROM stdin;
\.


--
-- TOC entry 4542 (class 0 OID 18330)
-- Dependencies: 387
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.products (id, code, name, description, status_id, currency, price, amount, author_id, project_id, created_at, updated_at, category_id) FROM stdin;
\.


--
-- TOC entry 4550 (class 0 OID 18396)
-- Dependencies: 395
-- Data for Name: products_bundles; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.products_bundles (id, bundle_id, product_id) FROM stdin;
\.


--
-- TOC entry 4377 (class 0 OID 16601)
-- Dependencies: 222
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.projects (id, name, description, homepage, is_public, parent_id, created_on, updated_on, identifier, status, lft, rgt, inherit_members, default_version_id, default_assigned_to_id) FROM stdin;
\.


--
-- TOC entry 4431 (class 0 OID 17097)
-- Dependencies: 276
-- Data for Name: projects_trackers; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.projects_trackers (project_id, tracker_id) FROM stdin;
\.


--
-- TOC entry 4399 (class 0 OID 16773)
-- Dependencies: 244
-- Data for Name: queries; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.queries (id, project_id, name, filters, user_id, column_names, sort_criteria, group_by, type, visibility, options, category_id, eq_counter, sub_project) FROM stdin;
\.


--
-- TOC entry 4440 (class 0 OID 17435)
-- Dependencies: 285
-- Data for Name: queries_roles; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.queries_roles (query_id, role_id) FROM stdin;
\.


--
-- TOC entry 4464 (class 0 OID 17685)
-- Dependencies: 309
-- Data for Name: query_categories; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.query_categories (id, name, created_at, updated_at, author_id, "position") FROM stdin;
\.


--
-- TOC entry 4558 (class 0 OID 18450)
-- Dependencies: 403
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.questions (id, subject, content, section_id, status_id, author_id, featured, locked, cached_weighted_score, comments_count, answers_count, views, total_views, created_on, updated_on) FROM stdin;
\.


--
-- TOC entry 4562 (class 0 OID 18484)
-- Dependencies: 407
-- Data for Name: questions_answers; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.questions_answers (id, content, author_id, question_id, accepted, cached_weighted_score, comments_count, created_on, updated_on) FROM stdin;
\.


--
-- TOC entry 4560 (class 0 OID 18471)
-- Dependencies: 405
-- Data for Name: questions_sections; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.questions_sections (id, name, description, project_id, section_type, "position") FROM stdin;
\.


--
-- TOC entry 4564 (class 0 OID 18501)
-- Dependencies: 409
-- Data for Name: questions_statuses; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.questions_statuses (id, name, is_closed, color, "position") FROM stdin;
\.


--
-- TOC entry 4502 (class 0 OID 17962)
-- Dependencies: 347
-- Data for Name: recently_vieweds; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.recently_vieweds (id, viewer_id, viewed_id, viewed_type, views_count, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4401 (class 0 OID 16787)
-- Dependencies: 246
-- Data for Name: repositories; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.repositories (id, project_id, url, login, password, root_url, type, path_encoding, log_encoding, extra_info, identifier, is_default, created_on) FROM stdin;
\.


--
-- TOC entry 4379 (class 0 OID 16617)
-- Dependencies: 224
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.roles (id, name, "position", assignable, builtin, permissions, issues_visibility, users_visibility, time_entries_visibility, all_roles_managed, settings) FROM stdin;
3	Manager	1	t	0	---\n- :add_project\n- :edit_project\n- :close_project\n- :select_project_modules\n- :manage_members\n- :manage_versions\n- :add_subprojects\n- :manage_public_queries\n- :save_queries\n- :view_issues\n- :add_issues\n- :edit_issues\n- :copy_issues\n- :manage_issue_relations\n- :manage_subtasks\n- :set_issues_private\n- :set_own_issues_private\n- :add_issue_notes\n- :edit_issue_notes\n- :edit_own_issue_notes\n- :view_private_notes\n- :set_notes_private\n- :delete_issues\n- :view_issue_watchers\n- :add_issue_watchers\n- :delete_issue_watchers\n- :import_issues\n- :manage_categories\n- :view_time_entries\n- :log_time\n- :edit_time_entries\n- :edit_own_time_entries\n- :manage_project_activities\n- :view_news\n- :manage_news\n- :comment_news\n- :view_documents\n- :add_documents\n- :edit_documents\n- :delete_documents\n- :view_files\n- :manage_files\n- :view_wiki_pages\n- :view_wiki_edits\n- :export_wiki_pages\n- :edit_wiki_pages\n- :rename_wiki_pages\n- :delete_wiki_pages\n- :delete_wiki_pages_attachments\n- :protect_wiki_pages\n- :manage_wiki\n- :view_changesets\n- :browse_repository\n- :commit_access\n- :manage_related_issues\n- :manage_repository\n- :view_messages\n- :add_messages\n- :edit_messages\n- :edit_own_messages\n- :delete_messages\n- :delete_own_messages\n- :manage_boards\n- :view_calendar\n- :view_gantt\n	all	all	all	t	\N
4	Developer	2	t	0	---\n- :manage_versions\n- :manage_categories\n- :view_issues\n- :add_issues\n- :edit_issues\n- :view_private_notes\n- :set_notes_private\n- :manage_issue_relations\n- :manage_subtasks\n- :add_issue_notes\n- :save_queries\n- :view_gantt\n- :view_calendar\n- :log_time\n- :view_time_entries\n- :view_news\n- :comment_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :edit_wiki_pages\n- :delete_wiki_pages\n- :view_messages\n- :add_messages\n- :edit_own_messages\n- :view_files\n- :manage_files\n- :browse_repository\n- :view_changesets\n- :commit_access\n- :manage_related_issues\n	default	all	all	t	\N
5	Reporter	3	t	0	---\n- :view_issues\n- :add_issues\n- :add_issue_notes\n- :save_queries\n- :view_gantt\n- :view_calendar\n- :log_time\n- :view_time_entries\n- :view_news\n- :comment_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :view_messages\n- :add_messages\n- :edit_own_messages\n- :view_files\n- :browse_repository\n- :view_changesets\n	default	all	all	t	\N
1	Non member	0	t	1	---\n- :view_issues\n- :add_issues\n- :add_issue_notes\n- :save_queries\n- :view_gantt\n- :view_calendar\n- :view_time_entries\n- :view_news\n- :comment_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :view_messages\n- :add_messages\n- :view_files\n- :browse_repository\n- :view_changesets\n	default	all	all	t	\N
2	Anonymous	0	t	2	---\n- :view_issues\n- :view_gantt\n- :view_calendar\n- :view_time_entries\n- :view_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :view_messages\n- :view_files\n- :browse_repository\n- :view_changesets\n	default	all	all	t	\N
\.


--
-- TOC entry 4444 (class 0 OID 17506)
-- Dependencies: 289
-- Data for Name: roles_managed_roles; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.roles_managed_roles (role_id, managed_role_id) FROM stdin;
\.


--
-- TOC entry 4351 (class 0 OID 16386)
-- Dependencies: 196
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.schema_migrations (version) FROM stdin;
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99
100
101
102
103
104
105
106
107
108
20090214190337
20090312172426
20090312194159
20090318181151
20090323224724
20090401221305
20090401231134
20090403001910
20090406161854
20090425161243
20090503121501
20090503121505
20090503121510
20090614091200
20090704172350
20090704172355
20090704172358
20091010093521
20091017212227
20091017212457
20091017212644
20091017212938
20091017213027
20091017213113
20091017213151
20091017213228
20091017213257
20091017213332
20091017213444
20091017213536
20091017213642
20091017213716
20091017213757
20091017213835
20091017213910
20091017214015
20091017214107
20091017214136
20091017214236
20091017214308
20091017214336
20091017214406
20091017214440
20091017214519
20091017214611
20091017214644
20091017214720
20091017214750
20091025163651
20091108092559
20091114105931
20091123212029
20091205124427
20091220183509
20091220183727
20091220184736
20091225164732
20091227112908
20100129193402
20100129193813
20100221100219
20100313132032
20100313171051
20100705164950
20100819172912
20101104182107
20101107130441
20101114115114
20101114115359
20110220160626
20110223180944
20110223180953
20110224000000
20110226120112
20110226120132
20110227125750
20110228000000
20110228000100
20110401192910
20110408103312
20110412065600
20110511000000
20110902000000
20111201201315
20120115143024
20120115143100
20120115143126
20120127174243
20120205111326
20120223110929
20120301153455
20120422150750
20120705074331
20120707064544
20120714122000
20120714122100
20120714122200
20120731164049
20120930112914
20121026002032
20121026003537
20121209123234
20121209123358
20121213084931
20130110122628
20130201184705
20130202090625
20130207175206
20130207181455
20130215073721
20130215111127
20130215111141
20130217094251
20130602092539
20130710182539
20130713104233
20130713111657
20130729070143
20130911193200
20131004113137
20131005100610
20131124175346
20131210180802
20131214094309
20131215104612
20131218183023
20140228130325
20140903143914
20140920094058
20141029181752
20141029181824
20141109112308
20141122124142
20150113194759
20150113211532
20150113213922
20150113213955
20150208105930
20150510083747
20150525103953
20150526183158
20150528084820
20150528092912
20150528093249
20150725112753
20150730122707
20150730122735
20150921204850
20150921210243
20151020182334
20151020182731
20151021184614
20151021185456
20151021190616
20151024082034
20151025072118
20151031095005
20160404080304
20160416072926
20160529063352
20161001122012
20161002133421
20161010081301
20161010081528
20161010081600
20161126094932
20161220091118
20170207050700
20170302015225
20170309214320
20170320051650
20170418090031
20170419144536
20150705172511
20160519161300
1-a_common_libs
20160512110921-a_common_libs
20170120140500-a_common_libs
20170710154232-a_common_libs
20170804162932-a_common_libs
20170807123242-a_common_libs
20170807123248-a_common_libs
20170807123321-a_common_libs
20171220133241-a_common_libs
20130418140346-easy_instant_messages
20130419131113-easy_instant_messages
20130910103812-easy_instant_messages
20160531113810-easy_instant_messages
1-extra_queries
2-extra_queries
3-extra_queries
20160127112400-extra_queries
20162701145900-extra_queries
20162703151100-extra_queries
20162703151101-extra_queries
20162703151102-extra_queries
20170317160200-extra_queries
20170411141400-extra_queries
1-global_roles
2-global_roles
1-redmine_agile
2-redmine_agile
3-redmine_agile
4-redmine_agile
5-redmine_agile
1-redmine_checklists
2-redmine_checklists
3-redmine_checklists
4-redmine_checklists
5-redmine_checklists
6-redmine_checklists
16-redmine_contacts
17-redmine_contacts
18-redmine_contacts
19-redmine_contacts
20-redmine_contacts
21-redmine_contacts
22-redmine_contacts
23-redmine_contacts
24-redmine_contacts
25-redmine_contacts
26-redmine_contacts
27-redmine_contacts
28-redmine_contacts
29-redmine_contacts
30-redmine_contacts
31-redmine_contacts
32-redmine_contacts
33-redmine_contacts
34-redmine_contacts
1-redmine_contacts_invoices
2-redmine_contacts_invoices
3-redmine_contacts_invoices
4-redmine_contacts_invoices
5-redmine_contacts_invoices
6-redmine_contacts_invoices
7-redmine_contacts_invoices
8-redmine_contacts_invoices
9-redmine_contacts_invoices
10-redmine_contacts_invoices
11-redmine_contacts_invoices
12-redmine_contacts_invoices
13-redmine_contacts_invoices
14-redmine_contacts_invoices
15-redmine_contacts_invoices
16-redmine_contacts_invoices
17-redmine_contacts_invoices
18-redmine_contacts_invoices
19-redmine_contacts_invoices
1-redmine_favorite_projects
2-redmine_favorite_projects
1-redmine_finance
2-redmine_finance
3-redmine_finance
5-redmine_finance
6-redmine_finance
7-redmine_finance
8-redmine_finance
9-redmine_finance
10-redmine_finance
11-redmine_finance
12-redmine_finance
20170119140023-redmine_issue_tabs
1-redmine_people
2-redmine_people
3-redmine_people
4-redmine_people
5-redmine_people
6-redmine_people
7-redmine_people
8-redmine_people
9-redmine_people
10-redmine_people
11-redmine_people
12-redmine_people
13-redmine_people
1-redmine_products
2-redmine_products
3-redmine_products
4-redmine_products
6-redmine_products
7-redmine_products
8-redmine_products
9-redmine_products
1-redmine_questions
2-redmine_questions
3-redmine_questions
4-redmine_questions
5-redmine_questions
6-redmine_questions
7-redmine_questions
1-redmineup_tags
2-redmineup_tags
1-under_construction
2-under_construction
3-under_construction
4-under_construction
5-under_construction
6-under_construction
7-under_construction
1-unread_issues
2-unread_issues
20170711112435-unread_issues
1-usability
2-usability
20150415224335-usability
20150603105300-usability
20150610114908-usability
\.


--
-- TOC entry 4458 (class 0 OID 17639)
-- Dependencies: 303
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.sessions (id, session_id, data, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4403 (class 0 OID 16800)
-- Dependencies: 248
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.settings (id, name, value, updated_on) FROM stdin;
1	plugin_a_common_libs	---\nautoconfig_libs: true\nenable_select2_lib: true\nenable_bootstrap_lib: true\nenable_javascript_patches: true\nenable_modal_windows: true\nenable_ajax_counters: true\n	2018-08-15 09:03:02.022722
2	plugin_redmine_contacts_invoices	---\n:invoices_invoices_company_name: Your company name\n:invoices_invoices_company_representative: Company representative name\n:invoices_invoices_template: classic\n:invoices_invoices_line_grouping: 0\n:invoices_invoices_cross_project_contacts: true\n:invoices_invoices_number_format: "#INV/%%YEAR%%%%MONTH%%%%DAY%%-%%ID%%"\n:invoices_invoices_company_info: |-\n  Your company address\n  Tax ID\n  phone:\n  fax:\n:invoices_invoices_company_logo_url: http://www.redmine.org/attachments/3458/redmine_logo_v1.png\n:invoices_invoices_bill_info: Your billing information (Bank, Address, IBAN, SWIFT\n  & etc.)\n:invoices_invoices_units: |-\n  hours\n  days\n  service\n  products\n	2018-08-15 09:03:41.227019
3	rest_api_enabled	1	2018-08-15 09:06:35.991953
4	jsonp_enabled	0	2018-08-15 09:06:36.018904
\.


--
-- TOC entry 4500 (class 0 OID 17949)
-- Dependencies: 345
-- Data for Name: taggings; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.taggings (id, tag_id, taggable_id, taggable_type, created_at) FROM stdin;
\.


--
-- TOC entry 4498 (class 0 OID 17938)
-- Dependencies: 343
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.tags (id, name) FROM stdin;
\.


--
-- TOC entry 4413 (class 0 OID 16902)
-- Dependencies: 258
-- Data for Name: time_entries; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on) FROM stdin;
\.


--
-- TOC entry 4381 (class 0 OID 16626)
-- Dependencies: 226
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.tokens (id, user_id, action, value, created_on, updated_on) FROM stdin;
4	1	feeds	82fbe363f9cdb19dd52283aa93a9233f56700ab5	2018-08-15 09:06:03.395741	2018-08-15 09:06:03.395741
5	1	api	7366024f9f4e5c8b5c868e8640e91d03b886fadd	2018-08-15 09:06:03.855229	2018-08-15 09:06:03.855229
\.


--
-- TOC entry 4383 (class 0 OID 16637)
-- Dependencies: 228
-- Data for Name: trackers; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.trackers (id, name, is_in_chlog, "position", is_in_roadmap, fields_bits, default_status_id) FROM stdin;
1	Bug	t	1	f	0	1
2	Feature	t	2	t	0	1
3	Support	f	3	f	0	1
\.


--
-- TOC entry 4568 (class 0 OID 18535)
-- Dependencies: 413
-- Data for Name: uc_browser_restrictions; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.uc_browser_restrictions (id, name, condition, version, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4566 (class 0 OID 18515)
-- Dependencies: 411
-- Data for Name: uc_periods; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.uc_periods (id, begin_date, end_date, custom_message, turned_on, created_at, updated_at, user_id, notify) FROM stdin;
\.


--
-- TOC entry 4570 (class 0 OID 18546)
-- Dependencies: 415
-- Data for Name: uc_restrictions; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.uc_restrictions (id, uc_period_id, controller, action, timestamps) FROM stdin;
\.


--
-- TOC entry 4395 (class 0 OID 16730)
-- Dependencies: 240
-- Data for Name: user_preferences; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.user_preferences (id, user_id, others, hide_mail, time_zone, favourite_project_id, usability) FROM stdin;
1	1	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n:comments_sorting: asc\n:warn_on_leaving_unsaved: '1'\n:textarea_font: ''\n	t		\N	\N
\.


--
-- TOC entry 4385 (class 0 OID 16647)
-- Dependencies: 230
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.users (id, login, hashed_password, firstname, lastname, admin, status, last_login_on, language, auth_source_id, created_on, updated_on, type, identity_url, mail_notification, salt, must_change_passwd, passwd_changed_on) FROM stdin;
2				Anonymous users	f	1	\N		\N	2018-08-15 08:39:48.182197	2018-08-15 08:39:48.182197	GroupAnonymous	\N		\N	f	\N
3				Non member users	f	1	\N		\N	2018-08-15 08:39:48.23872	2018-08-15 08:39:48.23872	GroupNonMember	\N		\N	f	\N
1	admin	9db3293fad2decf2ac372d40b31c91552257f795	Redmine	Admin	t	1	\N		\N	2018-08-15 08:39:30.492518	2018-08-15 08:39:30.492518	User	\N	all	62ec924bd0ac35cb69c0fbe5b652e37c	t	\N
4				Anonymous	f	0	\N		\N	2018-08-15 08:41:13.89167	2018-08-15 08:41:13.89167	AnonymousUser	\N	only_my_events	\N	f	\N
\.

--
-- TOC entry 4387 (class 0 OID 16664)
-- Dependencies: 232
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.versions (id, project_id, name, description, effective_date, created_on, updated_on, wiki_page_title, status, sharing) FROM stdin;
\.


--
-- TOC entry 4556 (class 0 OID 18437)
-- Dependencies: 401
-- Data for Name: viewings; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.viewings (id, viewer_id, viewed_id, viewed_type, ip, created_at) FROM stdin;
\.


--
-- TOC entry 4554 (class 0 OID 18422)
-- Dependencies: 399
-- Data for Name: votes; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.votes (id, votable_id, votable_type, voter_id, voter_type, vote_flag, vote_scope, vote_weight, vote_ip, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4419 (class 0 OID 16946)
-- Dependencies: 264
-- Data for Name: watchers; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.watchers (id, watchable_type, watchable_id, user_id) FROM stdin;
\.


--
-- TOC entry 4411 (class 0 OID 16880)
-- Dependencies: 256
-- Data for Name: wiki_content_versions; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) FROM stdin;
\.


--
-- TOC entry 4409 (class 0 OID 16867)
-- Dependencies: 254
-- Data for Name: wiki_contents; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.wiki_contents (id, page_id, author_id, text, comments, updated_on, version) FROM stdin;
\.


--
-- TOC entry 4407 (class 0 OID 16858)
-- Dependencies: 252
-- Data for Name: wiki_pages; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.wiki_pages (id, wiki_id, title, created_on, protected, parent_id) FROM stdin;
\.


--
-- TOC entry 4428 (class 0 OID 17030)
-- Dependencies: 273
-- Data for Name: wiki_redirects; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.wiki_redirects (id, wiki_id, title, redirects_to, created_on, redirects_to_wiki_id) FROM stdin;
\.


--
-- TOC entry 4405 (class 0 OID 16848)
-- Dependencies: 250
-- Data for Name: wikis; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.wikis (id, project_id, start_page, status) FROM stdin;
\.


--
-- TOC entry 4389 (class 0 OID 16679)
-- Dependencies: 234
-- Data for Name: workflows; Type: TABLE DATA; Schema: public; Owner: redmine
--

COPY public.workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) FROM stdin;
1	1	1	2	3	f	f	WorkflowTransition	\N	\N
2	1	1	3	3	f	f	WorkflowTransition	\N	\N
3	1	1	4	3	f	f	WorkflowTransition	\N	\N
4	1	1	5	3	f	f	WorkflowTransition	\N	\N
5	1	1	6	3	f	f	WorkflowTransition	\N	\N
6	1	2	1	3	f	f	WorkflowTransition	\N	\N
7	1	2	3	3	f	f	WorkflowTransition	\N	\N
8	1	2	4	3	f	f	WorkflowTransition	\N	\N
9	1	2	5	3	f	f	WorkflowTransition	\N	\N
10	1	2	6	3	f	f	WorkflowTransition	\N	\N
11	1	3	1	3	f	f	WorkflowTransition	\N	\N
12	1	3	2	3	f	f	WorkflowTransition	\N	\N
13	1	3	4	3	f	f	WorkflowTransition	\N	\N
14	1	3	5	3	f	f	WorkflowTransition	\N	\N
15	1	3	6	3	f	f	WorkflowTransition	\N	\N
16	1	4	1	3	f	f	WorkflowTransition	\N	\N
17	1	4	2	3	f	f	WorkflowTransition	\N	\N
18	1	4	3	3	f	f	WorkflowTransition	\N	\N
19	1	4	5	3	f	f	WorkflowTransition	\N	\N
20	1	4	6	3	f	f	WorkflowTransition	\N	\N
21	1	5	1	3	f	f	WorkflowTransition	\N	\N
22	1	5	2	3	f	f	WorkflowTransition	\N	\N
23	1	5	3	3	f	f	WorkflowTransition	\N	\N
24	1	5	4	3	f	f	WorkflowTransition	\N	\N
25	1	5	6	3	f	f	WorkflowTransition	\N	\N
26	1	6	1	3	f	f	WorkflowTransition	\N	\N
27	1	6	2	3	f	f	WorkflowTransition	\N	\N
28	1	6	3	3	f	f	WorkflowTransition	\N	\N
29	1	6	4	3	f	f	WorkflowTransition	\N	\N
30	1	6	5	3	f	f	WorkflowTransition	\N	\N
31	2	1	2	3	f	f	WorkflowTransition	\N	\N
32	2	1	3	3	f	f	WorkflowTransition	\N	\N
33	2	1	4	3	f	f	WorkflowTransition	\N	\N
34	2	1	5	3	f	f	WorkflowTransition	\N	\N
35	2	1	6	3	f	f	WorkflowTransition	\N	\N
36	2	2	1	3	f	f	WorkflowTransition	\N	\N
37	2	2	3	3	f	f	WorkflowTransition	\N	\N
38	2	2	4	3	f	f	WorkflowTransition	\N	\N
39	2	2	5	3	f	f	WorkflowTransition	\N	\N
40	2	2	6	3	f	f	WorkflowTransition	\N	\N
41	2	3	1	3	f	f	WorkflowTransition	\N	\N
42	2	3	2	3	f	f	WorkflowTransition	\N	\N
43	2	3	4	3	f	f	WorkflowTransition	\N	\N
44	2	3	5	3	f	f	WorkflowTransition	\N	\N
45	2	3	6	3	f	f	WorkflowTransition	\N	\N
46	2	4	1	3	f	f	WorkflowTransition	\N	\N
47	2	4	2	3	f	f	WorkflowTransition	\N	\N
48	2	4	3	3	f	f	WorkflowTransition	\N	\N
49	2	4	5	3	f	f	WorkflowTransition	\N	\N
50	2	4	6	3	f	f	WorkflowTransition	\N	\N
51	2	5	1	3	f	f	WorkflowTransition	\N	\N
52	2	5	2	3	f	f	WorkflowTransition	\N	\N
53	2	5	3	3	f	f	WorkflowTransition	\N	\N
54	2	5	4	3	f	f	WorkflowTransition	\N	\N
55	2	5	6	3	f	f	WorkflowTransition	\N	\N
56	2	6	1	3	f	f	WorkflowTransition	\N	\N
57	2	6	2	3	f	f	WorkflowTransition	\N	\N
58	2	6	3	3	f	f	WorkflowTransition	\N	\N
59	2	6	4	3	f	f	WorkflowTransition	\N	\N
60	2	6	5	3	f	f	WorkflowTransition	\N	\N
61	3	1	2	3	f	f	WorkflowTransition	\N	\N
62	3	1	3	3	f	f	WorkflowTransition	\N	\N
63	3	1	4	3	f	f	WorkflowTransition	\N	\N
64	3	1	5	3	f	f	WorkflowTransition	\N	\N
65	3	1	6	3	f	f	WorkflowTransition	\N	\N
66	3	2	1	3	f	f	WorkflowTransition	\N	\N
67	3	2	3	3	f	f	WorkflowTransition	\N	\N
68	3	2	4	3	f	f	WorkflowTransition	\N	\N
69	3	2	5	3	f	f	WorkflowTransition	\N	\N
70	3	2	6	3	f	f	WorkflowTransition	\N	\N
71	3	3	1	3	f	f	WorkflowTransition	\N	\N
72	3	3	2	3	f	f	WorkflowTransition	\N	\N
73	3	3	4	3	f	f	WorkflowTransition	\N	\N
74	3	3	5	3	f	f	WorkflowTransition	\N	\N
75	3	3	6	3	f	f	WorkflowTransition	\N	\N
76	3	4	1	3	f	f	WorkflowTransition	\N	\N
77	3	4	2	3	f	f	WorkflowTransition	\N	\N
78	3	4	3	3	f	f	WorkflowTransition	\N	\N
79	3	4	5	3	f	f	WorkflowTransition	\N	\N
80	3	4	6	3	f	f	WorkflowTransition	\N	\N
81	3	5	1	3	f	f	WorkflowTransition	\N	\N
82	3	5	2	3	f	f	WorkflowTransition	\N	\N
83	3	5	3	3	f	f	WorkflowTransition	\N	\N
84	3	5	4	3	f	f	WorkflowTransition	\N	\N
85	3	5	6	3	f	f	WorkflowTransition	\N	\N
86	3	6	1	3	f	f	WorkflowTransition	\N	\N
87	3	6	2	3	f	f	WorkflowTransition	\N	\N
88	3	6	3	3	f	f	WorkflowTransition	\N	\N
89	3	6	4	3	f	f	WorkflowTransition	\N	\N
90	3	6	5	3	f	f	WorkflowTransition	\N	\N
91	1	1	2	4	f	f	WorkflowTransition	\N	\N
92	1	1	3	4	f	f	WorkflowTransition	\N	\N
93	1	1	4	4	f	f	WorkflowTransition	\N	\N
94	1	1	5	4	f	f	WorkflowTransition	\N	\N
95	1	2	3	4	f	f	WorkflowTransition	\N	\N
96	1	2	4	4	f	f	WorkflowTransition	\N	\N
97	1	2	5	4	f	f	WorkflowTransition	\N	\N
98	1	3	2	4	f	f	WorkflowTransition	\N	\N
99	1	3	4	4	f	f	WorkflowTransition	\N	\N
100	1	3	5	4	f	f	WorkflowTransition	\N	\N
101	1	4	2	4	f	f	WorkflowTransition	\N	\N
102	1	4	3	4	f	f	WorkflowTransition	\N	\N
103	1	4	5	4	f	f	WorkflowTransition	\N	\N
104	2	1	2	4	f	f	WorkflowTransition	\N	\N
105	2	1	3	4	f	f	WorkflowTransition	\N	\N
106	2	1	4	4	f	f	WorkflowTransition	\N	\N
107	2	1	5	4	f	f	WorkflowTransition	\N	\N
108	2	2	3	4	f	f	WorkflowTransition	\N	\N
109	2	2	4	4	f	f	WorkflowTransition	\N	\N
110	2	2	5	4	f	f	WorkflowTransition	\N	\N
111	2	3	2	4	f	f	WorkflowTransition	\N	\N
112	2	3	4	4	f	f	WorkflowTransition	\N	\N
113	2	3	5	4	f	f	WorkflowTransition	\N	\N
114	2	4	2	4	f	f	WorkflowTransition	\N	\N
115	2	4	3	4	f	f	WorkflowTransition	\N	\N
116	2	4	5	4	f	f	WorkflowTransition	\N	\N
117	3	1	2	4	f	f	WorkflowTransition	\N	\N
118	3	1	3	4	f	f	WorkflowTransition	\N	\N
119	3	1	4	4	f	f	WorkflowTransition	\N	\N
120	3	1	5	4	f	f	WorkflowTransition	\N	\N
121	3	2	3	4	f	f	WorkflowTransition	\N	\N
122	3	2	4	4	f	f	WorkflowTransition	\N	\N
123	3	2	5	4	f	f	WorkflowTransition	\N	\N
124	3	3	2	4	f	f	WorkflowTransition	\N	\N
125	3	3	4	4	f	f	WorkflowTransition	\N	\N
126	3	3	5	4	f	f	WorkflowTransition	\N	\N
127	3	4	2	4	f	f	WorkflowTransition	\N	\N
128	3	4	3	4	f	f	WorkflowTransition	\N	\N
129	3	4	5	4	f	f	WorkflowTransition	\N	\N
130	1	1	5	5	f	f	WorkflowTransition	\N	\N
131	1	2	5	5	f	f	WorkflowTransition	\N	\N
132	1	3	5	5	f	f	WorkflowTransition	\N	\N
133	1	4	5	5	f	f	WorkflowTransition	\N	\N
134	1	3	4	5	f	f	WorkflowTransition	\N	\N
135	2	1	5	5	f	f	WorkflowTransition	\N	\N
136	2	2	5	5	f	f	WorkflowTransition	\N	\N
137	2	3	5	5	f	f	WorkflowTransition	\N	\N
138	2	4	5	5	f	f	WorkflowTransition	\N	\N
139	2	3	4	5	f	f	WorkflowTransition	\N	\N
140	3	1	5	5	f	f	WorkflowTransition	\N	\N
141	3	2	5	5	f	f	WorkflowTransition	\N	\N
142	3	3	5	5	f	f	WorkflowTransition	\N	\N
143	3	4	5	5	f	f	WorkflowTransition	\N	\N
144	3	3	4	5	f	f	WorkflowTransition	\N	\N
\.


--
-- TOC entry 4684 (class 0 OID 0)
-- Dependencies: 368
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.accounts_id_seq', 1, false);


--
-- TOC entry 4685 (class 0 OID 0)
-- Dependencies: 304
-- Name: acl_ajax_counters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.acl_ajax_counters_id_seq', 3, true);


--
-- TOC entry 4686 (class 0 OID 0)
-- Dependencies: 352
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.addresses_id_seq', 1, false);


--
-- TOC entry 4687 (class 0 OID 0)
-- Dependencies: 318
-- Name: agile_colors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.agile_colors_id_seq', 1, false);


--
-- TOC entry 4688 (class 0 OID 0)
-- Dependencies: 316
-- Name: agile_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.agile_data_id_seq', 1, false);


--
-- TOC entry 4689 (class 0 OID 0)
-- Dependencies: 300
-- Name: api_log_for_plugins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.api_log_for_plugins_id_seq', 1, false);


--
-- TOC entry 4690 (class 0 OID 0)
-- Dependencies: 197
-- Name: attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.attachments_id_seq', 1, false);


--
-- TOC entry 4691 (class 0 OID 0)
-- Dependencies: 199
-- Name: auth_sources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.auth_sources_id_seq', 1, false);


--
-- TOC entry 4692 (class 0 OID 0)
-- Dependencies: 268
-- Name: boards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.boards_id_seq', 1, false);


--
-- TOC entry 4693 (class 0 OID 0)
-- Dependencies: 261
-- Name: changes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.changes_id_seq', 1, false);


--
-- TOC entry 4694 (class 0 OID 0)
-- Dependencies: 259
-- Name: changesets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.changesets_id_seq', 1, false);


--
-- TOC entry 4695 (class 0 OID 0)
-- Dependencies: 322
-- Name: checklist_template_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.checklist_template_categories_id_seq', 1, false);


--
-- TOC entry 4696 (class 0 OID 0)
-- Dependencies: 324
-- Name: checklist_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.checklist_templates_id_seq', 1, false);


--
-- TOC entry 4697 (class 0 OID 0)
-- Dependencies: 320
-- Name: checklists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.checklists_id_seq', 1, false);


--
-- TOC entry 4698 (class 0 OID 0)
-- Dependencies: 241
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, false);


--
-- TOC entry 4699 (class 0 OID 0)
-- Dependencies: 326
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.contacts_id_seq', 1, false);


--
-- TOC entry 4700 (class 0 OID 0)
-- Dependencies: 350
-- Name: contacts_queries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.contacts_queries_id_seq', 1, false);


--
-- TOC entry 4701 (class 0 OID 0)
-- Dependencies: 348
-- Name: contacts_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.contacts_settings_id_seq', 1, false);


--
-- TOC entry 4702 (class 0 OID 0)
-- Dependencies: 294
-- Name: custom_field_enumerations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.custom_field_enumerations_id_seq', 1, false);


--
-- TOC entry 4703 (class 0 OID 0)
-- Dependencies: 201
-- Name: custom_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.custom_fields_id_seq', 1, false);


--
-- TOC entry 4704 (class 0 OID 0)
-- Dependencies: 205
-- Name: custom_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.custom_values_id_seq', 1, false);


--
-- TOC entry 4705 (class 0 OID 0)
-- Dependencies: 333
-- Name: deal_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.deal_categories_id_seq', 1, false);


--
-- TOC entry 4706 (class 0 OID 0)
-- Dependencies: 335
-- Name: deal_processes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.deal_processes_id_seq', 1, false);


--
-- TOC entry 4707 (class 0 OID 0)
-- Dependencies: 337
-- Name: deal_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.deal_statuses_id_seq', 1, false);


--
-- TOC entry 4708 (class 0 OID 0)
-- Dependencies: 331
-- Name: deals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.deals_id_seq', 1, false);


--
-- TOC entry 4709 (class 0 OID 0)
-- Dependencies: 354
-- Name: deals_issues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.deals_issues_id_seq', 1, false);


--
-- TOC entry 4710 (class 0 OID 0)
-- Dependencies: 376
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.departments_id_seq', 1, false);


--
-- TOC entry 4711 (class 0 OID 0)
-- Dependencies: 207
-- Name: documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.documents_id_seq', 1, false);


--
-- TOC entry 4712 (class 0 OID 0)
-- Dependencies: 298
-- Name: easy_entity_assignments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.easy_entity_assignments_id_seq', 1, false);


--
-- TOC entry 4713 (class 0 OID 0)
-- Dependencies: 306
-- Name: easy_instant_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.easy_instant_messages_id_seq', 1, false);


--
-- TOC entry 4714 (class 0 OID 0)
-- Dependencies: 296
-- Name: easy_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.easy_settings_id_seq', 1, false);


--
-- TOC entry 4715 (class 0 OID 0)
-- Dependencies: 287
-- Name: email_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.email_addresses_id_seq', 1, true);


--
-- TOC entry 4716 (class 0 OID 0)
-- Dependencies: 274
-- Name: enabled_modules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.enabled_modules_id_seq', 1, false);


--
-- TOC entry 4717 (class 0 OID 0)
-- Dependencies: 209
-- Name: enumerations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.enumerations_id_seq', 9, true);


--
-- TOC entry 4718 (class 0 OID 0)
-- Dependencies: 310
-- Name: eq_pinned_queries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.eq_pinned_queries_id_seq', 1, false);


--
-- TOC entry 4719 (class 0 OID 0)
-- Dependencies: 358
-- Name: expenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.expenses_id_seq', 1, false);


--
-- TOC entry 4720 (class 0 OID 0)
-- Dependencies: 366
-- Name: favorite_projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.favorite_projects_id_seq', 1, false);


--
-- TOC entry 4721 (class 0 OID 0)
-- Dependencies: 314
-- Name: global_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.global_roles_id_seq', 1, false);


--
-- TOC entry 4722 (class 0 OID 0)
-- Dependencies: 292
-- Name: import_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.import_items_id_seq', 1, false);


--
-- TOC entry 4723 (class 0 OID 0)
-- Dependencies: 290
-- Name: imports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.imports_id_seq', 1, false);


--
-- TOC entry 4724 (class 0 OID 0)
-- Dependencies: 360
-- Name: invoice_lines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.invoice_lines_id_seq', 1, false);


--
-- TOC entry 4725 (class 0 OID 0)
-- Dependencies: 362
-- Name: invoice_payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.invoice_payments_id_seq', 1, false);


--
-- TOC entry 4726 (class 0 OID 0)
-- Dependencies: 364
-- Name: invoice_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.invoice_templates_id_seq', 1, false);


--
-- TOC entry 4727 (class 0 OID 0)
-- Dependencies: 356
-- Name: invoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.invoices_id_seq', 1, false);


--
-- TOC entry 4728 (class 0 OID 0)
-- Dependencies: 211
-- Name: issue_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.issue_categories_id_seq', 1, false);


--
-- TOC entry 4729 (class 0 OID 0)
-- Dependencies: 416
-- Name: issue_reads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.issue_reads_id_seq', 1, false);


--
-- TOC entry 4730 (class 0 OID 0)
-- Dependencies: 266
-- Name: issue_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.issue_relations_id_seq', 1, false);


--
-- TOC entry 4731 (class 0 OID 0)
-- Dependencies: 213
-- Name: issue_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.issue_statuses_id_seq', 6, true);


--
-- TOC entry 4732 (class 0 OID 0)
-- Dependencies: 215
-- Name: issues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.issues_id_seq', 1, false);


--
-- TOC entry 4733 (class 0 OID 0)
-- Dependencies: 237
-- Name: journal_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.journal_details_id_seq', 1, false);


--
-- TOC entry 4734 (class 0 OID 0)
-- Dependencies: 235
-- Name: journals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.journals_id_seq', 1, false);


--
-- TOC entry 4735 (class 0 OID 0)
-- Dependencies: 281
-- Name: member_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.member_roles_id_seq', 1, false);


--
-- TOC entry 4736 (class 0 OID 0)
-- Dependencies: 217
-- Name: members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.members_id_seq', 1, false);


--
-- TOC entry 4737 (class 0 OID 0)
-- Dependencies: 270
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.messages_id_seq', 1, false);


--
-- TOC entry 4738 (class 0 OID 0)
-- Dependencies: 219
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.news_id_seq', 1, false);


--
-- TOC entry 4739 (class 0 OID 0)
-- Dependencies: 340
-- Name: notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.notes_id_seq', 1, false);


--
-- TOC entry 4740 (class 0 OID 0)
-- Dependencies: 277
-- Name: open_id_authentication_associations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.open_id_authentication_associations_id_seq', 1, false);


--
-- TOC entry 4741 (class 0 OID 0)
-- Dependencies: 279
-- Name: open_id_authentication_nonces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.open_id_authentication_nonces_id_seq', 1, false);


--
-- TOC entry 4742 (class 0 OID 0)
-- Dependencies: 372
-- Name: operation_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.operation_categories_id_seq', 1, false);


--
-- TOC entry 4743 (class 0 OID 0)
-- Dependencies: 374
-- Name: operation_objects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.operation_objects_id_seq', 1, false);


--
-- TOC entry 4744 (class 0 OID 0)
-- Dependencies: 370
-- Name: operations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.operations_id_seq', 1, false);


--
-- TOC entry 4745 (class 0 OID 0)
-- Dependencies: 392
-- Name: order_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.order_statuses_id_seq', 1, false);


--
-- TOC entry 4746 (class 0 OID 0)
-- Dependencies: 390
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- TOC entry 4747 (class 0 OID 0)
-- Dependencies: 380
-- Name: people_announcements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.people_announcements_id_seq', 1, false);


--
-- TOC entry 4748 (class 0 OID 0)
-- Dependencies: 384
-- Name: people_holidays_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.people_holidays_id_seq', 1, false);


--
-- TOC entry 4749 (class 0 OID 0)
-- Dependencies: 378
-- Name: people_information_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.people_information_user_id_seq', 1, false);


--
-- TOC entry 4750 (class 0 OID 0)
-- Dependencies: 382
-- Name: people_work_experiences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.people_work_experiences_id_seq', 1, false);


--
-- TOC entry 4751 (class 0 OID 0)
-- Dependencies: 396
-- Name: product_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.product_categories_id_seq', 1, false);


--
-- TOC entry 4752 (class 0 OID 0)
-- Dependencies: 388
-- Name: product_lines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.product_lines_id_seq', 1, false);


--
-- TOC entry 4753 (class 0 OID 0)
-- Dependencies: 394
-- Name: products_bundles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.products_bundles_id_seq', 1, false);


--
-- TOC entry 4754 (class 0 OID 0)
-- Dependencies: 386
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- TOC entry 4755 (class 0 OID 0)
-- Dependencies: 221
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.projects_id_seq', 1, false);


--
-- TOC entry 4756 (class 0 OID 0)
-- Dependencies: 243
-- Name: queries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.queries_id_seq', 1, false);


--
-- TOC entry 4757 (class 0 OID 0)
-- Dependencies: 308
-- Name: query_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.query_categories_id_seq', 1, false);


--
-- TOC entry 4758 (class 0 OID 0)
-- Dependencies: 406
-- Name: questions_answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.questions_answers_id_seq', 1, false);


--
-- TOC entry 4759 (class 0 OID 0)
-- Dependencies: 402
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.questions_id_seq', 1, false);


--
-- TOC entry 4760 (class 0 OID 0)
-- Dependencies: 404
-- Name: questions_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.questions_sections_id_seq', 1, false);


--
-- TOC entry 4761 (class 0 OID 0)
-- Dependencies: 408
-- Name: questions_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.questions_statuses_id_seq', 1, false);


--
-- TOC entry 4762 (class 0 OID 0)
-- Dependencies: 346
-- Name: recently_vieweds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.recently_vieweds_id_seq', 1, false);


--
-- TOC entry 4763 (class 0 OID 0)
-- Dependencies: 245
-- Name: repositories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.repositories_id_seq', 1, false);


--
-- TOC entry 4764 (class 0 OID 0)
-- Dependencies: 223
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.roles_id_seq', 5, true);


--
-- TOC entry 4765 (class 0 OID 0)
-- Dependencies: 302
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.sessions_id_seq', 1, false);


--
-- TOC entry 4766 (class 0 OID 0)
-- Dependencies: 247
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.settings_id_seq', 4, true);


--
-- TOC entry 4767 (class 0 OID 0)
-- Dependencies: 344
-- Name: taggings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.taggings_id_seq', 1, false);


--
-- TOC entry 4768 (class 0 OID 0)
-- Dependencies: 342
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.tags_id_seq', 1, false);


--
-- TOC entry 4769 (class 0 OID 0)
-- Dependencies: 257
-- Name: time_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.time_entries_id_seq', 1, false);


--
-- TOC entry 4770 (class 0 OID 0)
-- Dependencies: 225
-- Name: tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.tokens_id_seq', 5, true);


--
-- TOC entry 4771 (class 0 OID 0)
-- Dependencies: 227
-- Name: trackers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.trackers_id_seq', 3, true);


--
-- TOC entry 4772 (class 0 OID 0)
-- Dependencies: 412
-- Name: uc_browser_restrictions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.uc_browser_restrictions_id_seq', 1, false);


--
-- TOC entry 4773 (class 0 OID 0)
-- Dependencies: 410
-- Name: uc_periods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.uc_periods_id_seq', 1, false);


--
-- TOC entry 4774 (class 0 OID 0)
-- Dependencies: 414
-- Name: uc_restrictions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.uc_restrictions_id_seq', 1, false);


--
-- TOC entry 4775 (class 0 OID 0)
-- Dependencies: 239
-- Name: user_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.user_preferences_id_seq', 1, true);


--
-- TOC entry 4776 (class 0 OID 0)
-- Dependencies: 229
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- TOC entry 4777 (class 0 OID 0)
-- Dependencies: 231
-- Name: versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.versions_id_seq', 1, false);


--
-- TOC entry 4778 (class 0 OID 0)
-- Dependencies: 400
-- Name: viewings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.viewings_id_seq', 1, false);


--
-- TOC entry 4779 (class 0 OID 0)
-- Dependencies: 398
-- Name: votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.votes_id_seq', 1, false);


--
-- TOC entry 4780 (class 0 OID 0)
-- Dependencies: 263
-- Name: watchers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.watchers_id_seq', 1, false);


--
-- TOC entry 4781 (class 0 OID 0)
-- Dependencies: 255
-- Name: wiki_content_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.wiki_content_versions_id_seq', 1, false);


--
-- TOC entry 4782 (class 0 OID 0)
-- Dependencies: 253
-- Name: wiki_contents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.wiki_contents_id_seq', 1, false);


--
-- TOC entry 4783 (class 0 OID 0)
-- Dependencies: 251
-- Name: wiki_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.wiki_pages_id_seq', 1, false);


--
-- TOC entry 4784 (class 0 OID 0)
-- Dependencies: 272
-- Name: wiki_redirects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.wiki_redirects_id_seq', 1, false);


--
-- TOC entry 4785 (class 0 OID 0)
-- Dependencies: 249
-- Name: wikis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.wikis_id_seq', 1, false);


--
-- TOC entry 4786 (class 0 OID 0)
-- Dependencies: 233
-- Name: workflows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: redmine
--

SELECT pg_catalog.setval('public.workflows_id_seq', 144, true);


--
-- TOC entry 4134 (class 2606 OID 18208)
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- TOC entry 4007 (class 2606 OID 17658)
-- Name: acl_ajax_counters acl_ajax_counters_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.acl_ajax_counters
    ADD CONSTRAINT acl_ajax_counters_pkey PRIMARY KEY (id);


--
-- TOC entry 4099 (class 2606 OID 18047)
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- TOC entry 4035 (class 2606 OID 17767)
-- Name: agile_colors agile_colors_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.agile_colors
    ADD CONSTRAINT agile_colors_pkey PRIMARY KEY (id);


--
-- TOC entry 4031 (class 2606 OID 17754)
-- Name: agile_data agile_data_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.agile_data
    ADD CONSTRAINT agile_data_pkey PRIMARY KEY (id);


--
-- TOC entry 4003 (class 2606 OID 17635)
-- Name: api_log_for_plugins api_log_for_plugins_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.api_log_for_plugins
    ADD CONSTRAINT api_log_for_plugins_pkey PRIMARY KEY (id);


--
-- TOC entry 3791 (class 2606 OID 16412)
-- Name: attachments attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- TOC entry 3797 (class 2606 OID 16426)
-- Name: auth_sources auth_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.auth_sources
    ADD CONSTRAINT auth_sources_pkey PRIMARY KEY (id);


--
-- TOC entry 3950 (class 2606 OID 16989)
-- Name: boards boards_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.boards
    ADD CONSTRAINT boards_pkey PRIMARY KEY (id);


--
-- TOC entry 3935 (class 2606 OID 16934)
-- Name: changes changes_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.changes
    ADD CONSTRAINT changes_pkey PRIMARY KEY (id);


--
-- TOC entry 3928 (class 2606 OID 16920)
-- Name: changesets changesets_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.changesets
    ADD CONSTRAINT changesets_pkey PRIMARY KEY (id);


--
-- TOC entry 4041 (class 2606 OID 17798)
-- Name: checklist_template_categories checklist_template_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.checklist_template_categories
    ADD CONSTRAINT checklist_template_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4043 (class 2606 OID 17809)
-- Name: checklist_templates checklist_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.checklist_templates
    ADD CONSTRAINT checklist_templates_pkey PRIMARY KEY (id);


--
-- TOC entry 4039 (class 2606 OID 17786)
-- Name: checklists checklists_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.checklists
    ADD CONSTRAINT checklists_pkey PRIMARY KEY (id);


--
-- TOC entry 3891 (class 2606 OID 16761)
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- TOC entry 4046 (class 2606 OID 17838)
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- TOC entry 4095 (class 2606 OID 18000)
-- Name: contacts_queries contacts_queries_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.contacts_queries
    ADD CONSTRAINT contacts_queries_pkey PRIMARY KEY (id);


--
-- TOC entry 4092 (class 2606 OID 17983)
-- Name: contacts_settings contacts_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.contacts_settings
    ADD CONSTRAINT contacts_settings_pkey PRIMARY KEY (id);


--
-- TOC entry 3992 (class 2606 OID 17568)
-- Name: custom_field_enumerations custom_field_enumerations_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.custom_field_enumerations
    ADD CONSTRAINT custom_field_enumerations_pkey PRIMARY KEY (id);


--
-- TOC entry 3800 (class 2606 OID 16445)
-- Name: custom_fields custom_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.custom_fields
    ADD CONSTRAINT custom_fields_pkey PRIMARY KEY (id);


--
-- TOC entry 3806 (class 2606 OID 16469)
-- Name: custom_values custom_values_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.custom_values
    ADD CONSTRAINT custom_values_pkey PRIMARY KEY (id);


--
-- TOC entry 4067 (class 2606 OID 17890)
-- Name: deal_categories deal_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.deal_categories
    ADD CONSTRAINT deal_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4070 (class 2606 OID 17899)
-- Name: deal_processes deal_processes_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.deal_processes
    ADD CONSTRAINT deal_processes_pkey PRIMARY KEY (id);


--
-- TOC entry 4074 (class 2606 OID 17915)
-- Name: deal_statuses deal_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.deal_statuses
    ADD CONSTRAINT deal_statuses_pkey PRIMARY KEY (id);


--
-- TOC entry 4103 (class 2606 OID 18059)
-- Name: deals_issues deals_issues_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.deals_issues
    ADD CONSTRAINT deals_issues_pkey PRIMARY KEY (id);


--
-- TOC entry 4060 (class 2606 OID 17874)
-- Name: deals deals_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.deals
    ADD CONSTRAINT deals_pkey PRIMARY KEY (id);


--
-- TOC entry 4144 (class 2606 OID 18271)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- TOC entry 3810 (class 2606 OID 16483)
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- TOC entry 3998 (class 2606 OID 17611)
-- Name: easy_entity_assignments easy_entity_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.easy_entity_assignments
    ADD CONSTRAINT easy_entity_assignments_pkey PRIMARY KEY (id);


--
-- TOC entry 4009 (class 2606 OID 17669)
-- Name: easy_instant_messages easy_instant_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.easy_instant_messages
    ADD CONSTRAINT easy_instant_messages_pkey PRIMARY KEY (id);


--
-- TOC entry 3994 (class 2606 OID 17593)
-- Name: easy_settings easy_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.easy_settings
    ADD CONSTRAINT easy_settings_pkey PRIMARY KEY (id);


--
-- TOC entry 3984 (class 2606 OID 17486)
-- Name: email_addresses email_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.email_addresses
    ADD CONSTRAINT email_addresses_pkey PRIMARY KEY (id);


--
-- TOC entry 3965 (class 2606 OID 17050)
-- Name: enabled_modules enabled_modules_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.enabled_modules
    ADD CONSTRAINT enabled_modules_pkey PRIMARY KEY (id);


--
-- TOC entry 3815 (class 2606 OID 16494)
-- Name: enumerations enumerations_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.enumerations
    ADD CONSTRAINT enumerations_pkey PRIMARY KEY (id);


--
-- TOC entry 4016 (class 2606 OID 17701)
-- Name: eq_pinned_queries eq_pinned_queries_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.eq_pinned_queries
    ADD CONSTRAINT eq_pinned_queries_pkey PRIMARY KEY (id);


--
-- TOC entry 4115 (class 2606 OID 18091)
-- Name: expenses expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT expenses_pkey PRIMARY KEY (id);


--
-- TOC entry 4131 (class 2606 OID 18196)
-- Name: favorite_projects favorite_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.favorite_projects
    ADD CONSTRAINT favorite_projects_pkey PRIMARY KEY (id);


--
-- TOC entry 4026 (class 2606 OID 17743)
-- Name: global_roles global_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.global_roles
    ADD CONSTRAINT global_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3990 (class 2606 OID 17532)
-- Name: import_items import_items_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.import_items
    ADD CONSTRAINT import_items_pkey PRIMARY KEY (id);


--
-- TOC entry 3988 (class 2606 OID 17521)
-- Name: imports imports_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.imports
    ADD CONSTRAINT imports_pkey PRIMARY KEY (id);


--
-- TOC entry 4124 (class 2606 OID 18108)
-- Name: invoice_lines invoice_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.invoice_lines
    ADD CONSTRAINT invoice_lines_pkey PRIMARY KEY (id);


--
-- TOC entry 4127 (class 2606 OID 18134)
-- Name: invoice_payments invoice_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.invoice_payments
    ADD CONSTRAINT invoice_payments_pkey PRIMARY KEY (id);


--
-- TOC entry 4129 (class 2606 OID 18173)
-- Name: invoice_templates invoice_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.invoice_templates
    ADD CONSTRAINT invoice_templates_pkey PRIMARY KEY (id);


--
-- TOC entry 4113 (class 2606 OID 18074)
-- Name: invoices invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_pkey PRIMARY KEY (id);


--
-- TOC entry 3820 (class 2606 OID 16504)
-- Name: issue_categories issue_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.issue_categories
    ADD CONSTRAINT issue_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4228 (class 2606 OID 18572)
-- Name: issue_reads issue_reads_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.issue_reads
    ADD CONSTRAINT issue_reads_pkey PRIMARY KEY (id);


--
-- TOC entry 3948 (class 2606 OID 16972)
-- Name: issue_relations issue_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.issue_relations
    ADD CONSTRAINT issue_relations_pkey PRIMARY KEY (id);


--
-- TOC entry 3825 (class 2606 OID 16532)
-- Name: issue_statuses issue_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.issue_statuses
    ADD CONSTRAINT issue_statuses_pkey PRIMARY KEY (id);


--
-- TOC entry 3837 (class 2606 OID 16550)
-- Name: issues issues_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.issues
    ADD CONSTRAINT issues_pkey PRIMARY KEY (id);


--
-- TOC entry 3886 (class 2606 OID 16725)
-- Name: journal_details journal_details_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.journal_details
    ADD CONSTRAINT journal_details_pkey PRIMARY KEY (id);


--
-- TOC entry 3883 (class 2606 OID 16711)
-- Name: journals journals_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.journals
    ADD CONSTRAINT journals_pkey PRIMARY KEY (id);


--
-- TOC entry 3977 (class 2606 OID 17211)
-- Name: member_roles member_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.member_roles
    ADD CONSTRAINT member_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3843 (class 2606 OID 16562)
-- Name: members members_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- TOC entry 3959 (class 2606 OID 17003)
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- TOC entry 3847 (class 2606 OID 16576)
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- TOC entry 4080 (class 2606 OID 17933)
-- Name: notes notes_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);


--
-- TOC entry 3970 (class 2606 OID 17176)
-- Name: open_id_authentication_associations open_id_authentication_associations_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.open_id_authentication_associations
    ADD CONSTRAINT open_id_authentication_associations_pkey PRIMARY KEY (id);


--
-- TOC entry 3972 (class 2606 OID 17187)
-- Name: open_id_authentication_nonces open_id_authentication_nonces_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.open_id_authentication_nonces
    ADD CONSTRAINT open_id_authentication_nonces_pkey PRIMARY KEY (id);


--
-- TOC entry 4140 (class 2606 OID 18230)
-- Name: operation_categories operation_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.operation_categories
    ADD CONSTRAINT operation_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4142 (class 2606 OID 18241)
-- Name: operation_objects operation_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.operation_objects
    ADD CONSTRAINT operation_objects_pkey PRIMARY KEY (id);


--
-- TOC entry 4136 (class 2606 OID 18219)
-- Name: operations operations_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.operations
    ADD CONSTRAINT operations_pkey PRIMARY KEY (id);


--
-- TOC entry 4181 (class 2606 OID 18390)
-- Name: order_statuses order_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.order_statuses
    ADD CONSTRAINT order_statuses_pkey PRIMARY KEY (id);


--
-- TOC entry 4176 (class 2606 OID 18371)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 4150 (class 2606 OID 18304)
-- Name: people_announcements people_announcements_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.people_announcements
    ADD CONSTRAINT people_announcements_pkey PRIMARY KEY (id);


--
-- TOC entry 4155 (class 2606 OID 18327)
-- Name: people_holidays people_holidays_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.people_holidays
    ADD CONSTRAINT people_holidays_pkey PRIMARY KEY (id);


--
-- TOC entry 4148 (class 2606 OID 18284)
-- Name: people_information people_information_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.people_information
    ADD CONSTRAINT people_information_pkey PRIMARY KEY (user_id);


--
-- TOC entry 4153 (class 2606 OID 18315)
-- Name: people_work_experiences people_work_experiences_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.people_work_experiences
    ADD CONSTRAINT people_work_experiences_pkey PRIMARY KEY (id);


--
-- TOC entry 4189 (class 2606 OID 18416)
-- Name: product_categories product_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4167 (class 2606 OID 18356)
-- Name: product_lines product_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.product_lines
    ADD CONSTRAINT product_lines_pkey PRIMARY KEY (id);


--
-- TOC entry 4185 (class 2606 OID 18401)
-- Name: products_bundles products_bundles_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.products_bundles
    ADD CONSTRAINT products_bundles_pkey PRIMARY KEY (id);


--
-- TOC entry 4162 (class 2606 OID 18339)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3852 (class 2606 OID 16614)
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- TOC entry 3897 (class 2606 OID 16784)
-- Name: queries queries_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.queries
    ADD CONSTRAINT queries_pkey PRIMARY KEY (id);


--
-- TOC entry 4014 (class 2606 OID 17693)
-- Name: query_categories query_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.query_categories
    ADD CONSTRAINT query_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4213 (class 2606 OID 18495)
-- Name: questions_answers questions_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.questions_answers
    ADD CONSTRAINT questions_answers_pkey PRIMARY KEY (id);


--
-- TOC entry 4204 (class 2606 OID 18465)
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- TOC entry 4208 (class 2606 OID 18479)
-- Name: questions_sections questions_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.questions_sections
    ADD CONSTRAINT questions_sections_pkey PRIMARY KEY (id);


--
-- TOC entry 4217 (class 2606 OID 18510)
-- Name: questions_statuses questions_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.questions_statuses
    ADD CONSTRAINT questions_statuses_pkey PRIMARY KEY (id);


--
-- TOC entry 4090 (class 2606 OID 17970)
-- Name: recently_vieweds recently_vieweds_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.recently_vieweds
    ADD CONSTRAINT recently_vieweds_pkey PRIMARY KEY (id);


--
-- TOC entry 3900 (class 2606 OID 16797)
-- Name: repositories repositories_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.repositories
    ADD CONSTRAINT repositories_pkey PRIMARY KEY (id);


--
-- TOC entry 3854 (class 2606 OID 16623)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4005 (class 2606 OID 17647)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 3903 (class 2606 OID 16809)
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- TOC entry 4086 (class 2606 OID 17957)
-- Name: taggings taggings_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.taggings
    ADD CONSTRAINT taggings_pkey PRIMARY KEY (id);


--
-- TOC entry 4082 (class 2606 OID 17946)
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- TOC entry 3925 (class 2606 OID 16907)
-- Name: time_entries time_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.time_entries
    ADD CONSTRAINT time_entries_pkey PRIMARY KEY (id);


--
-- TOC entry 3857 (class 2606 OID 16634)
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3860 (class 2606 OID 16644)
-- Name: trackers trackers_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.trackers
    ADD CONSTRAINT trackers_pkey PRIMARY KEY (id);


--
-- TOC entry 4221 (class 2606 OID 18543)
-- Name: uc_browser_restrictions uc_browser_restrictions_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.uc_browser_restrictions
    ADD CONSTRAINT uc_browser_restrictions_pkey PRIMARY KEY (id);


--
-- TOC entry 4219 (class 2606 OID 18524)
-- Name: uc_periods uc_periods_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.uc_periods
    ADD CONSTRAINT uc_periods_pkey PRIMARY KEY (id);


--
-- TOC entry 4223 (class 2606 OID 18556)
-- Name: uc_restrictions uc_restrictions_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.uc_restrictions
    ADD CONSTRAINT uc_restrictions_pkey PRIMARY KEY (id);


--
-- TOC entry 3889 (class 2606 OID 16739)
-- Name: user_preferences user_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.user_preferences
    ADD CONSTRAINT user_preferences_pkey PRIMARY KEY (id);


--
-- TOC entry 3865 (class 2606 OID 16661)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3868 (class 2606 OID 16675)
-- Name: versions versions_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- TOC entry 4199 (class 2606 OID 18445)
-- Name: viewings viewings_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.viewings
    ADD CONSTRAINT viewings_pkey PRIMARY KEY (id);


--
-- TOC entry 4195 (class 2606 OID 18430)
-- Name: votes votes_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.votes
    ADD CONSTRAINT votes_pkey PRIMARY KEY (id);


--
-- TOC entry 3940 (class 2606 OID 16956)
-- Name: watchers watchers_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.watchers
    ADD CONSTRAINT watchers_pkey PRIMARY KEY (id);


--
-- TOC entry 3918 (class 2606 OID 16890)
-- Name: wiki_content_versions wiki_content_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.wiki_content_versions
    ADD CONSTRAINT wiki_content_versions_pkey PRIMARY KEY (id);


--
-- TOC entry 3915 (class 2606 OID 16876)
-- Name: wiki_contents wiki_contents_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.wiki_contents
    ADD CONSTRAINT wiki_contents_pkey PRIMARY KEY (id);


--
-- TOC entry 3910 (class 2606 OID 16863)
-- Name: wiki_pages wiki_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.wiki_pages
    ADD CONSTRAINT wiki_pages_pkey PRIMARY KEY (id);


--
-- TOC entry 3962 (class 2606 OID 17038)
-- Name: wiki_redirects wiki_redirects_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.wiki_redirects
    ADD CONSTRAINT wiki_redirects_pkey PRIMARY KEY (id);


--
-- TOC entry 3905 (class 2606 OID 16854)
-- Name: wikis wikis_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.wikis
    ADD CONSTRAINT wikis_pkey PRIMARY KEY (id);


--
-- TOC entry 3876 (class 2606 OID 16688)
-- Name: workflows workflows_pkey; Type: CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.workflows
    ADD CONSTRAINT workflows_pkey PRIMARY KEY (id);


--
-- TOC entry 3951 (class 1259 OID 16990)
-- Name: boards_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX boards_project_id ON public.boards USING btree (project_id);


--
-- TOC entry 3979 (class 1259 OID 17377)
-- Name: changeset_parents_changeset_ids; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX changeset_parents_changeset_ids ON public.changeset_parents USING btree (changeset_id);


--
-- TOC entry 3980 (class 1259 OID 17378)
-- Name: changeset_parents_parent_ids; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX changeset_parents_parent_ids ON public.changeset_parents USING btree (parent_id);


--
-- TOC entry 3936 (class 1259 OID 16935)
-- Name: changesets_changeset_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX changesets_changeset_id ON public.changes USING btree (changeset_id);


--
-- TOC entry 3942 (class 1259 OID 16960)
-- Name: changesets_issues_ids; Type: INDEX; Schema: public; Owner: redmine
--

CREATE UNIQUE INDEX changesets_issues_ids ON public.changesets_issues USING btree (changeset_id, issue_id);


--
-- TOC entry 3929 (class 1259 OID 17141)
-- Name: changesets_repos_rev; Type: INDEX; Schema: public; Owner: redmine
--

CREATE UNIQUE INDEX changesets_repos_rev ON public.changesets USING btree (repository_id, revision);


--
-- TOC entry 3930 (class 1259 OID 17311)
-- Name: changesets_repos_scmid; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX changesets_repos_scmid ON public.changesets USING btree (repository_id, scmid);


--
-- TOC entry 3982 (class 1259 OID 17452)
-- Name: custom_fields_roles_ids; Type: INDEX; Schema: public; Owner: redmine
--

CREATE UNIQUE INDEX custom_fields_roles_ids ON public.custom_fields_roles USING btree (custom_field_id, role_id);


--
-- TOC entry 3804 (class 1259 OID 17027)
-- Name: custom_values_customized; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX custom_values_customized ON public.custom_values USING btree (customized_type, customized_id);


--
-- TOC entry 3811 (class 1259 OID 16484)
-- Name: documents_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX documents_project_id ON public.documents USING btree (project_id);


--
-- TOC entry 3966 (class 1259 OID 17051)
-- Name: enabled_modules_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX enabled_modules_project_id ON public.enabled_modules USING btree (project_id);


--
-- TOC entry 3999 (class 1259 OID 17612)
-- Name: entity_assignment_idx; Type: INDEX; Schema: public; Owner: redmine
--

CREATE UNIQUE INDEX entity_assignment_idx ON public.easy_entity_assignments USING btree (entity_from_type, entity_from_id, entity_to_type, entity_to_id);


--
-- TOC entry 4000 (class 1259 OID 17613)
-- Name: entity_assignment_idx_from; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX entity_assignment_idx_from ON public.easy_entity_assignments USING btree (entity_from_id);


--
-- TOC entry 4001 (class 1259 OID 17614)
-- Name: entity_assignment_idx_to; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX entity_assignment_idx_to ON public.easy_entity_assignments USING btree (entity_to_id);


--
-- TOC entry 3978 (class 1259 OID 17215)
-- Name: groups_users_ids; Type: INDEX; Schema: public; Owner: redmine
--

CREATE UNIQUE INDEX groups_users_ids ON public.groups_users USING btree (group_id, user_id);


--
-- TOC entry 4100 (class 1259 OID 18049)
-- Name: index_addresses_on_address_type; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_addresses_on_address_type ON public.addresses USING btree (address_type);


--
-- TOC entry 4101 (class 1259 OID 18048)
-- Name: index_addresses_on_addressable_id_and_addressable_type; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_addresses_on_addressable_id_and_addressable_type ON public.addresses USING btree (addressable_id, addressable_type);


--
-- TOC entry 4036 (class 1259 OID 17768)
-- Name: index_agile_colors_on_container_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_agile_colors_on_container_id ON public.agile_colors USING btree (container_id);


--
-- TOC entry 4037 (class 1259 OID 17769)
-- Name: index_agile_colors_on_container_type; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_agile_colors_on_container_type ON public.agile_colors USING btree (container_type);


--
-- TOC entry 4032 (class 1259 OID 17772)
-- Name: index_agile_data_on_issue_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_agile_data_on_issue_id ON public.agile_data USING btree (issue_id);


--
-- TOC entry 4033 (class 1259 OID 17773)
-- Name: index_agile_data_on_position; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_agile_data_on_position ON public.agile_data USING btree ("position");


--
-- TOC entry 3792 (class 1259 OID 17258)
-- Name: index_attachments_on_author_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_attachments_on_author_id ON public.attachments USING btree (author_id);


--
-- TOC entry 3793 (class 1259 OID 17402)
-- Name: index_attachments_on_container_id_and_container_type; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_attachments_on_container_id_and_container_type ON public.attachments USING btree (container_id, container_type);


--
-- TOC entry 3794 (class 1259 OID 17273)
-- Name: index_attachments_on_created_on; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_attachments_on_created_on ON public.attachments USING btree (created_on);


--
-- TOC entry 3795 (class 1259 OID 17580)
-- Name: index_attachments_on_disk_filename; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_attachments_on_disk_filename ON public.attachments USING btree (disk_filename);


--
-- TOC entry 3798 (class 1259 OID 17230)
-- Name: index_auth_sources_on_id_and_type; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_auth_sources_on_id_and_type ON public.auth_sources USING btree (id, type);


--
-- TOC entry 3952 (class 1259 OID 17238)
-- Name: index_boards_on_last_message_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_boards_on_last_message_id ON public.boards USING btree (last_message_id);


--
-- TOC entry 3943 (class 1259 OID 17578)
-- Name: index_changesets_issues_on_issue_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_changesets_issues_on_issue_id ON public.changesets_issues USING btree (issue_id);


--
-- TOC entry 3931 (class 1259 OID 17268)
-- Name: index_changesets_on_committed_on; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_changesets_on_committed_on ON public.changesets USING btree (committed_on);


--
-- TOC entry 3932 (class 1259 OID 17234)
-- Name: index_changesets_on_repository_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_changesets_on_repository_id ON public.changesets USING btree (repository_id);


--
-- TOC entry 3933 (class 1259 OID 17233)
-- Name: index_changesets_on_user_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_changesets_on_user_id ON public.changesets USING btree (user_id);


--
-- TOC entry 4044 (class 1259 OID 17825)
-- Name: index_checklist_templates_on_tracker_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_checklist_templates_on_tracker_id ON public.checklist_templates USING btree (tracker_id);


--
-- TOC entry 3892 (class 1259 OID 17224)
-- Name: index_comments_on_author_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_comments_on_author_id ON public.comments USING btree (author_id);


--
-- TOC entry 3893 (class 1259 OID 17223)
-- Name: index_comments_on_commented_id_and_commented_type; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_comments_on_commented_id_and_commented_type ON public.comments USING btree (commented_id, commented_type);


--
-- TOC entry 4053 (class 1259 OID 17849)
-- Name: index_contacts_deals_on_contact_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_contacts_deals_on_contact_id ON public.contacts_deals USING btree (contact_id);


--
-- TOC entry 4054 (class 1259 OID 17848)
-- Name: index_contacts_deals_on_deal_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_contacts_deals_on_deal_id ON public.contacts_deals USING btree (deal_id);


--
-- TOC entry 4055 (class 1259 OID 17856)
-- Name: index_contacts_issues_on_contact_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_contacts_issues_on_contact_id ON public.contacts_issues USING btree (contact_id);


--
-- TOC entry 4056 (class 1259 OID 17855)
-- Name: index_contacts_issues_on_issue_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_contacts_issues_on_issue_id ON public.contacts_issues USING btree (issue_id);


--
-- TOC entry 4047 (class 1259 OID 17844)
-- Name: index_contacts_on_assigned_to_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_contacts_on_assigned_to_id ON public.contacts USING btree (assigned_to_id);


--
-- TOC entry 4048 (class 1259 OID 17839)
-- Name: index_contacts_on_author_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_contacts_on_author_id ON public.contacts USING btree (author_id);


--
-- TOC entry 4049 (class 1259 OID 17840)
-- Name: index_contacts_on_company; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_contacts_on_company ON public.contacts USING btree (company);


--
-- TOC entry 4050 (class 1259 OID 17842)
-- Name: index_contacts_on_email; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_contacts_on_email ON public.contacts USING btree (email);


--
-- TOC entry 4051 (class 1259 OID 17843)
-- Name: index_contacts_on_first_name; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_contacts_on_first_name ON public.contacts USING btree (first_name);


--
-- TOC entry 4052 (class 1259 OID 17841)
-- Name: index_contacts_on_is_company; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_contacts_on_is_company ON public.contacts USING btree (is_company);


--
-- TOC entry 4057 (class 1259 OID 17863)
-- Name: index_contacts_projects_on_contact_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_contacts_projects_on_contact_id ON public.contacts_projects USING btree (contact_id);


--
-- TOC entry 4058 (class 1259 OID 17862)
-- Name: index_contacts_projects_on_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_contacts_projects_on_project_id ON public.contacts_projects USING btree (project_id);


--
-- TOC entry 4096 (class 1259 OID 18001)
-- Name: index_contacts_queries_on_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_contacts_queries_on_project_id ON public.contacts_queries USING btree (project_id);


--
-- TOC entry 4097 (class 1259 OID 18002)
-- Name: index_contacts_queries_on_user_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_contacts_queries_on_user_id ON public.contacts_queries USING btree (user_id);


--
-- TOC entry 4093 (class 1259 OID 17984)
-- Name: index_contacts_settings_on_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_contacts_settings_on_project_id ON public.contacts_settings USING btree (project_id);


--
-- TOC entry 3801 (class 1259 OID 17249)
-- Name: index_custom_fields_on_id_and_type; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_custom_fields_on_id_and_type ON public.custom_fields USING btree (id, type);


--
-- TOC entry 3802 (class 1259 OID 17432)
-- Name: index_custom_fields_projects_on_custom_field_id_and_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE UNIQUE INDEX index_custom_fields_projects_on_custom_field_id_and_project_id ON public.custom_fields_projects USING btree (custom_field_id, project_id);


--
-- TOC entry 3803 (class 1259 OID 17431)
-- Name: index_custom_fields_trackers_on_custom_field_id_and_tracker_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE UNIQUE INDEX index_custom_fields_trackers_on_custom_field_id_and_tracker_id ON public.custom_fields_trackers USING btree (custom_field_id, tracker_id);


--
-- TOC entry 3807 (class 1259 OID 17636)
-- Name: index_custom_values_ccc; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_custom_values_ccc ON public.custom_values USING btree (customized_type, customized_id, custom_field_id);


--
-- TOC entry 3808 (class 1259 OID 17260)
-- Name: index_custom_values_on_custom_field_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_custom_values_on_custom_field_id ON public.custom_values USING btree (custom_field_id);


--
-- TOC entry 4068 (class 1259 OID 17891)
-- Name: index_deal_categories_on_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_deal_categories_on_project_id ON public.deal_categories USING btree (project_id);


--
-- TOC entry 4071 (class 1259 OID 17900)
-- Name: index_deal_processes_on_author_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_deal_processes_on_author_id ON public.deal_processes USING btree (author_id);


--
-- TOC entry 4072 (class 1259 OID 17901)
-- Name: index_deal_processes_on_deal_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_deal_processes_on_deal_id ON public.deal_processes USING btree (deal_id);


--
-- TOC entry 4075 (class 1259 OID 17922)
-- Name: index_deal_statuses_projects_on_project_id_and_deal_status_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_deal_statuses_projects_on_project_id_and_deal_status_id ON public.deal_statuses_projects USING btree (project_id, deal_status_id);


--
-- TOC entry 4104 (class 1259 OID 18061)
-- Name: index_deals_issues_on_deal_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_deals_issues_on_deal_id ON public.deals_issues USING btree (deal_id);


--
-- TOC entry 4105 (class 1259 OID 18060)
-- Name: index_deals_issues_on_issue_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_deals_issues_on_issue_id ON public.deals_issues USING btree (issue_id);


--
-- TOC entry 4061 (class 1259 OID 17878)
-- Name: index_deals_on_author_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_deals_on_author_id ON public.deals USING btree (author_id);


--
-- TOC entry 4062 (class 1259 OID 17879)
-- Name: index_deals_on_category_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_deals_on_category_id ON public.deals USING btree (category_id);


--
-- TOC entry 4063 (class 1259 OID 17875)
-- Name: index_deals_on_contact_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_deals_on_contact_id ON public.deals USING btree (contact_id);


--
-- TOC entry 4064 (class 1259 OID 17876)
-- Name: index_deals_on_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_deals_on_project_id ON public.deals USING btree (project_id);


--
-- TOC entry 4065 (class 1259 OID 17877)
-- Name: index_deals_on_status_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_deals_on_status_id ON public.deals USING btree (status_id);


--
-- TOC entry 4145 (class 1259 OID 18273)
-- Name: index_departments_on_head_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_departments_on_head_id ON public.departments USING btree (head_id);


--
-- TOC entry 4146 (class 1259 OID 18272)
-- Name: index_departments_on_parent_id_and_lft_and_rgt; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_departments_on_parent_id_and_lft_and_rgt ON public.departments USING btree (parent_id, lft, rgt);


--
-- TOC entry 3812 (class 1259 OID 17231)
-- Name: index_documents_on_category_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_documents_on_category_id ON public.documents USING btree (category_id);


--
-- TOC entry 3813 (class 1259 OID 17274)
-- Name: index_documents_on_created_on; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_documents_on_created_on ON public.documents USING btree (created_on);


--
-- TOC entry 4010 (class 1259 OID 17671)
-- Name: index_easy_instant_messages_on_recipient_id_and_sender_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_easy_instant_messages_on_recipient_id_and_sender_id ON public.easy_instant_messages USING btree (recipient_id, sender_id);


--
-- TOC entry 4011 (class 1259 OID 17682)
-- Name: index_easy_instant_messages_on_recipient_id_and_unread; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_easy_instant_messages_on_recipient_id_and_unread ON public.easy_instant_messages USING btree (recipient_id, unread);


--
-- TOC entry 4012 (class 1259 OID 17670)
-- Name: index_easy_instant_messages_on_sender_id_and_recipient_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_easy_instant_messages_on_sender_id_and_recipient_id ON public.easy_instant_messages USING btree (sender_id, recipient_id);


--
-- TOC entry 3995 (class 1259 OID 17600)
-- Name: index_easy_settings_on_name_and_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE UNIQUE INDEX index_easy_settings_on_name_and_project_id ON public.easy_settings USING btree (name, project_id);


--
-- TOC entry 3996 (class 1259 OID 17594)
-- Name: index_easy_settings_on_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_easy_settings_on_project_id ON public.easy_settings USING btree (project_id);


--
-- TOC entry 3985 (class 1259 OID 17487)
-- Name: index_email_addresses_on_user_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_email_addresses_on_user_id ON public.email_addresses USING btree (user_id);


--
-- TOC entry 3816 (class 1259 OID 17225)
-- Name: index_enumerations_on_id_and_type; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_enumerations_on_id_and_type ON public.enumerations USING btree (id, type);


--
-- TOC entry 3817 (class 1259 OID 17203)
-- Name: index_enumerations_on_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_enumerations_on_project_id ON public.enumerations USING btree (project_id);


--
-- TOC entry 4017 (class 1259 OID 17702)
-- Name: index_eq_pinned_queries_on_query_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_eq_pinned_queries_on_query_id ON public.eq_pinned_queries USING btree (query_id);


--
-- TOC entry 4018 (class 1259 OID 17703)
-- Name: index_eq_pinned_queries_on_query_id_and_user_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE UNIQUE INDEX index_eq_pinned_queries_on_query_id_and_user_id ON public.eq_pinned_queries USING btree (query_id, user_id);


--
-- TOC entry 4019 (class 1259 OID 17719)
-- Name: index_eq_queries_hide_in_projects_on_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_eq_queries_hide_in_projects_on_project_id ON public.eq_queries_hide_in_projects USING btree (project_id);


--
-- TOC entry 4020 (class 1259 OID 17718)
-- Name: index_eq_queries_hide_in_projects_on_query_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_eq_queries_hide_in_projects_on_query_id ON public.eq_queries_hide_in_projects USING btree (query_id);


--
-- TOC entry 4021 (class 1259 OID 17717)
-- Name: index_eq_queries_hide_in_projects_on_query_id_and_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE UNIQUE INDEX index_eq_queries_hide_in_projects_on_query_id_and_project_id ON public.eq_queries_hide_in_projects USING btree (query_id, project_id);


--
-- TOC entry 4022 (class 1259 OID 17725)
-- Name: index_eq_queries_show_in_projects_on_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_eq_queries_show_in_projects_on_project_id ON public.eq_queries_show_in_projects USING btree (project_id);


--
-- TOC entry 4023 (class 1259 OID 17724)
-- Name: index_eq_queries_show_in_projects_on_query_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_eq_queries_show_in_projects_on_query_id ON public.eq_queries_show_in_projects USING btree (query_id);


--
-- TOC entry 4024 (class 1259 OID 17723)
-- Name: index_eq_queries_show_in_projects_on_query_id_and_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE UNIQUE INDEX index_eq_queries_show_in_projects_on_query_id_and_project_id ON public.eq_queries_show_in_projects USING btree (query_id, project_id);


--
-- TOC entry 4116 (class 1259 OID 18123)
-- Name: index_expenses_on_assigned_to_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_expenses_on_assigned_to_id ON public.expenses USING btree (assigned_to_id);


--
-- TOC entry 4117 (class 1259 OID 18095)
-- Name: index_expenses_on_author_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_expenses_on_author_id ON public.expenses USING btree (author_id);


--
-- TOC entry 4118 (class 1259 OID 18092)
-- Name: index_expenses_on_contact_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_expenses_on_contact_id ON public.expenses USING btree (contact_id);


--
-- TOC entry 4119 (class 1259 OID 18093)
-- Name: index_expenses_on_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_expenses_on_project_id ON public.expenses USING btree (project_id);


--
-- TOC entry 4120 (class 1259 OID 18094)
-- Name: index_expenses_on_status_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_expenses_on_status_id ON public.expenses USING btree (status_id);


--
-- TOC entry 4132 (class 1259 OID 18197)
-- Name: index_favorite_projects_on_project_id_and_user_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_favorite_projects_on_project_id_and_user_id ON public.favorite_projects USING btree (project_id, user_id);


--
-- TOC entry 4027 (class 1259 OID 17745)
-- Name: index_global_roles_on_role_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_global_roles_on_role_id ON public.global_roles USING btree (role_id);


--
-- TOC entry 4028 (class 1259 OID 17744)
-- Name: index_global_roles_on_user_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_global_roles_on_user_id ON public.global_roles USING btree (user_id);


--
-- TOC entry 4029 (class 1259 OID 17746)
-- Name: index_global_roles_on_user_id_and_role_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_global_roles_on_user_id_and_role_id ON public.global_roles USING btree (user_id, role_id);


--
-- TOC entry 4121 (class 1259 OID 18109)
-- Name: index_invoice_lines_on_invoice_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_invoice_lines_on_invoice_id ON public.invoice_lines USING btree (invoice_id);


--
-- TOC entry 4122 (class 1259 OID 18188)
-- Name: index_invoice_lines_on_product_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_invoice_lines_on_product_id ON public.invoice_lines USING btree (product_id);


--
-- TOC entry 4125 (class 1259 OID 18135)
-- Name: index_invoice_payments_on_invoice_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_invoice_payments_on_invoice_id ON public.invoice_payments USING btree (invoice_id);


--
-- TOC entry 4106 (class 1259 OID 18078)
-- Name: index_invoices_on_assigned_to_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_invoices_on_assigned_to_id ON public.invoices USING btree (assigned_to_id);


--
-- TOC entry 4107 (class 1259 OID 18079)
-- Name: index_invoices_on_author_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_invoices_on_author_id ON public.invoices USING btree (author_id);


--
-- TOC entry 4108 (class 1259 OID 18075)
-- Name: index_invoices_on_contact_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_invoices_on_contact_id ON public.invoices USING btree (contact_id);


--
-- TOC entry 4109 (class 1259 OID 18162)
-- Name: index_invoices_on_order_number; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_invoices_on_order_number ON public.invoices USING btree (order_number);


--
-- TOC entry 4110 (class 1259 OID 18076)
-- Name: index_invoices_on_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_invoices_on_project_id ON public.invoices USING btree (project_id);


--
-- TOC entry 4111 (class 1259 OID 18077)
-- Name: index_invoices_on_status_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_invoices_on_status_id ON public.invoices USING btree (status_id);


--
-- TOC entry 3818 (class 1259 OID 17235)
-- Name: index_issue_categories_on_assigned_to_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_issue_categories_on_assigned_to_id ON public.issue_categories USING btree (assigned_to_id);


--
-- TOC entry 4224 (class 1259 OID 18574)
-- Name: index_issue_reads_on_issue_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_issue_reads_on_issue_id ON public.issue_reads USING btree (issue_id);


--
-- TOC entry 4225 (class 1259 OID 18573)
-- Name: index_issue_reads_on_user_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_issue_reads_on_user_id ON public.issue_reads USING btree (user_id);


--
-- TOC entry 4226 (class 1259 OID 18576)
-- Name: index_issue_reads_on_user_id_and_issue_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE UNIQUE INDEX index_issue_reads_on_user_id_and_issue_id ON public.issue_reads USING btree (user_id, issue_id);


--
-- TOC entry 3944 (class 1259 OID 17263)
-- Name: index_issue_relations_on_issue_from_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_issue_relations_on_issue_from_id ON public.issue_relations USING btree (issue_from_id);


--
-- TOC entry 3945 (class 1259 OID 17379)
-- Name: index_issue_relations_on_issue_from_id_and_issue_to_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE UNIQUE INDEX index_issue_relations_on_issue_from_id_and_issue_to_id ON public.issue_relations USING btree (issue_from_id, issue_to_id);


--
-- TOC entry 3946 (class 1259 OID 17264)
-- Name: index_issue_relations_on_issue_to_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_issue_relations_on_issue_to_id ON public.issue_relations USING btree (issue_to_id);


--
-- TOC entry 3822 (class 1259 OID 17299)
-- Name: index_issue_statuses_on_is_closed; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_issue_statuses_on_is_closed ON public.issue_statuses USING btree (is_closed);


--
-- TOC entry 3823 (class 1259 OID 17573)
-- Name: index_issue_statuses_on_position; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_issue_statuses_on_position ON public.issue_statuses USING btree ("position");


--
-- TOC entry 3826 (class 1259 OID 17242)
-- Name: index_issues_on_assigned_to_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_issues_on_assigned_to_id ON public.issues USING btree (assigned_to_id);


--
-- TOC entry 3827 (class 1259 OID 17246)
-- Name: index_issues_on_author_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_issues_on_author_id ON public.issues USING btree (author_id);


--
-- TOC entry 3828 (class 1259 OID 17241)
-- Name: index_issues_on_category_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_issues_on_category_id ON public.issues USING btree (category_id);


--
-- TOC entry 3829 (class 1259 OID 17271)
-- Name: index_issues_on_created_on; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_issues_on_created_on ON public.issues USING btree (created_on);


--
-- TOC entry 3830 (class 1259 OID 17243)
-- Name: index_issues_on_fixed_version_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_issues_on_fixed_version_id ON public.issues USING btree (fixed_version_id);


--
-- TOC entry 3831 (class 1259 OID 17579)
-- Name: index_issues_on_parent_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_issues_on_parent_id ON public.issues USING btree (parent_id);


--
-- TOC entry 3832 (class 1259 OID 17245)
-- Name: index_issues_on_priority_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_issues_on_priority_id ON public.issues USING btree (priority_id);


--
-- TOC entry 3833 (class 1259 OID 17312)
-- Name: index_issues_on_root_id_and_lft_and_rgt; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_issues_on_root_id_and_lft_and_rgt ON public.issues USING btree (root_id, lft, rgt);


--
-- TOC entry 3834 (class 1259 OID 17240)
-- Name: index_issues_on_status_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_issues_on_status_id ON public.issues USING btree (status_id);


--
-- TOC entry 3835 (class 1259 OID 17244)
-- Name: index_issues_on_tracker_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_issues_on_tracker_id ON public.issues USING btree (tracker_id);


--
-- TOC entry 3877 (class 1259 OID 17267)
-- Name: index_journals_on_created_on; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_journals_on_created_on ON public.journals USING btree (created_on);


--
-- TOC entry 3878 (class 1259 OID 17262)
-- Name: index_journals_on_journalized_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_journals_on_journalized_id ON public.journals USING btree (journalized_id);


--
-- TOC entry 3879 (class 1259 OID 18260)
-- Name: index_journals_on_updated_on; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_journals_on_updated_on ON public.journals USING btree (updated_on);


--
-- TOC entry 3880 (class 1259 OID 17261)
-- Name: index_journals_on_user_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_journals_on_user_id ON public.journals USING btree (user_id);


--
-- TOC entry 3973 (class 1259 OID 17577)
-- Name: index_member_roles_on_inherited_from; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_member_roles_on_inherited_from ON public.member_roles USING btree (inherited_from);


--
-- TOC entry 3974 (class 1259 OID 17236)
-- Name: index_member_roles_on_member_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_member_roles_on_member_id ON public.member_roles USING btree (member_id);


--
-- TOC entry 3975 (class 1259 OID 17237)
-- Name: index_member_roles_on_role_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_member_roles_on_role_id ON public.member_roles USING btree (role_id);


--
-- TOC entry 3839 (class 1259 OID 17248)
-- Name: index_members_on_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_members_on_project_id ON public.members USING btree (project_id);


--
-- TOC entry 3840 (class 1259 OID 17247)
-- Name: index_members_on_user_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_members_on_user_id ON public.members USING btree (user_id);


--
-- TOC entry 3841 (class 1259 OID 17314)
-- Name: index_members_on_user_id_and_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE UNIQUE INDEX index_members_on_user_id_and_project_id ON public.members USING btree (user_id, project_id);


--
-- TOC entry 3953 (class 1259 OID 17221)
-- Name: index_messages_on_author_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_messages_on_author_id ON public.messages USING btree (author_id);


--
-- TOC entry 3954 (class 1259 OID 17270)
-- Name: index_messages_on_created_on; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_messages_on_created_on ON public.messages USING btree (created_on);


--
-- TOC entry 3955 (class 1259 OID 17220)
-- Name: index_messages_on_last_reply_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_messages_on_last_reply_id ON public.messages USING btree (last_reply_id);


--
-- TOC entry 3844 (class 1259 OID 17254)
-- Name: index_news_on_author_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_news_on_author_id ON public.news USING btree (author_id);


--
-- TOC entry 3845 (class 1259 OID 17272)
-- Name: index_news_on_created_on; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_news_on_created_on ON public.news USING btree (created_on);


--
-- TOC entry 4076 (class 1259 OID 17935)
-- Name: index_notes_on_author_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_notes_on_author_id ON public.notes USING btree (author_id);


--
-- TOC entry 4077 (class 1259 OID 17934)
-- Name: index_notes_on_source_id_and_source_type; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_notes_on_source_id_and_source_type ON public.notes USING btree (source_id, source_type);


--
-- TOC entry 4078 (class 1259 OID 17985)
-- Name: index_notes_on_type_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_notes_on_type_id ON public.notes USING btree (type_id);


--
-- TOC entry 4137 (class 1259 OID 18250)
-- Name: index_operation_categories_on_lft; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_operation_categories_on_lft ON public.operation_categories USING btree (lft);


--
-- TOC entry 4138 (class 1259 OID 18251)
-- Name: index_operation_categories_on_rgt; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_operation_categories_on_rgt ON public.operation_categories USING btree (rgt);


--
-- TOC entry 4177 (class 1259 OID 18391)
-- Name: index_order_statuses_on_is_closed; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_order_statuses_on_is_closed ON public.order_statuses USING btree (is_closed);


--
-- TOC entry 4178 (class 1259 OID 18392)
-- Name: index_order_statuses_on_is_default; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_order_statuses_on_is_default ON public.order_statuses USING btree (is_default);


--
-- TOC entry 4179 (class 1259 OID 18393)
-- Name: index_order_statuses_on_position; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_order_statuses_on_position ON public.order_statuses USING btree ("position");


--
-- TOC entry 4168 (class 1259 OID 18372)
-- Name: index_orders_on_assigned_to_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_orders_on_assigned_to_id ON public.orders USING btree (assigned_to_id);


--
-- TOC entry 4169 (class 1259 OID 18373)
-- Name: index_orders_on_author_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_orders_on_author_id ON public.orders USING btree (author_id);


--
-- TOC entry 4170 (class 1259 OID 18377)
-- Name: index_orders_on_contact_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_orders_on_contact_id ON public.orders USING btree (contact_id);


--
-- TOC entry 4171 (class 1259 OID 18419)
-- Name: index_orders_on_number; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_orders_on_number ON public.orders USING btree (number);


--
-- TOC entry 4172 (class 1259 OID 18374)
-- Name: index_orders_on_order_date; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_orders_on_order_date ON public.orders USING btree (order_date);


--
-- TOC entry 4173 (class 1259 OID 18375)
-- Name: index_orders_on_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_orders_on_project_id ON public.orders USING btree (project_id);


--
-- TOC entry 4174 (class 1259 OID 18376)
-- Name: index_orders_on_status_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_orders_on_status_id ON public.orders USING btree (status_id);


--
-- TOC entry 4151 (class 1259 OID 18316)
-- Name: index_people_work_experiences_on_user_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_people_work_experiences_on_user_id ON public.people_work_experiences USING btree (user_id);


--
-- TOC entry 4186 (class 1259 OID 18417)
-- Name: index_product_categories_on_lft; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_product_categories_on_lft ON public.product_categories USING btree (lft);


--
-- TOC entry 4187 (class 1259 OID 18418)
-- Name: index_product_categories_on_rgt; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_product_categories_on_rgt ON public.product_categories USING btree (rgt);


--
-- TOC entry 4163 (class 1259 OID 18358)
-- Name: index_product_lines_on_container_id_and_container_type; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_product_lines_on_container_id_and_container_type ON public.product_lines USING btree (container_id, container_type);


--
-- TOC entry 4164 (class 1259 OID 18359)
-- Name: index_product_lines_on_position; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_product_lines_on_position ON public.product_lines USING btree ("position");


--
-- TOC entry 4165 (class 1259 OID 18357)
-- Name: index_product_lines_on_product_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_product_lines_on_product_id ON public.product_lines USING btree (product_id);


--
-- TOC entry 4182 (class 1259 OID 18402)
-- Name: index_products_bundles_on_bundle_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_products_bundles_on_bundle_id ON public.products_bundles USING btree (bundle_id);


--
-- TOC entry 4183 (class 1259 OID 18403)
-- Name: index_products_bundles_on_product_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_products_bundles_on_product_id ON public.products_bundles USING btree (product_id);


--
-- TOC entry 4156 (class 1259 OID 18341)
-- Name: index_products_on_author_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_products_on_author_id ON public.products USING btree (author_id);


--
-- TOC entry 4157 (class 1259 OID 18405)
-- Name: index_products_on_category_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_products_on_category_id ON public.products USING btree (category_id);


--
-- TOC entry 4158 (class 1259 OID 18404)
-- Name: index_products_on_code; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_products_on_code ON public.products USING btree (code);


--
-- TOC entry 4159 (class 1259 OID 18343)
-- Name: index_products_on_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_products_on_project_id ON public.products USING btree (project_id);


--
-- TOC entry 4160 (class 1259 OID 18342)
-- Name: index_products_on_status_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_products_on_status_id ON public.products USING btree (status_id);


--
-- TOC entry 3849 (class 1259 OID 17295)
-- Name: index_projects_on_lft; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_projects_on_lft ON public.projects USING btree (lft);


--
-- TOC entry 3850 (class 1259 OID 17296)
-- Name: index_projects_on_rgt; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_projects_on_rgt ON public.projects USING btree (rgt);


--
-- TOC entry 3894 (class 1259 OID 17250)
-- Name: index_queries_on_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_queries_on_project_id ON public.queries USING btree (project_id);


--
-- TOC entry 3895 (class 1259 OID 17251)
-- Name: index_queries_on_user_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_queries_on_user_id ON public.queries USING btree (user_id);


--
-- TOC entry 4209 (class 1259 OID 18498)
-- Name: index_questions_answers_on_accepted; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_questions_answers_on_accepted ON public.questions_answers USING btree (accepted);


--
-- TOC entry 4210 (class 1259 OID 18496)
-- Name: index_questions_answers_on_author_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_questions_answers_on_author_id ON public.questions_answers USING btree (author_id);


--
-- TOC entry 4211 (class 1259 OID 18497)
-- Name: index_questions_answers_on_question_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_questions_answers_on_question_id ON public.questions_answers USING btree (question_id);


--
-- TOC entry 4200 (class 1259 OID 18468)
-- Name: index_questions_on_author_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_questions_on_author_id ON public.questions USING btree (author_id);


--
-- TOC entry 4201 (class 1259 OID 18466)
-- Name: index_questions_on_section_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_questions_on_section_id ON public.questions USING btree (section_id);


--
-- TOC entry 4202 (class 1259 OID 18467)
-- Name: index_questions_on_status_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_questions_on_status_id ON public.questions USING btree (status_id);


--
-- TOC entry 4205 (class 1259 OID 18481)
-- Name: index_questions_sections_on_position; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_questions_sections_on_position ON public.questions_sections USING btree ("position");


--
-- TOC entry 4206 (class 1259 OID 18480)
-- Name: index_questions_sections_on_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_questions_sections_on_project_id ON public.questions_sections USING btree (project_id);


--
-- TOC entry 4214 (class 1259 OID 18511)
-- Name: index_questions_statuses_on_is_closed; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_questions_statuses_on_is_closed ON public.questions_statuses USING btree (is_closed);


--
-- TOC entry 4215 (class 1259 OID 18512)
-- Name: index_questions_statuses_on_position; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_questions_statuses_on_position ON public.questions_statuses USING btree ("position");


--
-- TOC entry 4087 (class 1259 OID 17971)
-- Name: index_recently_vieweds_on_viewed_id_and_viewed_type; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_recently_vieweds_on_viewed_id_and_viewed_type ON public.recently_vieweds USING btree (viewed_id, viewed_type);


--
-- TOC entry 4088 (class 1259 OID 17972)
-- Name: index_recently_vieweds_on_viewer_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_recently_vieweds_on_viewer_id ON public.recently_vieweds USING btree (viewer_id);


--
-- TOC entry 3898 (class 1259 OID 17222)
-- Name: index_repositories_on_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_repositories_on_project_id ON public.repositories USING btree (project_id);


--
-- TOC entry 3986 (class 1259 OID 17509)
-- Name: index_roles_managed_roles_on_role_id_and_managed_role_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE UNIQUE INDEX index_roles_managed_roles_on_role_id_and_managed_role_id ON public.roles_managed_roles USING btree (role_id, managed_role_id);


--
-- TOC entry 3901 (class 1259 OID 17297)
-- Name: index_settings_on_name; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_settings_on_name ON public.settings USING btree (name);


--
-- TOC entry 4083 (class 1259 OID 17958)
-- Name: index_taggings_on_tag_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_taggings_on_tag_id ON public.taggings USING btree (tag_id);


--
-- TOC entry 4084 (class 1259 OID 17959)
-- Name: index_taggings_on_taggable_id_and_taggable_type; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_taggings_on_taggable_id_and_taggable_type ON public.taggings USING btree (taggable_id, taggable_type);


--
-- TOC entry 3920 (class 1259 OID 17252)
-- Name: index_time_entries_on_activity_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_time_entries_on_activity_id ON public.time_entries USING btree (activity_id);


--
-- TOC entry 3921 (class 1259 OID 17275)
-- Name: index_time_entries_on_created_on; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_time_entries_on_created_on ON public.time_entries USING btree (created_on);


--
-- TOC entry 3922 (class 1259 OID 17253)
-- Name: index_time_entries_on_user_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_time_entries_on_user_id ON public.time_entries USING btree (user_id);


--
-- TOC entry 3855 (class 1259 OID 17232)
-- Name: index_tokens_on_user_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_tokens_on_user_id ON public.tokens USING btree (user_id);


--
-- TOC entry 3887 (class 1259 OID 17239)
-- Name: index_user_preferences_on_user_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_user_preferences_on_user_id ON public.user_preferences USING btree (user_id);


--
-- TOC entry 3861 (class 1259 OID 17256)
-- Name: index_users_on_auth_source_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_users_on_auth_source_id ON public.users USING btree (auth_source_id);


--
-- TOC entry 3862 (class 1259 OID 17255)
-- Name: index_users_on_id_and_type; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_users_on_id_and_type ON public.users USING btree (id, type);


--
-- TOC entry 3863 (class 1259 OID 17347)
-- Name: index_users_on_type; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_users_on_type ON public.users USING btree (type);


--
-- TOC entry 3866 (class 1259 OID 17294)
-- Name: index_versions_on_sharing; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_versions_on_sharing ON public.versions USING btree (sharing);


--
-- TOC entry 4196 (class 1259 OID 18447)
-- Name: index_viewings_on_viewed_type_and_viewed_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_viewings_on_viewed_type_and_viewed_id ON public.viewings USING btree (viewed_type, viewed_id);


--
-- TOC entry 4197 (class 1259 OID 18446)
-- Name: index_viewings_on_viewer_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_viewings_on_viewer_id ON public.viewings USING btree (viewer_id);


--
-- TOC entry 4190 (class 1259 OID 18432)
-- Name: index_votes_on_votable_id_and_votable_type_and_vote_scope; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_votes_on_votable_id_and_votable_type_and_vote_scope ON public.votes USING btree (votable_id, votable_type, vote_scope);


--
-- TOC entry 4191 (class 1259 OID 18434)
-- Name: index_votes_on_votable_type_and_vote_scope_and_vote_ip; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_votes_on_votable_type_and_vote_scope_and_vote_ip ON public.votes USING btree (votable_type, vote_scope, vote_ip);


--
-- TOC entry 4192 (class 1259 OID 18431)
-- Name: index_votes_on_voter_id_and_voter_type_and_vote_scope; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_votes_on_voter_id_and_voter_type_and_vote_scope ON public.votes USING btree (voter_id, voter_type, vote_scope);


--
-- TOC entry 4193 (class 1259 OID 18433)
-- Name: index_votes_on_voter_type_and_vote_scope_and_vote_ip; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_votes_on_voter_type_and_vote_scope_and_vote_ip ON public.votes USING btree (voter_type, vote_scope, vote_ip);


--
-- TOC entry 3937 (class 1259 OID 17228)
-- Name: index_watchers_on_user_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_watchers_on_user_id ON public.watchers USING btree (user_id);


--
-- TOC entry 3938 (class 1259 OID 17229)
-- Name: index_watchers_on_watchable_id_and_watchable_type; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_watchers_on_watchable_id_and_watchable_type ON public.watchers USING btree (watchable_id, watchable_type);


--
-- TOC entry 3916 (class 1259 OID 17269)
-- Name: index_wiki_content_versions_on_updated_on; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_wiki_content_versions_on_updated_on ON public.wiki_content_versions USING btree (updated_on);


--
-- TOC entry 3912 (class 1259 OID 17259)
-- Name: index_wiki_contents_on_author_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_wiki_contents_on_author_id ON public.wiki_contents USING btree (author_id);


--
-- TOC entry 3907 (class 1259 OID 17227)
-- Name: index_wiki_pages_on_parent_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_wiki_pages_on_parent_id ON public.wiki_pages USING btree (parent_id);


--
-- TOC entry 3908 (class 1259 OID 17226)
-- Name: index_wiki_pages_on_wiki_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_wiki_pages_on_wiki_id ON public.wiki_pages USING btree (wiki_id);


--
-- TOC entry 3960 (class 1259 OID 17265)
-- Name: index_wiki_redirects_on_wiki_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_wiki_redirects_on_wiki_id ON public.wiki_redirects USING btree (wiki_id);


--
-- TOC entry 3870 (class 1259 OID 17218)
-- Name: index_workflows_on_new_status_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_workflows_on_new_status_id ON public.workflows USING btree (new_status_id);


--
-- TOC entry 3871 (class 1259 OID 17216)
-- Name: index_workflows_on_old_status_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_workflows_on_old_status_id ON public.workflows USING btree (old_status_id);


--
-- TOC entry 3872 (class 1259 OID 17217)
-- Name: index_workflows_on_role_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_workflows_on_role_id ON public.workflows USING btree (role_id);


--
-- TOC entry 3873 (class 1259 OID 17576)
-- Name: index_workflows_on_tracker_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX index_workflows_on_tracker_id ON public.workflows USING btree (tracker_id);


--
-- TOC entry 3821 (class 1259 OID 16505)
-- Name: issue_categories_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX issue_categories_project_id ON public.issue_categories USING btree (project_id);


--
-- TOC entry 3838 (class 1259 OID 16551)
-- Name: issues_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX issues_project_id ON public.issues USING btree (project_id);


--
-- TOC entry 3884 (class 1259 OID 16727)
-- Name: journal_details_journal_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX journal_details_journal_id ON public.journal_details USING btree (journal_id);


--
-- TOC entry 3881 (class 1259 OID 16726)
-- Name: journals_journalized_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX journals_journalized_id ON public.journals USING btree (journalized_id, journalized_type);


--
-- TOC entry 3956 (class 1259 OID 17004)
-- Name: messages_board_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX messages_board_id ON public.messages USING btree (board_id);


--
-- TOC entry 3957 (class 1259 OID 17005)
-- Name: messages_parent_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX messages_parent_id ON public.messages USING btree (parent_id);


--
-- TOC entry 3848 (class 1259 OID 16577)
-- Name: news_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX news_project_id ON public.news USING btree (project_id);


--
-- TOC entry 3967 (class 1259 OID 17102)
-- Name: projects_trackers_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX projects_trackers_project_id ON public.projects_trackers USING btree (project_id);


--
-- TOC entry 3968 (class 1259 OID 17189)
-- Name: projects_trackers_unique; Type: INDEX; Schema: public; Owner: redmine
--

CREATE UNIQUE INDEX projects_trackers_unique ON public.projects_trackers USING btree (project_id, tracker_id);


--
-- TOC entry 3981 (class 1259 OID 17438)
-- Name: queries_roles_ids; Type: INDEX; Schema: public; Owner: redmine
--

CREATE UNIQUE INDEX queries_roles_ids ON public.queries_roles USING btree (query_id, role_id);


--
-- TOC entry 3923 (class 1259 OID 16909)
-- Name: time_entries_issue_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX time_entries_issue_id ON public.time_entries USING btree (issue_id);


--
-- TOC entry 3926 (class 1259 OID 16908)
-- Name: time_entries_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX time_entries_project_id ON public.time_entries USING btree (project_id);


--
-- TOC entry 3858 (class 1259 OID 17420)
-- Name: tokens_value; Type: INDEX; Schema: public; Owner: redmine
--

CREATE UNIQUE INDEX tokens_value ON public.tokens USING btree (value);


--
-- TOC entry 3789 (class 1259 OID 16392)
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: redmine
--

CREATE UNIQUE INDEX unique_schema_migrations ON public.schema_migrations USING btree (version);


--
-- TOC entry 3869 (class 1259 OID 16676)
-- Name: versions_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX versions_project_id ON public.versions USING btree (project_id);


--
-- TOC entry 3941 (class 1259 OID 17188)
-- Name: watchers_user_id_type; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX watchers_user_id_type ON public.watchers USING btree (user_id, watchable_type);


--
-- TOC entry 3919 (class 1259 OID 16891)
-- Name: wiki_content_versions_wcid; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX wiki_content_versions_wcid ON public.wiki_content_versions USING btree (wiki_content_id);


--
-- TOC entry 3913 (class 1259 OID 16877)
-- Name: wiki_contents_page_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX wiki_contents_page_id ON public.wiki_contents USING btree (page_id);


--
-- TOC entry 3911 (class 1259 OID 16864)
-- Name: wiki_pages_wiki_id_title; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX wiki_pages_wiki_id_title ON public.wiki_pages USING btree (wiki_id, title);


--
-- TOC entry 3963 (class 1259 OID 17039)
-- Name: wiki_redirects_wiki_id_title; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX wiki_redirects_wiki_id_title ON public.wiki_redirects USING btree (wiki_id, title);


--
-- TOC entry 3906 (class 1259 OID 16855)
-- Name: wikis_project_id; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX wikis_project_id ON public.wikis USING btree (project_id);


--
-- TOC entry 3874 (class 1259 OID 17123)
-- Name: wkfs_role_tracker_old_status; Type: INDEX; Schema: public; Owner: redmine
--

CREATE INDEX wkfs_role_tracker_old_status ON public.workflows USING btree (role_id, tracker_id, old_status_id);


--
-- TOC entry 4229 (class 2606 OID 17595)
-- Name: easy_settings fk_rails_31c4b01147; Type: FK CONSTRAINT; Schema: public; Owner: redmine
--

ALTER TABLE ONLY public.easy_settings
    ADD CONSTRAINT fk_rails_31c4b01147 FOREIGN KEY (project_id) REFERENCES public.projects(id);


-- Completed on 2018-08-15 09:08:24 UTC

--
-- PostgreSQL database dump complete
--

