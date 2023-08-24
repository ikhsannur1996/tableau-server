# Tableau Server Backup Guide (Windows Server)

This guide provides the command-line instructions for creating and scheduling backups for Tableau Server on a Windows Server environment.

## Scheduling a Backup

Use the following command to schedule a backup:

```bash
tsm maintenance backup -f <backup-file-name> -sr <recurrence> -st <time-to-run> -sd <days-to-run> -sn <schedule-name>
```

Replace placeholders with your specifics:

- `<backup-file-name>`: Desired backup file name.
- `<recurrence>`: Frequency ("daily," "weekly," or "monthly").
- `<time-to-run>`: Time in 24-hour format (HH:MM).
- `<days-to-run>`: Day(s) to run (comma-separated list).
- `<schedule-name>`: Backup schedule name.

### Example Backup Schedule

For instance, to schedule a weekly backup every Friday at 8:00 PM:

```bash
tsm maintenance backup -f friday-backup -sr weekly -st 20:00 -sd 5 -sn friday-backup
```

This will create backups every Friday at 8:00 PM and generate files named `<yyyy.mm.dd.hh.mm>-friday-backup.tsbak`.

## Monitoring and Verification

Regularly verify successful backups by checking generated backup files and their timestamps.

## Important Notes

- Ensure sufficient storage space in the backup directory.
- Adjust the backup file naming convention as required.
- Separate backups for configuration and data directory ensure comprehensive disaster recovery.
- Document backup and recovery procedures for future reference.

## Resources

- [Tableau Server Backup and Restore](https://help.tableau.com/current/server/en-us/backup.htm)
- [TSM Command-Line Reference](https://help.tableau.com/current/server/en-us/cli_tsm.htm)

Feel free to customize and expand this guide according to your environment and needs.
```
