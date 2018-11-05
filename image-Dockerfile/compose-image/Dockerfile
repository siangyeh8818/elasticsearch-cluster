FROM docker.elastic.co/elasticsearch/elasticsearch-oss:6.3.0

COPY --chown=elasticsearch:elasticsearch ./config/ /usr/share/elasticsearch/
COPY --chown=elasticsearch:elasticsearch  ./config/elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml
COPY ./analysis-ik-6.3.0/ /usr/share/elasticsearch/plugins/ik/

RUN yum -y install bzip2
COPY elasticsearch-head-master-docker.tar.gz /usr/share/elasticsearch/
RUN cd /usr/share/elasticsearch/
RUN tar zxvf elasticsearch-head-master-docker.tar.gz
RUN yum install -y epel-release 
RUN yum install -y npm 
RUN yum install -y nodejs

EXPOSE 9100 9200 9300
COPY  docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY  run-elasticsearch-head.sh /usr/local/bin/

RUN sed -i '2 i\chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/data' /usr/local/bin/docker-entrypoint.sh
#RUN bin/elasticsearch-plugin install -b com.floragunn:search-guard-6:6.3.0-23.1
#COPY --chown=elasticsearch:elasticsearch  ./config/elasticsearch.yml /usr/share/elasticsearch/elasticsearch.yml
#COPY Server-ssl/* /usr/share/elasticsearch/config/
#COPY client-ssl/* /usr/share/elasticsearch/plugins/search-guard-6/sgconfig/
#COPY ssl/* /usr/share/elasticsearch/config/
#RUN chmod 777 /usr/share/elasticsearch/plugins/search-guard-6/tools/sgadmin.sh
ENTRYPOINT ["docker-entrypoint.sh"]
