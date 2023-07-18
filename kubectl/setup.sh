mkdir /root/.kube

KUBE_CONFIG="/root/.kube/config"
KUBE_APISERVER="https://192.168.0.106:6443"

kubectl config set-cluster kubernetes \
  --certificate-authority=/opt/certs/ca.pem \
  --embed-certs=true \
  --server=${KUBE_APISERVER} \
  --kubeconfig=${KUBE_CONFIG}


kubectl config set-credentials cluster-admin \
  --client-certificate=/opt/certs/admin.pem \
  --client-key=/opt/certs/admin-key.pem \
  --embed-certs=true \
  --kubeconfig=${KUBE_CONFIG}


kubectl config set-context default \
  --cluster=kubernetes \
  --user=cluster-admin \
  --kubeconfig=${KUBE_CONFIG}

kubectl config use-context default --kubeconfig=${KUBE_CONFIG}
