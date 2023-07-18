KUBE_CONFIG="/opt/apps/kubernetes/conf/kube-proxy.kubeconfig"
KUBE_APISERVER="https://192.168.0.103:6443"

kubectl config set-cluster kubernetes \
  --certificate-authority=/opt/certs/ca.pem \
  --embed-certs=true \
  --server=${KUBE_APISERVER} \
  --kubeconfig=${KUBE_CONFIG}

kubectl config set-credentials kube-proxy \
  --client-certificate=/opt/certs/kube-proxy.pem \
  --client-key=/opt/certs/kube-proxy-key.pem \
  --embed-certs=true \
  --kubeconfig=${KUBE_CONFIG}

kubectl config set-context default \
  --cluster=kubernetes \
  --user=kube-proxy \
  --kubeconfig=${KUBE_CONFIG}

kubectl config use-context default --kubeconfig=${KUBE_CONFIG}
