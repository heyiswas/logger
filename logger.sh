#!/bin/bash

# Version	v0.1
# Autor		Andrej Neufeldt
# Contact	an@heyiswas.de

# Usage
# logger.sh "/path/to/log/something.log" "Message"

function _log() {

# $1 should be the log path and file
# $2 should be the log message

LOGFILE="$1" # file name with extension, from stdin
LOGMSG="$2" # log message from stdin
DATE="$(date +'[%Y%m%d-%T %z]')" # add ".%N" for nanoseconds


if [ -z "${LOGFILE}" ] && [ -z "${LOGMSG}" ];then
	exit 1 # no log file & no error message? never seen, never happened
elif [ -z "${LOGFILE}" ] && [ -n "${LOGMSG}" ];then
	echo -e "${DATE}\t${LOGMSG}" 2>&1 # no log file, but error message? print to stdout
elif [ -n "${LOGFILE}" ] && [ -z "${LOGMSG}" ];then
	exit 1 # no error message? it's useless then
elif [ -n "${LOGFILE}" ] && [ -n "${LOGMSG}" ];then
	echo -e "${DATE}\t${LOGMSG}" >> ${LOGFILE}
fi
}
# init
_log "$1" "$2"
