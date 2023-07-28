ingress:
	@printf "Install nginx-ingress-controller? [y/N] " && read ans && [ $${ans:-N} = y ]
	@helm upgrade --install nginx-ingress oci://ghcr.io/nginxinc/charts/nginx-ingress -f nginx-ingress/values.yaml --version 0.18.0

forecastle-helm:
	@printf "Install forecastle? [y/N] " && read ans && [ $${ans:-N} = y ]
	@helm repo add stakater https://stakater.github.io/stakater-charts
	@helm repo update
	@helm upgrade --install my-forecastle stakater/forecastle -f forecastle/values.yaml --version 1.0.128

cert-manager:
	@printf "Install cert-manager? [y/N] " && read ans && [ $${ans:-N} = y ]
	@helm repo add jetstack https://charts.jetstack.io
	@helm repo update
	@helm upgrade \
		--install cert-manager jetstack/cert-manager \
		--namespace cert-manager \
		--create-namespace \
		--version v1.12.0 \
		--set installCRDs=true

external-DNS:
	@printf "Install external-DNS? [y/N] " && read ans && [ $${ans:-N} = y ]
	@helm repo add bitnami https://charts.bitnami.com/bitnami
	@helm repo update
	@helm upgrade --install external-dns bitnami/external-dns -f externalDNS/values.yaml

argocd:
	@printf "Install argocd? [y/N] " && read ans && [ $${ans:-N} = y ]
	@helm repo add argo https://argoproj.github.io/argo-helm
	@helm repo update
	@helm upgrade --install argo-cd argo/argo-cd -f argo/values.yaml --version 5.41.2

argocd-password:
	@echo Password: $$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)
