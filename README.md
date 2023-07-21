# Installation

```sh
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
```

- test

```sh
kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=90s
```

- In progress

```sh
Jellyfin
Jellyseerr
Prowlarr
Radarr
Sonarr
Qbittorrent web
Flaresolverr
Joal
```