emp_data=read.csv("emp_data") #imported data
View(emp_data)
head(emp_data)
attach(emp_data)
colnames(emp_data)=c("salary","churnoutrate")
View(emp_data)

# Normality test to check Whether data is normally distributed or not (qq test)#
qqnorm(salary)
qqline(salary)

qqnorm(churnoutrate)
qqline(churnoutrate) #we observe that from qq plot both the data is Normally Distributed 

# Scatter Plot 
plot(salary,churnoutrate)# From Scatter Plot we observed that direction is negative,Strength is strong
cor(salary,churnoutrate) # r Value is -0.911 so Negative correaltion between salary and churnoutrate

# simple Linear Model 
model=lm(salary~churnoutrate,data=emp_data)
summary(model)#  R^2 Value is 0.821 hence is moderate so improve R^2 Value using Transform Function
confint(model,level = 0.95)
predict(model,interval = "predict")


# Transform The data using Log Function #
model=lm(log(salary)~log(churnoutrate),data=emp_data)
summary(model) 

# R^2 Value Improved From 0.821 to 0.889 by using Log Transform 
# P value is 4,33*10^-5, which is < 0.05
# Conclusion: Salary Hike Increases ,Decrease The Chur out rate
