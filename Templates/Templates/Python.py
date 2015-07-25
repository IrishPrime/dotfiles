#!/usr/bin/env python3
""""""

import argparse

def main():
    parser = argparse.ArgumentParser(description='')
    parser.add_argument('file_path', metavar='FILE', type=str,
            help='Path to input file')
    args = parser.parse_args()


if __name__ == "__main__":
    main()
