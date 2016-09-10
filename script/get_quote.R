options(digits=2)
library(WindR)
w.start()

# set all security codes
codes <- c("000001.SH","399001.SZ","399006.SZ","000016.SH","000300.SH")
# retrieve data from wind
w_wsd_data<-w.wsd(codes,"close","2015-12-31","2016-01-30","Fill=Previous")
quotes <- w_wsd_data$Data

# remove unused columns
quotes <- quotes[codes]

# calcuate changes between
b <- quotes[1,]
e <- quotes[nrow(quotes),]
percs <- (e - b) * 100 / b

w_wsd_data<-w.wsd(codes,"pct_chg","1998-01-01","2016-01-30","Period=M;Fill=Previous")
d <- w_wsd_data$Data

chg  <- d[months(d$DATETIME) == '二月',]
chg
#       DATETIME 000001.SH 399001.SZ 399006.SZ 000016.SH 000300.SH
# 2   1998-02-27     -1.34     -2.01       NaN       NaN       NaN
# 14  1999-02-09     -3.93     -5.65       NaN       NaN       NaN
# 26  2000-02-29     11.70     13.45       NaN       NaN       NaN
# 38  2001-02-28     -5.15     -6.12       NaN       NaN       NaN
# 50  2002-02-28      2.21      1.57       NaN       NaN      1.87
# 62  2003-02-28      0.81      0.20       NaN       NaN      0.52
# 74  2004-02-27      5.30      5.46       NaN      1.98      5.48
# 86  2005-02-28      9.58     10.86       NaN      6.78      8.91
# 98  2006-02-28      3.26      3.37       NaN      5.42      4.30
# 110 2007-02-28      3.40      5.33       NaN      2.11      6.68
# 122 2008-02-29     -0.80     -0.21       NaN     -0.78      1.17
# 134 2009-02-27      4.63      8.45       NaN      3.49      5.30
# 146 2010-02-26      2.10      2.47       NaN      1.35      2.42
# 158 2011-02-28      4.10      7.57       6.9      2.94      5.30
# 170 2012-02-29      5.93      8.07      13.4      4.47      6.89
# 182 2013-02-28     -0.83     -0.27      11.0     -1.84     -0.50
# 194 2014-02-28      1.14     -2.73      -4.1     -0.88     -1.07
# 206 2015-02-27      3.11      5.44      14.7      2.88      4.03
