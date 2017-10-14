/**
 *  Declarations of some operations on (Nearest Neighbor Graph, NNG or nng)
 */
#ifndef NNG_H
#define NNG_H

/* node status */
#define   CleanNode         0
#define   CandidateNode     1
#define   ExpandedNode      2
#define   CastNode          3

/**
 *  for [one] given query, converge to its knns on NNG with init candidates
 *  @param    v       the base dataset
 *  @param    n       base vector number
 *  @param    d       dimensionality
 *  @param    q       the query point,        [d,1]
 *  @param    cand    the candidate set
 *  @param    nc      candidate number
 *  @param    G       the nng
 *  @param    g       neighbor number of nng
 *  @param    k       [k]-nn
 *
 *  @return   knn     knn ids             [k,nq], int
 *  @return   knndis  knn distances       [k,nq], float
 *  @return   status  status of each point
 */
void converge_to_knn( const float *v, int n, int d,
                      const float *q,
                      const int *cand, int nc,
                      const int *G, int g,
                      int k,
                      int *knn, float *knndis, int *status);

#endif
