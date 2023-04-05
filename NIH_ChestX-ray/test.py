import pdb
import os

# parameter
gpu = "0"
name = "test"
file_path = "finetuning_outputs/xpercent/mrm_bestauc_checkpoint.bin" #please check the folder name, x=1/10/100
model = "ViT-B_16"
print(os.system('CUDA_VISIBLE_DEVICES=' + gpu +' python3 train.py --name ' + name + ' --stage test --model_type ' + model +' --model vit_base_patch16 --num_classes 14 --pretrained_path ' + file_path +' --eval_batch_size 512 --img_size 224 --fp16 --fp16_opt_level O2 --dataset_path ./'))

# simply runs this file to get test_accuracy.
