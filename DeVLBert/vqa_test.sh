CUDA_VISIBLE_DEVICES=0 python eval_tasks.py \
--bert_model bert-base-uncased --from_pretrained save/devlbert/vqa-pytorch_model_13_ema.bin \
--config_file config/bert_base_6layer_6conect.json \
--tasks 0 --split test --save_name devlbert_vqa
