/**
 *  mex file for zorder encoding
 */
#include "mex.h"
#include <stdlib.h>
#include <string.h>

#define BITS_INT 32

/// transform a set of integer into zorder array
unsigned int *transform(const unsigned int *coor, int d){
    int biti, di, idx, ofs;
    unsigned int *zorder;

    // some allocation
    zorder = (unsigned int *)malloc(sizeof(unsigned int)*d);
    memset(zorder, 0, sizeof(unsigned int)*d);

    // encode
    int flag = 0;
    for(biti = 0; biti < BITS_INT; biti++){
        // the i-th bit of a coordinate value
        for(di = 0; di < d; di++){
            // the di-th coordinate
            idx = (biti * d + di) / BITS_INT;       // which unit in the zorder array
            ofs = (biti * d + di) % BITS_INT;       // where to locate from the right
            zorder[idx] |= ((coor[di] >> (BITS_INT - biti - 1)) & 1) << (BITS_INT - ofs - 1);
        }
    }

    return zorder;
}

/**
 * mex入口：将一个矩阵中的向量转化为g-order编码 
 * @params	plhs	转换后矩阵 - uint32
 * @params 	prhs 	待转换矩阵 - uint32
 * @params 	n 		number of vector
 * @params 	d 		vector dimension
 */
void mexFunction(  int nlhs, mxArray *plhs[],
                  int nrhs, const mxArray *prhs[]){

  if (nrhs > 1){
    mexErrMsgTxt("error: more than one input parameters");
  }
  if(mxGetClassID(prhs[0]) != mxUINT32_CLASS){
    mexErrMsgTxt("first parameter must be a [uint32] type matrix");
  }
  int d = mxGetM(prhs[0]);
  int n = mxGetN(prhs[0]);
  unsigned int *vec = (unsigned int*)mxGetPr(prhs[0]);

  if(nlhs > 1){
    mexErrMsgTxt("one output required");
  }
  plhs[0] = mxCreateNumericMatrix(d, n, mxUINT32_CLASS, mxREAL);
  unsigned int *zvec = (unsigned int*)mxGetPr(plhs[0]);
  
  /* transform */
  unsigned int *buff = (unsigned int*)malloc(sizeof(unsigned int) * d);
  for(int i = 0; i < n; i++){  
    buff = transform(vec+d*i, d);
    memcpy(zvec+d*i, buff, sizeof(unsigned int) * d);
  }
  
  free(buff); buff = NULL;
}


