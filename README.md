# Lab - Automate Quay registry mirror using Ansible

This repository contains ansible code to automate the configuration and mirror image repositories from an source organization to a destiny organization between different Quay instances.

This lab is based on the Redhat official public documentation

- [Proof of Concept - Deploying Red Hat Quay]

    [Proof of Concept - Deploying Red Hat Quay]: https://docs.redhat.com/en/documentation/red_hat_quay/3.17/html/proof_of_concept_-_deploying_red_hat_quay/index

- [Manage Redhat Quay]

    [Manage Redhat Quay]: https://docs.redhat.com/en/documentation/red_hat_quay/3.17/html/manage_red_hat_quay/arch-mirroring-intro#mirroring-worker

## Running lab containers

1. Create the certificates for the registries

```bash
ANSIBLE_COLLECTIONS_PATH=$PWD ansible-playbook create_ca_certs.yaml
```

2. Create the Quay registry containers.

```bash
# v314
# ANSIBLE_COLLECTIONS_PATH=$PWD ansible-playbook -K -e @inventory_quay314_registry01.yaml create_quay.yaml
# ANSIBLE_COLLECTIONS_PATH=$PWD ansible-playbook -K -e @inventory_quay314_registry02.yaml create_quay.yaml
```

```bash
# v317
# ANSIBLE_COLLECTIONS_PATH=$PWD ansible-playbook -K -e @inventory_quay317_registry01.yaml create_quay.yaml
# ANSIBLE_COLLECTIONS_PATH=$PWD ansible-playbook -K -e @inventory_quay317_registry02.yaml create_quay.yaml
```

3. Create first user and api token

```bash
# v314
# ANSIBLE_COLLECTIONS_PATH=$PWD ansible-playbook -e @inventory_quay314_registry01.yaml create_quay_first_user.yaml
# ANSIBLE_COLLECTIONS_PATH=$PWD ansible-playbook -e @inventory_quay314_registry02.yaml create_quay_first_user.yaml
```

```bash
# v317
# ANSIBLE_COLLECTIONS_PATH=$PWD ansible-playbook -e @inventory_quay317_registry01.yaml create_quay_first_user.yaml
# ANSIBLE_COLLECTIONS_PATH=$PWD ansible-playbook -e @inventory_quay317_registry02.yaml create_quay_first_user.yaml
```

4. Seeding Quay instances

```bash
# v314
# ANSIBLE_COLLECTIONS_PATH=$PWD ansible-playbook -e @inventory_quay314_registry01_seed.yaml quay_seed.yaml
# ANSIBLE_COLLECTIONS_PATH=$PWD ansible-playbook -e @inventory_quay314_registry02_seed.yaml quay_seed.yaml
```

```bash
# v317
# ANSIBLE_COLLECTIONS_PATH=$PWD ansible-playbook -e @inventory_quay317_registry01_seed.yaml quay_seed.yaml
# ANSIBLE_COLLECTIONS_PATH=$PWD ansible-playbook -e @inventory_quay317_registry02_seed.yaml quay_seed.yaml
```

5. Configuring mirror between Quay registries

```bash
# v314
# ANSIBLE_COLLECTIONS_PATH=$PWD ansible-playbook -e @inventory_quay314_mirror.yaml quay_site_mirror.yaml
```

```bash
# v317
# ANSIBLE_COLLECTIONS_PATH=$PWD ansible-playbook -e @inventory_quay317_mirror.yaml quay_site_mirror.yaml
```

## License

GNU General Public License v3.0 or later.

See [LICENSE](https://www.gnu.org/licenses/gpl-3.0.txt) to see the full text.
    
