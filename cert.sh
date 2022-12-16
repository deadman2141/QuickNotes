scp /conf/acme/xenorchestra.fullchain root@192.168.10.100:/etc/ssl/xo/xo.crt
scp /conf/acme/xenorchestra.key root@192.168.10.100:/etc/ssl/xo/xo.key
scp /conf/acme/unificontroller.key root@192.168.10.60:/etc/ssl/private/unificontroller.key
scp /conf/acme/unificontroller.crt root@192.168.10.60:/etc/ssl/certs/unificontroller.crt
scp /conf/acme/graylog.crt root@192.168.10.45:/etc/graylog/tls/graylog-crt.pem
scp /conf/acme/graylog.key root@192.168.10.45:/etc/graylog/tls/graylog-keyt.pem
scp /conf/acme/so.key root@172.24.164.56:/etc/pki/managerssl.key
scp /conf/acme/so.fullchain.pem root@172.24.164.56:/etc/pki/managerssl.crt
