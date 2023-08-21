.PHONY: jellyfin jellyseerr prowlarr qbittorrent radarr sonarr nginx-ingress forecastle flaresolverr external-dns cert-manager kube-prometheus-stack

all-core: nginx-ingress nfs-provionner external-dns cert-manager kube-prometheus-stack
all-core-app: forecastle
all-torrent-app: jellyfin jellyseerr prowlarr qbittorrent radarr sonarr flaresolverr

########## ARGOCD ##########
argocd:
	@printf "Install argocd application\n"
	pushd argo-cd && \
		kubectl kustomize --enable-helm | kubectl apply -f - && \
		popd

argocd-password:
	@echo Password: $$(kubectl get secret argocd-initial-admin-secret -n argo-cd -o jsonpath="{.data.password}" | base64 -d)

########## FORECASTLE ##########

forecastle:
	@printf "Deploy forecastle application\n"
	@kubectl apply -f forecastle/application.yaml

nginx-ingress:
	@printf "Deploy nginx-ingress application\n"
	@kubectl apply -f nginx-ingress/application.yaml

########## CORE ##########
nfs-provionner:
	@printf "Install nfs-provionner application\n"
	@kubectl apply -f nfs-provionner/application.yaml

external-dns:
	@printf "Deploy external-dns application\n"
	@kubectl apply -f external-dns/application.yaml

external-service:
	@printf "Deploy external-service application\n"
	@kubectl apply -f external-service/application.yaml

cert-manager:
	@printf "Install cert-manager application\n"
	@kubectl apply -f cert-manager/helm-application.yaml

kube-prometheus-stack:
	@printf "Install kube-prometheus-stack application\n"
	@kubectl apply -f kube-prometheus-stack/application.yaml

pihole:
	@printf "Deploy pihole application\n"
	@kubectl apply -f pihole/application.yaml

########## TORRENT ##########
flaresolverr:
	@printf "Deploy flaresolverr application\n"
	@kubectl apply -f flaresolverr/application.yaml

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
