当你运行脚本安装好awx后，通过以下方式创建2个docker模拟的vm：

```
$ docker run -d -p 11111:22 --name vm1 songleo/ubuntu-ssh
$ docker run -d -p 22222:22 --name vm2 songleo/ubuntu-ssh
```

你可以在本地通过一下方式验证，登录这个2个vm：

```
$ ssh user1@192.168.0.106 -p 11111
$ ssh user1@192.168.0.106 -p 22222
```

然后使用playbook去配置你的awx，这里分别配置登录vm需要使用的credential，将vm加入awx，创建一个job template运行job：

```
$ export CONTROLLER_HOST="http://www.automation-system.com/awx/"
$ export CONTROLLER_USERNAME="admin"
$ export CONTROLLER_PASSWORD="EfGxdSBE56HLvFbhTFQKUAKPXwMk5zoD" # notsecret
$ ansible-playbook playbooks/configure_awx.yml
```

最后通过playbook运行新建的job template去ping 2个vm：

```
$ ansible-playbook playbooks/launch_job.yml
[WARNING]: No inventory was parsed, only implicit localhost is available
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not
match 'all'

PLAY [Launch job] ************************************************************************************************

TASK [Launch job] ************************************************************************************************
changed: [localhost]

TASK [Wait for the job to finish] ********************************************************************************
ok: [localhost]

TASK [Print the job result] **************************************************************************************
ok: [localhost] => {
    "job_result": {
        "changed": false,
        "elapsed": 4.436,
        "failed": false,
        "finished": "2024-01-06T09:10:06.248441Z",
        "id": 102,
        "started": "2024-01-06T09:10:01.812450Z",
        "status": "successful"
    }
}

PLAY RECAP *******************************************************************************************************
localhost                  : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

```
