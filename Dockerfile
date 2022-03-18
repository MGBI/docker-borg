FROM alpine
RUN apk --no-cache add 'borgbackup<1.2' bash

ENV LANG en_US.UTF-8

COPY borg-backup.sh /

CMD [ "/borg-backup.sh" ]
