# home-server-k8s


## Get Started
### Install k3s

```sh
curl -sfL https://get.k3s.io | sudo sh -
```
This command downloads the K3s installation script and runs it with root privileges.


```sh
sudo systemctl status k3s
```

Validate
```sh
sudo kubectl get nodes
```




Configure kubectl
```sh
mkdir -p $HOME/.kube
sudo cp /etc/rancher/k3s/k3s.yaml $HOME/.kube/config
sudo chown $USER:$USER $HOME/.kube/config
```



### Uninstall k3s ###
```sh
sudo /usr/local/bin/k3s-uninstall.sh
```


### Delete TRAEFIK ###

```sh
kubectl delete deployment traefik -n kube-system
kubectl delete service traefik -n kube-system
```
