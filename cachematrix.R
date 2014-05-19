#these functions have almost the same as the example code.
#just modified to process the matrix object
makeCacheMatrix <- function(x = matrix() ){
  m <- NULL
  set <- function(y){
    x<<-y
    m<<-NULL
  }
  get <- function() x
  setSolution <- function(solve) m<<-solve
  getSolution <- function() m
  return(list(set=set, get=get, setSolution=setSolution, getSolution=getSolution))
}

cacheSolve <- function(x, ...){
 m <- x$getSolution()
 if(!is.null(m)){
   message("getting chached data")
   return(m)
 }
 data <- x$get()
 m<- solve(data, ...)
 x$setSolution(m)
 return(m)
}
