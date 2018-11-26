import h5py
import numpy as numpy
import time
import os
import sys
import cv2


if __name__ == "__main__":
    h5py_file = '/home/gaojm/Documents/Point_cloud_FR/ND_13450_random/ND_pointNet_train_pointcloud_10000_clean_random.hdf5'
    file = h5py.File(h5py_file, 'r')
    print(file[u'Spring2003range_04316d215'])
    a= u'Spring2003range_04316d215'
    print(a)
    b = str(a)
    print(b)
    c = unicode(b)
    print(c)
    print(file[b])