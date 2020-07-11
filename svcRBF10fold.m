X = load("predx_for_classification.csv");
Y = load("label.csv");

x=X(1:2000,1:2);
y=Y(1:2000,1);




%Mdl = fitcsvm(x,y,'KernelFunction','linear', 'BoxConstraint',1);

accuracies = [];

for i = 0:9
    XTest=x(1+i*200:(i+1)*200,1:2);
    YTest=y(1+i*200:(i+1)*200,1);
    XTrain=x;
    XTrain(1+i*200:(i+1)*200,1:2) = NaN;
    YTrain=y;
    YTrain(1+i*200:(i+1)*200,1) = NaN;
    Mdl = fitcsvm(x,y,'KernelFunction','mysigmoid','Standardize',true);
    accuracy=loss(Mdl,XTest,YTest)
    accuracies = [accuracies,accuracy];
end

finalAccuracy=mean(accuracies)


%Mdl = fitcsvm(x,y,'KernelFunction','mysigmoid','Standardize',true);




%Mdl = fitcsvm(x,y,'KernelFunction','polynomial','Standardize',true,'PolynomialOrder',3);




%,'KernelFunction','linear', 'BoxConstraint',1

sv = Mdl.SupportVectors;


%figure
%gscatter(x(:,1),x(:,2),y)
%hold on
%svp = plot(sv(:,1),sv(:,2),'ko','MarkerSize',10);
%lsline
%set(svp,'visible','off')
%legend('0','1')
%hold off


d = 0.5; % Step size of the grid
[x1Grid,x2Grid] = meshgrid(min(x(:,1)):d:max(x(:,1)),...
    min(x(:,2)):d:max(x(:,2)));
xGrid = [x1Grid(:),x2Grid(:)];        % The grid
[~,scores1] = predict(Mdl,xGrid); % The scores

figure;
h(1:2) = gscatter(x(:,1),x(:,2),y);
hold on
contour(x1Grid,x2Grid,reshape(scores1(:,2),size(x1Grid)),[0 0],'k');
    % Decision boundary
title('Scatter Diagram with the Decision Boundary')
legend({'0','1','Support Vectors'},'Location','Best');
%accuracy=loss(Mdl,x,y)
hold off