BEGIN;


CREATE TABLE IF NOT EXISTS public.adresses
(
    adress_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    country_id integer NOT NULL,
    user_id integer NOT NULL,
    city_id integer NOT NULL,
    postacode integer,
    street character varying COLLATE pg_catalog."default",
    title character varying COLLATE pg_catalog."default",
    CONSTRAINT adresses_pkey PRIMARY KEY (adress_id)
);

CREATE TABLE IF NOT EXISTS public.cart
(
    cart_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    costumer_id integer NOT NULL,
    "totalPrice" double precision NOT NULL,
    CONSTRAINT cart_pkey PRIMARY KEY (cart_id)
);

CREATE TABLE IF NOT EXISTS public.categories
(
    category_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT categories_pkey PRIMARY KEY (category_id)
);

CREATE TABLE IF NOT EXISTS public.cities
(
    city_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying COLLATE pg_catalog."default",
    "plateNumber" integer,
    CONSTRAINT cities_pkey PRIMARY KEY (city_id)
);

CREATE TABLE IF NOT EXISTS public.countries
(
    country_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT countries_pkey PRIMARY KEY (country_id)
);

CREATE TABLE IF NOT EXISTS public.customers
(
    id integer NOT NULL,
    email character varying COLLATE pg_catalog."default" NOT NULL,
    phone character varying COLLATE pg_catalog."default" NOT NULL,
    name character varying COLLATE pg_catalog."default" NOT NULL,
    costumer_id integer NOT NULL,
    "birthDay" date NOT NULL,
    gender character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT customers_pkey PRIMARY KEY (costumer_id)
);

CREATE TABLE IF NOT EXISTS public.deliveries
(
    deliveryid integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "orderDate" date NOT NULL,
    "deliveryCode" integer NOT NULL,
    CONSTRAINT deliveries_pkey PRIMARY KEY (deliveryid)
);

CREATE TABLE IF NOT EXISTS public."orderDeliveries"
(
    "orderDeliveriyid" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    deliveryid integer NOT NULL,
    orderid integer NOT NULL,
    CONSTRAINT "orderDeliveries_pkey" PRIMARY KEY ("orderDeliveriyid")
);

CREATE TABLE IF NOT EXISTS public."orderDetails"
(
    "orderDetailid" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    orderid integer NOT NULL,
    cart_id integer NOT NULL,
    CONSTRAINT "orderDetails_pkey" PRIMARY KEY ("orderDetailid")
);

CREATE TABLE IF NOT EXISTS public.orders
(
    orderid integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "orderDate" date,
    "paymentMethod" character varying COLLATE pg_catalog."default",
    "isCompleted" boolean,
    addressid integer NOT NULL,
    CONSTRAINT orders_pkey PRIMARY KEY (orderid)
);

CREATE TABLE IF NOT EXISTS public.payments
(
    paymentid integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    orderid integer NOT NULL,
    "isVerified" boolean NOT NULL,
    paymentstrype_id integer NOT NULL,
    CONSTRAINT payments_pkey PRIMARY KEY (paymentid)
);

CREATE TABLE IF NOT EXISTS public."paymentsTypes"
(
    paymentstrype_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "paymentType" character varying COLLATE pg_catalog."default" NOT NULL,
    description character varying COLLATE pg_catalog."default",
    CONSTRAINT "paymentsTypes_pkey" PRIMARY KEY (paymentstrype_id)
);

CREATE TABLE IF NOT EXISTS public."productCart"
(
    "productCartid" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    cart_id integer NOT NULL,
    product_id integer NOT NULL
);

CREATE TABLE IF NOT EXISTS public.products
(
    product_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying COLLATE pg_catalog."default" NOT NULL,
    price double precision NOT NULL,
    "discountRate" double precision NOT NULL,
    stock integer NOT NULL,
    supplierid integer NOT NULL,
    CONSTRAINT products_pkey PRIMARY KEY (product_id)
);

CREATE TABLE IF NOT EXISTS public.products_categories
(
    products_categoriesid integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    product_id integer NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT products_categories_pkey PRIMARY KEY (products_categoriesid)
);

CREATE TABLE IF NOT EXISTS public.suppliers
(
    id integer NOT NULL,
    email character varying COLLATE pg_catalog."default" NOT NULL,
    phone character varying COLLATE pg_catalog."default" NOT NULL,
    name character varying COLLATE pg_catalog."default" NOT NULL,
    supplierid integer NOT NULL,
    description character varying COLLATE pg_catalog."default",
    CONSTRAINT suppliers_pkey PRIMARY KEY (supplierid)
);

CREATE TABLE IF NOT EXISTS public."user"
(
    user_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    email character varying COLLATE pg_catalog."default" NOT NULL,
    phone character varying COLLATE pg_catalog."default" NOT NULL,
    name character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT user_pkey PRIMARY KEY (user_id)
);

ALTER TABLE IF EXISTS public.adresses
    ADD CONSTRAINT adresses_cities_fk FOREIGN KEY (city_id)
    REFERENCES public.cities (city_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.adresses
    ADD CONSTRAINT adresses_countries_fk FOREIGN KEY (country_id)
    REFERENCES public.countries (country_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.adresses
    ADD CONSTRAINT adresses_users_fk FOREIGN KEY (user_id)
    REFERENCES public."user" (user_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.cart
    ADD CONSTRAINT cart_customers_fk FOREIGN KEY (costumer_id)
    REFERENCES public.customers (costumer_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."orderDeliveries"
    ADD CONSTRAINT "orderDeliveries_deliveries_fk" FOREIGN KEY (deliveryid)
    REFERENCES public.deliveries (deliveryid) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public."orderDeliveries"
    ADD CONSTRAINT "orderDeliveries_orders_fk" FOREIGN KEY (orderid)
    REFERENCES public.orders (orderid) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public."orderDetails"
    ADD CONSTRAINT "orderDetails_cart_fk" FOREIGN KEY (cart_id)
    REFERENCES public.cart (cart_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public."orderDetails"
    ADD CONSTRAINT "orderDetails_orders_fk" FOREIGN KEY (orderid)
    REFERENCES public.orders (orderid) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.orders
    ADD CONSTRAINT orders_adresss_fk FOREIGN KEY (addressid)
    REFERENCES public.adresses (adress_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.payments
    ADD CONSTRAINT "payment_paymentTypes_fk" FOREIGN KEY (paymentstrype_id)
    REFERENCES public."paymentsTypes" (paymentstrype_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.payments
    ADD CONSTRAINT payments_orders_fk FOREIGN KEY (orderid)
    REFERENCES public.orders (orderid) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public."productCart"
    ADD CONSTRAINT "productCart_cart_fk" FOREIGN KEY (cart_id)
    REFERENCES public.cart (cart_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public."productCart"
    ADD CONSTRAINT "productCart_product_fk" FOREIGN KEY (product_id)
    REFERENCES public.products (product_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.products
    ADD CONSTRAINT products_supplier_fk FOREIGN KEY (supplierid)
    REFERENCES public.suppliers (supplierid) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.products_categories
    ADD CONSTRAINT "productCategories_product_fk" FOREIGN KEY (product_id)
    REFERENCES public.products (product_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.products_categories
    ADD CONSTRAINT "productsCategories_categories_fk" FOREIGN KEY (category_id)
    REFERENCES public.categories (category_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

END;