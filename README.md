# EY VAT Services Master Repository

This repository serves as the master entry point for various microservices designed to automate EY's VAT Return department. Each microservice is responsible for a specific task in the automation pipeline, from converting PDF documents to images, extracting text from images, structuring text data, to predicting VAT codes.

## Microservices

- [**PDF to Image Microservice**](https://github.com/leothesouthafrican/EY_PDF2Image-Service): Converts PDF files to images.
- [**Image to Text Microservice**](https://github.com/leothesouthafrican/EY_Image2Text-Service): Extracts text from images using OCR.
- [**Text to Structured Data Microservice**](https://github.com/leothesouthafrican/EY_Text2Structure-Service): Converts text files to structured JSON data.
- [**VAT Inference Service**](https://github.com/leothesouthafrican/EY_VATInference-Service): Predicts VAT codes based on structured input data.

## Getting Started

To get started with running all the services together, ensure you have Docker installed and follow the steps below:

1. Clone the "dev" branch of this repository including all of its submodules:

   ```bash
   git clone --recurse-submodules -b dev https://github.com/leothesouthafrican/EY_VATServices_Master.git
   cd EY_VATServices_Master
   
   ```

2. Add a .env file in the root directory containing the following:

   * OPENAI_API_KEY = "..."
   * GOOGLE_API_KEY = "..."
   * GOOGLE_CSE_ID = "..."
  
3. Run the setup.sh script in the root directory, to setup an environment for each submodule, should you need this.

   3.1 Make the script executable by running:
   ```bash
    chmod +x setup.sh
   ```
   3.2 Execute the script by running:
   ```bash
    ./setup.sh
   ```

4. Build and start all of the services:

   ```bash
   docker-compose up --build
   ```
