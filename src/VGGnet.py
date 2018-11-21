import numpy as np
import tensorflow as tf
import os
import json
import cv2
import sys
from datetime import datetime
import math
import time
import tensorflow as tf
from net_fun import *
import json

def time_tensorflow_run(session, target, feed, info_string):
    num_steps_burn_in = 10
    total_duration = 0.0
    total_duration_squared = 0.0
    for i in range(num_steps_burn_in+num_batches):
        start_time = time.time()
        _ = session.run(target, feed_dict = feed)
        duration = time.time() - start_time
        if i >= num_steps_burn_in:
            if not i % 10 :
                print('')
                total_duration += duration
                total_duration_squared += duration * duration
    mn = total_duration/ num_batches
    vr = total_duration_squared/num_batches - mn * mn
    sd = math.sqrt(vr)
    print()

def run_benchmark():
    with tf.Graph().as_default():
        image_size = 224
        image = tf.Variable(tf.random_normal([batch_size,
                                              image_size,
                                              image_size,
                                              3],
                                             dtype=tf.float32,
                                             stddev=1e-1))
        keep_prob = tf.placeholder(tf.float32)
        prediction, softmax, fc8, p = inference_op(image, keep_prob)
        init = tf.global_variables_initializer()
        sess = tf.Session()
        sess.run(init)
        time_tensorflow_run(sess, prediction, {keep_prob:1.0}, 'Forward')
        objective = tf.nn.l2_loss(fc8)
        grad = tf.gradients(objective, p)
        time_tensorflow_run(sess, grad, {keep_prob:0.5}, 'Forward_backward')

if __name__ == '__main__':
    batch_size  = 100
    num_batches  = 32
    dict_tem = dict()
    img_name  = 'timg.jpg'
    img = cv2.imread(img_name)
    cv2.imshow('1', img)
    i = cv2.waitKey(0)
    dict_tem[img_name] = i
    print(i)
    print(dict_tem)
    w_f = 'test.json'
    with open(w_f, 'w') as f:
        json.dump(dict_tem, f)
    '''
    key(q) = 113 man
    key(w) = 119 woman
    '''
    cv2.destroyAllWindows()
    # if cv2.waitKey(100)>0:
    #     cv2.destroyAllWindows()

    # run_benchmark()









