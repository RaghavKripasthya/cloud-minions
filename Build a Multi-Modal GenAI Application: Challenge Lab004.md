# Build a Multi-Modal GenAI Application: Challenge Lab || bb-ide-genai-004 
## Video solution[Watch Here]()

```
#!/bin/bash
YELLOW='\033[0;33m'
NC='\033[0m' 
pattern=(
"**********************************************************"
"**                 S U B S C R I B E  TO                **"
"**                    DevLabs.ai                         **"
"**                                                      **"
"**********************************************************"
)
for line in "${pattern[@]}"
do
    echo -e "${YELLOW}${line}${NC}"
done
ID="$(gcloud projects list --format='value(PROJECT_ID)')"

cat > GenerateImage.py <<EOF_END
import argparse

import vertexai
from vertexai.preview.vision_models import ImageGenerationModel

def generate_image(
  project_id: str, location: str, output_file: str, prompt: str
) -> vertexai.preview.vision_models.ImageGenerationResponse:
  """Generate an image using a text prompt.
  Args:
    project_id: Google Cloud project ID, used to initialize Vertex AI.
    location: Google Cloud region, used to initialize Vertex AI.
    output_file: Local path to the output image file.
    prompt: The text prompt describing what you want to see."""

  vertexai.init(project=project_id, location=location)

  model = ImageGenerationModel.from_pretrained("imagen-3.0-generate-002")

  images = model.generate_images(
    prompt=prompt,
    # Optional parameters
    number_of_images=1,
    seed=1,
    add_watermark=False,
  )

  images[0].save(location=output_file)

  return images

generate_image(
  project_id='$ID',
  location='$REGION',
  output_file='image.jpeg',
  prompt='Create an image of a cricket ground in the heart of Los Angeles',
)
EOF_END

/usr/bin/python3 /home/student/GenerateImage.py

ID="$(gcloud projects list --format='value(PROJECT_ID)')"

cat > genai.py <<EOF_END
import vertexai
from vertexai.generative_models import GenerativeModel, Part

def generate_text(project_id: str, location: str) -> str:
  # Initialize Vertex AI
  vertexai.init(project=project_id, location=location)
  # Load the model
  multimodal_model = GenerativeModel("gemini-2.0-flash-001")
  # Query the model
  response = multimodal_model.generate_content(
    [
      # Add an example image
      Part.from_uri(
        "gs://generativeai-downloads/images/scones.jpg", mime_type="image/jpeg"
      ),
      # Add an example query
      "what is shown in this image?",
    ]
  )

  return response.text

project_id = "$ID"
location = "$REGION"

response = generate_text(project_id, location)
print(response)
EOF_END

/usr/bin/python3 /home/student/genai.py

sleep 30

/usr/bin/python3 /home/student/genai.py

pattern=(
"**********************************************************"
"**                 S U B S C R I B E  TO                **"
"**                 DeVLabs.ai                           **"
"**                                                      **"
"**********************************************************"
)
for line in "${pattern[@]}"
do
    echo -e "${YELLOW}${line}${NC}"
done
```


<div align="center" style="padding: 5px;">
  <h3>📱 Join the DevLabs.ai Community</h3>
  
  <a href="https://chat.whatsapp.com/BeGG0HXiM469i3WFMgm4qs">
    <img src="https://img.shields.io/badge/Join_WhatsApp-25D366?style=for-the-badge&logo=whatsapp&logoColor=white" alt="Join WhatsApp">
  </a>
  &nbsp;
  <a href="https://www.youtube.com/channel/UCVFPYmP2CZvVmICxw7YHT8A">
    <img src="https://img.shields.io/badge/Subscribe-Devlabs%20ai-FF0000?style=for-the-badge&logo=youtube&logoColor=white" alt="YouTube Channel">
  </a>
  &nbsp;
  <a href="https://t.me/DevLabsai">
    <img src="https://img.shields.io/badge/DevLabsai-chats%20&Updates-0077B5?style=for-the-badge&logo=Telegram&logoColor=white" alt="Telegram">
</a>


</div>
