#include "quicksort.h"

#ifdef __GNUC__
#define NOIPA __attribute__((noipa))
#else
#define NOIPA
#endif

/* Rosetta Code */
#if 1
void NOIPA quicksort(data *A, INDEX len) {
  data pivot;
  INDEX i,j ;

start:
  pivot = A[len / 2];
 
  for (i = 0, j = len - 1; ; i++, j--) {
    while (A[i] < pivot) i++;
    while (A[j] > pivot) j--;
 
    if (i >= j) break;
 
    data temp = A[i];
    A[i]     = A[j];
    A[j]     = temp;
  }
 
  if (i >= 2) { quicksort(A, i); }
  if (len-i >= 2) {
    A = A + i;
    len = len - i;
    goto start;
  }
}

#elif
void NOIPA quicksort(data *A, INDEX len) {
  data pivot = A[len / 2];
 
  INDEX i, j;
  for (i = 0, j = len - 1; ; i++, j--) {
    while (A[i] < pivot) i++;
    while (A[j] > pivot) j--;
 
    if (i >= j) break;
 
    data temp = A[i];
    A[i]     = A[j];
    A[j]     = temp;
  }
 
  if (i >= 2) { quicksort(A, i); }
  if (len-i >= 2) { quicksort(A + i, len - i); }
}

#else
void quicksort(data *A, INDEX len) {
  if (len < 2) return;
 
  data pivot = A[len / 2];
 
  INDEX i, j;
  for (i = 0, j = len - 1; ; i++, j--) {
    while (A[i] < pivot) i++;
    while (A[j] > pivot) j--;
 
    if (i >= j) break;
 
    data temp = A[i];
    A[i]     = A[j];
    A[j]     = temp;
  }
 
  quicksort(A, i);
  quicksort(A + i, len - i);
}
#endif

data data_random(void) {
  static uint64_t next = 1325997111;
  next = next * 1103515249 + 12345;
  return next;
}

void data_vec_random(data *a, unsigned len) {
  for(unsigned i=0; i<len; i++) {
    a[i] = data_random();
  }
}

bool data_vec_is_sorted(const data *a, unsigned len) {
  for(unsigned i=0; i<len-1; i++) {
    if (a[i] > a[i+1]) return false;
  }
  return true;
}
