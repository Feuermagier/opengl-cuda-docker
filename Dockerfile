FROM nvidia/cuda:12.9.0-cudnn-devel-ubuntu24.04
WORKDIR /usr/local/app

# general & opengl setup
RUN apt-get update \
    && apt-get install -y sudo nano vim curl wget git bash-completion coreutils build-essential pkg-config libglfw3 libglew2.2 libgl1 libglx-mesa0 libosmesa6 libegl1 libgles2 ffmpeg libsm6 libxext6 libopenblas-dev libvulkan1 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# get uv
# COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# For Mujoco software rendering (via OSMesa)
# ENV MUJOCO_GL=osmesa

# For Mujoco GPU rendering (via EGL)
ENV MUJOCO_GL="egl"
ENV PYOPENGL_PLATFORM="egl"
ENV NVIDIA_DRIVER_CAPABILITIES=compute,graphics,utility,video
RUN echo '{"file_format_version": "1.0.0", "ICD": {"library_path": "libEGL_nvidia.so.0"}}' >> /usr/share/glvnd/egl_vendor.d/10_nvidia.json
