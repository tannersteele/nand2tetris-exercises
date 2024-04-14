import difflib
import sys

# Usage: cmp.py {file_1} {file_2}

def cmp(lfile_path, rfile_path):
    """
    Util function to run diff between 2 files
    """
    with open(lfile_path, 'r') as lfile:
        with open(rfile_path, 'r') as rfile:
            diff = difflib.unified_diff(lfile, rfile, fromfile=lfile_path, tofile=rfile_path, lineterm='', n=0) # no ctx
    [print(line) for line in diff]


if __name__ == "__main__":
    cmp(sys.argv[1], sys.argv[2])