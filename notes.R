# notes from vtree tutorial 

# main goals of the vtree package? ##### 
## what is the denominator for the presented percentages? ####
## what about missing values? #### 

# excluding records with missings reduces statistical power and introduces selection bias
# vtree always shows missing values! 
# but by default it calculates 'valid percentages' - denominator doesn't include NAs 

# for two variables vtree makes no improvement to crosstabulation 
### a way to go wrong with data analysis is 'going fishing' i.e. searching around 
### for sth without RQs or hypothesis 

library(tidyverse)
library(vtree)

titanic <- crosstabToCases(Titanic) |> 
  mutate(Class = factor(Class)) 

vtree(titanic, "Class Sex Age Survived", horiz = F) 
vtree(titanic, "Class Sex Age Survived", horiz = F, prune = list(Sex = "Female")) 


# ESS tests ##### 
library(haven)
ess <- read_spss("/Users/remek/Downloads/ESS11/ESS11e04_0.sav")
essd <- sjlabelled::as_label(ess)

vtree(essd, "cntry gndr", horiz = T, sameline = T, showlegend = T, showlegendsum = T) 

svtree(essd, "netusoft polintr gndr", pattern = T) 


essd |> select(cntry, gndr) |> summary()

sjPlot::tab_xtab(essd$cntry, essd$gndr, show.row.prc = T)


vtree(essd, "netusoft polintr gndr", horiz = F, sameline = F, showlegend = T, showlegendsum = T) 

###################

library(gtsummary)

vtree(titanic, "Class Survived", horiz = F) 
tbl_cross(data = titanic, row = Class, col = Survived, percent = "row")
tbl_cross(data = titanic, row = Survived, col = Class, percent = "column")


# vtree and gtsummary packages are able to knit markdown into MS Word nicely 

