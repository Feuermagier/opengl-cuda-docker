# Singularity
- Build SIF file `singularity pull cudagl_egl.sif docker://docker.io/feuermagier/cudagl_egl:latest`
- Exec (in an interactive shell on a compute node with a GPU): `singularity exec --bind /home:/home,/data:/data,/tmp:/tmp --nv cudagl_egl.sif bash`


# Build & Push

## EGL
- `docker build -t feuermagier/cudagl_egl egl/`
- `docker push feuermagier/cudagl_egl`

<!-- ## OSMESA
- `docker build -t feuermagier/cudagl_osmesa osmesa/`
- `docker push feuermagier/cudagl_osmesa` -->
