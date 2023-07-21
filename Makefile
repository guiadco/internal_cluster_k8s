cluster:
	kind create cluster --config kind/config.yaml

ingress:
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
	kubectl wait --namespace ingress-nginx \
  		--for=condition=ready pod \
  		--selector=app.kubernetes.io/component=controller \
  		--timeout=90s

qbittorrent:
	helm repo add truecharts https://charts.truecharts.org/
	helm install my-qbittorrent truecharts/qbittorrent --version 15.0.29

flaresolvree:
	helm repo add k8s-at-home https://k8s-at-home.com/charts/
	helm install my-flaresolverr k8s-at-home/flaresolverr --version 5.4.2

sonarr:
	helm repo add k8s-at-home https://k8s-at-home.com/charts/
	helm install my-sonarr k8s-at-home/sonarr --version 16.3.2

radarr:
	helm repo add k8s-at-home https://k8s-at-home.com/charts/
	helm install my-radarr k8s-at-home/radarr --version 16.3.2

prowlarr:
	helm repo add truecharts https://truecharts.org/
	helm install my-prowlarr truecharts/prowlarr --version 11.0.32

jellyfin:
	helm repo add k8s-at-home https://k8s-at-home.com/charts/
	helm install my-jellyfin k8s-at-home/jellyfin --version 9.5.3

jellyseer:
	helm repo add qjoly https://qjoly.github.io/helm-charts/
	helm install my-jellyseer qjoly/jellyseer --version 1.0.0