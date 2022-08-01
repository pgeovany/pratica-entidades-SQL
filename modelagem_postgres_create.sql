CREATE TABLE "public.customers" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	CONSTRAINT "customers_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"price" int NOT NULL,
	"stock" integer NOT NULL DEFAULT '0',
	"size" varchar(3) NOT NULL,
	"category_id" integer NOT NULL,
	"main_image" TEXT NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.images" (
	"id" serial NOT NULL,
	"image_url" TEXT NOT NULL,
	"product_id" TEXT NOT NULL,
	CONSTRAINT "images_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.orders" (
	"id" serial NOT NULL,
	"customer_id" integer NOT NULL,
	"state" TEXT NOT NULL,
	"date" TIMESTAMP NOT NULL,
	"customer_address" TEXT NOT NULL,
	CONSTRAINT "orders_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.categories" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.order_products" (
	"id" serial NOT NULL,
	"product_id" integer NOT NULL,
	"order_id" integer NOT NULL,
	"quantity" integer NOT NULL,
	CONSTRAINT "order_products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("category_id") REFERENCES "categories"("id");

ALTER TABLE "images" ADD CONSTRAINT "images_fk0" FOREIGN KEY ("product_id") REFERENCES "products"("id");

ALTER TABLE "orders" ADD CONSTRAINT "orders_fk0" FOREIGN KEY ("customer_id") REFERENCES "customers"("id");


ALTER TABLE "order_products" ADD CONSTRAINT "order_products_fk0" FOREIGN KEY ("product_id") REFERENCES "products"("id");
ALTER TABLE "order_products" ADD CONSTRAINT "order_products_fk1" FOREIGN KEY ("order_id") REFERENCES "orders"("id");







