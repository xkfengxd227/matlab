/**
 *  find the right position for the query to insert in a sorted vector list
 */
#include "mex.h"
#include <vector>
#include <algorithm>
#include <iostream>
using namespace std;

bool comp(const vector<int> &va, const vector<int> &vb){
	bool a_small = true;
    
    // overlook the first element which is the id
	for(int i = 0; i < va.size(); i++){
		if(va[i] == vb[i]){
			continue;
		}else if(va[i] < vb[i]){
			break;
		}else{
			a_small = false;
			break;
		}
	}

	return a_small;
}

void printList(vector<int> list){
    cout << "[ ";
    for(int i = 0; i < list.size(); i++){
        cout << ", " << list[i];
	}
    cout << "]\n";
}

void mexFunction(  int nlhs, mxArray *plhs[],
                  int nrhs, const mxArray *prhs[]){

    /**
     *  sort a set of vectors in ascending order
     */
    if(nlhs != 1){
        mexErrMsgTxt("only 1 output argument are expected");
      }

    int     *v = (int*)mxGetPr(prhs[0]);
    int     d   = mxGetM(prhs[0]);
    int     n   = mxGetN(prhs[0]);
    int     *q = (int*)mxGetPr(prhs[1]);

    plhs[0] = mxCreateNumericMatrix(1, 1, mxINT32_CLASS, mxREAL);
    int     *ppos = (int*)mxGetPr(plhs[0]);
    
    /* convert the vectors to metrix */
    vector<vector<int> > vecs;
    for(int i = 0; i < n; i++){
        vector<int> avec;
        for(int j = 0; j < d; j++){
            avec.push_back(v[i*d+j]);
        }
        vecs.push_back(avec);
    }
    vector<int> qvec;
    for(int i = 0; i < d; i++){
        qvec.push_back(q[i]);
    }
    
    /* binary search */
    int left = 0;
    int right = n;
    int mid = -1;
    int cnt = 0;
    while(right > left){
        mid = (int)(left + (right - left) / 2);
        
        if (comp(qvec, vecs[mid])){
            right = mid;
        }else{
            left = mid + 1;
        }
        cnt ++;
    }
    
    ppos[0] = left;
}