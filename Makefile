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

argocd:
	@printf "Install argocd? [y/N] " && read ans && [ $${ans:-N} = y ]
	@helm repo add argo https://argoproj.github.io/argo-helm
	@helm repo update
	@helm upgrade --install argo-cd argo/argo-cd -f argo/values.yaml --version 5.41.2

argocd-password:
	@echo Password: $$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)
