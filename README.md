This repository offers a tool for quickly setting up an automation system utilizing the [AWX](https://github.com/ansible/awx). It's perfect for Proof of Concept (PoC), educational, or testing scenarios.

### Prerequisites

- [Docker Desktop](https://docs.docker.com/desktop/) 4.26.1
- [kind](https://github.com/kubernetes-sigs/kind) v0.20.0

### Building Automation System

```
$ git clone git@github.com:songleo/automation-system.git
$ cd automation-system
$ ./install.sh
```

### Access AWX Console

By default, the admin user is `admin` and the password is available in the <resourcename>-admin-password secret. To retrieve the admin password, run:

```
$ kubectl get secret awx-admin-password -o jsonpath="{.data.password}" | base64 --decode ; echo
admin
```

Please ensure that you add the mapping of IP addresses and domain names in your `/etc/hosts` file. For example, if your local IP is `192.168.0.106`, you need to add the following content to your `/etc/hosts` file.

```
192.168.0.106 www.automation-system.com
```

Then login console from this URL: http://www.automation-system.com/awx/#/home or http://localhost/awx/#/home

### Troubleshooting

You can use the following commands to load the docker image to Kind cluster if the Kind network is not good.

```
kind load docker-image quay.io/ansible/awx-operator:2.10.0 --name awx
kind load docker-image postgres:13 --name awx
kind load docker-image docker.io/redis:7 --name awx
kind load docker-image quay.io/ansible/awx:23.6.0 --name awx
kind load docker-image quay.io/ansible/awx-ee:latest --name awx
```

### Ref

- https://ansible.readthedocs.io/projects/awx-operator/en/latest/installation/basic-install.html
