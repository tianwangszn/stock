% detail = selfCreateData('603555','20150301','20150601');
% detail(:,1) = datenum(int2str(int64(detail(:,1)*100)),'yyyymmddHHMMSS');
% plot(detail(:,2))
% plot(detail(:,1),detail(:,2))
% detail(:,1) = floor(detail(:,1));
y=zeros(size(detail,1),1);
valuemin=[];
valuemax=[];
a=0;
t=1;
for i = detail(1,1):detail(end,1)
    daydetail=detail(detail(:,1)==i,:);
    if isempty(daydetail)
        continue
    end
    [valuemax(t),indexmax] = max(daydetail(:,2));
    [valuemin(t),indexmin] = min(daydetail(:,2));
    y(a+indexmax-1:a+indexmax+1)=2;
    y(a+indexmin:a+indexmin+2)=1;
    a=size(daydetail,1)+a;
    t=t+1;
end
% plot(y)