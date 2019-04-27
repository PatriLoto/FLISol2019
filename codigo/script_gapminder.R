# install.packages(readr)
library(ggplot)
library(tidyverse)

gapminder <- readr::read_csv("https://raw.githubusercontent.com/cienciadedatos/datos-de-miercoles/master/datos/2019/2019-04-24/gapminder_es.csv")
View(gapminder)
america <-gapminder %>% filter(continente== "Americas")
View(america)
qplot(x=anio, y=poblacion, data=america, color=pais)

pl <-ggplot(data=america,aes(x=anio, y=poblacion, color=pais, text = paste('Población:', poblacion))) +
  geom_point() +
  labs (title= "Población de America desde 1950 a 2000", x = "Año", y = "Población", color="")+
  theme(axis.text.x = element_text(angle = 50, vjust = 1.5, hjust=0.5)) +  
  theme(plot.title = element_text(family="Courier",
                                  size=rel(1),        
                                  vjust=2,            #Justificacion vertical, para separarlo del gr?fico
                                  position_identity(center),   
                                  face="bold",       
                                  color="black",     #Color del t?tulo: maroon, lightblue, lightblue,darkblue, darkorange, black.
                                  lineheight=1.2), legend.position= "right", legend.justification = "center")

ggplotly(pl, tooltip = "text")