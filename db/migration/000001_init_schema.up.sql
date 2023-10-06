
CREATE TABLE "accounts" (
  "id" bigserial PRIMARY KEY,
  "owner" varchar NOT NULL,
  "balance" bigint NOT NULL,
  "currency" varchar NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT 'now()'
);

CREATE TABLE "entries" (
  "id" bigserial PRIMARY KEY,
  "account_id" bigint NOT NULL,
  "ammount" bigint NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT 'now()'
);

CREATE TABLE "transactions" (
  "id" bigserial PRIMARY KEY,
  "from_account_id" bigint NOT NULL,
  "to_account_id" bigint NOT NULL,
  "ammount" bigint,
  "created_at" timestamp NOT NULL DEFAULT 'now()'
);

CREATE INDEX ON "accounts" ("owner");

CREATE INDEX ON "entries" ("account_id");

CREATE INDEX ON "transactions" ("from_account_id");

CREATE INDEX ON "transactions" ("to_account_id");

CREATE INDEX ON "transactions" ("from_account_id", "to_account_id");

COMMENT ON COLUMN "entries"."ammount" IS 'Can either be positive or negatic';

COMMENT ON COLUMN "transactions"."ammount" IS 'Can only be positive';

ALTER TABLE "entries" ADD FOREIGN KEY ("account_id") REFERENCES "accounts" ("id");

ALTER TABLE "transactions" ADD FOREIGN KEY ("from_account_id") REFERENCES "accounts" ("id");

ALTER TABLE "transactions" ADD FOREIGN KEY ("to_account_id") REFERENCES "accounts" ("id");
