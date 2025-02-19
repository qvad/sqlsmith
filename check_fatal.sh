#!/bin/sh
find ~/yugabyte-data -name '*FATAL.details*' -print | while read line; do head -n1 $i; done |
grep -v "Check failed: IsFinished()" | # https://github.com/yugabyte/yugabyte-db/issues/11301
grep -v "Timeout to wait resolve to complete" | # https://github.com/yugabyte/yugabyte-db/issues/11302
egrep -v "Destructing LookupDataGroup(.*), running_request_number: .* with non empty lookups:" | # https://github.com/yugabyte/yugabyte-db/issues/11308
sort | uniq -c | sort -n
