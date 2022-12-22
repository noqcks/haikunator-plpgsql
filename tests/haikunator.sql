-- Start transaction and plan tests
BEGIN;
SELECT plan(1);

-- Test case 1: Check that the function returns a non-null value
SELECT ok(generate_random_name() IS NOT NULL, 'generate_random_name() returns a non-null value') AS "Test Result",
       'generate_random_name() returns a non-null value' AS "Test Description";

-- Test case 2: Check that the function returns a string with the correct format (adjective-noun-token)
SELECT ok(regexp_matches(generate_random_name(), '^[a-zA-Z]+-[a-zA-Z]+-[a-zA-Z0-9]{8}$') IS NOT NULL,
         'generate_random_name() returns a string with the correct format (adjective-noun-token)') AS "Test Result",
       'generate_random_name() returns a string with the correct format (adjective-noun-token)' AS "Test Description";

-- Test case 3: Check that the function returns a unique value each time it is called
SELECT ok(generate_random_name() != generate_random_name(), 'generate_random_name() returns a unique value each time it is called') AS "Test Result",
       'generate_random_name() returns a unique value each time it is called' AS "Test Description";

-- Finish tests and rollback transaction
SELECT * FROM finish();
ROLLBACK;
