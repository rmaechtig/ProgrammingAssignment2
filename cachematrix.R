## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix creates a lis cointaining functions to 
## set and get a matrix
## set and get inverse matrix

makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL
	set <- function(y) {
		x <<- y
		inv <<- NULL
	}
	get <- function() {
		x
	}
	setinverse <- function(inverse) {
		inv <<- inverse
	}
	getinverse <- function() {
		inv
	}
	list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## this function retunrs the inverse of a matrix.
## first it checks whether the inverse has already been computed
## if it is computed then return the result
## if not then it computes the inverse, sets the values in the cache (setinverse) and returning the result
cacheSolve <- function(x, ...) {
	inv <- x$getinverse()
	if(!is.null(inv)) {
		message("data from cache.")
		return(inv)
	}
	data <- x$get()
	inv <- solve(data)
	x$setinverse(inv)
	inv 
}
