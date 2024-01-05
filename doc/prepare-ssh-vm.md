

### prepare vm to run the playbook

```
docker run -d -p 11111:22 --name vm1 songleo/ubuntu-ssh
docker run -d -p 22222:22 --name vm2 songleo/ubuntu-ssh
ssh user1@192.168.0.106 -p 11111
ssh user1@192.168.0.106 -p 22222
```

### add host to
