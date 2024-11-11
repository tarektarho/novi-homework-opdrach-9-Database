/* Table creation */
CREATE DATABASE "TechItEasy"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LOCALE_PROVIDER = 'libc'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

CREATE TABLE public."user" (
    id BIGSERIAL PRIMARY KEY,
    username VARCHAR(55) UNIQUE NOT NULL,
    password VARCHAR(55) NOT NULL,
    address VARCHAR(55),
    role VARCHAR(55),
    salaryScale INTEGER,
    vacationDays INTEGER
);

CREATE TABLE public."product" (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(55) NOT NULL,
    brand VARCHAR(55),
    price DECIMAL(10,2),
    currentStock INTEGER,
    sold INTEGER,
    dateSold DATE,
    type VARCHAR(55)
);

COMMENT ON COLUMN public.product.type IS 'e.g., Television, RemoteController';

CREATE TABLE public."television" (
    id BIGSERIAL PRIMARY KEY,
    product_id BIGSERIAL,
    height DOUBLE PRECISION,
    width DOUBLE PRECISION,
    screenQuality VARCHAR(55),
    screenType VARCHAR(55),
    wifi BOOLEAN,
    smartTv BOOLEAN,
    voiceControl BOOLEAN,
    HDR BOOLEAN,
    FOREIGN KEY (product_id) REFERENCES public.product(id)
);

CREATE TABLE public."RemoteController" (
    id BIGSERIAL PRIMARY KEY,
    product_id BIGSERIAL,
    smart BOOLEAN,
    batteryType VARCHAR(55),
    FOREIGN KEY (product_id) REFERENCES public.product(id)
);

CREATE TABLE public."CIModule" (
    id BIGSERIAL PRIMARY KEY,
    product_id BIGSERIAL,
    provider VARCHAR(55),
    encoding VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES public.product(id)
);

CREATE TABLE public."WallBracket" (
    id BIGSERIAL PRIMARY KEY,
    product_id BIGSERIAL,
    adjustable BOOLEAN,
    mountingMethod VARCHAR(55),
    height DOUBLE PRECISION,
    width DOUBLE PRECISION,
    FOREIGN KEY (product_id) REFERENCES public.product(id)
);
