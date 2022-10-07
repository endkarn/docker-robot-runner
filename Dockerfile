FROM alpine:3.16

ADD requirements.txt /usr/loca/robot/requirements.txt

RUN apk add --no-cache python3-dev gcc libc-dev libffi-dev
RUN apk add make bash curl py-pip chromium chromium-chromedriver

RUN pip3 install --upgrade pip
RUN pip3 install -r /usr/loca/robot/requirements.txt

RUN apk add nodejs npm
RUN npm install -g newman
RUN npm install -g newman-reporter-htmlextra

WORKDIR /workspace/

CMD ["bash"]