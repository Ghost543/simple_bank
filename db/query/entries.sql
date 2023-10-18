
-- name: CreateEntry :one
INSERT INTO entries (
  account_id, ammount
) VALUES (
  $1, $2
)
RETURNING *;

-- name: GetEntryById :one
SELECT * FROM entries
WHERE id = $1 LIMIT 1;

-- name: GetEntryByAccountId :one
SELECT * FROM entries WHERE account_id = $1 LIMIT 1;

-- name: ListEntries :many
SELECT * FROM entries
ORDER BY account_id
LIMIT $1
OFFSET $2;

-- name: UpdateEntry :exec
UPDATE entries
  SET ammount = $2
WHERE id = $1;

-- name: DeleteEntryById :exec
DELETE FROM entries
WHERE id = $1;

-- name: DeleteEntriesByAccountId :exec
DELETE FROM entries
  WHERE account_id = $1;
