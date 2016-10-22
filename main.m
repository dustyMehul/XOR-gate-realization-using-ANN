clear all;
close all;
clc;


%%Training Set
Ts = TrainingSetGeneration();

%% Initialization Variables
W = ones(6,1);
for i=1:6
   W(i) = rand;
end


n=0.5;
a=1;


%% learing Process
N=1000;  %for 10 times training the network
for j=1:N
    fprintf('-----------------------\n')
    fprintf('Training iteration %d of %d begins...\n\n',j,N);
    for i=1:4
        V2 = W(1)*A(i) + W(4)*B(i);
        V3 = W(2)*A(i) + W(3)*B(i);
   
        Y2 = sgmd(1,V2);
        Y3 = sgmd(1,V3);
   
        V4 = W(5)*Y2 + W(6)*Y3;
   
        Y4 = sgmd(1,V4);
    
        E4 = D(i) - Y4;
        %updating weights code here
        
        W(1) = W(1) + n*W(1)*A(i)*sgmdDash(a,V2)*W(5)*E4*sgmdDash(a,V4);
        W(2) = W(2) + n*W(2)*B(i)*sgmdDash(a,V3)*W(6)*E4*sgmdDash(a,V4);
        W(3) = W(3) + n*W(3)*A(i)*sgmdDash(a,V3)*W(6)*E4*sgmdDash(a,V4);
        W(4) = W(4) + n*W(4)*B(i)*sgmdDash(a,V2)*W(5)*E4*sgmdDash(a,V4);
        
        W(5) = W(5) + n*Y2*E4*sgmdDash(a,V4);
        W(6) = W(6) + n*Y3*E4*sgmdDash(a,V4);
        
        
    end


    fprintf('Training iteration %d of %d compleated!!!\n\n',j,N);
    Y = zeros(4,1);
    for i=1:4
        V2 = 1+W(1)*A(i) + W(4)*B(i);
        V3 = 1+W(2)*A(i) + W(3)*B(i);
   
        Y2 = sgmd(1,V2);
        Y3 = sgmd(1,V3);
   
        V4 = W(5)*Y2 + W(6)*Y3;
   
        Y(i) = sgmd(1,V4);
    
        E4 = D(i) - Y4;
    end
    fprintf('%f\n%f\n%f\n%f\n%f\n%f\n',W(1),W(2),W(3),W(4),W(5),W(6));
    fprintf('A = %f\t%f\t%f\t%f\n',A(1),A(2),A(3),A(4));
    fprintf('B = %f\t%f\t%f\t%f\n',B(1),B(2),B(3),B(4));
    fprintf('D = %f\t%f\t%f\t%f\n',D(1),D(2),D(3),D(4));
    
    
    fprintf('\nO = %f\t%f\t%f\t%f\n\n\n',Y(1),Y(2),Y(3),Y(4));
    
    

end