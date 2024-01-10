#!/bin/bash
#
# Copyright 2024 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCATION="us-central1"
DEPLOYMENT_ID="compute-partition"
SERVICE_ACCOUNT_PROJECT_ID="${GOOGLE_CLOUD_PROJECT}"
SERVICE_ACCOUNT_EMAIL="config-agent@${GOOGLE_CLOUD_PROJECT}.iam.gserviceaccount.com"
GIT_REPO="https://github.com/mmm/gcp-infra-manager"
GIT_REF="main"
DIRECTORY="terraform/compute-partition"
STORAGE_NODE_IP=""  # change this!
#STORAGE_NODE_IP="10.2.1.2"
INPUTS="project_id=${GOOGLE_CLOUD_PROJECT},network=tutorial,subnet=tutorial,zone=us-central1-c,home_volume_ip=${STORAGE_NODE_IP},tools_volume_ip=${STORAGE_NODE_IP}"

gcloud infra-manager deployments apply \
  "projects/${GOOGLE_CLOUD_PROJECT}/locations/${LOCATION}/deployments/${DEPLOYMENT_ID}" \
  --service-account "projects/${SERVICE_ACCOUNT_PROJECT_ID}/serviceAccounts/${SERVICE_ACCOUNT_EMAIL}" \
  --git-source-repo="${GIT_REPO}" \
  --git-source-ref="${GIT_REF}" \
  --git-source-directory="${DIRECTORY}" \
  --input-values="${INPUTS}"
