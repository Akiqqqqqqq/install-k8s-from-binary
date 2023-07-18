KUBE_CONFIG="/opt/apps/kubernetes/conf/kube-scheduler.kubeconfig"
KUBE_APISERVER="https://192.168.0.103:6443"

kubectl config set-cluster kubernetes \
  --certificate-authority=/opt/certs/ca.pem \
  --embed-certs=true \
  --server=${KUBE_APISERVER} \
  --kubeconfig=${KUBE_CONFIG}
kubectl config set-credentials kube-scheduler \
  --client-certificate=/opt/certs/scheduler.pem \
  --client-key=/opt/certs/scheduler-key.pem \
  --embed-certs=true \
  --kubeconfig=${KUBE_CONFIG}
kubectl config set-context default \
  --cluster=kubernetes \
  --user=kube-scheduler \
  --kubeconfig=${KUBE_CONFIG}
kubectl config use-context default --kubeconfig=${KUBE_CONFIG}
