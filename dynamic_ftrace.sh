#!/bin/sh
TRACING_DIR=/sys/kernel/debug/tracing
echo "ext4:*" > $TRACING_DIR/set_event
echo 1 > $TRACING_DIR/tracing_on

#execute command
$*

cat $TRACING_DIR/trace > /tmp/trace.txt
echo 0 > $TRACING_DIR/tracing_on
