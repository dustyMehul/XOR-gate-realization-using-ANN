function Ts = TrainingSetGeneration()

close all;
Ts = zeros(1000,3);

for i=1:1000
    Ts(i,1) = rand;
    Ts(i,2) = rand;
end

for i=1:1000
   if(Ts(i,1)<=0.25)
       if(Ts(i,2)<=0.25)
           Ts(i,3) = 0.15;
       else
           Ts(i,3)=0.85;
       end
   else
       if(Ts(i,2)<=0.25)
           Ts(i,3) = 0.85;
       else
           Ts(i,3)=0.15;clc
       end
   end
end

plot(0,0)
hold
for i=1:1000
    if(Ts(i,3)>0.5)
        plot(Ts(i,1), Ts(i,2), 'r*');
    else
        plot(Ts(i,1), Ts(i,2), 'bo');
    end
end

%lgd = legend('LOW', 'HIGH');

end