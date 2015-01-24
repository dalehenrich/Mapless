initialization
initializeClientsMutex
  ^ clientsMutex := TransientSemaphore forMutualExclusion