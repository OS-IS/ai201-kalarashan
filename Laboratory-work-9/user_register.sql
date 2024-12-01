CREATE OR REPLACE FUNCTION user_register(input_password TEXT)
RETURNS BOOLEAN AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM user_pass_combo_jay WHERE password = input_password) THEN
        RAISE EXCEPTION 'Password is too weak. It matches a password in the user_pass_combo_jay list.';
        RETURN FALSE;
    ELSE
        RETURN TRUE;
    END IF;
END;
$$ LANGUAGE plpgsql;
