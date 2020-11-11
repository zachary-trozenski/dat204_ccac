library(ggplot2)

?mpg
# make , model , displacement (L), year, cylinders, transmissions, drive (front, rear, 4wd)
# city mpg, hwy mpg, fuel type, class (type)
?qplot
qplot(x = class, y = displ, data = mpg, facets = drv ~ year, xlab = "Vehicle Class",
      ylab = "Engine Displacement (L)",geom="boxplot", color=class) + stat_summary(fun.y = "mean", shape = 42, size=1.25)

qplot(x = class, y = cty, data = mpg, xlab = "Vehicle Class", facets = drv ~ year,
      ylab = "City MPG", geom="boxplot", color=class) + stat_summary(fun.y = "mean", shape = 42, size=1.25)

qplot(x = class, y = hwy, data = mpg, xlab = "Vehicle Class", facets = drv ~ year,
      ylab = "Highway MPG",geom="boxplot", color=class) + stat_summary(fun.y = "mean", shape = 42, size=1.25)
