db2lookp-cli
============

*A db2look parser command line program in Python.*


Purpose
-------

This application is used to parse the output from the db2look command, splitting
the DDL into related objects and saving to respective files.

example:
    aliases:            db2lookp_alias.sql
    foreign keys:       db2lookp_foreign_key.sql
    indexes:            db2lookp_index.sql
    primary keys:       db2lookp_primary_key.sql
    schemas:            db2lookp_schema.sql
    sequences:          db2lookp_sequence.sql
    stored procedures:  db2lookp_stored_procedure.sql
    tables:             db2lookp_table.sql
    triggers:           db2lookp_trigger.sql
    user functions:     db2lookp_user_function.sql
    views:              db2lookp_view.sql


Usage
-----

  db2lookp parse <file> [-sqtpifuvacg] [(--src-schema=<schema>... --dst-schema=<schema>)]

Options
--------
  -h, --help                Show help
  --version                 Show version
  -s, --schema              Parse create schema statements
  -q, --sequence            Parse create sequence statements
  -t, --table               Parse create table statements
  -p, --primary-key         Parse create primary key statements
  -i, --index               Parse create index statements
  -f, --foreign-key         Parse create foreign key statements
  -u, --user-function       Parse create user defined functions statements
  -v, --view                Parse create view statements
  -a, --alias               Parse create alias statements
  -c, --stored-procedure    Parse create stored procedure statements
  -g, --trigger             Parse create trigger statements
  --src-schema=<schema>     Schema name/s to rename. Provide a single schema,
                            or comma separated list of schema names. Option requires --dst-schema option
  --dst-schema=<schema>     Schema name/s that will replace schema or list of schema's provided in --src-schema option