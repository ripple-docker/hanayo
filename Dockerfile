FROM golang

WORKDIR /go/src/zxq.co/ripple/hanayo
COPY . .

RUN go get -d -v ./...
RUN CGO_ENABLED=0 go install -v ./...

FROM alpine
WORKDIR /hanayo/
COPY --from=0 /go/bin/hanayo ./
COPY --from=0 /go/src/zxq.co/ripple/hanayo/ ./

# Agree to License
RUN mkdir ~/.config && touch ~/.config/ripple_license_agreed

# Generate config
RUN ./hanayo

COPY ./entrypoint.sh .
RUN chmod +x entrypoint.sh

ENV DOMAIN test.test
ENV MYSQL_ROOT_PASSWORD changeme

ENTRYPOINT [ "./entrypoint.sh" ]
CMD [ "./hanayo" ]
