## Two functions to cache the inverse of a matrix.

## This first function creates a special matrix object and can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {

m <- NULL

set <- function(y){
  x <<- y
  m <<- NULL
}

get <- function() x
setInverse <- function(Inverse) m <<- Inverse
getInverse <- function() m
list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## This second function computes the inverse of the special matrix returned by the first function.

cacheSolve <- function(x, ...) {
        # Return a matrix that is the inverse of 'x'
m <- x$getInverse()

if(!is.null(m)) {
  message("Getting cached data.")
  return(m)
  }

data <- x$get()
m <- solve(data)
x$setInverse(m)
m
  
}
