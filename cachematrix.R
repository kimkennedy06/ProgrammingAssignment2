##The below functions cache the inverse of a matrix.

##Code below is the same as makeVector and cachemean provided by
##instructor as an example it is just tweaked to handle matrices

## The makeCacheMatrix function creates a special "matrix" object
## that can cache its inverse.
## Matrix should be invertible (i.e. a square matrix)

makeCacheMatrix <- function(x = matrix() ){
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## cacheSolve function computes the inverse of the special "matrix"
## returned by makeCacheMatrix above. If the inverse was already calculated.
## The matrix has not changed, then the cacheSolve should retrieve the inverse
## from the cache.

cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  inv
}
