# Getting started

Start virtual machines

```
vagrant up
```

Then create the k8s cluster with kubespray

```
git clone https://github.com/kubernetes-incubator/kubespray
```

and follow the getting started instructions.

```
cd kubespray

# Install dependencies from ``requirements.txt``
sudo pip install -r requirements.txt

# Copy ``inventory/sample`` as ``inventory/mycluster``
cp -rfp inventory/sample inventory/mycluster

# Update Ansible inventory file with inventory builder
declare -a IPS=(192.168.33.11 192.168.33.12 192.168.33.13)
CONFIG_FILE=inventory/mycluster/hosts.ini python3 contrib/inventory_builder/inventory.py ${IPS[@]}

# Review and change parameters under ``inventory/mycluster/group_vars``
cat inventory/mycluster/group_vars/all.yml
cat inventory/mycluster/group_vars/k8s-cluster.yml
```

Remember to setup flannel, and add the following to hosts.ini file.

```ini
[all:vars]
ansible_user=root
flannel_interface_regexp=192.168.33.*
```

Deploy kubespray

```
ansible-playbook -i inventory/mycluster/hosts.ini --private-key ../id_rsa cluster.yml
```

## Notes

You can access the vms using the id_rsa key included in the repo

```
ssh -i id_rsa root@192.168.33.11
```
