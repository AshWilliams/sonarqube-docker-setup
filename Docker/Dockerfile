FROM sonarqube:7.0-alpine

ENV SONAR_VERSION=7.0 \
    SONARQUBE_HOME=/opt/sonarqube \
    SONARQUBE_JDBC_URL="jdbc:sqlserver://sql-sonarqube-prod.database.windows.net:1433;database=ssqldb-sonarqube-prod;user=sonarqube@sql-sonarqube-shared-andresi;password=sonar@azur3!;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;"

COPY entrypoint.sh ./bin/

RUN chmod +x ./bin/entrypoint.sh

ENTRYPOINT ["./bin/entrypoint.sh"]
