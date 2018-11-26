import numpy as np
import h5py
import json
import os
import sys
import cv2


if __name__ == "__main__":
    # # file_dir = '/home/'
    # dict_lable = dict()
    # people_state = dict()
    # dir_name = '/home/gaojm/Documents/ND_2D/'
    # # os.path.join()
    # write_file = 'test.json'
    # temp_ = os.walk(dir_name)
    # for sub_file_name in temp_:
    #     first_part = sub_file_name[0]
    #     for last_part in sub_file_name[2]:
    #         img_name = os.path.join(first_part, last_part)
    #         # print last_part[-3:]
    #         if last_part[-3:] == 'txt':
    #             continue
    #         people, state = last_part.split('d')
    #         people = os.path.join(first_part, people)
    #         if people in people_state:
    #             people_state[people].append(state)
    #         else:
    #             people_state[people] = list()
    #             people_state[people].append(state)

    #         # print img_name
            

    # print(dict_lable)
    # # print('people_state is ')
    # print(len(people_state.keys()))

    # for key in people_state:
    #     image_n = os.path.join(dir_name, key +'d'+ people_state[key][0])
    #     print image_n
    #     try:
    #         tem = cv2.imread(image_n)
    #         cv2.imshow('sy', tem)
    #         v = cv2.waitKey(0)
    #         if v == 113:
    #             v = 0
    #         else:
    #             v = 1
    #         dict_lable[image_n] = v
    #         '''
    #         key(q) = 113 man 0
    #         key(w) = 119 woman 1
    #         '''
    #         cv2.destroyAllWindows()
    #     except:
    #         pass
    #     # break

    # with open(write_file, 'w') as f:
    #     json.dump(dict_lable, f)
    json_f_n = 'test.json'
    with open(json_f_n, 'r') as f:
        dict_tem = json.load(fp=f)
        print(sum(dict_tem.values()))
        print(len(dict_tem) - sum(dict_tem.values()) - sum(dict_tem.values()))




