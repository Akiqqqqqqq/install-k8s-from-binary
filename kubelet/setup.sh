KUBE_CONFIG="/opt/apps/kubernetes/conf/bootstrap.kubeconfig"
KUBE_APISERVER="https://192.168.0.107:6443"
TOKEN="8f39002fb9f3395844c7063384ff3a21"


kubectl config set-cluster kubernetes \
  --certificate-authority=/opt/certs/ca.pem \
  --embed-certs=true \
  --server=${KUBE_APISERVER} \
  --kubeconfig=${KUBE_CONFIG}

kubectl config set-credentials "kubelet-bootstrap" \
  --token=${TOKEN} \
  --kubeconfig=${KUBE_CONFIG}

kubectl config set-context default \
  --cluster=kubernetes \
  --user="kubelet-bootstrap" \
  --kubeconfig=${KUBE_CONFIG}
  
kubectl config use-context default --kubeconfig=${KUBE_CONFIG}
