FROM ubuntu

RUN apt update && apt install -y --no-install-recommends \
        unzip \
        curl

WORKDIR /terraform

ARG version=0.12.0
RUN curl -k https://releases.hashicorp.com/terraform/${version}/terraform_${version}_linux_amd64.zip -o terraform_${version}_linux_amd64.zip
RUN unzip terraform_${version}_linux_amd64.zip
RUN ln -s ${PWD}/terraform /usr/local/bin/terraform
RUN terraform -v

ENTRYPOINT [ "terraform" ]

LABEL maintainer="Aleksei Muratov" \
      app="Terraform" \
      version=${version}
