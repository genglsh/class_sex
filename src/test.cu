#include<stdio.h>
#include<stdlib.h>
#include<cuda.h>
#include "hdf5.h"
// #include <opencv2/opencv.hpp>
// using namespace cv;
using namespace std;
#include <TooN/TooN.h>
#include <TooN/se3.h>
#include <TooN/GR_SVD.h>

__device__ int get_pos(){
    int 
}

struct Matrix4 {
    float4 data[4];

    inline __host__ __device__ float3 get_translation() const {
        return make_float3(data[0].w, data[1].w, data[2].w);
    }
};
inline Matrix4 getCameraMatrix( const float4 & k ){
    Matrix4 K;
    K.data[0] = make_float4(k.x, 0, k.z, 0);
    K.data[1] = make_float4(0, k.y, k.w, 0);
    K.data[2] = make_float4(0, 0, 1, 0);
    K.data[3] = make_float4(0, 0, 0, 1);
    return K;
}

inline Matrix4 getInverseCameraMatrix( const float4 & k ){
    Matrix4 invK;
    invK.data[0] = make_float4(1.0f/k.x, 0, -k.z/k.x, 0);
    invK.data[1] = make_float4(0, 1.0f/k.y, -k.w/k.y, 0);
    invK.data[2] = make_float4(0, 0, 1, 0);
    invK.data[3] = make_float4(0, 0, 0, 1);
    return invK;
}


std::ostream & operator<<( std::ostream & out, const Matrix4 & m ){
    for(unsigned i = 0; i < 4; ++i)
        out << m.data[i].x << "  " << m.data[i].y << "  " << m.data[i].z << "  " << m.data[i].w << "\n";
    return out;
}
 
__global__ void point2depthimage(Matrix4 r_inv, float* depth_image, float* point_sequence) {
    
	printf("aaa\n");
}
 
int main(void) {
	mykernel<<<2,2>>>();
    printf("Hello World!\n");
    cudaDeviceSynchronize();
    cudaDeviceReset();
}
 