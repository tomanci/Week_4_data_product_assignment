library(caret)
car <- mtcars

fit_mod <- glm(mpg ~.,data=car,family="poisson")
new_data <- as.data.frame(t(c("cyl"=8,"disp"=180,"hp"=500,"drat"=3.9,"wt"=10,"qsec"=18.9,"vs"=1,"am"=1,"gear"=7,"carb"=8)))
