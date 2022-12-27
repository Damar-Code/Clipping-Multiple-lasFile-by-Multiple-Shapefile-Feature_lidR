lapply(c("lidR","sf","future"), 
       require, character.only = TRUE)

# Read File
las_list <- list.files("E:/APRIL/Data Sample/Netherlands/LAS/Ground/", pattern = "^1_ground*//.las|^2_ground*//.las|^3_ground.*//.las", full.names = TRUE)
las_list

inv_plot <- st_read("E:/APRIL/Data Sample/Netherlands/shp/Plot_Inv.shp")

# Looping
for(i in las_list){
  #i <- las_list[1]
  ctg <- readLAScatalog(i)
  crs(ctg) <- "EPSG:28992"
  opt_output_files(ctg) <- paste0(OutputPath, "/Plot_{id}")
  plots <- clip_roi(ctg, inv_plot)
}



