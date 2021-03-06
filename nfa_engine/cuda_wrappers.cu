// Copyright (C) 2010  
// Pierluigi Rolando (pierluigi.rolando@polito.it)
// Netgroup - DAUIN - Politecnico di Torino
//
// Niccolo' Cascarano (niccolo.cascarano@polito.it)
// Netgroup - DAUIN - Politecnico di Torino
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

#include <cuda.h>
#include <cuda_runtime.h>

#include "cuda_wrappers.h"
#include "utils.h"


int cuda_error_convert(cudaError_t err) {
	if (err == cudaSuccess)
		return w_cudaSuccess;
	else
		return w_cudaFail;
}

int w_cudaMallocHost(void **ptr, size_t size) {
	cudaError_t retVal = cudaMallocHost(ptr, size);
	CUDA_CHECK(retVal, "Error durig cudaMallocHost ");
	return cuda_error_convert(retVal);
}

int w_cudaMalloc(void **devPtr, size_t size) {
	cudaError_t retVal = cudaMalloc(devPtr, size);
	CUDA_CHECK(retVal, "Error durig cudaMalloc ");
	return cuda_error_convert(retVal);
}

int w_cudaFree(void *devPtr) {
	cudaError_t retVal = cudaFree(devPtr);
	CUDA_CHECK(retVal, "Error durig cudaFree ");
	return cuda_error_convert(retVal);
}

int w_cudaFreeHost(void *devPtr) {
	cudaError_t retVal = cudaFreeHost(devPtr);
	CUDA_CHECK(retVal, "Error durig cudaFreeHost ");
	return cuda_error_convert(retVal);
}

