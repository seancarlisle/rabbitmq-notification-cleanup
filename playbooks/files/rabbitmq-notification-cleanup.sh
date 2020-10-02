#!/bin/bash

PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# Cycle through and purge notification queues
for VHOST in $(rabbitmqctl list_vhosts | grep -v List)
do
   QUEUES_TO_PURGE=$(rabbitmqctl list_queues -p $VHOST | awk '/notificat/ {if ($2 > 0) print $1}')

   for QUEUE in $QUEUES_TO_PURGE
   do
      rabbitmqctl purge_queue -p $VHOST $QUEUE
   done
done
