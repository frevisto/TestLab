# Base do Golang para build
ARG GO_VERSION=1.23.4
ARG VARIANT=alpine3.20
FROM golang:${GO_VERSION}-${VARIANT} AS builder

# Configurar diretório de trabalho
WORKDIR /build

# Instalar o Git e configurar acessos anônimos
RUN apk update && apk add --no-cache git && \
    git config --global url."https://github.com/".insteadOf git@github.com:

# Instalar o xk6 e compilar com a extensão para PostgreSQL
RUN go install go.k6.io/xk6/cmd/xk6@latest && \
    xk6 build --with github.com/grafana/xk6-output-postgres@latest

# Criar uma imagem final baseada no Alpine
FROM alpine:${VARIANT}

# Copiar o binário gerado para a imagem final
COPY --from=builder /build/k6 /usr/local/bin/k6

# Definir o entrypoint para o binário k6
ENTRYPOINT ["k6"]

