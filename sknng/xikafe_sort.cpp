#idndef XIKAFE_SORT_H
#define XIKAFE_SORT_H

// compare two keys K1 and K2 to determine whether K1 is larger than K2
int isLarge(int* K1, int* K2, int _m)
{
	int i = -1;
	for (i=0;i<_m;i++)
	{
		if (K1[i] > K2[i])
			return true;

		if (K1[i] < K2[i])
			return false;
	}

	//return FAILURE;
	return true;
}

// use the QUICKSORT algorithm to sort the hash keys and
// obtain the responding orders
void quickSort(int _m, int* keys, int* orders, int p, int r)
{
	int q = -1;

	if (p < r)
	{
		q = partition(_m, keys, orders, p, r);
		quickSort(_m, keys, orders, p, q-1);
		quickSort(_m, keys, orders, q+1, r);
	}
}

// the partition function in the quick sort method
int partition(int _m, int* keys, int* orders, int p, int r)
{
	int  i = -1;
	int  j = -1;
	int  k = -1;
	int _x = -1;
	int _y = -1;

	int* x = (int*) malloc(sizeof(int)*_m);
	int* y = (int*) malloc(sizeof(int)*_m);

	// gives A[r] to a variable x
	for (i=0;i<_m;i++)
	{
		x[i] = keys[r*_m+i];
	}
	_x = orders[r];


	i = p - 1;
	for (j=p;j<r;j++)
	{
		// give A[j] to y
		for (k=0;k<_m;k++)
		{
			y[k] = keys[j*_m+k];
		}
		_y = orders[j];

		// is A[j] <= x
		if (!isLarge(y,x,_m))
		{
			i = i + 1;

			// exchange A[i] and A[j]
			for (k=0;k<_m;k++)
			{
				keys[j*_m+k] = keys[i*_m+k];
			}

			for (k=0;k<_m;k++)
			{
				keys[i*_m+k] = y[k];
			}

			orders[j] = orders[i];
			orders[i] = _y;
		}
	}

	// exchange A[i+1] and A[r]
	for (k=0;k<_m;k++)
	{
		keys[r*_m+k] = keys[(i+1)*_m+k];
	}

	for (k=0;k<_m;k++)
	{
		keys[(i+1)*_m+k] = x[k];
	}

	orders[r]   = orders[i+1];
	orders[i+1] = _x;

	free(x);
	free(y);

	return i+1;

}

#endif
