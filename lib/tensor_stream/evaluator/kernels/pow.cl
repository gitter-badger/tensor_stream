 // same dimension add floating point op
 __kernel void pow_fp(const int M, const int N, const int switch_op, __global const float *A, __global const float *B, __global float *C) {
    // Get the index of the current element to be processed
    const int globalRow = get_global_id(0); // Row ID of C (0..M)
    const int globalCol = get_global_id(1); // Col ID of C (0..N)

    C[globalRow * N + globalCol] = pow((float)A[globalRow * N + globalCol], (float)B[globalRow * N + globalCol]);
}

 // 1D + Scalar floating point add op
 __kernel void pow_c_fp(const int M, const int N, const int switch_op, __global const float *A, __global const float *B, __global float *C) {
    // Get the index of the current element to be processed
    const int globalRow = get_global_id(0); // Row ID of C (0..M)
    const int globalCol = get_global_id(1); // Col ID of C (0..N)
    
    if (switch_op == 0) {
      C[globalRow * N + globalCol] = pow((float)A[globalRow * N + globalCol], (float)B[0]);
    } else {
      C[globalRow * N + globalCol] = pow((float)B[0], (float)A[globalRow * N + globalCol]);
    }
}

 // 1D + Scalar floating point add op broadcast
 __kernel void pow_b_fp(const int M, const int N, const int M2, const int N2, const int switch_op, __global const float *A, __global const float *B, __global float *C) {
    // Get the index of the current element to be processed
    const int globalRow = get_global_id(0); // Row ID of C (0..M)
    const int globalCol = get_global_id(1); // Col ID of C (0..N)
    
    int b_m_index = globalRow;
    int b_n_index = globalCol;

    if ( b_m_index >= M2) {
      b_m_index = b_m_index % M2;
    };

    if (b_n_index >= N2) {
      b_n_index = b_n_index % N2;
    }

    if (switch_op == 0) {
      C[globalRow * N + globalCol] = pow((float)A[globalRow * N + globalCol], (float)B[b_m_index * N2 + b_n_index]);
    } else {
      C[globalRow * N + globalCol] = pow((float)B[b_m_index * N2 + b_n_index], (float)A[globalRow * N + globalCol]);
    }
}

 // same dimension add floating point op
 __kernel void pow_int(const int M, const int N, const int switch_op, __global const int *A, __global const int *B, __global int *C) {
    // Get the index of the current element to be processed
    const int globalRow = get_global_id(0); // Row ID of C (0..M)
    const int globalCol = get_global_id(1); // Col ID of C (0..N)

    C[globalRow * N + globalCol] = pown((float)A[globalRow * N + globalCol], (int)B[globalRow * N + globalCol]);
}

 // 1D + Scalar floating point add op
 __kernel void pow_c_int(const int M, const int N, const int switch_op, __global const int *A, __global const int *B, __global int *C) {
    // Get the index of the current element to be processed
    const int globalRow = get_global_id(0); // Row ID of C (0..M)
    const int globalCol = get_global_id(1); // Col ID of C (0..N)
    
    if (switch_op == 0) {
      C[globalRow * N + globalCol] = pown((float)A[globalRow * N + globalCol], (int)B[0]);
    } else {
      C[globalRow * N + globalCol] = pown((float)B[0], (int)A[globalRow * N + globalCol]);
    }
}

 // 1D + Scalar floating point add op broadcast
 __kernel void pow_b_int(const int M, const int N, const int M2, const int N2, const int switch_op, __global const int *A, __global const int *B, __global int *C) {
    // Get the index of the current element to be processed
    const int globalRow = get_global_id(0); // Row ID of C (0..M)
    const int globalCol = get_global_id(1); // Col ID of C (0..N)
    
    int b_m_index = globalRow;
    int b_n_index = globalCol;

    if ( b_m_index >= M2) {
      b_m_index = b_m_index % M2;
    };

    if (b_n_index >= N2) {
      b_n_index = b_n_index % N2;
    }

    if (switch_op == 0) {
      C[globalRow * N + globalCol] = pown((float)A[globalRow * N + globalCol], (int)B[b_m_index * N2 + b_n_index]);
    } else {
      C[globalRow * N + globalCol] = pown((float)B[b_m_index * N2 + b_n_index], (int)A[globalRow * N + globalCol]);
    }
}