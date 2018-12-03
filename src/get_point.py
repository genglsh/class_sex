import numpy as np
import os
import h5py
import json

if __name__ == "__main__":
    file_name_h5py = os.path.join('/home/gaojm/Documents/Point_cloud_FR/ND_13450_random', 'ND_pointNet_train_pointcloud_10000_clean_random.hdf5')
    td_point = h5py.File(file_name_h5py,"r")
    # print(td_point.keys())
    print(td_point['Spring2005range_05265d163'])
    file_name_json = os.path.join('test.json')
    people_name = json.load(file_name_json)

