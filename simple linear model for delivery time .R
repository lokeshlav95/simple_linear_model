delivery_time=read.csv("delivery_time")
View(delivery_time)
head(delivery_time)
tail(delivery_time)
attach(delivery_time)

# Normality test whether data is normally distributed or not ( qq Test)
qqnorm(Delivery.Time)
qqline(Delivery.Time) #  Data  Normally distributed

qqnorm(Sorting.Time)
qqline(Sorting.Time)# Data normally distributed
# Scatter Plot 
plot(Sorting.Time,Delivery.Time) #From scatter plot we observed that  strength is moderate, direction is  positive 
cor(Sorting.Time,Delivery.Time) # r Value is 0.82599 , Model is strong



# simple Linear Regression Model
model=lm(Sorting.Time~Delivery.Time,data=delivery_time)
summary(model)# Hence R^2 value is 0.6823 week model

confint(model,level=0.95)
predict(model,interval = "predict")

# Transform the data using Log function both dependent and independent variable
model=lm(log(Sorting.Time~log(Delivery.Time),data = delivery_time)
summary(model1) # R^2 Value improved 0.6823 to  0.772 hence,model is moderately good
