library(rgdal)         # for readOGR(...)
library(ggplot2)
library(RColorBrewer)  # for brewer.pal(...)
library(raster)
library(hexbin)

UKmap  <- readOGR(dsn=path.expand("~/Desktop/Temp/My_R_Projects/MP_distrubution/GBR_adm_shp"),layer="GBR_adm2")
#UKmap <- shapefile("~/Desktop/Temp/My_R_Projects/MP_distrubution/GBR_adm2")

map.df <- fortify(UKmap)

p <- ggplot(subset(MP_data_extended, Party == "Labour"), aes(x=as.numeric(born_location_lon), y=as.numeric(born_location_lat))) + 
  #stat_density2d(aes(fill = ..density..), alpha=1, geom="tile",n =40, contour = FALSE)+
  #stat_bin2d(binwidth = c(0.4, 0.4), aes(fill = ..density..), drop = FALSE)+
  #geom_point(colour="red", alpha = 1)+
  geom_hex(binwidth = c(0.4,0.4))+
  geom_path(data=map.df,aes(x=long, y=lat,group=group), colour="gray50", alpha=0.5)+
  scale_fill_gradientn(colours=rev(brewer.pal(7,"Spectral")))+
  #scale_fill_gradientn(colours= brewer.pal(3,"Blues"))+
  #scale_fill_gradient2(low = "red", high = "black", space = "lab")+
  xlim(-10,+2.5) +
  ylim(+49, +62) +
  theme(panel.background = element_rect(fill = 'gray', colour = 'gray'),panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  coord_fixed()
  
par(bg = 'gray50')
print(p)
