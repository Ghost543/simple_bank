
-- name: CreateTransaction :one
INSERT INTO transactions (
  from_account_id, to_account_id, ammount
) VALUES (
  $1, $2, $3
)
RETURNING *;

-- name: GetTransaction :one
SELECT * FROM transactions
WHERE id = $1 LIMIT 1;

-- name: ListAccounts :many
SELECT * FROM transactions
ORDER BY id
LIMIT $1
OFFSET $2;


-- name: ListAccountsByAccountId :many
SELECT * FROM transactions
WHERE from_account_id = $1 OR to_account_id = $1
ORDER BY id
LIMIT $1
OFFSET $2;

-- name: UpdateAccount :exec
UPDATE transactions
  SET ammount = $2
WHERE id = $1;

-- name: DeleteAccount :exec
DELETE FROM transactions
WHERE id = $1;
