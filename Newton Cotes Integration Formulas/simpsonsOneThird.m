clearvars;
clc;
disp("Simpson's 1/3rd Rule");

%Enter basic info here. To define the function to be integrated check the
%end of the code
a=0;
b=0.8;
n=4;
h = (b-a)/n;
x = zeros(1,n-1);

%Enter true value if mentioned else put 'trueValue = integral(@f,a,b);'
true_value = integral(@f,a,b);

for i = 1:1:n+1
    x(i)=a+(i-1).*h;
end

I = (h./3).*(f(x(1)) + f(x(n+1)));

for i = 2:1:n
    if rem((i-1),2)==0
        I = I + (2*h/3)*f(x(i));
    else 
        I = I + (4*h/3)*f(x(i));
    end
end

Et = true_value-I;
perEt = 100*abs(Et/true_value);

%displaying results
disp("h = " + h)
disp("x = ");
disp(x);
disp("f(xi)=");
disp(f(x));
disp("True value = " + true_value);
disp("I = " + I);
disp("Et = " + Et);
disp("%Et = " + perEt);

function fx = f(x)
    %define your function here
    fx = (0.2 + 25*x - 200*x.^2 + 675*x.^3 - 900*x.^4 + 400*x.^5);
end



