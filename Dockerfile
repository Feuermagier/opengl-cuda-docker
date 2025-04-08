FROM nvidia/cuda:12.8.1-cudnn-runtime-ubuntu24.04
WORKDIR /usr/local/app

# get uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# opengl setup
RUN apt-get update && apt-get install -y libgl1 libglx-mesa0 ffmpeg libsm6 libxext6

RUN useradd app
USER app
