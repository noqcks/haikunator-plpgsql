-- Start transaction and plan tests
begin;
select plan(1);

-- Test case 1: Check that the function returns a non-null value
select ok(generate_random_name() IS NOT NULL, "generate_random_name() returns a non-null value");

-- Test case 2: Check that the function returns a string with the correct format (adjective-noun-token)
SELECT ok(regexp_matches(generate_random_name(), '^[a-zA-Z]+-[a-zA-Z]+-[a-zA-Z0-9]{8}$') IS NOT NULL,
         'generate_random_name() returns a string with the correct format (adjective-noun-token)');

-- Test case 3: Check that the function returns a unique value each time it is called
SELECT ok(generate_random_name() != generate_random_name(), 'generate_random_name() returns a unique value each time it is called');

-- Finish tests and rollback transaction
select * from finish();
rollback;
