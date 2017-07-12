FROM tomcat:8.0-jre8

# Download jnuget
ENV JNUGET https://bitbucket.org/smpsolutions/jnuget/downloads/jnuget-server-0.8.4-SNAPSHOT.war
RUN wget $JNUGET

ENV NUGET_HOME /data

# Remove default tomcat root application
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Move jnuget to ROOT tomcat application
RUN mv jnuget-*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

VOLUME ["/data","/usr/local/tomcat/logs","/usr/local/tomcat/conf"]
