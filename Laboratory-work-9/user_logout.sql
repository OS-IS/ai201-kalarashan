CREATE OR REPLACE FUNCTION user_logout(user_token TEXT)
RETURNS VOID AS $$
BEGIN
    DELETE FROM user_tokens WHERE token = user_token;
END;
$$ LANGUAGE plpgsql;
