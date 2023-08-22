```
root@yoda:~/.acme.sh# export AWS_ACCESS_KEY_ID=""
root@yoda:~/.acme.sh# export  AWS_SECRET_ACCESS_KEY=""
root@yoda:~/.acme.sh# /root/.acme.sh/acme.sh --issue --dns dns_aws -d yoda.geekhomeinside.io --renew-hook "cat /root/.acme.sh/yoda.geekhomeinside.io/fullchain.cer /root/.acme.sh/yoda.geekhomeinside.io/yoda.geekhomeinside.io.key >/etc/frontview/apache/apache2.pem && service apache2 restart"
```
