# Setup certificate for Cockpit with let's encrypt and cloudflare

- [Source](https://ryan.lovelett.me/posts/letsencrypt-cockpit/)

- setup cloudflare and certbot

```
dnf install python3-certbot python3-certbot-dns-cloudflare
```

- register ACME account

```
sudo certbot register --email "guiadco@geekhomeinside.com"
```

- request certificate

```
sudo certbot certonly --dns-cloudflare --dns-cloudflare-credentials ~/.secrets/cloudflare.ini --domains geekhomeinside.com
```

- Certbot Systemd Unit and Timers

```
sudo vi /etc/systemd/system/certbot.service
```

```
[Unit]
Description=Let's Encrypt renewal via Certbot
Documentation=https://letsencrypt.readthedocs.io/en/latest/

[Service]
Type=oneshot
ExecStart=/usr/bin/certbot renew --quiet --agree-tos
```

```
sudo vi /etc/systemd/system/certbot.timer
```

```
[Unit]
Description=Twice daily renewal of Let's Encrypt's certificates

[Timer]
OnCalendar=0/12:00:00
RandomizedDelaySec=1h
Persistent=true

[Install]
WantedBy=timers.target
```

```
sudo systemctl daemon-reload
```

```
sudo systemctl enable --now certbot.timer
```

- Check

```
sudo systemctl list-timers
```

- Configure cockpit

```
sudo cp /etc/letsencrypt/live/geekhomeinside.com/fullchain.pem /etc/cockpit/ws-certs.d/geekhomeinside.com.crt
sudo cp /etc/letsencrypt/live/geekhomeinside.com/privkey.pem /etc/cockpit/ws-certs.d/geekhomeinside.com.key
```

Auto renew certificate

```
/etc/letsencrypt/renewal-hooks/post/001-restart-cockpit.sh
```


```
#!/usr/bin/env bash

echo "SSL certificates renewed"

cp /etc/letsencrypt/live/geekhomeinside.com/fullchain.pem /etc/cockpit/ws-certs.d/geekhomeinside.com.crt
cp /etc/letsencrypt/live/geekhomeinside.com/privkey.pem /etc/cockpit/ws-certs.d/geekhomeinside.com.key

echo "Restarting Cockpit"
systemctl restart cockpit
```

