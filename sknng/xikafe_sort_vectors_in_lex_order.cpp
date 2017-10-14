/**
 *  sort a set of vectors in lex order
 */
#include "mex.h"
#include <vector>
#include <algorithm>
#include <iostream>
#include <cstdlib>
#include <cstring>
using namespace std;

void printList(vector<int> list){
    cout << "[ ";
    for(int i = 0; i < list.size(); i++){
        cout << ", " << list[i];
	}
    cout << "]\n";
}

bool comp(const vector<int> &va, const vector<int> &vb){
    for(int i = 0; i < va.size()-1; i++){   // the end of the vector is the id
        if(va[i] < vb[i]){
            return true;
        }else if(va[i] > vb[i]){
            return false;
        }
    }
    
    return true;
}

void mexFunction(  int nlhs, mxArray *plhs[],
                  int nrhs, const mxArray *prhs[]){

    /**
     *  sort a set of vectors in ascending order
     */
    if(nlhs > 2){
        mexErrMsgTxt("at most 2 output arguments are expected");
      }

    int     *v = (int*)mxGetPr(prhs[0]);
    int     d   = mxGetM(prhs[0]);
    int     n   = mxGetN(prhs[0]);

    plhs[0] = mxCreateNumericMatrix(d, n, mxINT32_CLASS, mxREAL);
    plhs[1] = mxCreateNumericMatrix(1, n, mxINT32_CLASS, mxREAL);
    int     *sv = (int*)mxGetPr(plhs[0]);
    int     *idx = (int*)mxGetPr(plhs[1]);

    // copy vectors into 2-D arrays
    vector<vector<int> > vecs;
    for(int i = 0; i < n; i++){
        vector<int> avec;
        for(int j = 0; j < d; j++){
            avec.push_back(v[i*d+j]);
        }
        avec.push_back(i+1);    // idx begin from 1 in matlab
        vecs.push_back(avec);
    }

    sort(vecs.begin(), vecs.end(), comp);

    // convert 2-D array to 1-D array
    for(int i = 0; i < n; i++){
        for(int j = 0; j < d; j++){
            sv[i*d+j] = vecs[i][j];
        }
        idx[i] = vecs[i][d];
    }
}