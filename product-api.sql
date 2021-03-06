PGDMP          '                z            product-api    13.6    13.6 +    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16394    product-api    DATABASE     q   CREATE DATABASE "product-api" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE "product-api";
                postgres    false            ?            1259    16462    image    TABLE     o  CREATE TABLE public.image (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    "position" integer NOT NULL,
    alt character varying,
    width double precision,
    height double precision,
    src text NOT NULL,
    admin_graphql_api_id character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone
);
    DROP TABLE public.image;
       public         heap    postgres    false            ?            1259    16460    image_id_seq    SEQUENCE     u   CREATE SEQUENCE public.image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.image_id_seq;
       public          postgres    false    209            ?           0    0    image_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;
          public          postgres    false    208            ?            1259    16448    option    TABLE        CREATE TABLE public.option (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    name character varying NOT NULL,
    "position" integer NOT NULL,
    "values" character varying[],
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone
);
    DROP TABLE public.option;
       public         heap    postgres    false            ?            1259    16446    option_id_seq    SEQUENCE     v   CREATE SEQUENCE public.option_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.option_id_seq;
       public          postgres    false    207            ?           0    0    option_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.option_id_seq OWNED BY public.option.id;
          public          postgres    false    206            ?            1259    16425    presentment_price    TABLE     7  CREATE TABLE public.presentment_price (
    id bigint NOT NULL,
    variant_id bigint NOT NULL,
    amount character varying,
    currency_code character varying NOT NULL,
    compare_at_price character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone
);
 %   DROP TABLE public.presentment_price;
       public         heap    postgres    false            ?            1259    16423    presentment_price_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.presentment_price_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.presentment_price_id_seq;
       public          postgres    false    205            ?           0    0    presentment_price_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.presentment_price_id_seq OWNED BY public.presentment_price.id;
          public          postgres    false    204            ?            1259    16397    product    TABLE     5  CREATE TABLE public.product (
    id bigint NOT NULL,
    title character varying(200) NOT NULL,
    body_html text,
    vendor character varying NOT NULL,
    product_type character varying NOT NULL,
    handle character varying,
    template_suffix character varying,
    status character varying,
    published_scope character varying NOT NULL,
    tags character varying,
    admin_graphql_api_id character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    published_at timestamp without time zone
);
    DROP TABLE public.product;
       public         heap    postgres    false            ?            1259    16395    product_id_seq    SEQUENCE     w   CREATE SEQUENCE public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    201            ?           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    200            ?            1259    16408    variant    TABLE     !  CREATE TABLE public.variant (
    id bigint NOT NULL,
    title character varying NOT NULL,
    price character varying NOT NULL,
    sku character varying NOT NULL,
    "position" bigint NOT NULL,
    inventory_policy character varying NOT NULL,
    compare_at_price character varying,
    fulfillment_service character varying NOT NULL,
    inventory_management character varying NOT NULL,
    option1 character varying,
    option2 character varying,
    option3 character varying,
    taxable boolean DEFAULT true NOT NULL,
    barcode character varying,
    grams bigint NOT NULL,
    image_id bigint,
    weight double precision NOT NULL,
    weight_unit character varying NOT NULL,
    inventory_item_id bigint NOT NULL,
    inventory_quantity integer,
    old_inventory_quantity integer,
    requires_shipping boolean NOT NULL,
    admin_graphql_api_id character varying,
    product_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    published_at timestamp without time zone
);
    DROP TABLE public.variant;
       public         heap    postgres    false            ?            1259    16406    variant_id_seq    SEQUENCE     w   CREATE SEQUENCE public.variant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.variant_id_seq;
       public          postgres    false    203            ?           0    0    variant_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.variant_id_seq OWNED BY public.variant.id;
          public          postgres    false    202            D           2604    16465    image id    DEFAULT     d   ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);
 7   ALTER TABLE public.image ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208    209            C           2604    16451 	   option id    DEFAULT     f   ALTER TABLE ONLY public.option ALTER COLUMN id SET DEFAULT nextval('public.option_id_seq'::regclass);
 8   ALTER TABLE public.option ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    207    207            B           2604    16428    presentment_price id    DEFAULT     |   ALTER TABLE ONLY public.presentment_price ALTER COLUMN id SET DEFAULT nextval('public.presentment_price_id_seq'::regclass);
 C   ALTER TABLE public.presentment_price ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205            ?           2604    16400 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    201    200    201            @           2604    16411 
   variant id    DEFAULT     h   ALTER TABLE ONLY public.variant ALTER COLUMN id SET DEFAULT nextval('public.variant_id_seq'::regclass);
 9   ALTER TABLE public.variant ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203            ?          0    16462    image 
   TABLE DATA           ?   COPY public.image (id, product_id, "position", alt, width, height, src, admin_graphql_api_id, created_at, updated_at) FROM stdin;
    public          postgres    false    209   ?7       ?          0    16448    option 
   TABLE DATA           d   COPY public.option (id, product_id, name, "position", "values", created_at, updated_at) FROM stdin;
    public          postgres    false    207   l8       ?          0    16425    presentment_price 
   TABLE DATA           |   COPY public.presentment_price (id, variant_id, amount, currency_code, compare_at_price, created_at, updated_at) FROM stdin;
    public          postgres    false    205   ?8       ?          0    16397    product 
   TABLE DATA           ?   COPY public.product (id, title, body_html, vendor, product_type, handle, template_suffix, status, published_scope, tags, admin_graphql_api_id, created_at, updated_at, published_at) FROM stdin;
    public          postgres    false    201   9       ?          0    16408    variant 
   TABLE DATA           ?  COPY public.variant (id, title, price, sku, "position", inventory_policy, compare_at_price, fulfillment_service, inventory_management, option1, option2, option3, taxable, barcode, grams, image_id, weight, weight_unit, inventory_item_id, inventory_quantity, old_inventory_quantity, requires_shipping, admin_graphql_api_id, product_id, created_at, updated_at, published_at) FROM stdin;
    public          postgres    false    203   :       ?           0    0    image_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.image_id_seq', 32, true);
          public          postgres    false    208            ?           0    0    option_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.option_id_seq', 12, true);
          public          postgres    false    206            ?           0    0    presentment_price_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.presentment_price_id_seq', 25, true);
          public          postgres    false    204            ?           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 21, true);
          public          postgres    false    200            ?           0    0    variant_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.variant_id_seq', 33, true);
          public          postgres    false    202            L           2606    16475    image image_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.image DROP CONSTRAINT image_pkey;
       public            postgres    false    209            J           2606    16433 (   presentment_price presentment_price_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.presentment_price
    ADD CONSTRAINT presentment_price_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.presentment_price DROP CONSTRAINT presentment_price_pkey;
       public            postgres    false    205            F           2606    16405    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    201            H           2606    16417    variant variant_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.variant
    ADD CONSTRAINT variant_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.variant DROP CONSTRAINT variant_pkey;
       public            postgres    false    203            M           2606    16481    variant image_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.variant
    ADD CONSTRAINT image_fk FOREIGN KEY (image_id) REFERENCES public.image(id) ON DELETE CASCADE NOT VALID;
 :   ALTER TABLE ONLY public.variant DROP CONSTRAINT image_fk;
       public          postgres    false    2892    203    209            P           2606    16455    option product_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.option
    ADD CONSTRAINT product_fk FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;
 ;   ALTER TABLE ONLY public.option DROP CONSTRAINT product_fk;
       public          postgres    false    207    2886    201            Q           2606    16469    image product_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.image
    ADD CONSTRAINT product_fk FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;
 :   ALTER TABLE ONLY public.image DROP CONSTRAINT product_fk;
       public          postgres    false    2886    201    209            N           2606    16497    variant product_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.variant
    ADD CONSTRAINT product_fk FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE NOT VALID;
 <   ALTER TABLE ONLY public.variant DROP CONSTRAINT product_fk;
       public          postgres    false    201    2886    203            O           2606    16434    presentment_price variant_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.presentment_price
    ADD CONSTRAINT variant_fk FOREIGN KEY (variant_id) REFERENCES public.variant(id) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.presentment_price DROP CONSTRAINT variant_fk;
       public          postgres    false    2888    205    203            ?   ?   x?-?I
?0@?ur
/??C? ?݈??46	?
?ނ?}<͂I??o?"
c?X?=?`?Q?5?0Ԙ6(0??T? ??jЍa???_?^ ???8Ĥr\.?39???uN,?䟃???n?2Ac?FM-
F?
?b<??4u?*G5?Ǟ암??/?      ?   A   x?34?42??,?I?4??v?ILή?4202?50?52P04?26?21?334317????????? ?v      ?   >   x?32?46?4???30?v????4202?50?52P04?26?21?33?055?r??qqq !?
;      ?   ?   x?uN?n? ??S?֥6??NjE??U?*C?,C8?dp??}1?ԩ????????8?Y?}???????C?3dܨ?\g????1?I????р o???`?UA???FpZ??????X?R?U+??X1? ?M?+~Z???yoSE?DW{??-!?|?ap??0?z7?+??{???	???Q?????!??????v??8//9???6u׼Tm?0?.??Ź*????i#      ?   ?   x?U??
?@??w??P????em?(W????t$z?4????8GHڼ|F??9?˞8???vw???????3???/3?^n?Y'fe?$!o?).}R? e??T?%???`lzk?? ?j*?5L޹??q"??G|?2K?k????e>c???6?     