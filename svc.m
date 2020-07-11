X = load("predx_for_classification.csv");
Y = load("label.csv");

x=X(1:1000,1:2);
y=Y(1:1000,1);


Mdl = fitcsvm(x,y,'KernelFunction','linear', 'BoxConstraint',1)

%,'KernelFunction','linear', 'BoxConstraint',1

sv = Mdl.SupportVectors;
figure
gscatter(x(:,1),x(:,2),y)
hold on
svp = plot(sv(:,1),sv(:,2),'ko','MarkerSize',10);
lsline
set(svp,'visible','off')
legend('0','1')
hold off