# otrs2jira
A little help to migrate OTRS-Tickets to Atlassian Jira.

## Precheck
* Check the table article_data_mime_attachment on your OTRS-System.
  Filenames with special characters or space will create some headaches. ;)

## Export attachments
* Export the blobs from your table with your favourite tool.
  * Create the name pattern like this:
    > *article_data_mime_attachment.id*-*article_data_mime_attachment.filename*

## Export CSV
* Export the CSV with the sql-file.
  > Please adjust the ticket prefix (startnumber and key)

## Move attachments to Jira
* Copy the files to your Jira-server in the folder */var/atlassian/application-data/jira/import/attachments* or your designated *$JIRA_HOME$/import/attachments*

## Precheck
* Check the csv for any line-breaks and correct it manually
* Check the jira-import-config.csv and modify the mail-domain, etc.

## Import CSV
* Import the CSV in Jira and use the settings-file
