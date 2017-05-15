from re import compile, findall, MULTILINE, DOTALL, IGNORECASE, sub
import sys

from .base import Base


class Parse(Base):

    ddl_patterns = {
        'schema': compile(
            r'Statements\s+\w+\s+Schemas(.*?)(?:\s+-{2}\s+DDL|\s+-{2}\s+Auth|\s+C\w+\s+W\w+;)',
            MULTILINE|DOTALL|IGNORECASE),
        'sequence': compile(
            r'Statements\s+\w+\s+Sequences\s+(.*?)(?:\s+-{2}\s+DDL|\s+-{2}\s+Auth|\s+C\w+\s+W\w+;)',
            MULTILINE|DOTALL|IGNORECASE),
        'table': compile(
            r'Statements\s+\w+\s+Table\s+(?:.*?)[.](?:.*?)\s+(.*?)\s+-{2}\s+DDL',
            MULTILINE|DOTALL|IGNORECASE),
        'primary_key': compile(
            r'Statements\s+\w+\s+Primary\s+(?:.*?)[.](?:.*?)\s+(.*?)(?:\s+-{2}\s+DDL|\s+-{2}\s+Auth|\s+C\w+\s+W\w+;)',
            MULTILINE|DOTALL|IGNORECASE),
        'index': compile(
            r'Statements\s+\w+\s+Indexes\s+(?:.*?)[.](?:.*?)\s+(.*?)(?:\s+-{2}\s+DDL|\s+-{2}\s+Auth|\s+C\w+\s+W\w+;)',
            MULTILINE|DOTALL|IGNORECASE),
        'foreign_key': compile(
            r'Statements\s+\w+\s+Foreign\s+(?:.*?)[.](?:.*?)\s+(.*?)(?:\s+-{2}\s+DDL|\s+-{2}\s+Auth|\s+C\w+\s+W\w+;)',
            MULTILINE|DOTALL|IGNORECASE),
        'user_function': compile(
            r'Statements\s+\w+\s+\w+\s+\w+\s+Functions\s(.*?)(?:\s+-{2}\s+DDL|\s+-{2}\s+Auth|\s+C\w+\s+W\w+;)',
            MULTILINE|DOTALL|IGNORECASE),
        'view': compile(
            r'Statements\s+\w+\s+Views\s+(.*?)(?:\s+-{2}\s+DDL|\s+-{2}\s+Auth|\s+C\w+\s+W\w+;)',
            MULTILINE|DOTALL|IGNORECASE),
        'alias': compile(
            r'Statements\s+\w+\s+Aliases\s+(.*?)(?:\s+-{2}\s+DDL|\s+-{2}\s+Auth|\s+C\w+\s+W\w+;)',
            MULTILINE|DOTALL|IGNORECASE),
        'stored_procedure': compile(
            r'Statements\s+\w+\s+\w+\s+Procedures\s(.*?)(?:\s+-{2}\s+DDL|\s+-{2}\s+Auth|\s+C\w+\s+W\w+;)',
            MULTILINE|DOTALL|IGNORECASE),
        'trigger': compile(
            r'Statements\s+\w+\s+Triggers\s+(.*?)(?:\s+-{2}\s+DDL|\s+-{2}\s+Auth|\s+C\w+\s+W\w+;)',
            MULTILINE|DOTALL|IGNORECASE),
        'role': compile(
            r'Statements\s+\w+\s+Roles(.*?)(?:\s+-{2}\s+DDL|\s+-{2}\s+Auth|\s+C\w+\s+W\w+;)',
            MULTILINE | DOTALL | IGNORECASE),
        'type': compile(
            r'Statements\s+\w+\s+Cursor\s+Types(.*?)(?:\s+-{2}\s+DDL|\s+-{2}\s+Auth|\s+C\w+\s+W\w+;)',
            MULTILINE | DOTALL | IGNORECASE),
        'check': compile(
            r'Statements\s+\w+\s+Check\s+(?:.*?)[.](?:.*?)\s+(.*?)(?:\s+-{2}\s+DDL|\s+-{2}\s+Auth|\s+C\w+\s+W\w+;)',
            MULTILINE | DOTALL | IGNORECASE),

    }

    @staticmethod
    def read_file(file):
        try:
            with open(file, 'r') as fh:
                data = fh.read().strip('\n')
        except IOError as fnfe:
            print('ERROR: {1}: {0} '.format(fnfe.filename, fnfe.strerror))
            sys.exit()

        if 'DB2LOOK'.lower() not in data[0].lower():
            print('Unable to verify db2look file signature, file possibly not created by db2look utility.')
            sys.exit()

        return data

    @staticmethod
    def parse(pattern, data):
        m = findall(pattern, data)
        return m

    @staticmethod
    def write_file(file, data):
        try:
            with open(file, 'w') as fh:
                fh.write(data)
        except IOError as fnfe:
            print('ERROR: {1}: {0} '.format(fnfe.filename, fnfe.strerror))
            sys.exit()

    @staticmethod
    def clean_data(data):
        actual_data = [s for s in data if '-' not in s.strip() and len(s.strip()) > 0]
        split_by_statement = '\n'.join(actual_data).split('@')
        clean_data = '@\n'.join(split_by_statement)

        return clean_data

    @staticmethod
    def process(pattern, data):
        output_file = __name__.split('.')[0] + '_' + pattern + '.sql'
        output = Parse.parse(Parse.ddl_patterns[pattern], data)
        output_len = len(output)

        if output_len:
            if pattern not in ['user_function', 'trigger', 'stored_procedure']:
                data = Parse.clean_data('\n'.join(output).split('\n'))
            else:
                data = '\n'.join(output)

            print('\t{0} object/s written to file {1}', output_len, output_file)
            Parse.write_file(output_file, data)
        else:
            print('\t{0} objects found.', output_len)

    @staticmethod
    def src_schema_pattern(src_schema):
        return [ compile(r'"' + s + r'\s*"', MULTILINE|DOTALL) for s in src_schema]
        # pattern = '(' + '|'.join(search_pattern) + ')'
        # return compile(pattern, MULTILINE|DOTALL)

    @staticmethod
    def dst_schema_pattern(dst_schema):
        return ['"' + s + '"' for s in dst_schema]
        # return '"' + dst_schema + '"'

    def run(self):
        all = True
        file = self.options['<file>']
        data = Parse.read_file(file)

        print('Parsing file: {0}'.format(file))
        for line in data[0:8]:
            print('\t'.format(line.replace('--','')))
        print()

        if self.options['--src-schema'] and self.options['--dst-schema']:
            src_schema = self.options['--src-schema'].split(',')
            dst_schema = self.options['--dst-schema'].split(',')
            if len(src_schema) == len(dst_schema):
                search_pattern = Parse.src_schema_pattern(src_schema)
                replace_pattern = Parse.dst_schema_pattern(dst_schema)
                for index, pattern in enumerate(search_pattern):
                    data = sub(pattern, replace_pattern[index], data)
            else:
                print("ERROR: Source and destination schema's require the same number of names "
                      "to support positional rename.")
                sys.exit()

        for key in self.options:
            pattern = key.strip('--').replace('-', '_')
            if pattern in Parse.ddl_patterns and self.options[key]:
                all = False
                Parse.process(pattern, data)

        if all:
            for pattern in Parse.ddl_patterns:
                Parse.process(pattern, data)
