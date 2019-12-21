#!/usr/bin/python
# coding=utf-8
# Executed using Python3
# Author: Zhang ZZ
# Date:   20-Dec-2019


import re


# Default path of files
RESULT_PATH = "18CPO060_prodigal_protein.out"
OUT_PATH = "18CPO060.out"
OUT_PATH_FILTERED = "18CPO060_filtered.out"
BLAST_PATH = "18CPO060_blastp_RP55.txt"

class Match:
    pI = 0
    M = 0
    id = ""

    def __init__(self, pI, M, id):
        self.M = M
        self.pI = pI
        self.id = id


# Extract information
def getinfo(match_list):
    with open(RESULT_PATH, "r") as f:
        tid = ""
        tM = 0
        tpI = 0
        for line in f:
            if re.search("PEPSTATS of (.*) from [0-9]* to [0,9]*", line):
                tid = re.search("PEPSTATS of (.*) from [0-9]* to [0,9]*", line).group(1)
            if re.search("Molecular weight = (\S+)\s*.*", line):
                tM = re.search("Molecular weight = (\S+)\s*.*", line).group(1)
            if re.search("Isoelectric Point = (\S+)", line):
                tpI = re.search("Isoelectric Point = (\S+)", line).group(1)
            if tid is not "" and tM is not 0 and tpI is not 0:
                match_list.append(Match(tpI, tM, tid))
                tid = ""
                tM = 0
                tpI = 0


def save(match_list, outpath):
    with open(outpath, "w") as f:
        f.write("id,pI,M\n")
        for match in match_list:
            f.write(match.id + "," + match.pI + "," + match.M + "\n")


def filter_by_annotation(match_list):
    filter_list = []
    match_list_filtered = []
    with open(BLAST_PATH, "r") as f:
        for line in f:
            filter_list.append(re.search("(\S+)\s\S+", line).group(1))
    for match in match_list:
        if match.id in filter_list:
            match_list_filtered.append(match)
    return match_list_filtered


def main():
    match_list = []
    getinfo(match_list)
    match_list_filtered = filter_by_annotation(match_list)
    save(match_list, OUT_PATH)
    save(match_list_filtered, OUT_PATH_FILTERED)


if __name__ == "__main__":
    main()
