Deploy a full AWS EKS cluster with Terraform

## Configuration

You can store state in an [S3 backend](https://www.terraform.io/docs/backends/types/s3.html), with locking via DynamoDB  
Run `terraform init` and `terraform apply` on the `s3.tf` file to create the S3 backend before creating the cluster

### Terraform

You need to run the following commands to create the resources with Terraform:

```bash
cd eks-cluster
terraform init
terraform plan
terraform apply
```

### Setup kubectl

Setup your `KUBECONFIG`

```bash
terraform output kubeconfig > ~/.kube/eks-cluster
export KUBECONFIG=~/.kube/eks-cluster
```

### Cleaning up

You can destroy this cluster entirely by running:

```bash
terraform plan -destroy
terraform destroy  --force
```

### Prometheus - Grafana on EKS

The manifests are present in `eks-prom-grafana` directory  
Just run the `kustomization.yaml` file and all the resources will be created.  
Now, we are provided with the External IP which would help us access the prometheus and grafana server.

```bash
export ELB=$(kubectl get svc -n grafana grafana -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')
echo "http://$ELB"
kubectl get secret --namespace grafana grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```


### Deploy Loki

```bash
kubectl create namespace loki
helm repo add loki https://grafana.github.io/loki/charts
helm repo update
curl https://raw.githubusercontent.com/grafana/loki/master/production/helm/promtail/values.yaml > values.yaml
helm install promtail --namespace loki loki/promtail -f values.yaml
```

You can reach your Grafana instance and start exploring your logs. For example, if you want to see all logs in the loki namespace use {namespace="loki"}
