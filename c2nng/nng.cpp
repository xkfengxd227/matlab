/*
Implementations of some operations on NNG

@author   xikafe
@date     2017-1-18
*/

#include "nng.h"
#include "common.h"
#include "heap.h"
#include <yael/vector.h>

void converge_to_knn( const float *v, int n, int d,
                      const float *q,
                      const int *cand, int nc,
                      const int *G, int g,
                      int k,
                      int *knn, float *knndis, int *status){
  /* validity check */
  ASSERTINFO(   v == NULL || q == NULL || cand == NULL || G == NULL
                || n <= 0 || d <= 0 || nc <= 0 || g <= 0 || k <= 0
                || knn == NULL || knndis == NULL || status == NULL,

                "IPP");
  ASSERTINFO(k > n, "k should be smaller than n");

  int i;

  /* init */
  Heap candHeap(nc);                    // cand-min-heap
  Heap knnHeap(k);                      // knn-max-heap
  int   count = nc;                     // loaded point counter
  for(i = 0; i < n; i++){
    status[i] = CleanNode;              // all points are [clean]
  }

  /* fulfill candHeap with candidates */
  for(int i = 0; i < nc; i++){
    DoubleIndex di = {cand[i], odistance(q, v+cand[i]*d, d) };
    candHeap.min_insert(&di);

    status[cand[i]] = CandidateNode;
  }

  /* begin the convergence on nng */
  int oid, gid;
  float oqdis, gqdis;
  while(!candHeap.isempty()){
    DoubleIndex tmpdi;
    candHeap.min_extract(&tmpdi);
    oid = tmpdi.id;
    oqdis = tmpdi.val;

    /* try to add it to knnHeap */
    if(f_bigger(knnHeap.elem[0].val, oqdis)){
      knnHeap.max_insert(&tmpdi);
    }


    if(status[oid] == CandidateNode){
      // for a candidate: traverse all neighbors
      for(i = 0; i < g; i++){
        gid = G[oid * g + i];
        gqdis = odistance(q, v+gid*d, d);
        DoubleIndex di = {gid, gqdis};

        if(f_bigger(oqdis, gqdis)){
          // neighber is nearer to query: [candidate]
          status[gid] = CandidateNode;
          candHeap.min_expand(&di);
        }else{
          // farther to query: [cast]
          status[gid] = CastNode;
        }
      }// endfor

      // mark o [expanded]
      status[oid] = ExpandedNode;
    }// endif
  }// endwhile

  /* extract knns */
  DI_MergeSort(knnHeap.elem, 0, k-1);
  for(i = 0; i < k; i++){
    knn[i] = knnHeap.elem[i].id;
    knndis[i] = knnHeap.elem[i].val;
  }
}
