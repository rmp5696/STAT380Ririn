#Model Fitting
log_data <- train.clean
log_data$LogLotArea <- log(log_data$LotArea)

logmodel <- lm(SalePrice ~ LogLotArea +
                 FullBath + YearBuilt + TotalBsmtSF + BedroomAbvGr + 
                 GrLivArea + YrSold, data = log_data)

logmodel <- lm(SalePrice ~ LogLotArea +
                 FullBath + YearBuilt + TotalBsmtSF + BedroomAbvGr + 
                 GrLivArea + YrSold, data = log_data)
summary(logmodel)

actual_values <- log_data$SalePrice
log_pred <- predict(logmodel, newdata = log_data)
log_mse <- mean((log_pred - actual_values)^2)
log_rmse <- sqrt(log_mse)

# fmod_quant <- lm(SalePrice~BedroomAbvGr+GrLivArea+TotalBsmtSF+LotArea,train.clean)
# 
# summary(fmod_quant)
test.clean$LogLotArea <- log(test.clean$LotArea)

submission$SalePrice <- predict(logmodel, newdata = test.clean)
write.csv(x = submission,file = "/Users/danielpark/Documents/STAT380Ririn/House Price 1/project/volume/models/result_submission.csv",row.names = F)