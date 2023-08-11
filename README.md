# Run an OpenAI-like API server for your llama2 models


Install Python packages.


```bash
conda create -p ./envs python=3.9
conda activate ./envs
pip install -r requirements.txt
```

Build `llama.cpp` and install its Python wrapper package.
```bash
CMAKE_ARGS="-DLLAMA_BLAS=ON -DLLAMA_BLAS_VENDOR=OpenBLAS" FORCE_CMAKE=1 pip install git+https://github.com/wangzhen263/llama-cpp-python.git
```

## Run the Web app

```bash
nohup python -m llama_cpp.server --model llama-2-13b-chat.ggmlv3.q8_0.bin --n_ctx 2048 --host 0.0.0.0 --port 8066 &
```

## Test the API

Try the CLI command to test the API server.


```
curl -X POST http://localhost:8066/v1/chat/plaincompletion -H 'accept: text/plain' -H 'Content-Type: text/plain' -d 'which line has the highest starch value?'
```

The response is
```
The line with the highest starch value is bulk hattrick with a mean starch value of 38.7.
```


