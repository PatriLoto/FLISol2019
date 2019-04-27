# ---------------------------------------------------------------------------------------------------------------- 
# INSTALACION
# ---------------------------------------------------------------------------------------------------------------- 
#getwd() #para saber donde se guardan los archivos
install.packages("ggplot2")
install.packages("plotly")     #Instalo el paquete plotly
install.packages("readr")
library ("plotly")       #LLamo al paquete plotly
library ("ggplot2")
library ("readr")  readr::read_csv()
# ---------------------------------------------------------------------------------------------------------------- 
# LECTURA DE DATOS
# ---------------------------------------------------------------------------------------------------------------- 
propina<-read.csv('E:/FLISOL2019/DATOS/propina.csv')   #leo mi set de datos readr::read_csv()
# ---------------------------------------------------------------------------------------------------------------- 
#   1- mi primer grafico con ggplot2 (solo datos y elementos estéticos) 
# ---------------------------------------------------------------------------------------------------------------- 

ggplot(data = propina, aes(x= total, y= propina)) + geom_point() + theme(aspect.ratio=1)

ggsave(filename = "E:/FLISOL2019/1ergrafico.png", width =20, height =10)
# ---------------------------------------------------------------------------------------------------------------- 
#   2- grafico con elemento estético por color (color por sexo:femenino/masculino)
# ---------------------------------------------------------------------------------------------------------------- 

ggplot(data = propina, aes(x= total, y= propina, colour= sexo )) + geom_point() + theme(aspect.ratio=1)

#permite guardar el grafico generado
ggsave(filename = "E:/FLISOL2019/graficoXgenero.png", width = 16, height = 9)        
# ---------------------------------------------------------------------------------------------------------------- 
# 3   - grafico utilizando elemento estético por color y geom__point con color geom_point(colour="blue")
# ---------------------------------------------------------------------------------------------------------------- 
ggplot(data = propina, aes(x= total, y= propina, colour= sexo )) + geom_point(colour="blue") + theme(aspect.ratio=1) 
ggsave(filename = "E:/FLISOL2019/graficoPunoAzul.png", width = 16, height = 9)        
# ---------------------------------------------------------------------------------------------------------------- 
#   4-  grafico utilizando como elemento estético  shape (shape for sexo:femenino/masculino)
# ---------------------------------------------------------------------------------------------------------------- 
ggplot(data = propina, aes(x= total, y= propina, shape= sexo )) + geom_point() + theme(aspect.ratio=1)

ggsave(filename = "E:/FLISOL2019/dografico.png", width = 16, height = 9)      
# ---------------------------------------------------------------------------------------------------------------- 
#    5 - grafico con atributos de geom_point(size=5, alpha=1/3)
# ---------------------------------------------------------------------------------------------------------------- 
ggplot(data = propina, aes(x= total, y= propina)) + geom_point(size=5, alpha=1/3) + theme(aspect.ratio=1)

ggsave(filename = "E:/FLISOL2019/grafico.png", width = 16, height = 9)   
# ---------------------------------------------------------------------------------------------------------------- 
#    6- grafico con  elemento estético por color (color =fuma: si/no)
ggplot(data = propina, aes(x= total, y= propina, colour= fuma )) + geom_point() + theme(aspect.ratio=1) 
# ---------------------------------------------------------------------------------------------------------------- 
#    7-  grafico con capas layer
# ---------------------------------------------------------------------------------------------------------------- 
ggplot() + layer(data = propina, mapping =aes(x= total, y= propina), geom = "point", stat="identity", position= "identity")
# ---------------------------------------------------------------------------------------------------------------- 
   # 8- Agrego etiquetas al eje 'x' e 'y' y al la leyenda)
# ---------------------------------------------------------------------------------------------------------------- 
ggplot(data = propina, aes(x = total, y = propina, color = sexo)) +
  geom_point() +  theme(aspect.ratio = 1) +
  labs(x = "Total de la cuenta", y = "Propina", color = "Sexo")
# ---------------------------------------------------------------------------------------------------------------- 
#  9- otra manera de utilizar ggplot
# ---------------------------------------------------------------------------------------------------------------- 
pl <- ggplot(propina, aes(total, propina, colour = sexo))+
  geom_point() 
pl + labs(x = "Total de la cuenta", y = "Propina", color = "Sexo", title= "Relación entre la variable propina y total")
pl
ggpplot3(pl)
# ---------------------------------------------------------------------------------------------------------------- 
#  10- gr?fico interactivo con PLOTLY  
# ---------------------------------------------------------------------------------------------------------------- 


p<- plot_ly (x = propina$propina, y = propina$total, color = propina$sexo, text = paste('Sexo','',propina$sexo), 
             hoverinfo = "text", type = "scatter") %>% layout(title= 'Relacion entre el valor de propina y el total', legend= 'Sexo',
                                                          xaxis = list(showline = F, 
                                                                       showticklabels = T, 
                                                                       fixedrange = T,
                                                                       showlegend =TRUE,
                                                                       title = "Propina (dol?re)s"),
                                                          yaxis = list(fixedrange = T, 
                                                                       title = "Total"))
p




# ---------------------------------------------------------------------------------------------------------------- 
#  11- gr?fico interactivo con PLOTLY  
# ---------------------------------------------------------------------------------------------------------------- 

pl <- ggplot(propina, aes(total, propina, colour = sexo,text = paste('Sexo:', sexo))) +
                           geom_point() +
  labs (title= "Relacion entre el valor de propina y el total", x = "Propina (dol?res)", y = "Total propina", color="")+
  theme(axis.text.x = element_text(angle = 50, vjust = 1.5, hjust=0.5)) +  
  theme(plot.title = element_text(family="Courier",
                                  size=rel(1),        
                                  vjust=2,            #Justificacion vertical, para separarlo del gr?fico
                                  position_identity(center),   
                                  face="bold",       
                                  color="black",     #Color del t?tulo: maroon, lightblue, lightblue,darkblue, darkorange, black.
                                  lineheight=1.2), legend.position= "top", legend.justification = "center")
ggplotly(pl, tooltip = "text")
