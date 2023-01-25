FROM ubuntu:18.04

RUN apt-get update && apt-get -y install openjdk-11-jdk-headless openjdk-11-jre-headless && useradd -u 1002 -s /bin/bash -d /home/deploy -c deploy -m -p 1234567890 -U deploy
RUN echo "controlRole zP2v+Kx+CGA8oRkKnzy1k6UkAPH8J22nNRBPkoOVNtaI4Q2GlXvZdf8oHH1iy4wMDqaeRMdPbK89OKXF1dGfLQ== F9DGfM4NcWkwulhTGQ+U3QQIOAHvmys3x0DHF+5ZOvSVDT1BBNUs6XxpqHBImpGMM23Om+NezawZwa23Qjoo6Q== SHA3-512" > /home/deploy/.jmxpassword && chmod 0400 /home/deploy/.jmxpassword && mkdir /home/deploy/logs

COPY login-0.1.0-SNAPSHOT.jar app.jar

ENTRYPOINT ["java","-Xms743m", "-Xmx1487m", "-Duser.country=US", "-Duser.language=en", "-Dcom.sun.management.jmxremote", "-Dcom.sun.management.jmxremote.port=42888", "-Dcom.sun.management.jmxremote.rmi.port=42888", "-Dcom.sun.management.jmxremote.local.only=false", "-Dcom.sun.management.jmxremote.ssl=false", "-Dcom.sun.management.jmxremote.authenticate=true", "-Dcom.sun.management.jmxremote.password.file=/home/deploy/.jmxpassword", "-Dportal.jmx.username=controlRole","-Dportal.jmx.password=GV8c8HCY7BHfHcCJ2PRdrNGmNjob9bZP","-Ddd.service=login","-Ddd.env=qa","-DDD_LOG_FILE=/home/deploy/logs/app.log","-Dsentry.dsn=https://cf8669f7067f4449845679baf24b558b@o61619.ingest.sentry.io/132218","-Dsentry.environment=qa","-Dsentry.servername=portal-login","-Dsentry.tags.application_name=login","-Dsentry.in-app-includes=com.windfalldata","-Dspring.profiles.active=qa,sentry","-Dportal.projectZone=projects/396837235109/zones/us-east1-b","-Dportal.instanceId=8662064572288912085","-Dspring.cloud.gcp.pubsub.project-id=wf-portal-qa","-jar","/app.jar"]

