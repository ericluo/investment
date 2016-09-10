library(readxl)

ctypes <- c("date", "numeric", "numeric", "numeric", "numeric", "numeric")
mmo = read_excel("~/../OneDrive/data/mmo.xlsx", col_names = F, col_types = ctypes, skip=2)
# 过滤掉NA数据
mmo <- na.omit(mmo[,1:3])

# TODO 整合沪深300指数


library(ggplot2)

d1 <- data.frame(x=mmo[,1], y=mmo[,2])
d1$panel <- "融资融券余额"

d2 <- data.frame(x=mmo[,1], y=mmo[,3])
d2$panel <- "融资余额占流通市值比例"

d <- rbind(d1, d2)

p <- ggplot(d, aes(x,y)) + geom_path()
p <- p + facet_grid(panel ~ ., scales = "free")
p
