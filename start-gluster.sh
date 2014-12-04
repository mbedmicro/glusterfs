

# Start newrelic monitoring
service newrelic-sysmond start

service glusterd start


shutdown_gluster()
{
  service glusterd stop
  service newrelic-sysmond stop  
  exit $?
}

trap shutdown_gluster SIGINT
while true; do sleep 1; done
