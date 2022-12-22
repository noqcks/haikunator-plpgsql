# haikunator-plpgsql

Generate Heroku-like random names with a postgresql function.

## Usage

You can find the function at `function/001_haikunator.sql`.

```sql
haikunate(token_length integer default 4, delimiter TEXT default '-', token_hex BOOLEAN default FALSE)
```

Examples

```sql
SELECT haikunate(); -- => "aged-band-1234"
SELECT haikunate(4, "-", false); -- => "blue-breeze-1234"
SELECT haikunate(4, "-", true); -- => "aged-band-4ab7"
SELECT haikunate(4, "_", true); -- => "autumn_bird_4ab7"
```
