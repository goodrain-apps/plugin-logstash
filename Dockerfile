FROM logstash:5

ENV TZ=Asia/Shanghai

COPY goodrain_default.conf /etc/logstash/conf.d/

COPY logstash.yml /etc/logstash/logstash.yml 

COPY start.sh /opt/rainbond/plugin/start.sh

RUN chmod +x /opt/rainbond/plugin/start.sh

ENTRYPOINT [ "bash","/opt/rainbond/plugin/start.sh" ]
