# LEITURA DOS DADOS - TEMPERATURA E CO2 GLOBAIS POR ANO
library(ggplot2)
dados <- read.csv("C:\\Users\\julia\\Downloads\\src\\analysis\\data_reg")
ggplot(dados, aes(x=co2, y=tpr)) + geom_point() + xlab("Dióxido de Carbono (ppm)") + ylab("Temperatura (ºC)")

dados1 <- dados[51:164,] # Pegando a partir de 1900
ggplot(dados1, aes(x=co2, y=tpr)) + geom_point() + xlab("Dióxido de Carbono (ppm)") + ylab("Temperatura (ºC)")

# AJUSTE DE REGRESSÃO
reg <- lm(data=dados1, tpr~co2)
reg$coefficients

ggplot(dados1, aes(x=co2, y=tpr)) + geom_point() + geom_smooth(method=lm) + xlab("Dióxido de Carbono (ppm)") + ylab("Temperatura (ºC)")

# TESTES DE GRANGER
library(lmtest)
grangertest(tpr~co2, data=dados1)
grangertest(co2~tpr, data=dados1)

# LEITURA DOS DADOS - TEMPERATURA E CO2 GLOBAIS POR MÊS (não é garantido ter todos os dias!)
library(forecast)
dados2 <- read.csv("C:\\Users\\julia\\Downloads\\src\\analysis\\tpr_co2_world_month")
dados3 <- dados2[601:1965,] # Pegando a partir de 1900
tpr.ts <- ts(dados1$tpr, frequency = 1, start = c(1900))
co2.ts <- ts(dados3$co2, frequency = 12, start = c(1900, 1))
model_tpr_ts <- auto.arima(tpr.ts) # A função auto.arima ajusta a melhor série temporal que o algoritmo encontrar
model_co2_ts <- auto.arima(co2.ts)

forec = forecast(model_co2_ts, level = c(65,80), h=17*12+3)
plot(forec, main="Dióxido de Carbono: ARIMA(0,0,0)(1,1,1)[12] with drift")
#lines(fitted(model_co2_ts),col="blue") # plota os dados previstos em azul

dt <-data.frame(forec)
mean(dt$Point.Forecast[196:207])

forec1 = forecast(model_tpr_ts, level = c(65,80), h=17)
plot(forec1, main="Temperatura: ARIMA(0,1,1) with drift")
#lines(fitted(model_tpr_ts),col="blue") # plota os dados previstos em azul

dt1 <-data.frame(forec1)
mean(dt1$Point.Forecast[196:207])
