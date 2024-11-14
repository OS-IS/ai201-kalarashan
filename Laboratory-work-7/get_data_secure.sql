CREATE OR REPLACE FUNCTION get_data(name_value VARCHAR)
RETURNS TABLE(p_id INTEGER, name VARCHAR, bd DATE, conf_level INTEGER) AS $$
BEGIN
    RETURN QUERY EXECUTE 'SELECT * FROM worker WHERE name = $1'
    USING name_value;
END;
$$ LANGUAGE plpgsql;
