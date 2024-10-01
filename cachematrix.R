## These functions work together to create a special "matrix" object
## that can cache its inverse. The `makeCacheMatrix` function creates 
## the object, while the `cacheSolve` function computes or retrieves 
## the cached inverse of the matrix.

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y 
        inv <<- NULL  
          }
  
  get <- function() {
    x  
  }

  setInverse <- function(inverse) {
    inv <<- inverse  
  }
  
  getInverse <- function() {
    inv  
  }
  
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

## This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix. If the inverse has already been 
## calculated (and the matrix has not changed), it retrieves 
## the inverse from the cache.
cacheSolve <- function(x, ...) {
  inv <- x$getInverse()
  if (!is.null(inv)) {
    message("getting cached data")  
    return(inv) 
  }
  
  data <- x$get()  
  inv <- solve(data, ...)  
  x$setInverse(inv)  
  inv  
}
