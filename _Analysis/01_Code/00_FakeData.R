# set.seed(xyz)
data <- read.csv2("_Analysis/02_Data/01_RawData/FullDataSet.csv")
data$productivity  <- data$productivity + rnorm(n =NROW(data), mean =0, sd = 5)
data$principalProd <- data$principalProd + rnorm(n =NROW(data), mean =1, sd = 7)
data$productive <- ifelse(test = data$productivity >= 50,
                          yes  = 1,
                          no   = 0)
data$performance <- data$performance + rnorm(n =NROW(data), mean =0, sd = 4)
data$performance[data$performance < 0] <- 0
data$performance[data$performance > 100] <- 100
data$principalPay2 <- round(340 - data$agentPay2 + data$performance, 
                            digits = 0)
data$principalPay2 <- ifelse(test = data$mechanism == "random",
                             yes  = data$principalPay2 - 20,
                             no   = data$principalPay2 - 25)
data$ratio <- data$performance / data$productivity
data$percKindness <- ifelse(data$mechanism == "random" &
                                    data$productivity < 50,
                            yes = 1,
                            no = ifelse(data$mechanism == "performanceBased" &
                                                data$productivity >= 50,
                                        yes = 1,
                                        no = 0))

write.csv2(data, 
           file = "_Analysis/02_Data/02_TidyData/FakedDataSet.csv",
           row.names = FALSE)