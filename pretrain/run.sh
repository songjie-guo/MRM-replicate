CUDA_VISIBLE_DEVICES=0,1,2,3 OMP_NUM_THREADS=1 python -m torch.distributed.launch --nproc_per_node=4 --master_port 12345 main_pretrain.py \
    --num_workers 10 \
    --accum_iter 2 \
    --batch_size 32 \
    --model mrm \
    --norm_pix_loss \
    --mask_ratio 0.75 \
    --epochs 200 \
    --warmup_epochs 40 \
    --blr 1.5e-4 --weight_decay 0.05 \
    --resume ./mae_pretrain_vit_base.pth \
    --data_path /path/to/dataset/ \
    --output_dir ./output/ \
