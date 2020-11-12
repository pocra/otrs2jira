SELECT CONCAT ('ITS-', t.id+1000) as ticketid, a.id as articleid, t.tn, t.title, t.customer_user_id, ts.name as state, tp.name as priority, t.create_time, t.change_time, u.login AS created, v.login AS changed, adm.a_from, adm.a_subject AS title, REPLACE(adm.a_body, '\n', '\\\\') AS description, CONCAT (t.change_time, ';', v.login, ';', REPLACE(adm.a_body, '\n', '\\\\')) AS comment, CONCAT('file://', att.id, '-', att.filename) AS attachment
FROM ticket t
LEFT JOIN article a on t.id = a.ticket_id
LEFT JOIN article_data_mime adm on a.id = adm.article_id
LEFT JOIN article_data_mime_attachment att on a.id = att.article_id
LEFT JOIN ticket_state ts on t.ticket_state_id = ts.id
LEFT JOIN ticket_priority tp on t.ticket_priority_id = tp.id
LEFT JOIN users u on t.create_by = u.id
LEFT JOIN users v on t.change_by = v.id
