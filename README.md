Simple playbook to install a cron job on a RabbitMQ host to purge notification queue messages
that are without consumers. This playbook requires a running OpenStack cloud deployed using
the openstack-ansible project.

## Usage
1. Pull down this repository to the deployment host
`git clone https://seancarlisle/rabbitmq-notification-cleanup.git /opt/rabbitmq-notification-cleanup`
1. Deploy the cron job
   `cd /opt/rabbitmq-notification-cleanup/playbooks
   ansible-playbook -i /opt/openstack-ansible/inventory deploy.yml`
