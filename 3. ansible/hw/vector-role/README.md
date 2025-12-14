# Ansible Role: vector
[MIT](https://opensource.org/licenses/MIT)

## Description

Deploy [Vector](https://vector.dev) using ansible.

## Requirements

- Ansible >= 2.11
- Debian and python3 on deployer machine.
## Role Variables
--------------

All variables which can be overridden are stored in defaults/main.yml file as well as in table below.

| Name           | Default Value | Description                        |
| -------------- | ------------- | -----------------------------------|
| `vector_version` | 0.42.0 | Vector package version. |
## Example Playbook
----------------

```
---
- name: Install Vector
  hosts: vector
  roles:
    - role: vector
      tags: vector
  vars:
    - vector_version: "0.42.0"

```

## License
-------

This project is licensed under MIT License.

## Author Information
------------------

[Vector](https://vector.dev/docs/) by [datalog](https://www.datadoghq.com/about/leadership/).
Role by [liberaty](https://github.com/liberaty).