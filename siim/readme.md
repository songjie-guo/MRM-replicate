- I clone the MMSegmentaiton (version 0.25.0) and adjust the files
- got Error: `ImportError: /home/r20user11/anaconda3/envs/MRM/lib/python3.8/site-packages/mmcv/_ext.cpython-38-x86_64-linux-gnu.so: undefined symbol: _ZNSt15__exception_ptr13exception_ptr9_M_addrefEv`
- find out that [vesrion of mmcv is not capable with CUDA and torch](https://blog.csdn.net/HaoZiHuang/article/details/118697818)


To solve:
- find out the versions of CUDA and torch: `python -c 'import torch;print(torch.__version__);print(torch.version.cuda)'` and got **1.8.2** and **11.1**
- try to install the correct version of mmcv: `pip install mmcv-full -f https://download.openmmlab.com/mmcv/dist/cu111/torch1.8.2/index.html`. But it installs mmcv-full-1.7.1 automatically.
- try to install mmcv-full-1.6.0 using `pip install mmcv-full-1.6.0 https://download.openmmlab.com/mmcv/dist/cu111/torch1.8.2/index.html` due to requirement "mmcv-full>=1.4.4,<=1.6.0" in `requirements/mminstall.txt`, but failed shown below
```
ERROR: HTTP error 404 while getting https://download.openmmlab.com/mmcv/dist/cu111/torch1.6.0/index.html
ERROR: Could not install requirement https://download.openmmlab.com/mmcv/dist/cu111/torch1.6.0/index.html 
because of HTTP error 404 Client Error: Not Found for url: https://download.openmmlab.com/mmcv/dist/cu111/torch1.6.0/index.html 
for URL https://download.openmmlab.com/mmcv/dist/cu111/torch1.6.0/index.html
```
- It also strictly requires mmcv version in mmseg/__init__.py, and got `AssertionError: MMCV==1.7.1 is used but incompatible. Please install mmcv>=(1, 3, 13, 0, 0, 0), <=(1, 6, 0, 0, 0, 0).` by using MMCV==1.7.1

TAT
