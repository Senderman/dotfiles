# Show etcd cluster status

```bash
etcdctl endpoint status -w=table --cluster
```

# List nodes and cluster name

```bash
patronictl -c /etc/patroni/patroni.yml list
```

# Switch leader

```bash
patronictl -c /etc/patroni/patroni.yml switchover
```

# Re-init REPLICA

```bash
patronictl -c /etc/patroni/patroni.yml reinit CLUSTERNAME NODENAME
```

