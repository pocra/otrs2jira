SELECT CONCAT ('ITS-', t.id+1000) as ticketid, art.id as articleid, t.tn AS orts_ticketnumber, t.title, t.customer_user_id, state.name as state, prio.name as priority, t.create_time, t.change_time, u_create.login AS created, u_change.login AS changed, art_mime.a_from, art_mime.a_subject AS title, REPLACE(art_mime.a_body, '\n', '\\\\') AS description, CONCAT (t.change_time, ';', u_change.login, ';', REPLACE(art_mime.a_body, '\n', '\\\\')) AS comment, CONCAT('file://', art_att.id, '-', art_att.filename) AS attachment
FROM ticket t
LEFT JOIN article art on t.id = art.ticket_id
LEFT JOIN article_data_mime art_mime on art.id = art_mime.article_id
LEFT JOIN article_data_mime_attachment art_att on art.id = art_att.article_id
LEFT JOIN ticket_state state on t.ticket_state_id = state.id
LEFT JOIN ticket_priority prio on t.ticket_priority_id = prio.id
LEFT JOIN users u_create on t.create_by = u_create.id
LEFT JOIN users u_change on t.change_by = u_change.id
