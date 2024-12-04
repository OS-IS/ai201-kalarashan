CREATE OR REPLACE FUNCTION user_login(client_ip TEXT, client_port INT)
RETURNS TEXT AS $$
DECLARE
    new_token TEXT;
BEGIN
    new_token := md5(random()::TEXT || clock_timestamp()::TEXT);
    INSERT INTO user_tokens(token, client_ip, client_port, server_pid)
    VALUES (new_token, client_ip, client_port, pg_backend_pid());
    RETURN new_token;
END;
$$ LANGUAGE plpgsql;
