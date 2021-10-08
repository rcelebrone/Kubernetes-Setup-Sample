# Instale minikube, kubectl, kubens, kubectx, docker

- https://docs.docker.com/v17.12/install
- https://kubernetes.io/docs/tasks/tools/install-kubectl
- https://kubernetes.io/docs/tasks/tools/install-minikube
- https://github.com/ahmetb/kubectx

# inicie o minikube

minikube start

# abre no browser o dash do kubernetes

minikube dashboard

# Faça o build da imagem e envie para o Docker Hub:

docker build . -t rcelebrone/apipy-hello:1.4
docker push rcelebrone/apipy-hello:1.4

# Crie o pod no kubernetes

kubectl create -f kube/pod.yaml

# Crie o deployment para permitir trabalhar com scale

kubectl apply -f kube/deployment.yaml

# Acompanhando o log

kubectl logs --follow --tail 0 --selector="app=apipy-hello"

# Criando service 

kubectl apply -f kube/service.yaml

# Assistindo o service localmente

kubectl port-forward svc/apipy-hello-service 2000:3000

# Acrescente o ingress para trabalhar com loadbalancer

minikube addons enable ingress 

# Crie um loadbalancer para seu serviço

kubectl apply -f kube/ingress.yaml

# editar o arquivo hosts e colocar o endereço do loadbalancer
### o ip do lb é gerado após a criação do mesmo (e não muda em atualizações, só se deletar e criar novamente)

vim /etc/hosts
>>> 192.168.49.2 apipy.kube.local

# acesse o serviço

curl http://apipy.kube.local/

# monitoring

kubectl logs -l app=apipy-hello -f

# Plus (um redis) - conecta e pinga
kubectl port-forward svc/redis-service 7000:9000
redis-cli -h localhost -p 7000 ping

# Referências
- https://github.com/rcelebrone/Docker-Kubernetes-Tips
- https://eduardomatos.dev/fazendo-seu-primeiro-deploy-no-kubernetes/
- https://scoutapm.com/blog/how-to-use-docker-healthcheck


### HELM
### kustomize
