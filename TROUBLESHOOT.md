```sh
➜  ~ helm install my-qbittorrent truecharts/qbittorrent --version 15.0.29
NAME: my-qbittorrent
LAST DEPLOYED: Fri Jul 21 13:17:02 2023
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
# Welcome to using <qbittorrent>.
Thank you for installing thank you for choosing TrueCharts

## Using <qbittorrent>
## Documentation
Please check out the TrueCharts documentation on:
https://truecharts.com

OpenSource can only exist with your help, please consider supporting TrueCharts:
https://truecharts.org/sponsor

➜  ~ helm install my-flaresolverr k8s-at-home/flaresolverr --version 5.4.2
NAME: my-flaresolverr
LAST DEPLOYED: Fri Jul 21 13:22:49 2023
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
1. Get the application URL by running these commands:
  export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=flaresolverr,app.kubernetes.io/instance=my-flaresolverr" -o jsonpath="{.items[0].metadata.name}")
  echo "Visit http://127.0.0.1:8080 to use your application"
  kubectl port-forward $POD_NAME 8080:8191

➜  ~ helm install my-sonarr k8s-at-home/sonarr --version 16.3.2
NAME: my-sonarr
LAST DEPLOYED: Fri Jul 21 13:22:53 2023
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
1. Get the application URL by running these commands:
  export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=sonarr,app.kubernetes.io/instance=my-sonarr" -o jsonpath="{.items[0].metadata.name}")
  echo "Visit http://127.0.0.1:8080 to use your application"
  kubectl port-forward $POD_NAME 8080:8989
➜  ~ helm install my-radarr k8s-at-home/radarr --version 16.3.2
NAME: my-radarr
LAST DEPLOYED: Fri Jul 21 13:22:58 2023
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
1. Get the application URL by running these commands:
  export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=radarr,app.kubernetes.io/instance=my-radarr" -o jsonpath="{.items[0].metadata.name}")
  echo "Visit http://127.0.0.1:8080 to use your application"
  kubectl port-forward $POD_NAME 8080:7878

➜  ~ helm install my-jellyfin k8s-at-home/jellyfin --version 9.5.3
NAME: my-jellyfin
LAST DEPLOYED: Fri Jul 21 13:23:13 2023
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
1. Get the application URL by running these commands:
  export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=jellyfin,app.kubernetes.io/instance=my-jellyfin" -o jsonpath="{.items[0].metadata.name}")
  echo "Visit http://127.0.0.1:8080 to use your application"
  kubectl port-forward $POD_NAME 8080:8096

➜  ~ helm install my-jellyseer qjoly/jellyseer --version 1.0.0
NAME: my-jellyseer
LAST DEPLOYED: Fri Jul 21 13:23:17 2023
NAMESPACE: default
STATUS: deployed
REVISION: 1

➜  ~ helm install my-prowlarr truecharts/prowlarr --version 11.0.32
NAME: my-prowlarr
LAST DEPLOYED: Fri Jul 21 13:24:00 2023
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
# Welcome to using <prowlarr>.
Thank you for installing thank you for choosing TrueCharts

## Using <prowlarr>
## Documentation
Please check out the TrueCharts documentation on:
https://truecharts.com

OpenSource can only exist with your help, please consider supporting TrueCharts:
https://truecharts.org/sponsor
```