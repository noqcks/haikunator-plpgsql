-- Start transaction and plan tests
BEGIN;
SELECT plan(3);

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

-- Test case 5: Check that the function returns the correct length when token_length is specified
SELECT ok(length(regexp_matches(haikunate(8), '^[a-zA-Z]+-[a-zA-Z]+-([a-zA-Z0-9]{8})$')[1]) = 8,
         'haikunate() returns the correct length when token_length is specified') AS "Test Result",
       'haikunate() returns the correct length when token_length is specified' AS "Test Description";

-- Test case 6: Check that the delimiter is correct when specified
SELECT ok(regexp_matches(haikunate(8, '_'), '^[a-zA-Z]+_[a-zA-Z]+_([a-zA-Z0-9]{8})$') IS NOT NULL,
         'haikunate() returns the correct delimiter when specified') AS "Test Result",
       'haikunate() returns the correct delimiter when specified' AS "Test Description";

-- Finish tests and rollback transaction
SELECT * FROM finish();
ROLLBACK;
