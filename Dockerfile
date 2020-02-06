FROM alpine:latest

# Github labels
LABEL "com.github.actions.name"="dokku-github-action"
LABEL "com.github.actions.description"="Deploy application to Dokku"
LABEL "com.github.actions.icon"="mic"
LABEL "com.github.actions.color"="purple"

LABEL "repository"="http://github.com/AlexanderBabel/dokku-github-action"
LABEL "homepage"="http://github.com/actions"
LABEL "maintainer"="Alexander Babel <us09alex@icloud.com>"

RUN apk add --no-cache bash git openssh-client

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]