#!/bin/bash
LOG_FILE=logs_file
AMI_ID_LINE_NR=$(grep -n "amazon-ebs: AMIs were created:" ${LOG_FILE} | cut -d : -f 1)
((AMI_ID_LINE_NR++))
FINAL_AMI_ID=$(cat ${LOG_FILE} | awk NR==${AMI_ID_LINE_NR} | awk 'match($0, /ami-.*/) { print substr($0, RSTART, RLENGTH) }')
echo "Got AMI id: ${FINAL_AMI_ID}"
