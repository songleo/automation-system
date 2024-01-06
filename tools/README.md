## 通过docker模拟vm

可以使用当前目录的Dockerfile创建一个模拟vm的容器，用来加入awx，然后将playbook运行在这个模拟的vm。比如：

```
docker run -d -p 11111:22 --name vm1 songleo/ubuntu-ssh
ssh admin@192.168.0.106 -p 11111
```

## build image

```

```
