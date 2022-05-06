| global.domainName | string | `"cluster.local"` | domainName |
| global.mode | string | `"standalone"` | nacos mode, If  want to deploy a deployment with more than 1 replica, please select `cluster` mode. |
| ingress.annotations | object | `{"alb.ingress.kubernetes.io/actions.redirect-to-nacos":"{\"type\":\"redirect\",\"redirectConfig\":{\"host\":\"#{host}\",\"path\":\"/nacos/\",\"port\":\"#{port}\",\"protocol\":\"#{protocol}\",\"query\":\"#{query}\",\"statusCode\":\"HTTP_301\"}}\n","alb.ingress.kubernetes.io/healthcheck-path":"/nacos","alb.ingress.kubernetes.io/listen-ports":"[{\"HTTP\": 80}]","alb.ingress.kubernetes.io/scheme":"internet-facing","alb.ingress.kubernetes.io/success-codes":"200-399","alb.ingress.kubernetes.io/target-type":"ip","kubernetes.io/ingress.class":"alb"}` | Ingress annotations. |
| ingress.enabled | bool | `true` | Ingress enabled. |
| ingress.hosts | list | `[{"paths":["/nacos/"]}]` | Ingress hosts. |
| ingress.tlsenabled | bool | `false` | Ingress tls enabled. |
| nacos.affinity | object | `{}` | nacos affinity. |
| nacos.annotations | object | `{}` | nacos annotations. |
| nacos.image.pullPolicy | string | `"IfNotPresent"` | nacos image pullPolicy. |
| nacos.image.repository | string | `"nacos/nacos-server"` | nacos image repository. |
| nacos.image.tag | string | `"latest"` | nacos image tag. |
| nacos.name | string | `"nacos"` | nacos deployment name. |
| nacos.nodeSelector | object | `{}` | nacos nodeSelector. |
| nacos.preferhostmode | string | `"hostname"` | nacos preferhostmode. |
| nacos.replicaCount | int | `1` | nacos replicaCount. |
| nacos.resources.limits.cpu | string | `"500m"` | nacos cpu limits. |
| nacos.resources.limits.memory | string | `"2Gi"` | nacos memory limits. |
| nacos.resources.requests.cpu | string | `"500m"` | nacos cpu requests. |
| nacos.resources.requests.memory | string | `"2Gi"` | nacos memory requests. |
| nacos.serverPort | int | `8848` | nacos serverPort. |
| nacos.tolerations | list | `[]` | nacos tolerations. |
| nacosplugin.enabled | bool | `true` | nacosplugin enabled. |
| nacosplugin.image.pullPolicy | string | `"Always"` | nacosplugin pullPolicy repository. |
| nacosplugin.image.repository | string | `"nacos/nacos-peer-finder-plugin"` | nacosplugin image repository. |
| nacosplugin.image.tag | float | `1.1` | nacosplugin tag repository. |
| persistence.data.accessModes[0] | string | `"ReadWriteOnce"` | nacos data persistence accessModes. |
| persistence.data.resources.requests.storage | string | `"5Gi"` | nacos data storage request. |
| persistence.data.storageClassName | string | `"gp2"` | nacos data persistence storageClassName. |
| persistence.enabled | bool | `true` | persistence enabled. |
| persistence.mysql.accessModes[0] | string | `"ReadWriteOnce"` | mysql data persistence accessModes. |
| persistence.mysql.resources.requests.storage | string | `"5Gi"` | mysql data storage request. |
| persistence.mysql.storageClassName | string | `"gp2"` | mysql data persistence storageClassName. |
| service.port | int | `8848` | Nacos Kubernetes service port. |
| service.type | string | `"ClusterIP"` | Nacos Kubernetes service type. |
| storage.mysql.database | string | `"nacos"` | mysql database. Only takes effect when `storage.type`=`mysql` or `rds`. |
| storage.mysql.host | string | `"mysql.nacos.svc.cluster.local"` | mysql host. Only takes effect when `storage.type`=`rds`. |
| storage.mysql.image.pullPolicy | string | `"IfNotPresent"` | mysql image pullPolicy. Only takes effect when `storage.type`=`mysql`. |
| storage.mysql.image.repository | string | `"public.ecr.aws/docker/library/mysql"` | mysql image repository. Only takes effect when `storage.type`=`mysql`. |
| storage.mysql.image.tag | string | `"5.7.37"` | mysql image tag. Only takes effect when `storage.type`=`mysql`. |
| storage.mysql.name | string | `"mysql"` | mysql deployment name. Only takes effect when `storage.type`=`mysql`. |
| storage.mysql.param | string | `"characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&useSSL=false"` | mysql param. Only takes effect when `storage.type`=`mysql`. |
| storage.mysql.password | string | `"password"` | mysql password. Only takes effect when `storage.type`=`mysql` or `rds`. |
| storage.mysql.port | int | `3306` | mysql port. Only takes effect when `storage.type`=`mysql` or `rds`. |
| storage.mysql.username | string | `"username"` | mysql username. Only takes effect when `storage.type`=`mysql` or `rds`. |
| storage.type | string | `"embedded"` | nacos storage, select `mysql` will create mysql in kubernetes cluster. |
