# Ansible Role: Lighthouse
[MIT](https://opensource.org/licenses/MIT)

## Description

Deploy [lighthouse](https://lighthouse-book.sigmaprime.io/intro.html) using ansible.

## Requirements

- Ansible >= 2.11
- Debian and python3 on deployer machine.

## Example

### Playbook

```yaml
---
- name: Lighthouse Install
  hosts: lighthouse
  roles:
    - role: lighthouse
      tags: lighthouse

```

## License

This project is licensed under MIT License.


## Author Information

[lighthouse](https://lighthouse-book.sigmaprime.io/intro.html) by Google  
Role by [liberaty](https://github.com/liberaty).