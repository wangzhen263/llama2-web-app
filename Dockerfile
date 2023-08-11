FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-devel 

WORKDIR /work
COPY . /work
RUN apt update && apt install -y git
RUN pip install -r requirements.txt
RUN CMAKE_ARGS="-DLLAMA_BLAS=ON -DLLAMA_BLAS_VENDOR=OpenBLAS" FORCE_CMAKE=1 pip install git+https://github.com/wangzhen263/llama-cpp-python.git
EXPOSE 8066
ENTRYPOINT ["bash", "./docker-entrypoint.sh"]
