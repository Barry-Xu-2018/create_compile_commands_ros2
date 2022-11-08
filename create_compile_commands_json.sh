#!/bin/bash

set -x

OUTPUT_FILENAME=compile_commands.json

rm -f ${OUTPUT_FILENAME}

file_list=$(find . -name "compile_commands.json")

echo "[" > ${OUTPUT_FILENAME}

for f in ${file_list}
do
sed '1d;$d' ${f} >> ${OUTPUT_FILENAME}
done

echo "]" >> ${OUTPUT_FILENAME}

sed -i 's/\}$/},/' ${OUTPUT_FILENAME}
tac ${OUTPUT_FILENAME} > /tmp/${OUTPUT_FILENAME}.tmp
sed -i '2s/\},/}/' /tmp/${OUTPUT_FILENAME}.tmp
tac /tmp/${OUTPUT_FILENAME}.tmp > ${OUTPUT_FILENAME}
