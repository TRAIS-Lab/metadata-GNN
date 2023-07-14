library(MSGLasso)

x <- read.csv("Dataset Properties.csv")
y <- read.csv("Model Performance.csv")
scaled_x <- scale(x, center=TRUE, scale=TRUE) / sqrt((dim(x)[1]-1))

scaled_y <- scale(y, center=TRUE, scale=TRUE) / sqrt((dim(y)[1]-1))

P <- dim(scaled_x)[2]
Q <- dim(scaled_y)[2]

G <- dim(scaled_x)[2]
R <- 1
gmax <- 1
cmax <- 1
GarrStarts <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17)
GarrEnds <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17)
RarrStarts <- c(1)
RarrEnds <- c(7)

tmp <- FindingPQGrps(P, Q, G, R, gmax, GarrStarts, GarrEnds, RarrStarts, RarrEnds)
PQgrps <- tmp$PQgrps

tmp1 <- Cal_grpWTs(P, Q, G, R, gmax, PQgrps)
grpWTs <- tmp1$grpWTs

tmp2 <- FindingGRGrps(P, Q, G, R, cmax, GarrStarts, GarrEnds, RarrStarts, RarrEnds)
GRgrps <- tmp2$GRgrps

Pen_L <- matrix(rep(1,P*Q),P,Q, byrow=TRUE)
Pen_G <- matrix(rep(1,G*R),G,R, byrow=TRUE)

grp_Norm0 <- matrix(rep(0, G*R), nrow=G, byrow=TRUE)
MSGLassolam1 <- 0.001
MSGLassolamG <- 0.001
MSGLassolamG.m <- matrix(rep(MSGLassolamG, G*R),G,R,byrow=TRUE)
system.time(try <-MSGLasso(scaled_x, scaled_y, grpWTs, Pen_L, Pen_G, PQgrps, GRgrps, grp_Norm0,
                           MSGLassolam1, MSGLassolamG.m, Beta0=NULL))

