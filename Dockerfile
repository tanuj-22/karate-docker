FROm maven:3.9-amazoncorretto-11-debian

WORKDIR /usr/src/mymaven

COPY ./src /usr/src/mymaven/src

COPY ./pom.xml /usr/src/mymaven/pom.xml

RUN apt-get update && apt-get install -y wget gnupg2 && \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list && \
    apt-get update && apt-get install -y google-chrome-stable && \
    wget https://chromedriver.storage.googleapis.com/114.0.5735.90/chromedriver_linux64.zip && \
    apt-get install unzip && \
    unzip chromedriver_linux64.zip && \
    mv chromedriver /usr/bin/chromedriver && \
    chown root:root /usr/bin/chromedriver && \
    chmod +x /usr/bin/chromedriver

RUN useradd -ms /bin/bash mavenuser && \
    chown mavenuser:mavenuser /usr/bin/chromedriver

RUN chown -R mavenuser /usr/src/mymaven

USER mavenuser

RUN mvn clean -DskipTests

ENTRYPOINT [ "mvn","test" ]
