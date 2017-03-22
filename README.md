# bluemix-kubernetes-sample

The Bluemix Kubernetes sample demonstrates how to set up your environment to deploy the Kubernetes Guestbook example pods to the IBM Bluemix Container Service. It is comprised of the following scripts
- ```install_bx.sh``` - Installs the Bluemix command line tools, the Container Service plugin to Bluemix command line tool, and the Kubernetes kubectrl command line tool.
- ```bx_login.sh``` - Authenticates the user to Bluemix and the Container Service. It relies on the following environment variables:
  - **BLUEMIX_USER** - Your Bluemix user ID.
  - **BLUEMIX_PASSWORD** - Your Bluemix password.
  - **CLUSTER_NAME** - The name of your Container Service cluster.
  - **BLUEMIX_ACCOUNT** - The ID of the Bluemix account where you created the cluster. Retrieve it with ``` bx iam accounts```.
  - **BLUEMIX_ORG** - Soecify your Bluemix organization when building with Travis. Not required when building with DevOps Services pipeline.
  - **BLUEMIX_SPACE** - Soecify your Bluemix space when building with Travis. Not required when building with DevOps Services pipeline.
- ```deploy.sh``` - Downloads the Guestbook Kubernetes configuration, and deploys it to the previously created cluster.

## Create an IBM DevOps Services toolchain
The Create Toolchain button below will create a Bluemix DevOps service tookchain and pipeline for deploying the Guestbook sample.

[![Create Toolchain](https://console.ng.bluemix.net/devops/graphics/create_toolchain_button.png)](https://console.ng.bluemix.net/devops/setup/deploy/?repository=https://github.com/IBMCloudDevOps/bluemix-kubernetes-sample)
