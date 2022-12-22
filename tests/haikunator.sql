-- Start transaction and plan tests
BEGIN;
SELECT plan(2);

-- Test case 1: Check that the function returns a non-null value
SELECT ok(haikunate() IS NOT NULL, 'haikunate() returns a non-null value') AS "Test Result",
       'haikunate() returns a non-null value' AS "Test Description";

-- Test case 2: Check that the function returns a string with the correct format (adjective-noun-token)
SELECT ok(regexp_matches(haikunate(), '^[a-zA-Z]+-[a-zA-Z]+-[a-zA-Z0-9]{8}$') IS NOT NULL,
         'haikunate() returns a string with the correct format (adjective-noun-token)') AS "Test Result",
       'haikunate() returns a string with the correct format (adjective-noun-token)' AS "Test Description";

-- Test case 3: Check that the function returns a string with the correct format (adjective-noun-token) when token_hex is true
SELECT ok(regexp_matches(haikunate(8, '-', TRUE), '^[a-zA-Z]+-[a-zA-Z]+-[a-f0-9]{8}$') IS NOT NULL,
         'haikunate() returns a string with the correct format (adjective-noun-token) when token_hex is true') AS "Test Result",
       'haikunate() returns a string with the correct format (adjective-noun-token) when token_hex is true' AS "Test Description";

-- Test case 4: Check that the function returns a unique value each time it is called
SELECT ok(haikunate() != haikunate(), 'haikunate() returns a unique value each time it is called') AS "Test Result",
       'haikunate() returns a unique value each time it is called' AS "Test Description";

-- Finish tests and rollback transaction
SELECT * FROM finish();
ROLLBACK;
