MODEL=llama3-8b

# run AWQ search (optional; we provided the pre-computed results)
python -m awq.entry --model_path /mnt/nfs/infrawaves/Llama-3.1-8B \
    --w_bit 4 --q_group_size 128 \
    --run_awq --dump_awq awq_cache/llama3-8b-w4-g128.pt

# evaluate the AWQ quantize model (simulated pseudo quantization)
python -m awq.entry --model_path /mnt/nfs/infrawaves/Llama-3.1-8B \
    --tasks wikitext \
    --w_bit 4 --q_group_size 128 \
    --load_awq awq_cache/llama3-8b-w4-g128.pt \
    --q_backend fake

# generate real quantized weights (w4)
python -m awq.entry --model_path /mnt/nfs/infrawaves/Llama-3.1-8B \
    --w_bit 4 --q_group_size 128 \
    --load_awq awq_cache/llama3-8b-w4-g128.pt \
    --q_backend real --dump_quant quant_cache/llama3-8b-w4-g128-awq.pt

# load and evaluate the real quantized model (smaller gpu memory usage)
python -m awq.entry --model_path /mnt/nfs/infrawaves/Llama-3.1-8B \
    --tasks wikitext \
    --w_bit 4 --q_group_size 128 \
    --load_quant quant_cache/llama3-8b-w4-g128-awq-v2.pt