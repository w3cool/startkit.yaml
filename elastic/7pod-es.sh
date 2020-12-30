#!/bin/sh
# add elastic helm chart
helm repo add elastic https://helm.elastic.co
helm repo update

# 2 - 2 - 3 architecture
helm upgrade --wait --timeout=600 --install \
  --values ./master.yaml elasticsearch elastic/elasticsearch

helm upgrade --wait --timeout=600 --install \
  --values ./data.yaml elasticsearch elastic/elasticsearch

helm upgrade --wait --timeout=600 --install \
  --values ./client.yaml elasticsearch elastic/elasticsearch