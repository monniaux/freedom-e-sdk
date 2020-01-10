#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>
#include "quicksort.h"
#include "clock.h"

#define LEN 300
static data vec[LEN];

int main (void) {
  clock_prepare();
  data_vec_random(vec, LEN);
  clock_start();
  quicksort(vec, LEN);
  clock_stop();
  printf("sorted=%s\n",
	 data_vec_is_sorted(vec, LEN)?"true":"false");
  print_total_clock();

  return 0;
}
 
