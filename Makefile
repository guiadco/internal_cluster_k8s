.PHONY: jellyfin jellyseerr prowlarr qbittorrent radarr sonarr nginx-ingress forecastle flaresolverr external-dns cert-manager longhorn cert-manager-issuer kube-prometheus-stack
argocd:
	@helm repo add argo https://argoproj.github.io/argo-helm
	@helm repo update
	@helm upgrade --install argo-cd argo/argo-cd -n argo-cd -f argo/values.yaml --version 5.41.2

argocd-password:
	@echo Password: $$(kubectl get secret argocd-initial-admin-secret -n argo-cd -o jsonpath="{.data.password}" | base64 -d)

jellyfin:
	@printf "Deploy jellyfin application\n"
	@kubectl apply -f jellyfin/application.yaml

jellyseerr:
	@printf "Deploy jellyseerr application\n"
	@kubectl apply -f jellyseerr/application.yaml

prowlarr:
	@printf "Deploy prowlarr application\n"
	@kubectl apply -f prowlarr/application.yaml

qbittorrent:
	@printf "Deploy qbittorrent application\n"
	@kubectl apply -f qbittorrent/application.yaml

radarr:
	@printf "Deploy radarr application\n"
	@kubectl apply -f radarr/application.yaml

sonarr:
	@printf "Deploy sonarr application\n"
	@kubectl apply -f sonarr/application.yaml

nginx-ingress:
	@printf "Deploy nginx-ingress application\n"
	@kubectl apply -f nginx-ingress/application.yaml

forecastle:
	@printf "Deploy forecastle application\n"
	@kubectl apply -f forecastle/application.yaml

flaresolverr:
	@printf "Deploy flaresolverr application\n"
	@kubectl apply -f flaresolverr/application.yaml

external-dns:
	@printf "Deploy external-dns application\n"
	@kubectl apply -f external-dns/application.yaml

cert-manager:
	@printf "Install cert-manager application\n"
	@kubectl apply -f cert-manager/helm-application.yaml

longhorn:
	@printf "Install longhorn application\n"
	@kubectl apply -f longhorn/application.yaml

cert-manager-issuer:
	@printf "Deploy cert-manager-issuer application\n"
	@kubectl apply -f cert-manager-issuer/cluster-prod-issuer.yaml
	@kubectl apply -f cert-manager-issuer/cluster-staging-issuer.yaml

kube-prometheus-stack:
	@printf "Install kube-prometheus-stack application\n"
	@kubectl apply -f kube-prometheus-stack/application.yaml
