
<!-- README.md is generated from README.Rmd. Please edit that file -->
RSDA
====

Symbolic Data Analysis (SDA) was proposed by professor Edwin Diday in 1987, the main purpose of SDA is to substitute the set of rows (cases) in the data table for a concept (second order statistical unit). This package implements, to the symbolic case, certain techniques of automatic classification, as well as some linear models.

Installation
------------

You can install RSDA from github with:

``` r
# install.packages("devtools")
devtools::install_github("PROMiDAT/RSDA")
```

Examples
--------

``` r
data(ex1_db2so)
ex1_db2so
```

            state sex county group age
    1     Florida   M      2     6   3
    2  California   F      4     3   4
    3       Texas   M     12     3   4
    4     Florida   F      2     3   4
    5       Texas   M      4     6   4
    6       Texas   F      2     3   3
    7     Florida   M      6     3   4
    8     Florida   F      2     6   4
    9  California   M      2     3   6
    10 California   F     21     3   4
    11 California   M      2     3   4
    12 California   M      2     6   7
    13      Texas   F     23     3   4
    14    Florida   M      2     3   4
    15    Florida   F     12     7   4
    16      Texas   M      2     3   8
    17 California   F      3     7   9
    18 California   M      2     3  11
    19 California   M      1     3  11

``` r
result1 <- classic.to.sym(ex1_db2so, concept=c("state"),
                    variables=c("county", "group","sex", "age","age"),
                    variables.types=c("$S", "$M","$M","$I","$C"))
result1
```

    # A Symbolic Data Table :  3  x  5 
                     county              group          sex    age  age
    California {1,2,3,4,21} 3:75% 6:12% 7:12%  F:38% M:62%  [4,11]    7
    Florida        {2,6,12} 3:50% 6:33% 7:17%  F:50% M:50%   [3,4] 3.83
    Texas       {2,4,12,23}  3:80% 6:20% 7:0%  F:40% M:60%   [3,8]  4.6

``` r
result2 <- classic.to.sym(ex1_db2so, concept=c("state", "sex"),
                    variables=c("county", "group", "age"),
                    variables.types=c("$S", "$M", "$I"))
result2
```

    # A Symbolic Data Table :  6  x  3 
                   county              group    age
    California.F {3,4,21}  3:67% 6:0% 7:33%   [4,9]
    California.M    {1,2}  3:80% 6:20% 7:0%  [4,11]
    Florida.F      {2,12} 3:33% 6:33% 7:33%   [4,4]
    Florida.M       {2,6}  3:67% 6:33% 7:0%   [3,4]
    Texas.F        {2,23}  3:100% 6:0% 7:0%   [3,4]
    Texas.M      {2,4,12}  3:67% 6:33% 7:0%   [4,8]

``` r
result3 <- classic.to.sym(ex1_db2so, concept=c("state"),
                    variables=c("age"),
                    variables.types=c("$H5"))
result3
```

    # A Symbolic Data Table :  3  x  1 
                                                               age
    California [2,4):0% [4,6):38% [6,8):25% [8,10):12% [10,12]:25%
    Florida      [2,4):17% [4,6):83% [6,8):0% [8,10):0% [10,12]:0%
    Texas       [2,4):20% [4,6):60% [6,8):0% [8,10):20% [10,12]:0%

``` r
result4 <- classic.to.sym(ex1_db2so, concept=c("state"),
                    variables=c("age"),
                    variables.types=c("$H8"))
result4
```

    # A Symbolic Data Table :  3  x  1 
                                                                                           age
    California [3,4):0% [4,5):38% [5,6):0% [6,7):12% [7,8):12% [8,9):0% [9,10):12% [10,11]:25%
    Florida       [3,4):17% [4,5):83% [5,6):0% [6,7):0% [7,8):0% [8,9):0% [9,10):0% [10,11]:0%
    Texas        [3,4):20% [4,5):60% [5,6):0% [6,7):0% [7,8):0% [8,9):20% [9,10):0% [10,11]:0%

Basic plots in RSDA
===================

``` r
data(oils)
oils
```

    # A Symbolic Data Table :  8  x  4 
               GRA       FRE       IOD       SAP
    L  [0.93,0.94] [-27,-18] [170,204] [118,196]
    P  [0.93,0.94]   [-5,-4] [192,208] [188,197]
    Co [0.92,0.92]   [-6,-1]  [99,113] [189,198]
    S  [0.92,0.93]   [-6,-4] [104,116] [187,193]
    Ca [0.92,0.92] [-25,-15]   [80,82] [189,193]
    O  [0.91,0.92]     [0,6]   [79,90] [187,196]
    B  [0.86,0.87]   [30,38]   [40,48] [190,199]
    H  [0.86,0.86]   [22,32]   [53,77] [190,202]

