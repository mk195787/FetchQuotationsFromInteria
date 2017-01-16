#!/bin/bash
curl -vs "http://mojeinwestycje.interia.pl/gie/notgpw/full/zlec_all?sp=55&zl=A" 2>&1 |
grep -o "[0-9,]\+\s\.\+\s[0-9]\+\s\.\+\s[0-9:]\{8\}" |
sed -n 's/\([0-9,]\+\)\s\.*\s\([0-9]\+\).*/\1|\2/p' |
awk 'BEGIN {FS=OFS=SUBSEP="|"}{arr[$1]+=$2}END {for(i in arr) print i, arr[i]}' |
sort -nr |
awk 'BEGIN {FS=OFS=SUBSEP="|"}{p[NR]=$1; agg[NR]+=(agg[NR-1]+$2)}END {for(i in agg) print p[i], agg[i]}' |
sort -n
curl -vs "http://mojeinwestycje.interia.pl/gie/notgpw/full/zlec_all?sp=55&zl=V" 2>&1 |
grep -o "[0-9,]\+\s\.\+\s[0-9]\+\s\.\+\s[0-9:]\{8\}" |
sed -n 's/\([0-9,]\+\)\s\.*\s\([0-9]\+\).*/\1|\2/p' |
awk 'BEGIN {FS=OFS=SUBSEP="|"}{arr[$1]+=$2}END {for(i in arr) print i, arr[i]}' |
sort -n |
awk 'BEGIN {FS=OFS=SUBSEP="|"}{p[NR]=$1; agg[NR]+=(agg[NR-1]+$2)}END {for(i in agg) print p[i], agg[i]}'
