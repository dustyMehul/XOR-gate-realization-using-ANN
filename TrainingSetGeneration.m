function Ts = TrainingSetGeneration()

Ts = zeros(10000,3);

for i=1:1000
    Ts(i,1) = rand;
    Ts(i,2) = rand;
end

for i=1:10000
   if(Ts(i,1)<=0.25)
       if(Ts(i,2)<=0.25)
           Ts(i,3) = 0.05;
       else
           Ts(i,3)=0.95;
       end
   else
       if(Ts(i,2)<=0.25)
           Ts(i,3) = 0.95;
       else
           Ts(i,3)=0.05;
       end
   end
end

% plot(0,0)
% hold
% for i=1:10000
%     if(Ts(i,3)>0.5)
%         plot(Ts(i,1), Ts(i,2), 'r*');
%     else
%         plot(Ts(i,1), Ts(i,2), 'bo');
%     end
% end

%lgd = legend('LOW', 'HIGH');
%hold off;
end