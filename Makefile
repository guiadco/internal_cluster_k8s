.PHONY: jellyfin jellyseerr prowlarr qbittorrent radarr sonarr nginx-ingress forecastle flaresolverr external-dns cert-manager longhorn cert-manager-issuer
argocd:
	@printf "Install argocd? [y/N] " && read ans && [ $${ans:-N} = y ]
	@helm repo add argo https://argoproj.github.io/argo-helm
	@helm repo update
	@helm upgrade --install argo-cd argo/argo-cd -f argo/values.yaml --version 5.41.2

argocd-password:
	@echo Password: $$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)

jellyfin:
	@printf "Deploy jellyfin app"
	@kubectl apply -f jellyfin/application.yaml

jellyseerr:
	@printf "Deploy jellyseerr app"
	@kubectl apply -f jellyseerr/application.yaml

prowlarr:
	@printf "Deploy prowlarr app"
	@kubectl apply -f prowlarr/application.yaml

qbittorrent:
	@printf "Deploy qbittorrent app"
	@kubectl apply -f qbittorrent/application.yaml

radarr:
	@printf "Deploy radarr app"
	@kubectl apply -f radarr/application.yaml

sonarr:
	@printf "Deploy sonarr app"
	@kubectl apply -f sonarr/application.yaml

nginx-ingress:
	@printf "Deploy nginx-ingress app"
	@kubectl apply -f nginx-ingress/application.yaml

forecastle:
	@printf "Deploy forecastle app"
	@kubectl apply -f forecastle/application.yaml

flaresolverr:
	@printf "Deploy flaresolverr app"
	@kubectl apply -f flaresolverr/application.yaml

external-dns:
	@printf "Deploy external-dns app"
	@kubectl apply -f external-dns/application.yaml

cert-manager:
	@printf "Install cert-manager app"
	@kubectl apply -f cert-manager/application.yaml

longhorn:
	@printf "Install longhorn app"
	@kubectl apply -f longhorn/application.yaml


cert-manager-issuer:
	@printf "Deploy cert-manager-issuer app"
	@kubectl apply -f cert-manager-issuer/cluster-prod-issuer.yaml
	@kubectl apply -f cert-manager-issuer/cluster-staging-issuer.yaml