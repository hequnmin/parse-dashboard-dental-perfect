FROM node:latest
ENV PARSE_DASHBOARD_ALLOW_INSECURE_HTTP true
# ENV PARSE_DASHBOARD_TRUST_PROXY 1
WORKDIR /src
ADD . /src
RUN npm config set registry https://registry.npm.taobao.org
RUN npm install

EXPOSE 4040
EXPOSE 4041

# RUN cd /src \
#  && npm install \
#  && npm run build \
#  && npm cache clear \
#  && rm -rf ~/.npm \
#  && rm -rf /var/lib/apt/lists/*
ENTRYPOINT ["npm", "run", "dashboard"]
