// g-ordering
#include "mex.h"
#include <vector>
#include <stdlib.h>
#include <string.h>

#define BITS_INT 32

/* binary to gray code */
unsigned int binary2gray(unsigned int val){
    return val ^ (val >> 1);
}
/* gray code to binary */
unsigned int gray2binary(unsigned int val){
    unsigned int y = val;
    val = val >> 1;
    while(val){
        y ^= val;
        val = val >> 1;
    }

    return y;
}

/// transform a set of integer into gorder array
unsigned int *transform(const unsigned int *coor, int d){
    
    int biti, di, idx, ofs;
    unsigned int *gorder = NULL, *gcoor = NULL;

    // allocation gorder
    gorder = (unsigned int *)malloc(sizeof(unsigned int)*d);
    memset(gorder, 0, sizeof(unsigned int)*d);

    // copy original code
    gcoor = (unsigned int *)malloc(sizeof(unsigned int)*d);
    memcpy(gcoor, coor, sizeof(unsigned int)*d);

    // convert coordinate to gray code
    for(di = 0; di < d; di++){
        gcoor[di] = binary2gray(gcoor[di]);
    }

    // gordering on gray coordinate
    for(biti = 0; biti < BITS_INT; biti++){
        // the i-th bit of a coordinate value
        for(di = 0; di < d; di++){

            // the di-th coordinate
            idx = (biti * d + di) / BITS_INT;       // which unit in the gorder array
            ofs = (biti * d + di) % BITS_INT;       // where to locate from the right
            gorder[idx] |= ((gcoor[di] >> (BITS_INT - biti - 1)) & 1) << (BITS_INT - ofs - 1);
        }
    }

    // gray coordinate to binary
    for(di = 0; di < d; di++){
        gorder[di] = gray2binary(gorder[di]);
    }

    return gorder;
}


void mexFunction(  int nlhs, mxArray *plhs[],
                  int nrhs, const mxArray *prhs[], int d){

  if (nrhs != 2){
    mexErrMsgTxt("two input required (key array and the dim)");
  }
  if(mxGetClassID(prhs[0]) != mxSINGLE_CLASS){
    mexErrMsgTxt("first parameter must be asingle precision matrix");
  }
  int d = mxGetM(prhs[0]);
  int n = mxGetN(prhs[0]);
  float *v = (float*)mxGetPr(prhs[0]);

  if(nlhs > 1){
    mexErrMsgTxt("one one output required");
  }
  plhs[0] = mxCreateNumericMatrix(1, n, mxINT32_CLASS, 0);
  int *cnt = (int*)mxGetPr(plhs[0]);

  vector<int> vs = {1,2,3};
  
  int i, j;
  for(i = 0; i < n; i++){
    for(j = 0; j < d; j++){
      if(v[i*d+j] > 0){
        cnt[i]++;
      }
    }
  }
}