``` r
sym.scatterplot(oils[,3], oils[,4], main='Scatter Plot')
```

<img src="README-unnamed-chunk-3-1.png" style="display: block; margin: auto;" />

``` r
sym.radar.plot(oils[1:2,],main = "Radar Plot")
```

<img src="README-unnamed-chunk-3-2.png" style="display: block; margin: auto;" />

``` r
sym.radar.plot(oils[1:4,],main = "Radar Plot")
```

<img src="README-unnamed-chunk-3-3.png" style="display: block; margin: auto;" />

``` r
h <- interval.histogram.plot(oils[,3],n.bins = 2,main = "histogram")
```

<img src="README-unnamed-chunk-3-4.png" style="display: block; margin: auto;" />

``` r
h <- interval.histogram.plot(oils[,2],n.bins = 3,main = "histogram", col = "blue")
```

<img src="README-unnamed-chunk-3-5.png" style="display: block; margin: auto;" />

Basic statistics in RSDA
========================

Mean
----

``` r
result1
```

    # A Symbolic Data Table :  3  x  5 
                     county              group          sex    age  age
    California {1,2,3,4,21} 3:75% 6:12% 7:12%  F:38% M:62%  [4,11]    7
    Florida        {2,6,12} 3:50% 6:33% 7:17%  F:50% M:50%   [3,4] 3.83
    Texas       {2,4,12,23}  3:80% 6:20% 7:0%  F:40% M:60%   [3,8]  4.6

``` r
mean(result1[,5])
```

    [1] 5.143333

``` r
mean(result1[,4],method = "interval")
```

         age    age.1 
    3.333333 7.666667 

``` r
mean(result1[,3],method = "modal")
```

        F     M 
    0.425 0.575 

Standard Deviation
------------------

``` r
sd(result1[,5])
```

    [1] 1.65337

``` r
sd(result1[,4],method = "interval")
```

          age     age.1 
    0.5773503 3.5118846 

``` r
sd(result1[,3],method = "modal")
```

             F          M 
    0.06614378 0.06614378 

Varianze
--------

``` r
var(result1[,5])
```

    [1] 2.733633

``` r
var(result1[,4],method = "interval")
```

           age      age.1 
     0.3333333 12.3333333 

``` r
var(result1[,3],method = "modal")
```

           F        M 
    0.004375 0.004375 

Correlation
-----------

``` r
cor(oils[,1],oils[,2])
```

    [1] -0.900923

``` r
cor(oils[,2],oils[,3],method = "billard")
```

    [1] -0.6451262

``` r
cor(oils[,3],oils[,4])
```

    [1] -0.5932557

Principal Component Analysis for Interval Data
==============================================

``` r
oils
```

    # A Symbolic Data Table :  8  x  4 
               GRA       FRE       IOD       SAP
    L  [0.93,0.94] [-27,-18] [170,204] [118,196]
    P  [0.93,0.94]   [-5,-4] [192,208] [188,197]
    Co [0.92,0.92]   [-6,-1]  [99,113] [189,198]
    S  [0.92,0.93]   [-6,-4] [104,116] [187,193]
    Ca [0.92,0.92] [-25,-15]   [80,82] [189,193]
    O  [0.91,0.92]     [0,6]   [79,90] [187,196]
    B  [0.86,0.87]   [30,38]   [40,48] [190,199]
    H  [0.86,0.86]   [22,32]   [53,77] [190,202]

Example 1
---------

``` r
res <- sym.interval.pca(oils,'centers')
sym.scatterplot(res$Sym.Components[,1], res$Sym.Components[,2],
                 labels=TRUE,col='red',main='Centers PCA Method - Oils Data')
```

<img src="README-unnamed-chunk-9-1.png" style="display: block; margin: auto;" />

``` r
sym.circle.plot(res$Sym.Prin.Correlations)
```

<img src="README-unnamed-chunk-9-2.png" style="display: block; margin: auto;" />

Example 2
---------

``` r
res <- sym.interval.pca(oils,'tops')
sym.scatterplot(res$Sym.Components[,1],res$Sym.Components[,2],
                labels=TRUE,col='red',main='PCA Vertex - Oil Data')
```

<img src="README-unnamed-chunk-10-1.png" style="display: block; margin: auto;" />

Example 3
---------

``` r
res <- sym.interval.pca(oils,'principal.curves')
sym.scatterplot(res$sym.prin.curve[,1],res$sym.prin.curve[,2],
                 labels=TRUE,col='red',main='Principal Curves PCA - Oils Data')
```

<img src="README-unnamed-chunk-11-1.png" style="display: block; margin: auto;" />

Example 4
---------

