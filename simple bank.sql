CREATE TABLE "accounts" (
  "id" bigserial PRIMARY KEY,
  "owner" varchar NOT NULL,
  "balance" bigint NOT NULL,
  "currency" varchar NOT NULL,
  "created_at" timestampz NOT NULL DEFAULT 'now()'
);

CREATE TABLE "entries" (
  "id" bigserial PRIMARY KEY,
  "account_id" bigint NOT NULL,
  "ammount" bigint NOT NULL,
  "created_at" timestampz NOT NULL DEFAULT 'now()'
);

CREATE TABLE "posts" (
  "id" bigserial PRIMARY KEY,
  "from_account_id" bigint NOT NULL,
  "to_account_id" bigint NOT NULL,
  "ammount" bigint,
  "created_at" timestampz NOT NULL DEFAULT 'now()'
);

CREATE INDEX ON "accounts" ("owner");

CREATE INDEX ON "entries" ("account_id");

CREATE INDEX ON "posts" ("from_account_id");

CREATE INDEX ON "posts" ("to_account_id");

CREATE INDEX ON "posts" ("from_account_id", "to_account_id");

COMMENT ON COLUMN "entries"."ammount" IS 'Can either be positive or negatic';

COMMENT ON COLUMN "posts"."ammount" IS 'Can only be positive';

ALTER TABLE "entries" ADD FOREIGN KEY ("account_id") REFERENCES "accounts" ("id");

ALTER TABLE "posts" ADD FOREIGN KEY ("from_account_id") REFERENCES "accounts" ("id");

ALTER TABLE "posts" ADD FOREIGN KEY ("to_account_id") REFERENCES "accounts" ("id");
