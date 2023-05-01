FROM ghcr.io/allenai/pytorch:1.13.1-cuda11.7-python3.10-v1.2.2

RUN apt update
RUN pip install transformers==4.27.1 
RUN pip install protobuf cpm_kernels gradio mdtex2html sentencepiece accelerate fastapi uvicorn

RUN mkdir -p /opt/ml/code

COPY . /opt/ml/code
COPY serve /opt/ml/code

RUN mkdir -p /root/.cache/huggingface/accelerate
COPY default_config.yaml /root/.cache/huggingface/accelerate/

WORKDIR /opt/ml/code
