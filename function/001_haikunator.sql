CREATE OR REPLACE FUNCTION generate_random_name(token_length integer default 4, delimiter TEXT default '-', token_hex BOOLEAN default FALSE)
RETURNS TEXT AS $$
DECLARE
  adjectives TEXT[] := '{aged, ancient, autumn, billowing, bitter, black, blue, bold, broad, broken, calm, cold, cool, crimson, curly, damp, dark, dawn, delicate, divine, dry, empty, falling, fancy, flat, floral, fragrant, frosty, gentle, green, hidden, holy, icy, jolly, late, lingering, little, lively, long, lucky, misty, morning, muddy, mute, nameless, noisy, odd, old, orange, patient, plain, polished, proud, purple, quiet, rapid, raspy, red, restless, rough, round, royal, shiny, shrill, shy, silent, small, snowy, soft, solitary, sparkling, spring, square, steep, still, summer, super, sweet, throbbing, tight, tiny, twilight, wandering, weathered, white, wild, winter, wispy, withered, yellow, young}';
  nouns TEXT[] := '{art, band, bar, base, bird, block, boat, bonus, bread, breeze, brook, bush, butterfly, cake, cell, cherry, cloud, credit, darkness, dawn, dew, disk, dream, dust, feather, field, fire, firefly, flower, fog, forest, frog, frost, glade, glitter, grass, hall, hat, haze, heart, hill, king, lab, lake, leaf, limit, math, meadow, mode, moon, morning, mountain, mouse, mud, night, paper, pine, poetry, pond, queen, rain, recipe, resonance, rice, river, salad, scene, sea, shadow, shape, silence, sky, smoke, snow, snowflake, sound, star, sun, sun, sunset, surf, term, thunder, tooth, tree, truth, union, unit, violet, voice, water, waterfall, wave, wildflower, wind, wood}';
  adjective TEXT := '';
  noun TEXT := '';
  token_chars TEXT[] := '{}';
  token TEXT := '';
BEGIN
  if token_hex THEN
    token_chars := '{0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f}';
  ELSE
    token_chars := '{0,1,2,3,4,5,6,7,8,9}';
  END IF;

  -- Generate a random hex token of token_length
  FOR i IN 1..token_length LOOP
    token := token || token_chars[floor(random()*16)+1];
  END LOOP;

  adjective := adjectives[floor(random()*(array_length(adjectives, 1)))];
  noun := nouns[floor(random()*(array_length(nouns, 1)))];

  raise notice 'Adjective %', adjective;
  raise notice 'Noun %', noun;
  raise notice 'Token %', token;

  RETURN adjective || '-' || noun || '-' || token;
END;
$$ LANGUAGE plpgsql;
