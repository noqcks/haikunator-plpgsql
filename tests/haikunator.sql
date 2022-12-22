-- Start transaction and plan tests
begin;
select plan(1);

-- Test generate_random_name()
select generate_random_name() as name;

-- Finish tests and rollback transaction
select * from finish();
rollback;
