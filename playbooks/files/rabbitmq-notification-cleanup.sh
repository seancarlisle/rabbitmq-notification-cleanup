#!/bin/bash

# Cycle through and purge notification queues
for VHOST in $(rabbitmqctl list_vhosts | grep -v List)
do
   QUEUES_TO_PURGE=$(rabbitmqctl list_queues -p $VHOST | awk '/notificat/ {if ($2 > 0) print $1}')

   for QUEUE in $QUEUES_TO_PURGE
   do
      echo rabbitmqctl purge_queues -p $VHOST $QUEUE
   done
done
