mrliberty@admin-vm:~/work/homework/ansible/hw/hw-02$ ansible-playbook -i playbook/inventory/prod.yml playbook/site.yml --diff

PLAY [Install Clickhouse on Ubuntu] *****************************************************************************************************************************************************************

TASK [Gathering Facts] ******************************************************************************************************************************************************************************
ok: [ubuntu-1]

TASK [Check for broken dependencies] ****************************************************************************************************************************************************************
ok: [ubuntu-1]

TASK [Fix dependencies] *****************************************************************************************************************************************************************************
skipping: [ubuntu-1]

TASK [Install dependencies] *************************************************************************************************************************************************************************
ok: [ubuntu-1]

TASK [Get clickhouse distrib (.deb)] ****************************************************************************************************************************************************************
changed: [ubuntu-1] => (item=clickhouse-client)
changed: [ubuntu-1] => (item=clickhouse-server)
failed: [ubuntu-1] (item=clickhouse-common-static) => {"ansible_loop_var": "item", "changed": false, "dest": "/home/ubuntu/clickhouse-common-static_22.3.3.44_all.deb", "elapsed": 0, "item": "clickhouse-common-static", "msg": "Request failed", "response": "HTTP Error 404: Not Found", "status_code": 404, "url": "https://packages.clickhouse.com/deb/pool/main/c/clickhouse-common-static/clickhouse-common-static_22.3.3.44_all.deb"}

TASK [Get clickhouse distrib (fallback)] ************************************************************************************************************************************************************
changed: [ubuntu-1]

TASK [Check if files exist] *************************************************************************************************************************************************************************
ok: [ubuntu-1] => (item=clickhouse-client_22.3.3.44_all.deb)
ok: [ubuntu-1] => (item=clickhouse-server_22.3.3.44_all.deb)
ok: [ubuntu-1] => (item=clickhouse-common-static_22.3.3.44_amd64.deb)

TASK [Install clickhouse-common-static] *************************************************************************************************************************************************************
Selecting previously unselected package clickhouse-common-static.
(Reading database ... 95145 files and directories currently installed.)
Preparing to unpack .../clickhouse-common-static_22.3.3.44_amd64.deb ...
Unpacking clickhouse-common-static (22.3.3.44) ...
Setting up clickhouse-common-static (22.3.3.44) ...
changed: [ubuntu-1]

TASK [Install clickhouse-client and clickhouse-server] **********************************************************************************************************************************************
Selecting previously unselected package clickhouse-client.
(Reading database ... 95159 files and directories currently installed.)
Preparing to unpack .../clickhouse-client_22.3.3.44_all.deb ...
Unpacking clickhouse-client (22.3.3.44) ...
Setting up clickhouse-client (22.3.3.44) ...
changed: [ubuntu-1] => (item=clickhouse-client_22.3.3.44_all.deb)
Selecting previously unselected package clickhouse-server.
(Reading database ... 95172 files and directories currently installed.)
Preparing to unpack .../clickhouse-server_22.3.3.44_all.deb ...
Unpacking clickhouse-server (22.3.3.44) ...
Setting up clickhouse-server (22.3.3.44) ...
Processing triggers for systemd (245.4-4ubuntu3.24) ...
changed: [ubuntu-1] => (item=clickhouse-server_22.3.3.44_all.deb)

TASK [Check for broken dependencies] ****************************************************************************************************************************************************************
ok: [ubuntu-1]

TASK [Fix dependencies] *****************************************************************************************************************************************************************************
skipping: [ubuntu-1]

TASK [Flush handlers] *******************************************************************************************************************************************************************************

RUNNING HANDLER [Start clickhouse service] **********************************************************************************************************************************************************
changed: [ubuntu-1]

TASK [Ensure clickhouse-server is installed] ********************************************************************************************************************************************************
ok: [ubuntu-1]

TASK [Create database] ******************************************************************************************************************************************************************************
changed: [ubuntu-1]

PLAY [Install Vector on Ubuntu] *********************************************************************************************************************************************************************

TASK [Gathering Facts] ******************************************************************************************************************************************************************************
ok: [ubuntu-2]

TASK [Check for broken dependencies] ****************************************************************************************************************************************************************
ok: [ubuntu-2]

TASK [Fix dependencies] *****************************************************************************************************************************************************************************
skipping: [ubuntu-2]

TASK [Download vector package (.deb)] ***************************************************************************************************************************************************************
changed: [ubuntu-2]

TASK [Install vector package] ***********************************************************************************************************************************************************************
Selecting previously unselected package vector.
(Reading database ... 95145 files and directories currently installed.)
Preparing to unpack .../vector_0.30.0-1_amd64.deb ...
Unpacking vector (0.30.0-1) ...
Setting up vector (0.30.0-1) ...
systemd-journal:x:101:
changed: [ubuntu-2]

TASK [Apply vector template] ************************************************************************************************************************************************************************
--- before
+++ after: /home/mrliberty/.ansible/tmp/ansible-local-17473n90b2x0f/tmp1durk0yr/vector.yml.j2
@@ -0,0 +1,15 @@
+sinks:
+    to_clickhouse:
+        compression: gzip
+        database: logs
+        endpoint: demo
+        healthcheck: true
+        inputs:
+        - demo_logs
+        skip_unknown_fields: true
+        table: vector_table
+        type: clickhouse
+sources:
+    demo_logs:
+        format: syslog
+        type: demo_logs

changed: [ubuntu-2]

TASK [Change vector systemd unit] *******************************************************************************************************************************************************************
--- before
+++ after: /home/mrliberty/.ansible/tmp/ansible-local-17473n90b2x0f/tmpu4uf1i5m/vector.service.j2
@@ -0,0 +1,14 @@
+[Unit]
+Description=Vector
+Documentation=https://vector.dev
+After=network-online.target
+Requires=network-online.target
+
+[Service]
+User=root
+Group=root
+ExecStart=/usr/bin/vector --config /etc/vector/vector.yml
+ExecReload=/bin/kill -HUP $MAINPID
+Restart=always
+[Install]
+WantedBy=multi-user.target
\ No newline at end of file

changed: [ubuntu-2]

TASK [Reload systemd to apply changes] **************************************************************************************************************************************************************
ok: [ubuntu-2]

TASK [Ensure vector service is enabled and started] *************************************************************************************************************************************************
changed: [ubuntu-2]

PLAY RECAP ******************************************************************************************************************************************************************************************
ubuntu-1                   : ok=11   changed=5    unreachable=0    failed=0    skipped=2    rescued=1    ignored=0   
ubuntu-2                   : ok=8    changed=5    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0