#!/bin/bash

python -m llama_cpp.server --model llama-2-13b-chat.ggmlv3.q8_0.bin --n_ctx 2048 --host 0.0.0.0 --port 8066 
