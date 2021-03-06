PGDMP                  	        y           postgres    13.3    13.3 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    13442    postgres    DATABASE     e   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'German_Austria.1252';
    DROP DATABASE postgres;
                postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3281                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            �           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �            1259    34024    adresse    TABLE     �   CREATE TABLE public.adresse (
    adressenid integer NOT NULL,
    strasse character varying(255),
    plz integer,
    ort character varying(255),
    laengengrad integer,
    breitengrad integer,
    landid character varying(3)
);
    DROP TABLE public.adresse;
       public         heap    postgres    false            �            1259    34030    auto    TABLE     �   CREATE TABLE public.auto (
    kennzeichen character varying(10),
    zulassungsdatum date,
    fzklasse character varying(30),
    fid integer NOT NULL
);
    DROP TABLE public.auto;
       public         heap    postgres    false            �            1259    34033    beute    TABLE       CREATE TABLE public.beute (
    beuteid integer NOT NULL,
    bezeichnung character varying(255),
    wert numeric,
    beutetyp character varying(255),
    beschreibung character varying(255),
    verssum numeric,
    fotolink character varying,
    deliktid integer
);
    DROP TABLE public.beute;
       public         heap    postgres    false            �            1259    34039    delikt    TABLE     T  CREATE TABLE public.delikt (
    deliktid integer NOT NULL,
    erfassungszeitpunkt timestamp without time zone,
    beschreibung character varying(255),
    tatzeitvon time without time zone,
    tatzeitbis time without time zone,
    schadenshoehe numeric,
    status character varying,
    delikttypid integer,
    adressenid integer
);
    DROP TABLE public.delikt;
       public         heap    postgres    false            �            1259    34045 	   delikttyp    TABLE     l   CREATE TABLE public.delikttyp (
    delikttypid integer NOT NULL,
    bezeichnung character varying(255)
);
    DROP TABLE public.delikttyp;
       public         heap    postgres    false            �            1259    34048    dienststelle    TABLE     ~   CREATE TABLE public.dienststelle (
    dstelleid integer NOT NULL,
    name character varying(255),
    adressenid integer
);
     DROP TABLE public.dienststelle;
       public         heap    postgres    false            �            1259    34051    dienststellenzuteilung    TABLE     �   CREATE TABLE public.dienststellenzuteilung (
    persid integer NOT NULL,
    dstelleid integer NOT NULL,
    von date,
    bis date
);
 *   DROP TABLE public.dienststellenzuteilung;
       public         heap    postgres    false            �            1259    34054    ermitteltin    TABLE     `   CREATE TABLE public.ermitteltin (
    persid integer NOT NULL,
    deliktid integer NOT NULL
);
    DROP TABLE public.ermitteltin;
       public         heap    postgres    false            �            1259    34057 	   ermittler    TABLE     �   CREATE TABLE public.ermittler (
    verwgr character varying(3),
    dstgr character varying(10),
    bg numeric(7,2),
    persid integer NOT NULL,
    vorgesid integer
);
    DROP TABLE public.ermittler;
       public         heap    postgres    false            �            1259    34060    fahrrad    TABLE     U   CREATE TABLE public.fahrrad (
    rahmengroesse integer,
    fid integer NOT NULL
);
    DROP TABLE public.fahrrad;
       public         heap    postgres    false            �            1259    34063    fahrzeug    TABLE     �   CREATE TABLE public.fahrzeug (
    fid integer NOT NULL,
    farbe character varying(30),
    beschreibung character varying(255)
);
    DROP TABLE public.fahrzeug;
       public         heap    postgres    false            �            1259    34066    freiheitsstrafe    TABLE     �   CREATE TABLE public.freiheitsstrafe (
    haftdatum timestamp without time zone,
    enthaftdatum timestamp without time zone,
    jva integer,
    verurteilungid integer NOT NULL
);
 #   DROP TABLE public.freiheitsstrafe;
       public         heap    postgres    false            �            1259    34069 
   geldstrafe    TABLE     �   CREATE TABLE public.geldstrafe (
    tagessatz numeric(6,2),
    frist date,
    bezahldatum timestamp without time zone,
    verurteilungid integer NOT NULL
);
    DROP TABLE public.geldstrafe;
       public         heap    postgres    false            �            1259    34072    geschaedigter    TABLE     �   CREATE TABLE public.geschaedigter (
    beruf character varying(255),
    blutgruppe character varying(3),
    persid integer NOT NULL
);
 !   DROP TABLE public.geschaedigter;
       public         heap    postgres    false            �            1259    34075    grenztan    TABLE     p   CREATE TABLE public.grenztan (
    nationid character(3) NOT NULL,
    nachbarnationid character(3) NOT NULL
);
    DROP TABLE public.grenztan;
       public         heap    postgres    false            �            1259    34078    hatalibi    TABLE     �   CREATE TABLE public.hatalibi (
    vpersid integer NOT NULL,
    deliktid integer NOT NULL,
    beschreibung character varying(255),
    von timestamp without time zone,
    bis timestamp without time zone,
    zpersid integer
);
    DROP TABLE public.hatalibi;
       public         heap    postgres    false            �            1259    34081 
   hatmerkmal    TABLE     `   CREATE TABLE public.hatmerkmal (
    merkmalid integer NOT NULL,
    persid integer NOT NULL
);
    DROP TABLE public.hatmerkmal;
       public         heap    postgres    false            �            1259    34084    indiz    TABLE     �   CREATE TABLE public.indiz (
    indizid integer NOT NULL,
    beschreibung character varying(255),
    funddatum date,
    fundzeit time without time zone,
    zugelbeweis boolean,
    deliktid integer
);
    DROP TABLE public.indiz;
       public         heap    postgres    false            �            1259    34087    istbetroffen    TABLE     �   CREATE TABLE public.istbetroffen (
    persid integer NOT NULL,
    deliktid integer NOT NULL,
    rollbez character varying(255)
);
     DROP TABLE public.istbetroffen;
       public         heap    postgres    false            �            1259    34090    istfreundvon    TABLE     `   CREATE TABLE public.istfreundvon (
    persid integer NOT NULL,
    fpersid integer NOT NULL
);
     DROP TABLE public.istfreundvon;
       public         heap    postgres    false            �            1259    34093 
   istzeugein    TABLE     �   CREATE TABLE public.istzeugein (
    persid integer NOT NULL,
    deliktid integer NOT NULL,
    zaussage character varying(255),
    datum date,
    uhrzeit time without time zone
);
    DROP TABLE public.istzeugein;
       public         heap    postgres    false            �            1259    34102    land    TABLE     f   CREATE TABLE public.land (
    landid character(3) NOT NULL,
    bezeichnung character varying(50)
);
    DROP TABLE public.land;
       public         heap    postgres    false            �            1259    34096    merkmalstyp    TABLE     k   CREATE TABLE public.merkmalstyp (
    merkmalid integer NOT NULL,
    merkmaltyp character varying(125)
);
    DROP TABLE public.merkmalstyp;
       public         heap    postgres    false            �            1259    34099    motorrad    TABLE     |   CREATE TABLE public.motorrad (
    kennzeichen character varying(10),
    zulassungsdatum date,
    fid integer NOT NULL
);
    DROP TABLE public.motorrad;
       public         heap    postgres    false            �            1259    34105    nutzt    TABLE     �   CREATE TABLE public.nutzt (
    teamid integer NOT NULL,
    fid integer NOT NULL,
    von timestamp without time zone,
    bis timestamp without time zone
);
    DROP TABLE public.nutzt;
       public         heap    postgres    false            �            1259    34108    person    TABLE     Q  CREATE TABLE public.person (
    persid integer NOT NULL,
    vorname character varying(255),
    nachname character varying(255),
    geschlecht character(1),
    geburtsdatum date,
    telnr character varying(20),
    familienstand character varying(40),
    nationid character(3),
    adressenid integer,
    sprachid character(2)
);
    DROP TABLE public.person;
       public         heap    postgres    false            �            1259    34114    polizist    VIEW     �  CREATE VIEW public.polizist AS
 SELECT p.persid,
    p.vorname,
    p.nachname,
    p.geburtsdatum,
    e.verwgr,
    e.dstgr,
    e.bg,
    ( SELECT dienststellenzuteilung.dstelleid
           FROM public.dienststellenzuteilung
          WHERE ((dienststellenzuteilung.bis IS NULL) AND (p.persid = d.persid))) AS dstelleid
   FROM public.person p,
    public.ermittler e,
    public.dienststellenzuteilung d
  WHERE (p.persid = e.persid);
    DROP VIEW public.polizist;
       public          postgres    false    209    226    207    207    207    209    209    226    226    226    209            �            1259    34118    sprache    TABLE     g   CREATE TABLE public.sprache (
    sprachid character(2) NOT NULL,
    sprache character varying(20)
);
    DROP TABLE public.sprache;
       public         heap    postgres    false            �            1259    34121    spricht    TABLE     a   CREATE TABLE public.spricht (
    persid integer NOT NULL,
    sprachid character(2) NOT NULL
);
    DROP TABLE public.spricht;
       public         heap    postgres    false            �            1259    34124    verurteilung    TABLE     �   CREATE TABLE public.verurteilung (
    verurteilungid integer NOT NULL,
    datum date,
    strafmass integer,
    bedingt boolean,
    persid integer,
    deliktid integer
);
     DROP TABLE public.verurteilung;
       public         heap    postgres    false            �            1259    34127    taeter    VIEW     a  CREATE VIEW public.taeter AS
 SELECT p.persid,
    p.vorname,
    p.nachname,
    v.verurteilungid,
    v.strafmass,
    v.bedingt,
        CASE
            WHEN (v.verurteilungid = g.verurteilungid) THEN 'GS'::text
            WHEN (v.verurteilungid = f.verurteilungid) THEN 'FS'::text
            ELSE NULL::text
        END AS strafe,
    f.haftdatum,
    f.enthaftdatum,
    f.jva
   FROM public.person p,
    public.verurteilung v,
    public.geldstrafe g,
    public.freiheitsstrafe f
  WHERE ((p.persid = v.persid) AND ((v.verurteilungid = f.verurteilungid) OR (v.verurteilungid = g.verurteilungid)));
    DROP VIEW public.taeter;
       public          postgres    false    212    230    230    230    226    226    226    213    230    212    212    212            �            1259    34131    tatwerkzeug    TABLE     �   CREATE TABLE public.tatwerkzeug (
    tatwerkzeugid integer NOT NULL,
    werkzeugtyp character varying(125),
    bezeichnung character varying(255),
    beschreibung character varying(255)
);
    DROP TABLE public.tatwerkzeug;
       public         heap    postgres    false            �            1259    34137    zeuge    TABLE     ]   CREATE TABLE public.zeuge (
    beruf character varying(255),
    persid integer NOT NULL
);
    DROP TABLE public.zeuge;
       public         heap    postgres    false            �            1259    34140    tatzeuge    VIEW     �   CREATE VIEW public.tatzeuge AS
 SELECT p.persid,
    p.vorname,
    p.nachname,
    p.telnr,
    z.beruf
   FROM public.person p,
    public.zeuge z
  WHERE (p.persid = z.persid);
    DROP VIEW public.tatzeuge;
       public          postgres    false    226    226    233    233    226    226            �            1259    34144    team    TABLE     Z   CREATE TABLE public.team (
    teamid integer NOT NULL,
    name character varying(30)
);
    DROP TABLE public.team;
       public         heap    postgres    false            �            1259    34147    verdaechtiger    TABLE     �  CREATE TABLE public.verdaechtiger (
    groesse smallint,
    pseudonym character varying(255),
    bandenname character varying(255),
    beruf character varying(255),
    haarfarbe character varying(255),
    schuhgroesse character varying(255),
    augenfarbe character varying(255),
    blutgruppe character varying(3),
    fotolink character varying(255),
    fingerabdrucklink character varying(255),
    ergreifbel numeric(6,2),
    persid integer NOT NULL
);
 !   DROP TABLE public.verdaechtiger;
       public         heap    postgres    false            �            1259    34153    wirdverdaechtigt    TABLE     �   CREATE TABLE public.wirdverdaechtigt (
    persid integer NOT NULL,
    deliktid integer NOT NULL,
    motiv character varying(255)
);
 $   DROP TABLE public.wirdverdaechtigt;
       public         heap    postgres    false            �            1259    34156    wirdverwendet    TABLE     i   CREATE TABLE public.wirdverwendet (
    tatwerkzeugid integer NOT NULL,
    deliktid integer NOT NULL
);
 !   DROP TABLE public.wirdverwendet;
       public         heap    postgres    false            �          0    34024    adresse 
   TABLE DATA                 public          postgres    false    201   ��       �          0    34030    auto 
   TABLE DATA                 public          postgres    false    202   /�       �          0    34033    beute 
   TABLE DATA                 public          postgres    false    203   ,�       �          0    34039    delikt 
   TABLE DATA                 public          postgres    false    204   8�       �          0    34045 	   delikttyp 
   TABLE DATA                 public          postgres    false    205   ��       �          0    34048    dienststelle 
   TABLE DATA                 public          postgres    false    206   �       �          0    34051    dienststellenzuteilung 
   TABLE DATA                 public          postgres    false    207   �       �          0    34054    ermitteltin 
   TABLE DATA                 public          postgres    false    208   ��       �          0    34057 	   ermittler 
   TABLE DATA                 public          postgres    false    209   <�       �          0    34060    fahrrad 
   TABLE DATA                 public          postgres    false    210   ��       �          0    34063    fahrzeug 
   TABLE DATA                 public          postgres    false    211   q�       �          0    34066    freiheitsstrafe 
   TABLE DATA                 public          postgres    false    212   ��       �          0    34069 
   geldstrafe 
   TABLE DATA                 public          postgres    false    213   ��       �          0    34072    geschaedigter 
   TABLE DATA                 public          postgres    false    214   g�       �          0    34075    grenztan 
   TABLE DATA                 public          postgres    false    215    �       �          0    34078    hatalibi 
   TABLE DATA                 public          postgres    false    216   ��       �          0    34081 
   hatmerkmal 
   TABLE DATA                 public          postgres    false    217   �       �          0    34084    indiz 
   TABLE DATA                 public          postgres    false    218   ��       �          0    34087    istbetroffen 
   TABLE DATA                 public          postgres    false    219   ��       �          0    34090    istfreundvon 
   TABLE DATA                 public          postgres    false    220   �       �          0    34093 
   istzeugein 
   TABLE DATA                 public          postgres    false    221   ��       �          0    34102    land 
   TABLE DATA                 public          postgres    false    224   ��       �          0    34096    merkmalstyp 
   TABLE DATA                 public          postgres    false    222   ~�       �          0    34099    motorrad 
   TABLE DATA                 public          postgres    false    223   �       �          0    34105    nutzt 
   TABLE DATA                 public          postgres    false    225   ��       �          0    34108    person 
   TABLE DATA                 public          postgres    false    226   ��       �          0    34118    sprache 
   TABLE DATA                 public          postgres    false    228   F�       �          0    34121    spricht 
   TABLE DATA                 public          postgres    false    229   0�       �          0    34131    tatwerkzeug 
   TABLE DATA                 public          postgres    false    232   ��       �          0    34144    team 
   TABLE DATA                 public          postgres    false    235   j�       �          0    34147    verdaechtiger 
   TABLE DATA                 public          postgres    false    236   ��       �          0    34124    verurteilung 
   TABLE DATA                 public          postgres    false    230   ��       �          0    34153    wirdverdaechtigt 
   TABLE DATA                 public          postgres    false    237   �       �          0    34156    wirdverwendet 
   TABLE DATA                 public          postgres    false    238   ��       �          0    34137    zeuge 
   TABLE DATA                 public          postgres    false    233   v�       �           2606    34160    adresse adresse_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.adresse
    ADD CONSTRAINT adresse_pkey PRIMARY KEY (adressenid);
 >   ALTER TABLE ONLY public.adresse DROP CONSTRAINT adresse_pkey;
       public            postgres    false    201            �           2606    34162    auto auto_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY public.auto
    ADD CONSTRAINT auto_pkey PRIMARY KEY (fid);
 8   ALTER TABLE ONLY public.auto DROP CONSTRAINT auto_pkey;
       public            postgres    false    202            �           2606    34164    beute beute_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.beute
    ADD CONSTRAINT beute_pkey PRIMARY KEY (beuteid);
 :   ALTER TABLE ONLY public.beute DROP CONSTRAINT beute_pkey;
       public            postgres    false    203            �           2606    34166    delikt delikt_pkey1 
   CONSTRAINT     W   ALTER TABLE ONLY public.delikt
    ADD CONSTRAINT delikt_pkey1 PRIMARY KEY (deliktid);
 =   ALTER TABLE ONLY public.delikt DROP CONSTRAINT delikt_pkey1;
       public            postgres    false    204            �           2606    34168    delikttyp delikttyp_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.delikttyp
    ADD CONSTRAINT delikttyp_pkey PRIMARY KEY (delikttypid);
 B   ALTER TABLE ONLY public.delikttyp DROP CONSTRAINT delikttyp_pkey;
       public            postgres    false    205            �           2606    34170    dienststelle dienststelle_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.dienststelle
    ADD CONSTRAINT dienststelle_pkey PRIMARY KEY (dstelleid);
 H   ALTER TABLE ONLY public.dienststelle DROP CONSTRAINT dienststelle_pkey;
       public            postgres    false    206            �           2606    34172 2   dienststellenzuteilung dienststellenzuteilung_pkey 
   CONSTRAINT        ALTER TABLE ONLY public.dienststellenzuteilung
    ADD CONSTRAINT dienststellenzuteilung_pkey PRIMARY KEY (persid, dstelleid);
 \   ALTER TABLE ONLY public.dienststellenzuteilung DROP CONSTRAINT dienststellenzuteilung_pkey;
       public            postgres    false    207    207            �           2606    34174    ermitteltin ermitteltin_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.ermitteltin
    ADD CONSTRAINT ermitteltin_pkey PRIMARY KEY (persid, deliktid);
 F   ALTER TABLE ONLY public.ermitteltin DROP CONSTRAINT ermitteltin_pkey;
       public            postgres    false    208    208            �           2606    34176    ermittler ermittler_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.ermittler
    ADD CONSTRAINT ermittler_pkey PRIMARY KEY (persid);
 B   ALTER TABLE ONLY public.ermittler DROP CONSTRAINT ermittler_pkey;
       public            postgres    false    209            �           2606    34178    fahrrad fahrrad_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.fahrrad
    ADD CONSTRAINT fahrrad_pkey PRIMARY KEY (fid);
 >   ALTER TABLE ONLY public.fahrrad DROP CONSTRAINT fahrrad_pkey;
       public            postgres    false    210            �           2606    34180    fahrzeug fahrzeug_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.fahrzeug
    ADD CONSTRAINT fahrzeug_pkey PRIMARY KEY (fid);
 @   ALTER TABLE ONLY public.fahrzeug DROP CONSTRAINT fahrzeug_pkey;
       public            postgres    false    211            �           2606    34182 $   freiheitsstrafe freiheitsstrafe_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.freiheitsstrafe
    ADD CONSTRAINT freiheitsstrafe_pkey PRIMARY KEY (verurteilungid);
 N   ALTER TABLE ONLY public.freiheitsstrafe DROP CONSTRAINT freiheitsstrafe_pkey;
       public            postgres    false    212            �           2606    34184    geldstrafe geldstrafe_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.geldstrafe
    ADD CONSTRAINT geldstrafe_pkey PRIMARY KEY (verurteilungid);
 D   ALTER TABLE ONLY public.geldstrafe DROP CONSTRAINT geldstrafe_pkey;
       public            postgres    false    213            �           2606    34186     geschaedigter geschaedigter_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.geschaedigter
    ADD CONSTRAINT geschaedigter_pkey PRIMARY KEY (persid);
 J   ALTER TABLE ONLY public.geschaedigter DROP CONSTRAINT geschaedigter_pkey;
       public            postgres    false    214            �           2606    34188    grenztan grenztan_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.grenztan
    ADD CONSTRAINT grenztan_pkey PRIMARY KEY (nationid, nachbarnationid);
 @   ALTER TABLE ONLY public.grenztan DROP CONSTRAINT grenztan_pkey;
       public            postgres    false    215    215            �           2606    34190    hatalibi hatalibi_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.hatalibi
    ADD CONSTRAINT hatalibi_pkey PRIMARY KEY (vpersid, deliktid);
 @   ALTER TABLE ONLY public.hatalibi DROP CONSTRAINT hatalibi_pkey;
       public            postgres    false    216    216            �           2606    34192    hatmerkmal hatmerkmal_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.hatmerkmal
    ADD CONSTRAINT hatmerkmal_pkey PRIMARY KEY (merkmalid, persid);
 D   ALTER TABLE ONLY public.hatmerkmal DROP CONSTRAINT hatmerkmal_pkey;
       public            postgres    false    217    217            �           2606    34194    indiz indiz_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.indiz
    ADD CONSTRAINT indiz_pkey PRIMARY KEY (indizid);
 :   ALTER TABLE ONLY public.indiz DROP CONSTRAINT indiz_pkey;
       public            postgres    false    218            �           2606    34196    istbetroffen istbetroffen_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.istbetroffen
    ADD CONSTRAINT istbetroffen_pkey PRIMARY KEY (persid, deliktid);
 H   ALTER TABLE ONLY public.istbetroffen DROP CONSTRAINT istbetroffen_pkey;
       public            postgres    false    219    219            �           2606    34198    istfreundvon istfreundvon_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.istfreundvon
    ADD CONSTRAINT istfreundvon_pkey PRIMARY KEY (persid, fpersid);
 H   ALTER TABLE ONLY public.istfreundvon DROP CONSTRAINT istfreundvon_pkey;
       public            postgres    false    220    220            �           2606    34200    istzeugein istzeugein_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.istzeugein
    ADD CONSTRAINT istzeugein_pkey PRIMARY KEY (persid, deliktid);
 D   ALTER TABLE ONLY public.istzeugein DROP CONSTRAINT istzeugein_pkey;
       public            postgres    false    221    221            �           2606    34202    merkmalstyp merkmalstyp_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.merkmalstyp
    ADD CONSTRAINT merkmalstyp_pkey PRIMARY KEY (merkmalid);
 F   ALTER TABLE ONLY public.merkmalstyp DROP CONSTRAINT merkmalstyp_pkey;
       public            postgres    false    222            �           2606    34204    motorrad motorrad_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.motorrad
    ADD CONSTRAINT motorrad_pkey PRIMARY KEY (fid);
 @   ALTER TABLE ONLY public.motorrad DROP CONSTRAINT motorrad_pkey;
       public            postgres    false    223            �           2606    34206    land nation_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.land
    ADD CONSTRAINT nation_pkey PRIMARY KEY (landid);
 :   ALTER TABLE ONLY public.land DROP CONSTRAINT nation_pkey;
       public            postgres    false    224            �           2606    34208    nutzt nutzt_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.nutzt
    ADD CONSTRAINT nutzt_pkey PRIMARY KEY (teamid, fid);
 :   ALTER TABLE ONLY public.nutzt DROP CONSTRAINT nutzt_pkey;
       public            postgres    false    225    225            �           2606    34210    person person_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (persid);
 <   ALTER TABLE ONLY public.person DROP CONSTRAINT person_pkey;
       public            postgres    false    226            �           2606    34212    sprache sprache_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.sprache
    ADD CONSTRAINT sprache_pkey PRIMARY KEY (sprachid);
 >   ALTER TABLE ONLY public.sprache DROP CONSTRAINT sprache_pkey;
       public            postgres    false    228            �           2606    34214    spricht spricht_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.spricht
    ADD CONSTRAINT spricht_pkey PRIMARY KEY (persid, sprachid);
 >   ALTER TABLE ONLY public.spricht DROP CONSTRAINT spricht_pkey;
       public            postgres    false    229    229            �           2606    34216    tatwerkzeug tatwerkzeug_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.tatwerkzeug
    ADD CONSTRAINT tatwerkzeug_pkey PRIMARY KEY (tatwerkzeugid);
 F   ALTER TABLE ONLY public.tatwerkzeug DROP CONSTRAINT tatwerkzeug_pkey;
       public            postgres    false    232            �           2606    34218    team team_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.team
    ADD CONSTRAINT team_pkey PRIMARY KEY (teamid);
 8   ALTER TABLE ONLY public.team DROP CONSTRAINT team_pkey;
       public            postgres    false    235            �           2606    34220     verdaechtiger verdaechtiger_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.verdaechtiger
    ADD CONSTRAINT verdaechtiger_pkey PRIMARY KEY (persid);
 J   ALTER TABLE ONLY public.verdaechtiger DROP CONSTRAINT verdaechtiger_pkey;
       public            postgres    false    236            �           2606    34222    verurteilung verurteilung_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.verurteilung
    ADD CONSTRAINT verurteilung_pkey PRIMARY KEY (verurteilungid);
 H   ALTER TABLE ONLY public.verurteilung DROP CONSTRAINT verurteilung_pkey;
       public            postgres    false    230            �           2606    34224 &   wirdverdaechtigt wirdverdaechtigt_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.wirdverdaechtigt
    ADD CONSTRAINT wirdverdaechtigt_pkey PRIMARY KEY (persid, deliktid);
 P   ALTER TABLE ONLY public.wirdverdaechtigt DROP CONSTRAINT wirdverdaechtigt_pkey;
       public            postgres    false    237    237                        2606    34226     wirdverwendet wirdverwendet_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.wirdverwendet
    ADD CONSTRAINT wirdverwendet_pkey PRIMARY KEY (tatwerkzeugid, deliktid);
 J   ALTER TABLE ONLY public.wirdverwendet DROP CONSTRAINT wirdverwendet_pkey;
       public            postgres    false    238    238            �           2606    34228    zeuge zeuge_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.zeuge
    ADD CONSTRAINT zeuge_pkey PRIMARY KEY (persid);
 :   ALTER TABLE ONLY public.zeuge DROP CONSTRAINT zeuge_pkey;
       public            postgres    false    233                       2606    34229    dienststelle adressenid    FK CONSTRAINT     �   ALTER TABLE ONLY public.dienststelle
    ADD CONSTRAINT adressenid FOREIGN KEY (adressenid) REFERENCES public.adresse(adressenid);
 A   ALTER TABLE ONLY public.dienststelle DROP CONSTRAINT adressenid;
       public          postgres    false    206    201    3004                       2606    34234    auto auto_fid_fkey    FK CONSTRAINT     q   ALTER TABLE ONLY public.auto
    ADD CONSTRAINT auto_fid_fkey FOREIGN KEY (fid) REFERENCES public.fahrzeug(fid);
 <   ALTER TABLE ONLY public.auto DROP CONSTRAINT auto_fid_fkey;
       public          postgres    false    211    202    3024                       2606    34239 <   dienststellenzuteilung dienststellenzuteilung_dstelleid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dienststellenzuteilung
    ADD CONSTRAINT dienststellenzuteilung_dstelleid_fkey FOREIGN KEY (dstelleid) REFERENCES public.dienststelle(dstelleid);
 f   ALTER TABLE ONLY public.dienststellenzuteilung DROP CONSTRAINT dienststellenzuteilung_dstelleid_fkey;
       public          postgres    false    206    207    3014                       2606    34244 9   dienststellenzuteilung dienststellenzuteilung_persid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dienststellenzuteilung
    ADD CONSTRAINT dienststellenzuteilung_persid_fkey FOREIGN KEY (persid) REFERENCES public.ermittler(persid);
 c   ALTER TABLE ONLY public.dienststellenzuteilung DROP CONSTRAINT dienststellenzuteilung_persid_fkey;
       public          postgres    false    207    209    3020                       2606    34249 #   ermitteltin ermitteltin_persid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ermitteltin
    ADD CONSTRAINT ermitteltin_persid_fkey FOREIGN KEY (persid) REFERENCES public.ermittler(persid);
 M   ALTER TABLE ONLY public.ermitteltin DROP CONSTRAINT ermitteltin_persid_fkey;
       public          postgres    false    209    208    3020                       2606    34254 !   ermittler ermittler_vorgesid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ermittler
    ADD CONSTRAINT ermittler_vorgesid_fkey FOREIGN KEY (vorgesid) REFERENCES public.ermittler(persid);
 K   ALTER TABLE ONLY public.ermittler DROP CONSTRAINT ermittler_vorgesid_fkey;
       public          postgres    false    3020    209    209            	           2606    34259    fahrrad fahrrad_fid_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.fahrrad
    ADD CONSTRAINT fahrrad_fid_fkey FOREIGN KEY (fid) REFERENCES public.fahrzeug(fid);
 B   ALTER TABLE ONLY public.fahrrad DROP CONSTRAINT fahrrad_fid_fkey;
       public          postgres    false    3024    211    210            
           2606    34264 3   freiheitsstrafe freiheitsstrafe_verurteilungid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.freiheitsstrafe
    ADD CONSTRAINT freiheitsstrafe_verurteilungid_fkey FOREIGN KEY (verurteilungid) REFERENCES public.verurteilung(verurteilungid);
 ]   ALTER TABLE ONLY public.freiheitsstrafe DROP CONSTRAINT freiheitsstrafe_verurteilungid_fkey;
       public          postgres    false    3060    212    230                       2606    34269 )   geldstrafe geldstrafe_verurteilungid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.geldstrafe
    ADD CONSTRAINT geldstrafe_verurteilungid_fkey FOREIGN KEY (verurteilungid) REFERENCES public.verurteilung(verurteilungid);
 S   ALTER TABLE ONLY public.geldstrafe DROP CONSTRAINT geldstrafe_verurteilungid_fkey;
       public          postgres    false    213    3060    230                       2606    34274 &   grenztan grenztan_nachbarnationid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.grenztan
    ADD CONSTRAINT grenztan_nachbarnationid_fkey FOREIGN KEY (nachbarnationid) REFERENCES public.land(landid);
 P   ALTER TABLE ONLY public.grenztan DROP CONSTRAINT grenztan_nachbarnationid_fkey;
       public          postgres    false    215    224    3050                       2606    34279    grenztan grenztan_nationid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.grenztan
    ADD CONSTRAINT grenztan_nationid_fkey FOREIGN KEY (nationid) REFERENCES public.land(landid);
 I   ALTER TABLE ONLY public.grenztan DROP CONSTRAINT grenztan_nationid_fkey;
       public          postgres    false    3050    215    224                       2606    34284    hatalibi hatalibi_vpersid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.hatalibi
    ADD CONSTRAINT hatalibi_vpersid_fkey FOREIGN KEY (vpersid) REFERENCES public.verdaechtiger(persid);
 H   ALTER TABLE ONLY public.hatalibi DROP CONSTRAINT hatalibi_vpersid_fkey;
       public          postgres    false    216    236    3068                       2606    34289    hatalibi hatalibi_zpersid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.hatalibi
    ADD CONSTRAINT hatalibi_zpersid_fkey FOREIGN KEY (zpersid) REFERENCES public.zeuge(persid);
 H   ALTER TABLE ONLY public.hatalibi DROP CONSTRAINT hatalibi_zpersid_fkey;
       public          postgres    false    233    216    3064                       2606    34294 $   hatmerkmal hatmerkmal_merkmalid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.hatmerkmal
    ADD CONSTRAINT hatmerkmal_merkmalid_fkey FOREIGN KEY (merkmalid) REFERENCES public.merkmalstyp(merkmalid);
 N   ALTER TABLE ONLY public.hatmerkmal DROP CONSTRAINT hatmerkmal_merkmalid_fkey;
       public          postgres    false    217    3046    222                       2606    34299 !   hatmerkmal hatmerkmal_persid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.hatmerkmal
    ADD CONSTRAINT hatmerkmal_persid_fkey FOREIGN KEY (persid) REFERENCES public.verdaechtiger(persid);
 K   ALTER TABLE ONLY public.hatmerkmal DROP CONSTRAINT hatmerkmal_persid_fkey;
       public          postgres    false    236    217    3068                       2606    34304 %   istbetroffen istbetroffen_persid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.istbetroffen
    ADD CONSTRAINT istbetroffen_persid_fkey FOREIGN KEY (persid) REFERENCES public.geschaedigter(persid);
 O   ALTER TABLE ONLY public.istbetroffen DROP CONSTRAINT istbetroffen_persid_fkey;
       public          postgres    false    3030    219    214                       2606    34309 %   istfreundvon istfreundvon_persid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.istfreundvon
    ADD CONSTRAINT istfreundvon_persid_fkey FOREIGN KEY (persid) REFERENCES public.verdaechtiger(persid);
 O   ALTER TABLE ONLY public.istfreundvon DROP CONSTRAINT istfreundvon_persid_fkey;
       public          postgres    false    220    3068    236                       2606    34314 &   istfreundvon istfreundvon_persid_fkey1    FK CONSTRAINT     �   ALTER TABLE ONLY public.istfreundvon
    ADD CONSTRAINT istfreundvon_persid_fkey1 FOREIGN KEY (persid) REFERENCES public.verdaechtiger(persid);
 P   ALTER TABLE ONLY public.istfreundvon DROP CONSTRAINT istfreundvon_persid_fkey1;
       public          postgres    false    220    3068    236                       2606    34319 !   istzeugein istzeugein_persid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.istzeugein
    ADD CONSTRAINT istzeugein_persid_fkey FOREIGN KEY (persid) REFERENCES public.zeuge(persid);
 K   ALTER TABLE ONLY public.istzeugein DROP CONSTRAINT istzeugein_persid_fkey;
       public          postgres    false    233    3064    221                       2606    34324    motorrad motorrad_fid_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.motorrad
    ADD CONSTRAINT motorrad_fid_fkey FOREIGN KEY (fid) REFERENCES public.fahrzeug(fid);
 D   ALTER TABLE ONLY public.motorrad DROP CONSTRAINT motorrad_fid_fkey;
       public          postgres    false    211    223    3024                       2606    34329    adresse nationid    FK CONSTRAINT     q   ALTER TABLE ONLY public.adresse
    ADD CONSTRAINT nationid FOREIGN KEY (landid) REFERENCES public.land(landid);
 :   ALTER TABLE ONLY public.adresse DROP CONSTRAINT nationid;
       public          postgres    false    224    3050    201                       2606    34334    nutzt nutzt_fid_fkey    FK CONSTRAINT     s   ALTER TABLE ONLY public.nutzt
    ADD CONSTRAINT nutzt_fid_fkey FOREIGN KEY (fid) REFERENCES public.fahrzeug(fid);
 >   ALTER TABLE ONLY public.nutzt DROP CONSTRAINT nutzt_fid_fkey;
       public          postgres    false    225    211    3024                       2606    34339    nutzt nutzt_teamid_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY public.nutzt
    ADD CONSTRAINT nutzt_teamid_fkey FOREIGN KEY (teamid) REFERENCES public.team(teamid);
 A   ALTER TABLE ONLY public.nutzt DROP CONSTRAINT nutzt_teamid_fkey;
       public          postgres    false    225    3066    235            !           2606    34344    verdaechtiger persid    FK CONSTRAINT     w   ALTER TABLE ONLY public.verdaechtiger
    ADD CONSTRAINT persid FOREIGN KEY (persid) REFERENCES public.person(persid);
 >   ALTER TABLE ONLY public.verdaechtiger DROP CONSTRAINT persid;
       public          postgres    false    3054    236    226                       2606    34349    ermittler persid    FK CONSTRAINT     s   ALTER TABLE ONLY public.ermittler
    ADD CONSTRAINT persid FOREIGN KEY (persid) REFERENCES public.person(persid);
 :   ALTER TABLE ONLY public.ermittler DROP CONSTRAINT persid;
       public          postgres    false    209    226    3054                        2606    34354    zeuge persid    FK CONSTRAINT     o   ALTER TABLE ONLY public.zeuge
    ADD CONSTRAINT persid FOREIGN KEY (persid) REFERENCES public.person(persid);
 6   ALTER TABLE ONLY public.zeuge DROP CONSTRAINT persid;
       public          postgres    false    233    226    3054                       2606    34359    geschaedigter persid    FK CONSTRAINT     w   ALTER TABLE ONLY public.geschaedigter
    ADD CONSTRAINT persid FOREIGN KEY (persid) REFERENCES public.person(persid);
 >   ALTER TABLE ONLY public.geschaedigter DROP CONSTRAINT persid;
       public          postgres    false    3054    226    214                       2606    34364    person person_adressenid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_adressenid_fkey FOREIGN KEY (adressenid) REFERENCES public.adresse(adressenid);
 G   ALTER TABLE ONLY public.person DROP CONSTRAINT person_adressenid_fkey;
       public          postgres    false    226    3004    201                       2606    34369    person person_nationid_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_nationid_fkey FOREIGN KEY (nationid) REFERENCES public.land(landid);
 E   ALTER TABLE ONLY public.person DROP CONSTRAINT person_nationid_fkey;
       public          postgres    false    224    3050    226                       2606    34374    person person_sprachid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_sprachid_fkey FOREIGN KEY (sprachid) REFERENCES public.sprache(sprachid);
 E   ALTER TABLE ONLY public.person DROP CONSTRAINT person_sprachid_fkey;
       public          postgres    false    226    3056    228                       2606    34379    spricht spricht_persid_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.spricht
    ADD CONSTRAINT spricht_persid_fkey FOREIGN KEY (persid) REFERENCES public.person(persid);
 E   ALTER TABLE ONLY public.spricht DROP CONSTRAINT spricht_persid_fkey;
       public          postgres    false    3054    226    229                       2606    34384    spricht spricht_sprachid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.spricht
    ADD CONSTRAINT spricht_sprachid_fkey FOREIGN KEY (sprachid) REFERENCES public.sprache(sprachid);
 G   ALTER TABLE ONLY public.spricht DROP CONSTRAINT spricht_sprachid_fkey;
       public          postgres    false    229    3056    228                       2606    34389 %   verurteilung verurteilung_persid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.verurteilung
    ADD CONSTRAINT verurteilung_persid_fkey FOREIGN KEY (persid) REFERENCES public.verdaechtiger(persid);
 O   ALTER TABLE ONLY public.verurteilung DROP CONSTRAINT verurteilung_persid_fkey;
       public          postgres    false    236    3068    230            "           2606    34394 -   wirdverdaechtigt wirdverdaechtigt_persid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.wirdverdaechtigt
    ADD CONSTRAINT wirdverdaechtigt_persid_fkey FOREIGN KEY (persid) REFERENCES public.verdaechtiger(persid);
 W   ALTER TABLE ONLY public.wirdverdaechtigt DROP CONSTRAINT wirdverdaechtigt_persid_fkey;
       public          postgres    false    236    237    3068            #           2606    34399 .   wirdverwendet wirdverwendet_tatwerkzeugid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.wirdverwendet
    ADD CONSTRAINT wirdverwendet_tatwerkzeugid_fkey FOREIGN KEY (tatwerkzeugid) REFERENCES public.tatwerkzeug(tatwerkzeugid);
 X   ALTER TABLE ONLY public.wirdverwendet DROP CONSTRAINT wirdverwendet_tatwerkzeugid_fkey;
       public          postgres    false    238    232    3062            �   �  x����n�X��y
��8����Y�-qDSI�@v��DBhY��i�WY�kt���U#/�'骺����A"[���x�9U��e�UM���2ٟ����/�z��.�i|�ۮ���qh��U����x��m���������E������ɇ�Xeu�PWɤ>v�]����ݐ��&�L������/����r�R���$��x��&骙���7yh�����q�����&Q�@=rd�uV�M��D�0R"�Vx�����s��\2"-��S*;��)�]dL�����n�����%�9��B/��j��&N�R ���X���[O��^О^)�PY�ǧ�˛j�4�Zg��y�3BG���̟���æ}�t�Dz��aY���.��9N:u����l��~�N)��U�d��:�f/� +�����&vi�Bm��+h�Ө�j5ͪ:X Ӛ#��s]x��C]�@:��D(��2ͳ�������ݜx�aī��L�؎��������xl��\��OS��ߥ��tE��{)�Z�0k� �I5�*F�T�� ;Oo�jwh"\q�ut1H��b;�������\�2"�k�d�D��`*zl!��v.�xWHQ,hB�/��-E�۳8�n���~{���h�n~Iާe��2t�1�5+�jl��e��!����|ځX��j°(�s��<S��tV��JPCp����ӡ;W:�1���Ų�gA���Tl��<�����&���?����-E�"-���9J ��ѽ ��nv���� �J�Ui�~	�N�b�J����n�4Y>|�/
B%�H��ɠ�˳:+�i52�(�#�~��4C{i��x�o2�0���3�[0	H va��O�o%<ԓ���o��4PjiT)�ѓ@��?����7 V����ߪ�ZJJO��4�����F��A�z9�*�)�����j�7L�B53��E�.$Z�0o'ewu�d��.�L]�ʝ����4iG�o�(@M�8�eQ�8	�n �p�	�
Ӗ��P^��|�չW�4d��ܟ9�Җ,���KNB���q+�0|�U�)4�ӱ!����J>��P&���.��W���щe����w�{-���{��ʵ�F�V�ҿ�+��x�_�@�U3���?�����N��o��8x[��y��q����c��B�pq�}ܢ���t����b"���MQIz�TP��0	�K�[C�x���I��`��hE�Ԫⶰʁ�m���h���ю�{���8��M���o�Coq�I��6yQ���'U®0��H�̛�Ԫ������t�G_~`yo��ؖ��8��ŀ���b,؅�5��GǕ�}�O_^-k�y����GT�Н&y(o`��u�6	���L�4A�8F^`�����^[Ĵ�o����xX?�^�_�|v��`A���)�5�Z��o�1�|��=nm_x��d$�$�̐�>�뼑�]��pq�>0D.6A��a0N�E���l6OCu�4R�$4c��K2���Ǘ>�a��<�g�j�ϳ�5�������߭�J���"���e��c6�z`�@^����rz���p8u���['��9�5��u�*���-���*z�a��߿2[���ÙTi��g` tG�pUt�Jj}!��v���EĪ���� 	׸2��)u���}L� JZ0O�vog�;�֌q)ƣ�����>��3b<f���ò���./E�5�iZ�8͔��j���/0�o/���Iѳ��y>v4�y�)���o���111�6l4�2_,�4�]ec���ˆ�m ���.7�tPC���e8Od�h�1$�r���G��ƙ>��	���5x�D���u��ӺI�& ;k�N�To>�"�Zg}����=dīS�{ڄ����S'L�L��r!��a�&o��	��x�      �   �   x����n�@E�|�ۡ	�aF(W���ji"�=�T'�)LL�#��?��'��=osr������Oh���Rw
fw.e���ƥ��ʶ���^�N�|�w{�&�����+`�+����K}BѧHK[U��D�K'�V�a��`�6B?���Q^�4��z�$���Q !HK;Q�VHn�����t\����v�#KoJ7�O���kL���Ԕ�y2	-��醩�7۱����      �   �  x��T�r�0���9�q��hzJڔ2!� wa��5���OLx�>Foy��Ą2949���v�}�vw:_�>,�t���j����`'~�$dk�ƹ�2Yʸ#���ڭt�+���>��ږ!K+S	���% pc09e�׳�킝�B�W*�+)!YoE�N�|�%w\+s�SX��[�ʍ���ݚ `(u�@%ϓu�Hy��E<u>��;��O�O0�ܞ}SH��c����KR͋�J��6 �w`�#1�q^�x�He����V�a_��\2�W��;��AbM����p�j���T�v�KP���^���}�E`��-�βg��!�q�A��\&�S$�p7��qUI<h����� ���:|�z���hۋ@1�,@�"�_�xD�Pf�Gy�QPI�A��EՊ���(�d���_�	U pl�A���4�7�,���x��]��vω�~�F�a;�?���r^��璘�:�P�v��%�-Ȕ˴��U ϳ�</�_����b�      �   _  x��V�n�0��S���6v�j�%ꪥۮM�,��l�j}�]�zջ�X?�&jr�g>8�����ُG2��N�UR���
�r����!�6\�Jn�3��dn��^g
D��1���a'{����S�:�Ax��
�����޶��A����]����5u��u)s�O</��+�	��j�!I�5YTR���P�����g�T�Ŵ��y�á')(^m� we	k�wH�|������MN��" �>YADIV�T�Unl�����i��<�B[Ӳ�����=�ȥ���8p��J�
�q��bH���[��?ȴ%Ϧ&��}\��K��۶�KBBI��R����]/|������L�tp�X�����ީ�̏��}���w��q�b6	��?�h�|lʆLz�>O��7.Sñ1._� �0dq|QP�g|�z�i��k<�91��X��7�إх��@����'�)_ǁ7�i���Q��,�4���Y8����Qն5��-�n&;AKz<`�Ӟ4=�X�uV���/[��}4Ixw|U����<0�_�{�p����6 ;����w&�>�0��FQ���F�2�      �   4  x���MN�0F�=�wm�
�
bE�"�HM۽Ob+�DcDΓ3��.î��Y���)�e�ٲb�}a]FW'�n��������	�AW������i��l�-ش��*5R7�<��N���"��W�	�	�� �G�����zJ��}F~�C�P /#rÃ���P@�~r��MJ��2�B�^C� I��|��|4�{��7�Bn���D��4��! *m=`��j�Y�,��
��ɰx4��U���S�A8��dI��7�$�$T��sT�L:��6�)Z������:�|x��C      �   �   x���=O�0��=�ⶶR�b'ō�@T(
�����hO5n句�� 1�z���9[׭�˷t���Soi�2�.��Z���9�)��O,A�!�#3�����rSQ���d��{���=���㤄���]I��%k�p���v��֮�W$��V��m�v���aC�ٌ9^_@(5�3N/��'�x�tr�Hf��Q���<S�8.N�����=����΄�DU�+�dSZV:�B��p��q�k������h      �   �   x���v
Q���W((M��L�K�L�+.).I��Iͫ*-I��)�KW�(H-*�L�QH�H��e�y:
I�Ś
a�>���
�:
�:
�FF��@���36T״�򤲕f:
F`K-�V!�49�VZ­� [i���R�؀V����	�Nc���)�NCs���P;AL��\\ ���      �      x���v
Q���W((M��L�K-��,)I�)��S�(H-*�L�QHI���.�L�Ts�	uV�0�Q0Դ��$� 3#���Q0�� C�L0�Q0��`0�Q�����hIq0 ��� ����      �   �   x���A�0��⽩0dSH���0H�:d`&s��i����yn?�,I�K,���E#KO��Ժ
�Q�g�T����tB��B0>T-�s�z�y��c�~a#����d�w������yu���w[������v�p３b�q�?�BЅ#��9.m��hM#A�sn4�z�{�G      �   g   x���v
Q���W((M��L�KK�(*JLQ�(J��M�K/�O-.N�QH�L�Ts�	uV�02�Q0ִ��$W�����-t(q�� �| 2�h  �4cp      �   1  x���Kj�0�}N��0�Σ�J�)�ԅ汗��-,d3��e��1���*�����J�Ň��?J�m�ci�{c�Zor^�l����!�9
���X"(aM1c��f�l�4
Y�u�c� <�L0{�����N,A��o����X[#	��5h���|���* ���s�O�^~U]�Ҽm)��#��tY7I w�t�傦�3O��O�o���G��p��v��2D�{�/�H�LcG�ׅ�!T�2.vI!�U,\���"I/��eS.��i����c�ۖh��rT��T$w^�<|5&�݃��      �   �   x�����@�w����\M[@E'���;�g�<|~O8�t��_�6N��&�8����Ws��6gm��i���0<�=��)�w��.�B�KWue�����9�`�L���!a�� ��;�X���G/�9����1�͘��;O�LH-?�6I\}� �^�Q����G�t� ���E�����'N	�~�{�b��      �   �   x���1�0�w~�ې�5��
���@B0Qp/R������Ԑ�H�ro�����R����.���Tu��F���,U�J��5U�	䪗����{x��k����YV��C��gX1�F$`s��2a������7w�V��;Q��2N��6
��[����Rt)�S��M��bјd,c�$�☀��������3e��� ɋ��      �   �   x���v
Q���W((M��L�KO-N�HLM�L/I-R�HJ-*M�QH�)-I/*-(H�Q(H-*�L�Ts�	uV�P�=�-/9C]GA��IH�kZsyR�䐢�̼�"��N�@҂j&;�����@w9�Ѐj��^RTu���fT3�+��(/1'��l:���� t�R      �   |   x���v
Q���W((M��L�K/Jͫ*I�S��K,����L�Q�KL�HJ,�	h*�9���+h�����(�;{��kZsyRj�ch�8���0.8�d�Tj��2d*5��8��@㸸 �&|�      �   U  x��U�n�@}�W��d"���'���R)�T��O�
{��B%~&?�?�Y�6��H+{ul���9gg8�<�Na8�����R9{L���$ܯ�����1��w�Y�QFN�X� iX�}�������g, Z���E�*�hRQ0���(��k�9�3N8�!�܀������nXU�@��GhT0��2"�ށ�T�"�o�$_.��ק��ga��;����<��Q):���q�d#�rpS����E��K���U�A����Z%{��֩��.4)�Dl?J��P�D4��b��"�o�Qk��,��s��J�?$�z����� {�i�c��S$��'���D�h�z� �\��7p���D���᧴V��R�f��ۍ�!�Fy��(#�[R<�5Z�v.��b#��*�B�W�xE� Y`���1�8
�	�(����v{�܏#�o#+2D��j�I�%�&�7c���;���m���)i��l`�,�����^H��8�	o�/N7T�R���
�0IG���;����Np���,��ٵ����'�*A�σ��,��26�~�<c}Wq~
��=q�[���zw�	IBG      �   t   x���v
Q���W((M��L��H,�M-��M�QЀ22St
R��3S4�}B]�4u�4��<�6�HG�А"��&P��'(2�he� $�!idBiHS��@�� �_��      �   Q  x����J�0�������K���jBŁN�����ְZ%m�l��bf��\���B�]���b���+�X�ч�+U\�Z��t?%<�˦(�T��7Z�Zޚ��������ld��O�	Y�m�����_�M�C�(M�s�M�ۛ
(�� H��}��H��z�p�F�����D|L��)J�u�Ĭ���7R#!�.60�����Me���u$0�ּj,��
jf�x��kY��_V��G1�,#� ϙ+�`ر}����A��+��"� C8`��1tY�?pU��в���@�-�-�\��S��"	;c�]1�o[�;���'���K7� ���R      �   
   x���          �   �   x���v
Q���W((M��L��,.I+J-�K)��S�(H-*�L�QH�04�}B]�4u�5��<�6�HG��"�N0�����(󅁎�!e�0��Ђ2#�1�0:L(�Pc�#(�#S��@#�� Ijя      �   +  x����n�@��<��H$;�=5H!�
�}�����G��2�����2��k����������z�c�����P�;e]�>G���ƪ,��w���Z�#�q���45*w��O?k�F�"诹:5<)h����#�K���O�I�b��lVl8K���_z���5� �*���Ѐ��O ��{��ϖ�3n�Z��r���5��E�X��l���<�*A7'��c%��Vhr�s
eA{�`�!|�BU�EE�Jx�:����ǌ�+�u�?��b��JBϾ/K���7{�D<���3t=z�.]Hw�z2t�D�>sq�Ux�Bht-��IC�C|U��D���4NZ�m"�%���)|9���I�=<T��h]������}�E%�T��{�:s�~^w�{�Ӯ;pLU��7`���W:r'�D�s�1�U2���]���9���(��t�{�uzޞg���WǓ,��4�U����gA߶�+�0�lN���";[��)"uK�� RkK��B�>"Yɏ�{=\���N����      �   �   x���v
Q���W((M��L��I�KQ� ��):
I�U���y�y�
a�>���
��A�:
�.��%�� ���\���2���Ԣ"�
���_�����G�Q�!� �<Ks(3��������*�A\\ {�u�      �   �   x���v
Q���W((M��L��M-��M�).�,PЀr2St�L���B��O�k������z@fjQrf^���5�'e��9��$�hf)U�4�X��J�L�f�����e�`�)�<�ԤԢ����l��\\ �!��      �   �   x���=�@FўUL&|����+h��(�DDҰz!��[���a�E	��d�>��,�������4c�3��./����YזiӴս��o��٭�f����i�B�pת�TA��/1[*�TJ|��8#C�Y}�)�3�c�W����L�����A 	a����L�ba/�������(��+��      �   
   x���          �   9  x�͘_O�8�������l'��CEw10��ncZC� 'm���s��i2j�� I�6��9�ޟ}�4�y~�����k�(��ǗquU�7���*Wꍹ�R/������ua����/���s�l7WИ�tW�7����]�����J�0�;S�&��_�h���v��z3�o�
.�K���/��g������G3�&DMX�_�0�� �;�������<��?�����.��p]�Ƽ�ү�ak��鄲	S�F�KH9�Ŀ�3nm�Ӎi������H�&^�v:x�uA�S�'$�ު��TW��N��6;�ڙD*2�u��_�-?M1�2�^R�_e>�JR��<��4R�ܧ��l��|����X"���������l\y�B���vcCRߌ�o}�Z!$�6m�
���6ƽ��'����UJT�vۼu�?g6��,�ZT�t2S�k��d',m��H�*\׳Y�e�A��������!N|���!%S@W�C|}���"���f[g��өq;����S"[�R �D|<:�
�"�PJ���Ɩ�������#;d?V�R@W�<����`�^;[7�W�A�����)���H)�A�m���X�z�y2S׭����K3lJ��")d�E�����\�2w�ll�;��*d@@z��T�b'�RǺ���T3�0��S���0q��|3�����RF�e�&'Z���ǚ�y�-����.�����W,Vz�ބg�6���fX��->�ڻ��z(��F,{�H�!�$9՗be%*�^��L��B��ղ�'�&������O+*Q67~�Fk�t�0n5ڛ�����R9�%�C���+Wk�z�yЍv��3�VX��nT�ݡ�!�hrBq�=9b�H�e$�'�������ٴ�>����'D�=8@��0�Xىy�y4�Qӵ�hc�fhl@
v�;�M$�����â=N򔃳�c�ގ�)'Q֋��,� N���8�yșW�a{^�Fg-�oY����7	9:�o�4Vjbr
�Ǡ��h���~�*�k��H�	�]|c�&��pv���}�k3�9�C�{�!0�%2v�J�gK�	l�9      �   �   x���]
�@ �wO�o*H�_?�$d ��?�������JГ��Q<I��hކa��f׷� 9npDe�,�U%�qJ�4�EA�����!�}$�*$nISWq*����8���N�h铅�P��V�+�/b&��<�J-8�g���r��d�m�8e�	�Jk.�

�u>H�0�R9�p��A�[׾�m��Ԙf��Q�x�*�dҎ��ѵ���/3#c      �   �   x����
�@�|�vI ��M��Hq L�׋��#��7���.��v�k��ҋk������j�S��[����0��~C.����t�i!�J��o��@~��7��!_A����P��.�*�PKz�P��Z��0�Qw!-C�&5�~}�$_���      �   z  x���KN�@��=�wm��W�
D�UiA���L�$V�i5E�,�]/�'���؎5�'���W�����3��):sҕhv�z������ @a�e��4$6����ۧ��zC݅T�+�1�.�kgH�B�wFE���t�����a�f�8��H�����$0Em��k��v�@�����T9:��2(�X��H�1�o�����6�B���H.X��`�!Y�A}a(�1��v!����ɠ�]�*��fLS�6e;����q�ؕ]�PW�Y��{�x�Z���xq�j�g�(�����>�,��&kNO3iF�-e��.~A����Ki)�8���5��K���R��ߏ_&�����t�`���      �   
   x���          �   f  x�՗�n�6��y
dw���q�ia�~ �&�"I{Jc�E
#r�}�>IO��I:ԇaǉ۫.҈�D�ǿ�3Z���{�ۇ���R���)�R�$�&!�e�=Q��ck�yOH0197K$����@�[�(���1�	����%䋂�uV+�q��2&euRB��5��T����ev��{��tr���SKn���k~j->$֔��jm�B�SY}��2�γ��pJ�+���j��G�������j�����iH�`"�N�a8�ӷ?-:���/�ri+pJk���?��e5DI�M·;��w[���P2(މ�e��lK�@*ria3�ϳ��iF��D*�y��S��kL�A���+��pL��+��-�9K;P�(�~]!��8VNY3���X��)�ri�NE[�6�O�݂>��r/&���UQT�}HQ,LD+�����x��P�ݏ&�WÓm](��[�~ar�~U�ՔP��~�og�| Z2��w�eۨ����ؓ���c��S>K��u�aG�NF�n��p�B��r-ꦊꬰ.�l/}5������K�.��d�
-;�����c����Ѹik*A��wg=bܘ�0�����J���*��w��՞�	�97�X�q��+	�������Z�]5�ʇ�U���˕�kQ�W�	/�a��Ԙ�K{\������=��vu'=��e�g�e;	loT�jd����N�M�v���b#��$��KJZEq�/�⥄ȲNYۊŽ��k�1D�������jy�Q��Cһ�9�,�O
⏘Y��bM�=Cz'�w����z�c�u��m�T!��s�y�]��i(=}��k�}S.����ѿƂ��      �     x��Իn�0��=Oq6@�+۹����)J��Cc�Հ�/<mc"�{������t����n��p���M�`�6c��`9�2����L�y�Ͻsz0��'p�����G��Ͱ��u��la�	,�2E�ZP�� ��׬I�s�@F�o�I��u2I%5�%<�&E$��RP��r�Gw�`��R�Ze����"zX2L5��l����Q��R�.j�)8"��"�p*ؿ�6U�,*f�W�[T�(x�T2g�J9Y�*��%b��vi�F      �   �  x���Mn�@��>wN #��tՠna�@���DI�F����P��g�*;]�o����bf!~|�����6����F�Tx)/F���V9.�(M��=[�jE{�b��C��9��t�}�����p�_�6$!R���)�$�K4�q�/���Y�W+�Y^O��C}!?�RI%(Ԥ9qk(|�O�8�3m����Þ+�1Y��p�C�Y��B�kp�p��ΩF��'�ɢLIJ�3}q��,��4�rEo��.�i;�"��.ّ��˞n�;̉��o��C�z��ܰR�f���E��)[M.����k�l�m��V�f]� I+\RFw}��9��{�w1Uyg��Z��m��K�nN,��!�!�CĎ>�|��5��9��e�E/�oK����ap6=l/? �53o=Ҹ����]�o�K��T�����Å�O      �   �   x���M
�0�}N�-[��q墋�T�ս�AB�HHxz{���a���0��^�{����>��r@n!����>�%X^��Mq=/��D�t���SN�e����L%���*����m�d����L-���:B%3��l�R?�l��      �   �   x���v
Q���W((M��L֫J-MOU�HJ-*M�Q(H-*�L�Ts�	uV�P�I�(J-R�Q0Ѵ��$Y�ojrFb^f6�C��QZ\���1Œ,S܊2�o`L�a�Eه����a
4�� ݡh�     