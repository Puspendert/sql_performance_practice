## MySql and UUIDs

- avoid using raw uuid as PK or as an indexed column. They are usually stored in `VARCHAR(36)` and consume 146 bytes. They are random and cause clustered index to be rebalanced
they are included in each secondary indexes (consuming disk and memory)
- instead use `BINARY(16)` datatype and use `UUID_TO_BIN(uuid(), 1)` to generate the sequential ids.
- Don't use uuid v4. With UUID v4m it’s not possible to generate any sequential ouput and this is why those random UUID should never be used as Primary Key with InnoDB.

Links:    
https://blogs.oracle.com/mysql/post/mysql-uuids    
https://mysqlcode.com/mysql-uuid_to_bin-and-bin_to_uuid/    
https://dev.mysql.com/doc/refman/8.0/en/create-table-gipks.html    
