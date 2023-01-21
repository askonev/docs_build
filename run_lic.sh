#!/bin/bash

## main configs
PORT=80
VERSION=7.3.0.156
JWT_ENABLED=false


docker run  -itd \
            -p $PORT:80 \
            -v licence:/app/onlyoffice/DocumentServer/data
            --env JWT_ENABLED=$JWT_ENABLED \
            --restart unless-stopped \
            --name ds_dev_lic \
            onlyoffice/4testing-documentserver-ee:$VERSION

sleep 120

# docker exec ds_dev_lic  /var/www/onlyoffice/documentserver/npm/json -f \
                # /etc/onlyoffice/documentserver/local.json 'services.CoAuthoring.secret.session.string'
                
docker exec ds_dev_lic sudo supervisorctl start ds:example
docker exec ds_dev_lic sudo sed 's,autostart=false,autostart=true,' -i /etc/supervisor/conf.d/ds-example.conf
docker exec ds_dev_lic cat /etc/supervisor/conf.d/ds-example.conf | grep autostart
