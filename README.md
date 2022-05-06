# Nacos on eks

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

A Helm chart for Kubernetes

Nacos (official site: [nacos.io](https://nacos.io)) is an easy-to-use platform designed for dynamic service discovery and configuration and service management. It helps you to build cloud native applications and microservices platform easily.


## Introduction

This chart bootstraps a [nacos](https://nacos.io) deployment on a [EKS](https://aws.amazon.com/eks/) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.3+ with Beta APIs enabled

## Installing the Chart

To install the chart with the release name `nacos`:

```console
helm install nacos ./helm
```

## Uninstalling the Chart

To uninstall/delete the `nacos` deployment:

```console
helm delete nacos
```

The command removes all the Kubernetes components associated with the chart and deletes the release.


## Configuration

The following table lists the configurable parameters of the Prometheus chart and their default values.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `global.domainName` | string | `"cluster.local"` | domainName |
| `global.mode` | `"standalone"` or `"cluster"` | `"standalone"` | nacos mode, If  want to deploy a deployment with more than 1 replica, please select `cluster` mode. |
| `ingress.annotations` | object | `{"alb.ingress.kubernetes.io/actions.redirect-to-nacos":"{\"type\":\"redirect\",\"redirectConfig\":{\"host\":\"#{host}\",\"path\":\"/nacos/\",\"port\":\"#{port}\",\"protocol\":\"#{protocol}\",\"query\":\"#{query}\",\"statusCode\":\"HTTP_301\"}}\n","alb.ingress.kubernetes.io/healthcheck-path":"/nacos","alb.ingress.kubernetes.io/listen-ports":"[{\"HTTP\": 80}]","alb.ingress.kubernetes.io/scheme":"internet-facing","alb.ingress.kubernetes.io/success-codes":"200-399","alb.ingress.kubernetes.io/target-type":"ip","kubernetes.io/ingress.class":"alb"}` | Ingress annotations. |
| `ingress.enabled` | bool | `true` | Ingress enabled. |
| `ingress.hosts` | list | `[{"paths":["/nacos/"]}]` | Ingress hosts. |
| `ingress.tlsenabled` | bool | `false` | Ingress tls enabled. |
| `nacos.affinity` | object | `{}` | nacos affinity. |
| `nacos.annotations` | object | `{}` | nacos annotations. |
| `nacos.image.pullPolicy` | string | `"IfNotPresent"` | nacos image pullPolicy. |
| `nacos.image.repository` | string | `"nacos/nacos-server"` | nacos image repository. |
| `nacos.image.tag` | string | `"latest"` | nacos image tag. |
| `nacos.name` | string | `"nacos"` | nacos deployment name. |
| `nacos.nodeSelector` | object | `{}` | nacos nodeSelector. |
| `nacos.preferhostmode` | string | `"hostname"` | nacos preferhostmode. |
| `nacos.replicaCount` | int | `1` | nacos replicaCount. |
| `nacos.resources.limits.cpu` | string | `"500m"` | nacos cpu limits. |
| `nacos.resources.limits.memory` | string | `"2Gi"` | nacos memory limits. |
| `nacos.resources.requests.cpu` | string | `"500m"` | nacos cpu requests. |
| `nacos.resources.requests.memory` | string | `"2Gi"` | nacos memory requests. |
| `nacos.serverPort` | int | `8848` | nacos serverPort. |
| `nacos.tolerations` | list | `[]` | nacos tolerations. |
| `nacosplugin.enabled` | bool | `true` | nacosplugin enabled. |
| `nacosplugin.image.pullPolicy` | string | `"Always"` | nacosplugin pullPolicy repository. |
| `nacosplugin.image.repository` | string | `"nacos/nacos-peer-finder-plugin"` | nacosplugin image repository. |
| `nacosplugin.image.tag` | float | `1.1` | nacosplugin tag repository. |
| `persistence.data.accessModes[0]` | string | `"ReadWriteOnce"` | nacos data persistence accessModes. |
| `persistence.data.resources.requests.storage` | string | `"5Gi"` | nacos data storage request. |
| `persistence.data.storageClassName` | string | `"gp2"` | nacos data persistence storageClassName. |
| `persistence.enabled` | bool | `true` | persistence enabled. |
| `persistence.mysql.accessModes[0]` | string | `"ReadWriteOnce"` | mysql data persistence accessModes. |
| `persistence.mysql.resources.requests.storage` | string | `"5Gi"` | mysql data storage request. |
| `persistence.mysql.storageClassName` | string | `"gp2"` | mysql data persistence storageClassName. |
| `service.port` | int | `8848` | Nacos Kubernetes service port. |
| `service.type` | string | `"ClusterIP"` | Nacos Kubernetes service type. |
| `storage.mysql.database` | string | `"nacos"` | mysql database. Only takes effect when `storage.type`=`mysql` or `rds`. |
| `storage.mysql.host` | string | `"mysql.nacos.svc.cluster.local"` | mysql host. Only takes effect when `storage.type`=`rds`. |
| `storage.mysql.image.pullPolicy` | string | `"IfNotPresent"` | mysql image pullPolicy. Only takes effect when `storage.type`=`mysql`. |
| `storage.mysql.image.repository` | string | `"public.ecr.aws/docker/library/mysql"` | mysql image repository. Only takes effect when `storage.type`=`mysql`. |
| `storage.mysql.image.tag` | string | `"5.7.37"` | mysql image tag. Only takes effect when `storage.type`=`mysql`. |
| `storage.mysql.name` | string | `"mysql"` | mysql deployment name. Only takes effect when `storage.type`=`mysql`. |
| `storage.mysql.param` | string | `"characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&useSSL=false"` | mysql param. Only takes effect when `storage.type`=`mysql`. |
| `storage.mysql.password` | string | `"password"` | mysql password. Only takes effect when `storage.type`=`mysql` or `rds`. |
| `storage.mysql.port` | int | `3306` | mysql port. Only takes effect when `storage.type`=`mysql` or `rds`. |
| `storage.mysql.username` | string | `"username"` | mysql username. Only takes effect when `storage.type`=`mysql` or `rds`. |
| `storage.type` | `"embedded"`, `"mysql"` or `"rds"` | `"embedded"` | nacos storage, select `mysql` will create mysql in kubernetes cluster. |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install ./helm  --name nacos \
    --set global.mode=cluster
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install -f helm/values.yaml nacos ./helm
```

> **Tip**: You can use the default [values.yaml](helm/values.yaml)

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.

