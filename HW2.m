Question2 = "\n Declare x-Value:::";
xval = input(Question2);
display(xval);
Question = "Declare alpha value::: \n";
alpha = input(Question);
display(alpha);
%%%Take in a user input for xval and alpha paramaters...
z = [xval ; alpha];

display(z);


%%%Display for conformation....

%DeclareLen = "Declare how many iterations you would like for Newton's Method::: \n"

f = [alpha*cosh(xval/4) - xval; (alpha*sinh(xval/4)/4)-1];
%% Create main function
NewJaco = [cosh(xval/4) , (alpha*sinh(xval/4)/4) - 1; sinh(xval/4)/4, -alpha*cosh(xval/4)/16];
%% Hard coded Jacobian calculation because values were not being passed based on octave packages downloaded...
display(NewJaco);

[L,U, p] = lu(NewJaco);
%% Find L and U, p not necessary but nice to have
display(L);
display(U);

%% What I did here was simply alter the variables so that I could complete math
%% Operations that were necessary to find the conditional estimate
yi = U;
y = (inverse(yi));
y = y\-f;
y = L*y;
h = U\y;


%% h is added to create new z, the new z may be used for another iteration 
%% in order to find the values
z = z+h;

display(y);
display(h);
display(z);
%% Display all outputs so that user is able to follow along with results.
