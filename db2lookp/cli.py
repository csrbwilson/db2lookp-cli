"""


db2look parser.

Usage:
  db2lookp parse <file> [-sqtpifuvacg] [(--src-schema=<schema> --dst-schema=<schema>)]

Options:
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
  -r, --role                Parse create role statements
  -y, --type                Parse create type statements
  --src-schema=<schema>     Schema name/s to rename. Provide a single schema, or comma separated list of schema names. Option requires --dst-schema option
  --dst-schema=<schema>     Schema name/s that will replace schema or list of schema's provided in --src-schema option

Help:
    For help using this tool, please open an issue on the Github repository:
    https://github.com/csrbwilson/db2lookp-cli.git


"""


from inspect import getmembers, isclass

from docopt import docopt

from . import __version__ as VERSION


def main():
    """Main CLI entrypoint."""
    import db2lookp.commands
    options = docopt(__doc__, version=VERSION)

    # Here we'll try to dynamically match the command the user is trying to run
    # with a pre-defined command class we've already created.
    for (k, v) in options.items():
        if hasattr(db2lookp.commands, k) and v:
            module = getattr(db2lookp.commands, k)
            db2lookp.commands = getmembers(module, isclass)
            command = [command[1] for command in db2lookp.commands if command[0] != 'Base'][0]
            command = command(options)
            command.run()