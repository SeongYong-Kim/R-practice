library(qcc)

#7.4
Number <- c(0,3,4,6,5,2,8,9,4,2,6,4,8,0,7,20,6,1,5,7)
Data_7.4 <- data.frame(Number)

qcc(data = Data_7.4[1],
    type = "p",
    sizes = 50,
    title = "p chart",
    digits = 5,
    plot = TRUE)

Data_7.4 <- Data_7.4[-16,]

qcc(data = Data_7.4,
    type = "p",
    sizes = 50,
    title = "p chart",
    digits = 5,
    plot = TRUE)

#7.9
Number <- c(7,4,1,3,6,8,10,5,2,7,6,15,0,9,5,1,4,5,7,12)
Data_7.9 <- data.frame(Number)

qcc(data = Data_7.9[1],
    type = "p",
    sizes = 100,
    title = "p chart",
    digits = 5,
    plot = TRUE)

Data_7.9 <- Data_7.9[-12,]

qcc(data = Data_7.9,
    type = "p",
    sizes = 100,
    title = "p chart",
    digits = 5,
    plot = TRUE)
