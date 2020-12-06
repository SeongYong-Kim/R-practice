#1
x <- c(1, 2, 3, 3, 4, 5, 5)
y <- c(3, 7, 5, 8, 11, 14, 12)
#(a)
model.x.y <- lm(y~x)
model.x.y$coef
#Answer : y(hat) = 0.5319 + 2.4468x

#(b)
sigma_square <- sum(model.x.y$re^2) / (length(x) - 2)
sigma <- sqrt(sigma_square)
s.eBeta1 <- sigma * (1 / sqrt(sum((x-mean(x))^2)))
t1 <- (model.x.y$coef[[2]] - 2) / s.eBeta1
p_value <- pt(t1, length(x) - 2)
p_value
#Answer : p-value = 0.8190909

#(c)
s.eBeta0 <- sqrt(sigma_square * (1/length(x) + (mean(x)^2)/sum((x-mean(x))^2)))
U <- model.x.y$coef[[1]] + qt(0.975, length(x)-2)*s.eBeta0
L <- model.x.y$coef[[1]] - qt(0.975, length(x)-2)*s.eBeta0
c(L,U)
#Answer : C.I = (-3.550487  4.614317), confidence interval�� 1�� �����ϹǷ� do not reject H0.

#(d)
summary(model.x.y)
model.reduced <- lm(y~1)
SSE.RM <- sum(model.reduced$residuals^2)
SSE.FM <- sum(model.x.y$residuals^2)
F = ((SSE.RM - SSE.FM)/(1+1-1))/(SSE.FM/(length(x)-1-1))
p_value_f <- 1 - pf(F, 1, length(x)-2)
p_value_f
#Answer : p-value = 0.002729

#(e)
#x�� 4�϶� y�� confidence interval�� ���ؾ��Ѵ�.
predict(model.x.y,interval="confidence",newdata=data.frame(x=c(4)), level=0.9)
#Answer :        fit      lwr      upr
#           10.31915 8.920531 11.71777

#2
load(file="C:/Users/pc/Desktop/HW2(data).RData")
#(a)
model.gas <- lm(mpg~engine+hp+weight, data.HW2)
model.gas$coef
#Answer : mpg(hat) = 35.1805 - 0.002568engine + 0.0154hp - 0.0018weight

#(b)
#Answer : engine, hp�� fixed �Ǿ������� weight�� �Ѵ��� �ö󰡸� mpg�� ��������� 0.0018�����Ѵ�.

#(c)
anova(model.gas)$F
#F statistics : (engine, hp, weight) = (33.0076, 0.0592, 9.9575)
anova(model.gas)$Pr
#p-value of each variable : (engine, hp, weight) = (0.0007018494, 0.8147244889, 0.0160272985)
#��� ������ fitted�� regression model���� ������ �������� ������ p-value�� ���� ����.
#�� p-value�� ������ ������ regression model�� �󸶳� �� �����ϴ��ĸ� ��Ÿ���� ô���� �� �� �ִ�.
#�̴� �� ������ ����� 0�� �� Ȯ���̶���� �ؼ��� �� ������ ���� engine�� weight�� model�� �� ��Ÿ���� ����� 0�� Ȯ���� ������
#hp�� model�� �� �������� ���ϰ� ������ ����� 0�� Ȯ���� ������ �� �� �ִ�.

#(d)
model.engine <- lm(mpg~engine, data.HW2)
anova(model.engine)$Pr
summary(model.engine)
#p-value : 0.002382
#R-squared : 0.6598

model.hp <- lm(mpg~hp, data.HW2)
anova(model.hp)$Pr
summary(model.hp)
#p-value : 0.4969
#R-squared : 0.05274

model.weight <- lm(mpg~weight, data.HW2)
anova(model.weight)$Pr
summary(model.weight)
#p-value : 0.1381
#R-squared : 0.2273

#Answer : 3�� ���� p-value�� R-squared�� ���� ����� ���� ����. p-value�� R-squared�� ����
#         hp, weight�� ���� �𵨵��� ��� regression model�� �� �����ϰ� ���� ���� ���� �ľ��� �� �ִ�.
#         hp, weight variable�� �����ϴ� ���� ���ڴ�.

#(e)
model.engine$coef
#Answer : mpg(hat) = 30.5736 - 0.0025engine

#(f)
anova(model.engine, model.gas)$Pr
#Answer : F-test ��� p-value���� 0.0446���� �� �� �ִ�. �̴� �ϳ� ���� ���ڷ�,
#         reduced model�� full model�� ũ�� �������̰� ���ٰ� ���� �� �ִ�.

#3
#(a)
#regression�� �������� ������ ������ ��Ÿ����. ���� ������ X1 �Ѱ��̹Ƿ� df = 1�̴�.
#Answer : 1

#(b)
SSR <- 1848.76
MSR <- SSR / 1 #MSR�� SSR�� ��հ����� SSR���� df�� ������.
MSR
#Answer : MSR = 1848.76

#(c)
#������ 1���� regression model������ beta1�� ���� t�� �������� F-statistic�� ���� �����ϴ�.
t1 <- 8.32
F_statistic <- t1^2
F_statistic
#Answer : 69.2224

#(d)
#F_statistic = MSR / MSE�� ǥ���ȴ�.
MSE <- MSR / F_statistic
#MSE = SSE / df ���� residual�� df�� n-p-1�� ǥ�õǰ� �̴� 18�̴�.
SSE <- MSE * 18
SSE
#Answer : 480.7357

#(e)
#redisual�� df�� n-p-1�� ǥ�õǰ�, p=1���� df =18�� �ȴ�.
#Answer : 18

#(f)
#(d)������ MSE�� ����ߴ�.
MSE
#Answer : 26.70754

#(g)
#beta0�� ���� p-value�� 0.084�̰� �̿����� �������� p ��, 1�̴�.
t0 <- -qt(0.0824/2, 1)
t0
#Answer : 7.682775

#(h)
#t1 = Beta1/s.eBeta1 ���� Beta1 = t1 * s.eBeta1�̴�.
s.eBeta1 <- 0.1528
t1 <- 8.32
Beta1 = t1 * s.eBeta1
Beta1
#Answer : 1.271296

#(i)
#n�� sample�� �����̹Ƿ� 20�̴�.
#Answer : 20

#(j)
R2 <- 1 - SSE/(SSE + SSR)
R2
#Answer : 0.793631

#(k)
SST <- SSE + SSR
Ra2 <- 1 -(SSE/(20-1-1))/(SST/(20-1))
Ra2
#Answer : 0.782166

#(l)
sigma_square <- SSE / (20 - 2)
sigma <- sqrt(sigma_square)
sigma
#Answer : 5.167934

#(m)
#residual�� �������� ǥ��ȴ�. �̴� n-p-1�̴�.
df <- 20-1-1
df
#Answer : 18
