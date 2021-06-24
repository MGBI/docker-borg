FROM alpine
RUN apk --no-cache add borgbackup bash

ENV LANG en_US.UTF-8

COPY borg-backup.sh /

CMD [ "/borg-backup.sh" ]
