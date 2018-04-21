FROM centos:7
MAINTAINER koduki

ENV GRAALVM_URL=https://github.com/oracle/graal/releases/download/vm-1.0.0-rc1/graalvm-ce-1.0.0-rc1-linux-amd64.tar.gz \
    GRAALVM_PKG=graalvm-ce-1.0.0-rc1-linux-amd64.tar.gz \
    GRAALVM_HOME=/usr/graalvm-1.0.0-rc1

ENV JAVA_HOME=${GRAALVM_HOME} \
    PATH=${GRAALVM_HOME}/bin:$PATH

RUN curl -L -o $GRAALVM_PKG $GRAALVM_URL &&  \
    tar xfvz $GRAALVM_PKG -C /usr/ &&  \
    rm $GRAALVM_PKG

RUN yum -y install gcc openssl-devel && rm -rf /var/cache/yum && \
    alternatives --install /usr/bin/java  java  $JAVA_HOME/bin/java  20000 && \
    alternatives --install /usr/bin/javac javac $JAVA_HOME/bin/javac 20000 && \
    alternatives --install /usr/bin/jar   jar   $JAVA_HOME/bin/jar   20000

CMD ["java", "-version"]