#!/bin/sh

cd /sys/kernel/debug/tracing
echo 0 > tracing_on
#echo create_empty_buffers > set_ftrace_filter
echo create_empty_buffers > set_graph_function
echo 0 > options/sleep-time
echo function_graph > current_tracer
echo 1 > tracing_on

## run test
cd -
#mount /dev/sda12 /mnt/sda12
./writetest -b 800 -o /home/sean/sda5/fileout
rm /home/sean/sda5/fileout
sync
#umount /mnt/sda12
cd -
#echo 0 > tracing_on
cat trace > /tmp/$1
