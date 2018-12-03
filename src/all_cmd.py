import numpy as np
import os
import sys

if __name__ == "__main__":
    cmd1 = 'nvcc -std=c++11 test.cu -o a.out'
    cmd2 = './a.out'
    cmd3 = 'python show_depth_image.py'
    os.system(cmd1)
    os.system(cmd2)
    os.system(cmd3)