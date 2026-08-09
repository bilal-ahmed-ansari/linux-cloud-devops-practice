1. NAS vs SAN with a real-world example

a)NAS: 

Imagine your company has 100 employees.

They need a common place to store documents.

You create:

Company NAS
     |
     └── Shared
          |
          ├── HR
          ├── Finance
          ├── Projects
          └── Reports

Users access files.

This is a good use case for NAS.

b)SAN

Now imagine you have a database server.

The database needs high-performance storage.

You can present storage from a SAN:

SAN
 |
 └── 500 GB LUN
        |
        ↓
 Database Server
        |
      /dev/sdb
        |
      ext4/XFS
        |
      /database

The database server sees the storage as a disk.

That's SAN.
