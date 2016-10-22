function plotTs(Ts);
    close all;
    N = length(Ts);
    
    plot(0,0)
    hold
    for i=1:N
        if(Ts(i,3)>0.5)
            plot(Ts(i,1), Ts(i,2), 'r*');
        else
            plot(Ts(i,1), Ts(i,2), 'bo');
        end
    end
    hold off;
end
