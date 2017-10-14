/**
 *  the interface for matlab to call converge_on_nng method
 */
#include "mex.h"
#include <xkfeng/nng.h>

/**
 *  @param    v       the base dataset    [d,n], float
 *  @param    q       the query dataset   [d,nq], float
 *  @param    cand    the candidate set   [nc, nq], int
 *  @param    G       the nng             [g,n], int
 *  @param    k       [k]-nn              scalar, int
 *
 *  @return   knn     knn ids             [k,nq], int
 *  @return   knndis  knn distances       [k,nq], float
 *  @return   status  point status        [n], int
 */
void mexFunction( int nlhs, mxArray *plhs[],
                  int nrhs, const mxArray *prhs[]){
  if(nrhs != 5 || nlhs > 2){
    mexErrMsgTxt("invalid number of input arguments");
  }
  if(nlhs > 3){
    mexErrMsgTxt("1 or 2 or 3 output arguments are required");
  }

  float *v  = (float*)mxGetPr(prhs[0]);
  int   d   = mxGetM(prhs[0]);
  int   n   = mxGetN(prhs[0]);
  float *q  = (float*)mxGetPr(prhs[1]);
  int   nq  = mxGetN(prhs[1]);
  int   *cand  = (int*)mxGetPr(prhs[2]);
  int   nc  = mxGetM(prhs[2]);
  int   *G  = (int*)mxGetPr(prhs[3]);
  int   g   = mxGetM(prhs[3]);
  int   k   = mxGetScalar(prhs[4]);

  if(k > n){
    mexErrMsgTxt("k should be smaller than the number of vectors");
  }

  plhs[0] = mxCreateNumericMatrix(k, nq, mxINT32_CLASS, mxREAL);
  plhs[1] = mxCreateNumericMatrix(k, nq, mxSINGLE_CLASS, mxREAL);
  plhs[2] = mxCreateNumericMatrix(n, nq, mxINT32_CLASS, mxREAL);
  int   *knn = (int*)mxGetPr(plhs[0]);
  float *knndis = (float*)mxGetPr(plhs[1]);
  int   *status = (int*)mxGetPr(plhs[2]);

  /* for each query, perform one round knn search */
  int i;
  for(i = 0; i < nq; i++){
    converge_to_knn(v, n, d, q+i*d, cand, nc, G, g, k, knn+i*k, knndis+i*k, status+i*n);
  }

  /* idx start from 1 in matlab */
  for(i = 0; i < k * nq; i++){
    knn[i]++;
  }
}
