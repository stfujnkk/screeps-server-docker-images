FROM alpine:3.10 as run-env
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories && \
apk update && apk --no-cache add nodejs

FROM run-env as compile-env
WORKDIR /screeps-server-builder
RUN apk --no-cache add build-base python2 npm && \ 
npm init -y && npm install screeps@4.2.14 --registry=https://registry.npm.taobao.org && \
npm prune --production && npm prune && npm dedupe

FROM run-env
ENV PATH=/screeps:$PATH
WORKDIR /screeps
COPY --from=compile-env /screeps-server-builder .
RUN ln -s /screeps/node_modules/.bin/screeps /screeps/screeps
EXPOSE 21025 21026 21027
