CREATE OR REPLACE FUNCTION get_data(name_value VARCHAR)
RETURNS TABLE(p_id INTEGER, name VARCHAR, bd DATE, conf_level INTEGER) AS $$
DECLARE
    str VARCHAR;
BEGIN
    str := 'SELECT * FROM worker WHERE name = ''' || name_value || ''';';
    RETURN QUERY EXECUTE str;
END;
$$ LANGUAGE plpgsql;
