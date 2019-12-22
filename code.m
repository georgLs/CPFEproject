data = 'SSE 50 earnings ready.xlsx';
Companies = xlsread(data, 'E1:AV1');
Earnings  = xlsread(data, 'E5:AV46');
Actuals = xlsread(data, 'E5:AV5'); %actual earnings for Q32019
[n,m] = size(Earnings);
Forecasts = zeros(1, m); %earnigns forecast for Q32019
const = ones(37, 1);
b = zeros(3,m);
k = zeros(1,m);
for i=1:m
    for j=1:n
        if Earnings(j,i) ~=-99
            k(i)=j;
        end
    k(i);
    end    
    Elag = Earnings(4:k-1,i);
    Elagdif = Earnings(2:k-4,i)-Earnings(6:k,i);
    b(:,i)=regress(Earnings(1:k-5,i), [const, Elag(1:k-5), Elagdif(1:k-5)]);
    Forecasts(i) = Earnings(1,i)*b(1, i)+Elag(1)*b(2,i)+Elagdif(1)*b(3,i);
end

FE = zeros(37, 1);
FE = (Actuals-Forecasts)./abs(Forecasts);
[FE_sort, order] = sort(FE, 'descend');
Companies_sort = Companies(order);
Companies_sort(1:5)
Companies_sort(40:44)

data1 = 'prices.xlsx';

k = find(companies_sort(1:5), Companies);
