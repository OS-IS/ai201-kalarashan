CREATE OR REPLACE FUNCTION get_data(user_token TEXT)
RETURNS TABLE(data TEXT) AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM user_tokens WHERE token = user_token) THEN
        RAISE EXCEPTION 'Invalid or expired token.';
    END IF;
    RETURN QUERY SELECT 'Secure data';
END;
$$ LANGUAGE plpgsql;
