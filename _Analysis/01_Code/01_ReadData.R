if(file.exists("_Analysis/02_Data/01_RawData/FullDataSet.csv")){
        data <- read.csv2("_Analysis/02_Data/01_RawData/FullDataSet.csv")
}else if(file.exists("_Analysis/02_Data/02_TidyData/FakedDataSet.csv")){
        data <- read.csv2("_Analysis/02_Data/02_TidyData/FakedDataSet.csv")
}