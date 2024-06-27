FROM mcr.microsoft.com/dotnet/sdk:8.0

COPY ./ /opt/arc-validate
WORKDIR /opt/arc-validate

RUN chmod +x build.sh
RUN ./build.sh runtests

ENV PATH="${PATH}:/opt/arc-validate"
ENV PATH="${PATH}:/opt/arc-validate/src/arc-validate/bin/Release/net8.0"

RUN apt update && apt install -y yq && apt install jq

WORKDIR /arc