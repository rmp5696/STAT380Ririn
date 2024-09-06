#Data Wrangling

#Reading csv files.
#REMEMBER TO USE gsub FUNCTION

raw_house <- read.csv("./project/volume/data/raw/Stat_380_housedata.csv")
submission <- read.csv("./project/volume/models/example_sub.csv")



# index <- sample(1:nrow(raw_house), size = 0.8 * nrow(raw_house))
# 
# train_index <- 1:nrow(raw_house) %in% index

# train_index <- sample(1:nrow(raw_house), size = 10000)
# test_index <- setdiff(1:nrow(raw_house), train_index)
# 
# train <- raw_house[train_index, ]
# test  <- raw_house[test_index, ]

train.clean <- raw_house[!is.na(raw_house$SalePrice), ]

test.clean <- raw_house[is.na(raw_house$SalePrice), ]

# train.clean <- na.omit(train)
# test.clean <- test[, -c(17)]


