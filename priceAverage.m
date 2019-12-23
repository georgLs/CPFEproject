function priceAverage = priceAverage(prices,compNum)
Prices = prices;

index = find(Prices==compNum);
companyPrices = Prices(index+1:index+35);

priceSum = sum(companyPrices);
priceAverage = priceSum/length(companyPrices);

end