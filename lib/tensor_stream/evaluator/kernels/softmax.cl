// First naive implementation
% c_dtype = dtype_to_c_type(dtype)
__kernel void softmax_<%= dtype %>(const int N,
                      const __global <%= c_dtype %>* A,
                      __global <%= c_dtype %>* C) {

    // Get the index of the current element to be processed
    const int globalRow = get_global_id(0); // Row ID of C (0..M)

    // Compute a single element (loop over K)
    float acc = 0.0f;
    float max = FLT_MIN;

    for (int k=0; k<N; k++) {
      max = A[globalRow*N + k] > max ? A[globalRow*N + k] : max;
    }

    for (int k=0; k<N; k++) {
      acc += exp(A[globalRow*N + k] - max);
    }

    // Store the result
    for (int k=0; k < N; k++) {
      C[globalRow*N + k] = exp(A[globalRow*N + k] - max) / acc;
    }
}