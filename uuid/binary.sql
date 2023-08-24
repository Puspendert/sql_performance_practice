CREATE TABLE customerO
(
  id BINARY(16) DEFAULT (UUID_TO_BIN(UUID(), 1)) PRIMARY KEY, 
  name varchar(50),
  created_at timestamp default now()
);

-- insert 1 million records
INSERT INTO customerO (name)
SELECT CONCAT('Customer', n)
  FROM
(
select a.N + b.N * 10 + c.N * 100 + d.N * 1000 + e.N * 10000 + f.N * 100000 + 1 N
from (select 0 as N union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) a
      , (select 0 as N union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) b
      , (select 0 as N union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) c
      , (select 0 as N union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) d
      , (select 0 as N union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) e
      , (select 0 as N union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) f
) t;

select count(*) from customerO;

select BIN_TO_UUID(id,1), name, created_at from customerO order by id desc limit 10;

-- insert new records to check if the records gets inserted to the last. Answer: YES, the records does gets added at the last
INSERT INTO customerO (name) values ("puspender1"), ("puspender2");

-- get query insight. Notice the size of the id column: 16 bytes
EXPLAIN select * from customer where id = 'a9dbfb10-427c-11ee-bb25-0242ac110002';
