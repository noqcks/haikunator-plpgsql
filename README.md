# haikunator-plpgsql

![ci](https://github.com/noqcks/haikunator-plpgsql/actions/workflows/ci.yml/badge.svg) [![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

Generate Heroku-like random names in PL/pgSQL. Inspired by [usmanbashir/haikunator](https://github.com/usmanbashir/haikunator)

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
