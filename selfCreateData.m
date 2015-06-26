function detail = selfCreateData(StockCode,BeginDate,EndDate)
s=datenum(BeginDate,'yyyymmdd');
e=datenum(EndDate,'yyyymmdd');
T=datestr((s:1:e)','yyyymmdd');

detail=[];
for i =1:size(T,1)
    detail = [detail ;GetStockTick_Web(StockCode,T(i,:))];
end
