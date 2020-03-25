##### BEGIN image/Dockerfile/header-instructions #####
FROM streamsets/datacollector-libs:streamsets-datacollector-elasticsearch_5-lib-${CONTECO_TAG} AS elastic
FROM streamsets/datacollector-libs:streamsets-datacollector-apache-kafka_2_0-lib-${CONTECO_TAG} AS kafka
##### END image/Dockerfile/header-instructions #####

##### BEGIN external-mapped/Dockerfile/image-header #####
FROM $CONTECO_BASE
##### END external-mapped/Dockerfile/image-header #####

##### BEGIN image/Dockerfile/build-instructions #####
USER root
RUN apk update && apk add coreutils && apk add gettext && apk add jq && rm -rf /var/cache/apk/*
##### END image/Dockerfile/build-instructions #####

##### BEGIN external/Dockerfile/conteco #####
COPY ./ /conteco/repo/
COPY --from=elastic /opt/streamsets-datacollector-${CONTECO_TAG}/streamsets-libs/streamsets-datacollector-elasticsearch_5-lib /opt/streamsets-datacollector-${CONTECO_TAG}/streamsets-libs/streamsets-datacollector-elasticsearch_5-lib
COPY --from=kafka /opt/streamsets-datacollector-${CONTECO_TAG}/streamsets-libs/streamsets-datacollector-apache-kafka_2_0-lib /opt/streamsets-datacollector-${CONTECO_TAG}/streamsets-libs/streamsets-datacollector-apache-kafka_2_0-lib
##### END external/Dockerfile/conteco #####

##### BEGIN external-mapped/Dockerfile/labels-footer #####
LABEL $CONTECO_LABELSPACE.schema-version="1.0" \
      $CONTECO_LABELSPACE.realm="$CONTECO_REALM_RUNTIME" \
      $CONTECO_LABELSPACE.ecosystem="$CONTECO_ECOSYSTEM_RUNTIME" \
      $CONTECO_LABELSPACE.type="$CONTECO_TYPE" \
      $CONTECO_LABELSPACE.name="$CONTECO_NAME" \
      $CONTECO_LABELSPACE.tag="$CONTECO_TAG" \
      $CONTECO_LABELSPACE.base="$CONTECO_BASE" \
      $CONTECO_LABELSPACE.build="$CONTECO_BUILD" \
      $CONTECO_LABELSPACE.label="$CONTECO_LABEL" \
      $CONTECO_LABELSPACE.description="$CONTECO_DESCRIPTION" \
      $CONTECO_LABELSPACE.repository="/conteco/repo"
##### END external-mapped/Dockerfile/labels-footer #####
