from re import compile, findall, MULTILINE, DOTALL, sub
import sys

from .base import Base


class Parse(Base):

    ddl_patterns = {
        'schema': compile(r'S\w+\s+\w+\s+Schemas(.*?)\s+-{2}\s+DDL', MULTILINE|DOTALL),
        'sequence': compile(r'S\w+\s+\w+\s+Sequences(.*?)\s+-{2}\s+DDL', MULTILINE|DOTALL),
        'table': compile(r'S\w+\s+\w+\s+Table\s+(?:.*?)[.](?:.*?)\s+(.*?)\s+-{2}\s+DDL', MULTILINE|DOTALL),
        'primary_key': compile(r'S\w+\s+\w+\s+Primary\s+(?:.*?)[.](?:.*?)\s+(.*?)-{2}\s+DDL', MULTILINE|DOTALL),
        'index': compile(r'S\w+\s+\w+\s+Indexes\s+(?:.*?)[.](?:.*?)\s+(.*?)-{2}\s+DDL', MULTILINE|DOTALL),
        'foreign_key': compile(r'S\w+\s+\w+\s+Foreign\s+(?:.*?)[.](?:.*?)\s+(.*?)-{2}\s+DDL', MULTILINE|DOTALL),
        'user_function': compile(r'S\w+\s+\w+\s+\w+\s+\w+\s+Functions\s(.*?)\s+-{2}\s+DDL', MULTILINE|DOTALL),
        'view': compile(r'S\w+\s+\w+\s+Views\s+(.*?)\s+-{2}\s+DDL', MULTILINE|DOTALL),
        'alias': compile(r'S\w+\s+\w+\s+Aliases\s+(.*?)\s+-{2}\s+DDL', MULTILINE|DOTALL),
        'stored_procedure': compile(r'S\w+\s+\w+\s+\w+\s+Procedures\s(.*?)\s+-{2}\s+DDL', MULTILINE|DOTALL),
        'trigger': compile(r'S\w+\s+\w+\s+Triggers\s+(.*?)\s+C\w+\s+W\w+;', MULTILINE|DOTALL)
    }

    @staticmethod
    def read_file(file):
        try:
            with open(file, 'r') as fh:
                data = fh.read().strip('\n')
        except IOError as fnfe:
            print('ERROR: {1}: {0} '.format(fnfe.filename, fnfe.strerror))
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
        split_by_statement = '\n'.join(actual_data).split(';')
        clean_data = ';\n'.join(split_by_statement)

        return clean_data

    @staticmethod
    def process(pattern, data):
        output = Parse.parse(Parse.ddl_patterns[pattern], data)

        if len(output):

            if pattern not in ['user_function', 'trigger', 'stored_procedure']:
                data = Parse.clean_data('\n'.join(output).split('\n'))
            else:
                data = '\n'.join(output)

            Parse.write_file(__name__.split('.')[0] + '_' + pattern + '.sql', data)

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

        if self.options['--src-schema'] and self.options['--dst-schema']:
            src_schema = self.options['--src-schema'].split(',')
            dst_schema = self.options['--dst-schema'].split(',')
            if len(src_schema) == len(dst_schema):
                search_pattern = Parse.src_schema_pattern(src_schema)
                replace_pattern = Parse.dst_schema_pattern(dst_schema)
                for index, pattern in enumerate(search_pattern):
                    data = sub(pattern, replace_pattern[index], data)
            else:
                print("ERROR: Source and destination schema's don't match.")
                sys.exit()

        for key in self.options:
            pattern = key.strip('--').replace('-', '_')
            if pattern in Parse.ddl_patterns and self.options[key]:
                all = False
                Parse.process(pattern, data)

        if all:
            for pattern in Parse.ddl_patterns:
                Parse.process(pattern, data)
