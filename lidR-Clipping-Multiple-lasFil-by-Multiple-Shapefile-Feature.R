lapply(c("lidR","sf","future"), 
       require, character.only = TRUE)

# Read File
las_list <- list.files("path/to/las/", pattern = ".las", full.names = TRUE)
las_list

shp <- st_read("path/to/shp/")

# Looping
for(i in las_list){
  #i <- las_list[1]
  ctg <- readLAScatalog(i)
  opt_output_files(ctg) <- paste0(OutputPath, "/Plot_{id}")
  plots <- clip_roi(ctg, shp)
}



