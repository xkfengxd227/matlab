#include "mex.h"
#include <vector>
using namespace std;

void mexFunction(  int nlhs, mxArray *plhs[],
                  int nrhs, const mxArray *prhs[]){

  if (nrhs > 1){
    mexErrMsgTxt("only one input required");
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
  plhs[0] = mxCreateNumericMatrix(1, n, mxINT32_CLASS, mxREAL);
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
