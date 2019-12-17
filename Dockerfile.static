##### BEGIN external-mapped/Dockerfile/iamge-header #####
FROM streamsets/datacollector:3.10.1
##### END external-mapped/Dockerfile/image-header #####

##### BEGIN image/Dockerfile/build-instructions #####
USER root
RUN apk update && apk add coreutils && apk add gettext && apk add jq && rm -rf /var/cache/apk/*
##### END image/Dockerfile/build-instructions #####

##### BEGIN external/Dockerfile/conteco #####
COPY ./ /conteco/repo/
##### END external/Dockerfile/conteco #####

##### BEGIN external-mapped/Dockerfile/labels-footer #####
LABEL io.vcweb.schema-version="1.0" \
      io.vcweb.realm="vcwebio" \
      io.vcweb.ecosystem="conteco" \
      io.vcweb.type="external" \
      io.vcweb.name="streamsets" \
      io.vcweb.tag="3.10.1" \
      io.vcweb.base="streamsets/datacollector:3.10.1" \
      io.vcweb.build="external-mapped" \
      io.vcweb.label="external.streamsets - ContEco" \
      io.vcweb.description="Streamsets Datacollector image with ContEco external prerequisites installed." \
      io.vcweb.repository="/conteco/repo" 
##### END external-mapped/Dockerfile/labels-footer #####
