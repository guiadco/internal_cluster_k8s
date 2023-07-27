ingress:
	@printf "Install nginx-ingress-controller? [y/N] " && read ans && [ $${ans:-N} = y ]
	@helm repo add nginx-stable https://helm.nginx.com/stable
	@helm repo update
	@helm install nginx-ingress nginx-stable/nginx-ingress --set rbac.create=true
	@kubectl wait --namespace ingress-nginx \
  		--for=condition=ready pod \
  		--selector=app.kubernetes.io/component=controller \
  		--timeout=90s

cert-manager:
	@printf "Install cert-manager? [y/N] " && read ans && [ $${ans:-N} = y ]
	@helm repo add jetstack https://charts.jetstack.io
	@helm repo update
	@helm install \
		cert-manager jetstack/cert-manager \
		--namespace cert-manager \
		--create-namespace \
		--version v1.12.0 \
		--set installCRDs=true

external-DNS:
	@printf "Install external-DNS? [y/N] " && read ans && [ $${ans:-N} = y ]
	@helm repo add bitnami https://charts.bitnami.com/bitnami
	@helm repo update
	@helm install external-dns bitnami/external-dns -f externalDNS/values.yaml

argocd:
	@printf "Install argocd? [y/N] " && read ans && [ $${ans:-N} = y ]
	@helm repo add argo https://argoproj.github.io/argo-helm
	@helm repo update
	@helm upgrade --install argo-cd argo/argo-cd -f argo/values.yaml --version 5.41.2

argocd-password:
	@echo Password: $$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)

qbittorrent:
	@printf "Install qbittorrent? [y/N] " && read ans && [ $${ans:-N} = y ]
	@helm repo add truecharts https://charts.truecharts.org/
	@helm repo update
	@helm install my-qbittorrent truecharts/qbittorrent --version 15.0.29

flaresolvree:
	@printf "Install flaresolverr? [y/N] " && read ans && [ $${ans:-N} = y ]
	@helm repo add k8s-at-home https://k8s-at-home.com/charts/
	@helm repo update
	@helm install my-flaresolverr k8s-at-home/flaresolverr --version 5.4.2

sonarr:
	@printf "Install sonarr? [y/N] " && read ans && [ $${ans:-N} = y ]
	@helm repo add k8s-at-home https://k8s-at-home.com/charts/
	@helm repo update
	@helm install my-sonarr k8s-at-home/sonarr --version 16.3.2

radarr:
	@printf "Install radarr? [y/N] " && read ans && [ $${ans:-N} = y ]
	@helm repo add k8s-at-home https://k8s-at-home.com/charts/
	@helm repo update
	@helm install my-radarr k8s-at-home/radarr --version 16.3.2

prowlarr:
	@printf "Install prowlarr? [y/N] " && read ans && [ $${ans:-N} = y ]
	@helm repo add truecharts https://truecharts.org/ || true
	@helm repo update
	@helm install my-prowlarr truecharts/prowlarr --version 11.0.32

jellyfin:
	@printf "Install jellyfin? [y/N] " && read ans && [ $${ans:-N} = y ]
	@helm repo add k8s-at-home https://k8s-at-home.com/charts/
	@helm repo update
	@helm install my-jellyfin k8s-at-home/jellyfin --version 9.5.3

jellyseer:
	@printf "Install jellyseer? [y/N] " && read ans && [ $${ans:-N} = y ]
	@helm repo add qjoly https://qjoly.github.io/helm-charts/
	@helm repo update
	@helm install my-jellyseer qjoly/jellyseer --version 1.0.0