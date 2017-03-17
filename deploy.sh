#!/bin/sh

echo "Create Guestbook"
IP_ADDR=$(sudo bx cs workers $CLUSTER_NAME | grep deployed | awk '{ print $2 }')

echo -e "\tConfiguring vars"
$(sudo bx cs cluster-config $CLUSTER_NAME | grep export)

echo -e "\tDownlodaing guestbook yml"
curl "https://raw.githubusercontent.com/kubernetes/kubernetes/master/examples/guestbook/all-in-one/guestbook-all-in-one.yaml" > guestbook.yml
sed -i '130i\ \ type: NodePort' guestbook.yml #For OSX: brew install gnu-sed; replace sed references with gsed

echo -e "\tChecking if previous version of guestbook exists"
sudo kubectl get services | grep frontend > /dev/null
RET=$?

#Service exists
if [ $RET -eq 0 ]; then
  echo -e "\tDeleting previous version of guestbook"
  sudo kubectl delete -f guestbook.yml
fi

echo -e "\tCreating guestbook"
sudo kubectl create -f guestbook.yml

PORT=$(sudo kubectl get services | grep frontend | sed 's/.*://g' | sed 's/\/.*//g')

echo ""
echo "View the guestbook at http://$IP_ADDR:$PORT"
