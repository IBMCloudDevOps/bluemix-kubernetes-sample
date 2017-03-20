#!/bin/bash

echo "Create Guestbook"
IP_ADDR=$(bx cs workers $CLUSTER_NAME | grep deployed | awk '{ print $2 }')

echo -e "\tConfiguring vars"
exp=$(bx cs cluster-config $CLUSTER_NAME | grep export)
if [ $? -ne 0 ]; then
  echo "Cluster $CLUSTER_NAME not created or not ready."
  exit 1
fi
eval "$exp"

echo -e "\tDownloading guestbook yml"
curl --silent "https://raw.githubusercontent.com/kubernetes/kubernetes/master/examples/guestbook/all-in-one/guestbook-all-in-one.yaml" > guestbook.yml
sed -i '130i\ \ type: NodePort' guestbook.yml #For OSX: brew install gnu-sed; replace sed references with gsed

echo -e "\tChecking if previous version of guestbook exists"
kubectl get services | grep frontend > /dev/null
RET=$?

#Service exists
if [ $RET -eq 0 ]; then
  echo -e "\tDeleting previous version of guestbook"
  kubectl delete -f guestbook.yml
fi

echo -e "\tCreating guestbook"
kubectl create -f guestbook.yml

PORT=$(kubectl get services | grep frontend | sed 's/.*://g' | sed 's/\/.*//g')

echo ""
echo "View the guestbook at http://$IP_ADDR:$PORT"
