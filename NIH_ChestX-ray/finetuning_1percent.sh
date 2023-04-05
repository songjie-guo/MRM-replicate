CUDA_VISIBLE_DEVICES=0 python3 train.py --name mrm --stage train --model vit_base_patch16 --model_type ViT-B_16 --num_classes 14 \
    --pretrained_path "../MRM.pth" --dataset_path '../NIH_ChestX-ray' \
    --output_dir "finetuning_outputs/1percent/" --data_volume '1' --num_steps 3000  --eval_batch_size 512 --img_size 224 \
    --learning_rate 3e-2 --warmup_steps 50 --fp16 --fp16_opt_level O2 --train_batch_size 96

# command-line instruction that runs a Python script called train.py with various arguments passed to it

# CUDA_VISIBLE_DEVICES=0: This is an environment variable that specifies which GPU to use
# In this case, it sets the GPU device to 0. Setting it to 1 is not good.

# add output_dir "/1percent/" is to not make all 3 finetuning outputs to have same name.
