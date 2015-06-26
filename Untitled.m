clc;close all;clear

detail = selfCreateData('600022','20150301','20150626');
detail(:,1) = datenum(int2str(int64(detail(:,1)*100)),'yyyymmddHHMMSS');%按时间顺序排序
figure(1)
plot(detail(:,2))%绘制股价连续变化
%plot(detail(:,1),detail(:,2))%绘制股价随时间变化
detail(:,1) = floor(detail(:,1));
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
figure(2)
plot(valuemax);
hold on
plot(valuemin);