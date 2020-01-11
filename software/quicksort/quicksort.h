#include <stdint.h>
#include <stdbool.h>

typedef unsigned INDEX;

typedef uint32_t data;

void quicksort(data *A, INDEX len);
void data_vec_random(data *a, INDEX len);
bool data_vec_is_sorted(const data *a, INDEX len);
