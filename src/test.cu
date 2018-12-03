#include<stdio.h>
#include<stdlib.h>
#include<cuda.h>
// #include <opencv2/opencv.hpp>
#include<fstream>
// #include <TooN/TooN.h>
// #include <TooN/se3.h>
// #include <TooN/GR_SVD.h>

// using namespace cv;
using namespace std;

__device__ int get_pos(){
    return threadIdx.x + blockIdx.x * blockDim.x;
    
}
struct Img{
    int* data;
    int image_width;
    int image_height;
    int img_arr_size;
    Img(){

    }
    Img(int w, int h){
        image_height = h;
        image_width = w;
        img_arr_size = sizeof(int) * image_width*image_height;
        cudaMalloc((void**)&data, img_arr_size);
    }
};
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

inline __host__ __device__ float3 make_float3(float4 a)
{
    // printf("make_float3_start\n");
    return make_float3(a.x, a.y, a.z);
}

inline __host__ __device__ float dot(float3 a, float3 b)
{
    // printf("dot_start\n");
    return a.x * b.x + a.y * b.y + a.z * b.z;
}


inline __host__ __device__ float3 rotate( const Matrix4 & M, const float3 & v){
    // printf("start\n");
    float3 ans = make_float3(dot(make_float3(M.data[0]), v),dot(make_float3(M.data[1]), v),dot(make_float3(M.data[2]), v));
        // printf("end\n");
    return ans;
}



std::ostream & operator<<( std::ostream & out, const Matrix4 & m ){
    for(unsigned i = 0; i < 4; ++i)
        out << m.data[i].x << "  " << m.data[i].y << "  " << m.data[i].z << "  " << m.data[i].w << "\n";
    return out;
}
 
// __global__ void point2depthimage(Matrix4 r_inv, float* depth_image, float* point_sequence) {
    
// 	printf("aaa\n");
// }
__global__ void mykernel(float3* a, const Matrix4 r_inv, int max_num,Img* img){
    // printf("%d %d %d %d \n", r_inv.data[0].x, r_inv.data[0].y, r_inv.data[0].z, r_inv.data[0].w);
    
    int index = get_pos();
    if(index >= max_num)
        return ;
    // printf("index is %d x is %f, y is %f, z is %f\n", index,arr[index].x, arr[index].y, arr[index].z);
    float3 pixel_  = rotate(r_inv, a[index]);
    int depth = int(pixel_.z);
    int2 image_pos =make_int2(pixel_.x / pixel_.z, pixel_.y / pixel_.z);
    if(image_pos.x >= img->image_width || image_pos.y >= img->image_height )
        return;
    else{
        img->data[img->image_width * image_pos.y + image_pos.x] = depth;
    }
    printf("index is %d,x is %f, y is %f, z is %f, image_pos.x is %d, image_pos.z is %d\n",index,pixel_.x, pixel_.y, pixel_.z, image_pos.x, image_pos.y);
}

int num = 1000;
float3* simulation_array;
float3* test_gpu_array;
int* img;
int array_size = sizeof(float3)*num;
float4 four_element = make_float4(1,1,1,1);
int img_width = 100, img_height = 200;
int* image_show;
Img* img_show = new Img(img_width, img_height);

// Matrix4 camera_M = getCameraMatrix(rotate_matrix);
Matrix4 inv_camera_M = getInverseCameraMatrix(four_element);

int main() {
    simulation_array = (float3*)malloc(array_size);
    image_show = (int*)malloc(img_show->img_arr_size);

    // mykernel<<<100,1000>>>();
    for(int x = 0; x<num;x++){
        simulation_array[x] = make_float3(rand()%10,rand()%10,rand()%10);
        // printf("%f, %f, %f\n", simulation_array[x].x, simulation_arr/ay[x].y,simulation_array[x].z);
    }
    cudaMalloc((void**)&test_gpu_array, array_size);
    cudaMemcpy(test_gpu_array,simulation_array,array_size, cudaMemcpyHostToDevice); 
    // cout<<inv_camera_M;
    mykernel<<<100,10>>>(test_gpu_array, inv_camera_M, num, img_show);
    cudaMemcpy(image_show,img_show->data, img_show->img_arr_size, cudaMemcpyDeviceToHost); 
    
    // printf("Hello World!\n");
    cudaDeviceSynchronize();

    ofstream ofile;               
    ofile.open("image_show.txt");     
    for(int i=0; i<img_height;i++)
        for(int j=0;j<img_width;j++){
            if(j == img_width-1)
                ofile<<image_show[i*img_width + j]<<'\n';
            else
                ofile<<image_show[i*img_width + j]<<' ';   
        }
    ofile.close();               

    cudaDeviceReset();
    // uchar *ptmp = NULL;
    // Mat depth_image = Mat(img_height, img_width, CV_8UC1);
    // for(int i = 0 ;i<img_height;i++){
    //     // ptmp = depth_image.ptr<uchar>(i);
    //     for(int ii = 0; ii < img_width; ii++){
    //         depth_image.at<uchar>(i,ii) = image_show[ii+i*img_show->image_width];
    //     }
    // }
    // // namedWindow("depth_image");
    // imshow("depth_image", depth_image);
    // waitKey(0);
}
 