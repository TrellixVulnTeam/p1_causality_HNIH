id="aoanet"
if [ ! -f log/log_$id/infos_$id.pkl ]; then
start_from=""
else
start_from="--start_from log/log_$id"
fi
python train.py --id $id \
    --caption_model aoa \
    --refine 0 \
    --refine_aoa 0 \
    --use_ff 0 \
    --decoder_type AoA \
    --use_multi_head 2 \
    --num_heads 8 \
    --multi_head_scale 1 \
    --mean_feats 1 \
    --ctx_drop 1 \
    --dropout_aoa 0.3 \
    --label_smoothing 0.2 \
    --input_json data/cocotalk.json \
    --input_label_h5 data/cocotalk_label.h5 \
    --input_att_dir_vc /the/path/to/VC_Feature \
    --input_fc_dir  /the/path/to/Up_Down/cocobu_fc \
    --input_att_dir  /the/path/to/Up_Down/cocobu_att  \
    --input_box_dir  /the/path/to/Up_Down/cocobu_box \
    --seq_per_img 5 \
    --batch_size 20 \
    --beam_size 1 \
    --learning_rate 1.5e-4 \
    --num_layers 2 \
    --input_encoding_size 1024 \
    --rnn_size 2048 \
    --learning_rate_decay_start 0 \
    --scheduled_sampling_start 0 \
    --checkpoint_path log/log_$id  \
    $start_from \
    --save_checkpoint_every 5000 \
    --language_eval 1 \
    --val_images_use -1 \
    --max_epochs 30 \
    --scheduled_sampling_increase_every 5 \
    --scheduled_sampling_max_prob 0.5 \
    --learning_rate_decay_every 3

python train.py --id $id \
    --caption_model aoa \
    --refine 0 \
    --refine_aoa 0 \
    --use_ff 0 \
    --decoder_type AoA \
    --use_multi_head 2 \
    --num_heads 8 \
    --multi_head_scale 1 \
    --mean_feats 1 \
    --ctx_drop 1 \
    --dropout_aoa 0.3 \
    --input_json data/cocotalk.json \
    --input_label_h5 data/cocotalk_label.h5 \
    --input_att_dir_vc /the/path/to/VC_Feature \
    --input_fc_dir  /the/path/to/Up_Down/cocobu_fc \
    --input_att_dir  /the/path/to/Up_Down/cocobu_att  \
    --input_box_dir  /the/path/to/Up_Down/cocobu_box \
    --seq_per_img 5 \
    --batch_size 20 \
    --beam_size 1 \
    --num_layers 2 \
    --input_encoding_size 1024 \
    --rnn_size 2048 \
    --language_eval 1 \
    --val_images_use -1 \
    --save_checkpoint_every 4000 \
    --start_from log/log_$id \
    --checkpoint_path log/log_$id"_rl" \
    --learning_rate 1.5e-5 \
    --max_epochs 70 \
    --self_critical_after 0 \
    --learning_rate_decay_start -1 \
    --scheduled_sampling_start -1 \
    --reduce_on_plateau 
