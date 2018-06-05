# logstash plugin demo

## 配置文件说明

配置文件支持：

- 远程配置文件
- 本地配置文件，即项目里配置
- 插件简单配置选项

## 简单配置选项说明

```
GRLOGTYPE: systemlog #唯一类型
GRLOGPATH: /var/log/messages
GRLOGPOSITION: beginning
GRLOGINTERVAL: 10
ELASTICSEARCH_HOST: 127.0.0.1:9200
GRCODEC: rubydebug #插件默认rubydebug，支持其他plain,json. 后续支持multiline
GREPASS: MagicWord
GREUSER: elastic
```

## 其他

插件默认内存1G起。