``` r
res <- sym.interval.pca(oils,'optimized.distance')
sym.scatterplot(res$Sym.Components[,1] , res$Sym.Components[,2],
labels = TRUE,col='red',main='Optimized PCA Distance - Oils Data')
```

<img src="README-unnamed-chunk-12-1.png" style="display: block; margin: auto;" />

``` r
plot(res$pca.min,choix = "var")
```

<img src="README-unnamed-chunk-12-2.png" style="display: block; margin: auto;" />

Example 5
---------

``` r
res <- sym.interval.pca(oils,'optimized.variance')
sym.scatterplot(res$Sym.Components[,1] ,res$Sym.Components[,2],
labels = TRUE,col='red',main='Optimized PCA Variance - Oils Data')
```

<img src="README-unnamed-chunk-13-1.png" style="display: block; margin: auto;" />

``` r
plot(res$pca.min,choix = "var")
```

<img src="README-unnamed-chunk-13-2.png" style="display: block; margin: auto;" />

Regression for Interval Data
============================

Lineal Model
------------

``` r
data(int_prost_train)
data(int_prost_test)
res.cm<-sym.lm(lpsa~.,sym.data=int_prost_train,method='cm')
pred.cm<-predictsym.lm(res.cm,int_prost_test,method='cm')
RMSE.L(sym.var(int_prost_test,9),pred.cm$Fitted)
```

    [1] 0.7229999

``` r
RMSE.U(sym.var(int_prost_test,9),pred.cm$Fitted)
```

    [1] 0.7192467

``` r
R2.L(sym.var(int_prost_test,9),pred.cm$Fitted)
```

    [1] 0.501419

``` r
R2.U(sym.var(int_prost_test,9),pred.cm$Fitted)
```

    [1] 0.5058389

``` r
deter.coefficient(sym.var(int_prost_test,9),pred.cm$Fitted)
```

    [1] 0.4962964

LASSO
-----

``` r
data(int_prost_train)
data(int_prost_test)
res.cm.lasso<-sym.glm(sym.data=int_prost_train,response=9,method='cm',
                      alpha=1,nfolds=10,grouped=TRUE)
pred.cm.lasso<-predictsym.glm(res.cm.lasso,response=9,int_prost_test,method='cm')
plot(res.cm.lasso)
```

<img src="README-unnamed-chunk-15-1.png" style="display: block; margin: auto;" />

``` r
plot(res.cm.lasso$glmnet.fit, "lambda", label=TRUE)
```

<img src="README-unnamed-chunk-15-2.png" style="display: block; margin: auto;" />

``` r
RMSE.L(sym.var(int_prost_test,9),pred.cm.lasso)
```

    [1] 0.711936

``` r
RMSE.U(sym.var(int_prost_test,9),pred.cm.lasso)
```

    [1] 0.7084501

``` r
R2.L(sym.var(int_prost_test,9),pred.cm.lasso)
```

    [1] 0.5162145

``` r
R2.U(sym.var(int_prost_test,9),pred.cm.lasso)
```

    [1] 0.5203659

``` r
deter.coefficient(sym.var(int_prost_test,9),pred.cm.lasso)
```

    [1] 0.4965905

RIDGE
-----

``` r
data(int_prost_train)
data(int_prost_test)
res.cm.ridge<-sym.glm(sym.data=int_prost_train,response=9,method='cm',
                      alpha=0,nfolds=10,grouped=TRUE)
pred.cm.ridge<-predictsym.glm(res.cm.ridge,response=9,int_prost_test,method='cm')
plot(res.cm.ridge)
```

<img src="README-unnamed-chunk-16-1.png" style="display: block; margin: auto;" />

``` r
plot(res.cm.ridge$glmnet.fit, "lambda", label=TRUE)
```

<img src="README-unnamed-chunk-16-2.png" style="display: block; margin: auto;" />

``` r
RMSE.L(sym.var(int_prost_test,9),pred.cm.ridge)
```

    [1] 0.7010619

``` r
RMSE.U(sym.var(int_prost_test,9),pred.cm.ridge)
```

    [1] 0.6980688

``` r
R2.L(sym.var(int_prost_test,9),pred.cm.ridge)
```

    [1] 0.5323882

``` r
R2.U(sym.var(int_prost_test,9),pred.cm.ridge)
```

    [1] 0.5358668

``` r
deter.coefficient(sym.var(int_prost_test,9),pred.cm.ridge)
```

    [1] 0.4761883

Symbolic Correspondance Analysis
================================

``` r
data(ex_cfa1) 
res <- sym.cfa(ex_cfa1)
cfa.scatterplot(sym.var(res,1), sym.var(res,2), num.gr1=ex_cfa1$N,
                        labels=TRUE,col='red',main='CFA')
```

<img src="README-unnamed-chunk-17-1.png" style="display: block; margin: auto;" />
