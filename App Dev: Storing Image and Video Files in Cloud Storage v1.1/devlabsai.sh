# Clone the repository

git clone https://github.com/GoogleCloudPlatform/training-data-analyst

# Configure and run the case study application

cd ~/training-data-analyst/courses/developingapps/nodejs/cloudstorage/start

. prepare_environment.sh

gsutil mb gs://$DEVSHELL_PROJECT_ID-media

export GCLOUD_BUCKET=$DEVSHELL_PROJECT_ID-media

# Create the updated cloudstorage.js file
cat > server/gcp/cloudstorage.js << 'EOL'
// Copyright 2017, Google, Inc.
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
'use strict';

const config = require('../config');

// Load the module for Cloud Storage
const Storage = require('@google-cloud/storage');

// Create the storage client
// The Storage(...) factory function accepts an options
// object which is used to specify which project's Cloud
// Storage buckets should be used via the projectId
// property.
// The projectId is retrieved from the config module.
// This module retrieves the project ID from the
// GCLOUD_PROJECT environment variable.

const storage = Storage({
 projectId: config.get('GCLOUD_PROJECT')
});

// Get the GCLOUD_BUCKET environment variable
// Recall that earlier you exported the bucket name into an
// environment variable.
// The config module provides access to this environment
// variable so you can use it in code

const GCLOUD_BUCKET = config.get('GCLOUD_BUCKET');

// Get a reference to the Cloud Storage bucket

const bucket = storage.bucket(GCLOUD_BUCKET);

function sendUploadToGCS (req, res, next) {
  if (!req.file) {
    return next();
  }

  const oname = Date.now() + req.file.originalname;
  // Get a reference to the new object
  const file = bucket.file(oname);

  // Create a stream to write the file into Cloud Storage
  const stream = file.createWriteStream({
    metadata: {
      contentType: req.file.mimetype
    }
  });

  // Attach event handler for error
  stream.on('error', (err) => {
    // If there's an error move to the next handler
    next(err);
  });

  // Attach event handler for finish
  stream.on('finish', () => {
    // Make the object publicly accessible
    file.makePublic().then(() => {
      // Set a new property on the file for the public URL for the object
      req.file.cloudStoragePublicUrl = `https://storage.googleapis.com/${GCLOUD_BUCKET}/${oname}`;
      // Invoke the next middleware handler
      next();
    });
  });

  // End the stream to upload the file's data
  stream.end(req.file.buffer);
}

// [START exports]
module.exports = {
  sendUploadToGCS
};
// [END exports]
EOL
check_status "Updated cloudstorage.js file"

# Create the corrected cloudstorage.js file with Multer
cat > ~/training-data-analyst/courses/developingapps/nodejs/cloudstorage/start/server/gcp/cloudstorage.js << 'EOL'
// Copyright 2017, Google, Inc.
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
'use strict';

const config = require('../config');

// Import multer for handling file uploads
const Multer = require('multer');

// Configure multer for memory storage
const multer = Multer({
  storage: Multer.memoryStorage(),
  limits: {
    fileSize: 5 * 1024 * 1024 // 5MB limit
  }
});

// Load the module for Cloud Storage
const Storage = require('@google-cloud/storage');

// Create the storage client
const storage = Storage({
  projectId: config.get('GCLOUD_PROJECT')
});

// Get the GCLOUD_BUCKET environment variable
const GCLOUD_BUCKET = config.get('GCLOUD_BUCKET');

// Get a reference to the Cloud Storage bucket
const bucket = storage.bucket(GCLOUD_BUCKET);

function sendUploadToGCS(req, res, next) {
  if (!req.file) {
    return next();
  }

  const oname = Date.now() + req.file.originalname;
  // Get a reference to the new object
  const file = bucket.file(oname);

  // Create a stream to write the file into Cloud Storage
  const stream = file.createWriteStream({
    metadata: {
      contentType: req.file.mimetype
    }
  });

  // Attach event handler for error
  stream.on('error', (err) => {
    // If there's an error move to the next handler
    next(err);
  });

  // Attach event handler for finish
  stream.on('finish', () => {
    // Make the object publicly accessible
    file.makePublic().then(() => {
      // Set a new property on the file for the public URL for the object
      req.file.cloudStoragePublicUrl = `https://storage.googleapis.com/${GCLOUD_BUCKET}/${oname}`;
      // Invoke the next middleware handler
      next();
    });
  });

  // End the stream to upload the file's data
  stream.end(req.file.buffer);
}

// [START exports]
module.exports = {
  sendUploadToGCS,
  multer // Export the configured multer middleware
};
// [END exports]
EOL

npm start

