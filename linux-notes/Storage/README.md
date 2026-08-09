First understand "storage"

Suppose you have a Linux server:

Linux Server
     |
     └── /data
          |
          ├── file1.txt
          ├── report.pdf
          └── backup.tar.gz

Normally, the server stores these files on its own hard disk.

But in a company, you may not want every server to have all its storage locally.

Instead, you can have a central storage system:

              Central Storage
                    |
        ┌───────────┼───────────┐
        ↓           ↓           ↓
     Server 1    Server 2    Server 3

This is where NAS and SAN come in.
