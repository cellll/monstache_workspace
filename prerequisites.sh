#!/bin/bash
set -a            
source .env
set +a

TOML_FILEPATH=${MONSTACHE_DIR}/${TOML_FILENAME}

INFO_LOG_FILEPATH="${MONSTACHE_DIR}/logs/info.log"
WARN_LOG_FILEPATH="${MONSTACHE_DIR}/logs/warn.log"
ERROR_LOG_FILEPATH="${MONSTACHE_DIR}/logs/error.log"
STATS_LOG_FILEPATH="${MONSTACHE_DIR}/logs/stats.log"
TRACE_LOG_FILEPATH="${MONSTACHE_DIR}/logs/trace.log"


TARGET_LINE=$(grep -rn "info =" ${TOML_FILEPATH} | cut -d: -f1)
if [ -z ${TARGET_LINE} ]; then echo "TARGET_LINE NOT EXISTS."; exit; fi
INFO_LOG_FILEPATH=${INFO_LOG_FILEPATH//\//\\/}
sed -i "${TARGET_LINE}s/.*/info = '${INFO_LOG_FILEPATH}'/g" ${TOML_FILEPATH}

TARGET_LINE=$(grep -rn "warn =" ${TOML_FILEPATH} | cut -d: -f1)
if [ -z ${TARGET_LINE} ]; then echo "TARGET_LINE NOT EXISTS."; exit; fi
WARN_LOG_FILEPATH=${WARN_LOG_FILEPATH//\//\\/}
sed -i "${TARGET_LINE}s/.*/warn = '${WARN_LOG_FILEPATH}'/g" ${TOML_FILEPATH}

TARGET_LINE=$(grep -rn "error =" ${TOML_FILEPATH} | cut -d: -f1)
if [ -z ${TARGET_LINE} ]; then echo "TARGET_LINE NOT EXISTS."; exit; fi
ERROR_LOG_FILEPATH=${ERROR_LOG_FILEPATH//\//\\/}
sed -i "${TARGET_LINE}s/.*/error = '${ERROR_LOG_FILEPATH}'/g" ${TOML_FILEPATH}

TARGET_LINE=$(grep -rn "stats = '" ${TOML_FILEPATH} | cut -d: -f1)
if [ -z ${TARGET_LINE} ]; then echo "TARGET_LINE NOT EXISTS."; exit; fi
STATS_LOG_FILEPATH=${STATS_LOG_FILEPATH//\//\\/}
sed -i "${TARGET_LINE}s/.*/stats = '${STATS_LOG_FILEPATH}'/g" ${TOML_FILEPATH}

TARGET_LINE=$(grep -rn "trace =" ${TOML_FILEPATH} | cut -d: -f1)
if [ -z ${TARGET_LINE} ]; then echo "TARGET_LINE NOT EXISTS."; exit; fi
TRACE_LOG_FILEPATH=${TRACE_LOG_FILEPATH//\//\\/}
sed -i "${TARGET_LINE}s/.*/#trace = '${TRACE_LOG_FILEPATH}'/g" ${TOML_FILEPATH}
