o = load("label.csv");
n = load("predx_for_classification.csv");
m = load("predy_for_classification.csv");

%o(1,1)
%n(1,1)
%m(1,1)

DECISION_TREE_LEARNING(n, o)

function tree = DECISION_TREE_LEARNING(features, labels)
samelabel = true;

for i = 1:size(labels)
    if labels(i) ~= labels(i+1)
        samelabel = false;
    end
end

if samelabel
    tree.class = labels(1);
else
    [best_attribute, best_threshold] = CHOOSE_ATTRIBUTE(features, labels);
    tree.attribute = best_attribute;
    tree.threshold = best_threshold;
    
    for i = 1:size(tree.attribute)
        if tree.attribute{i} < tree.threshold 
            examplesl = [examplesl, tree.attribute(i)];
            targetsl = [targets, labels(i, 1)];
        else
            examplesr = [examplesr, tree.attribute(i)];
            targetsr = [targetsr, labels(i, 1)];
        end
    end
    
    subtreel = DECISION_TREE_LEARNING(examplesl, targetsl);
    
    subtreer = DECISION_TREE_LEARNING(examplesr, targetsr);
    
    tree.kids = [subtreel,subtreer]
    
end

tree

end

function en = entropy(p,n)
    en = -(p/(p+n))*log2(p/(p+n))-(n/(p+n))*log2(n/(p+n));
end

function [best_features,best_threshold] = CHOOSE_ATTRIBUTE(features,targets)
[x,z] = sort(features);
length = 82905;
best_thresh_ary = {};
positive_ary = {};
negative_ary = {};

for k = 1:3%48
    
    % in this function we sort the features into a 3D array "x"
    % each row is different features: "k"
    % so for each feature we go down the column first: "i"


    % resetting variables
    
    averages = {};
    sortedresults = {};
    
    for i = 1:length

    % we get an average by doing: ((i) + (i + 1)) / 2
	% we then put that at the end of the array "averages"

        avg = (x(i,k) + x(i+1,k)) / 2;
        averages = [averages,avg];
        
    end

    for i = 1:length

    % "z" is an array containing the new location of each node after being sorted earlier, i is each element in "sortedresults"
	% which gets the i'th result ("targets") and puts it into its new position
	% the reason for this is so we can compare the "sortedresults" with our "trialresults" from splitting with the
	% threash hold derived from the "averages" variable we attained earlier

        sortedresults{z(i,k)} = targets(i,1);

    end
    
    % resetting variables

    trialresults = {};
    counter = 0;
    counter_position = 1;
    stored_positives = 1%0;
    stored_negatives = 1%0;

    for i = 1:20000:length-2905

	% this should just go from 1 to length but this is very slow so we set it to jump through
	% "matchedcounter" shows how many matches the "trialresults" got with our threshhold values
	% "i" is the position of averages and "j" is the position of the results
	% the inner loop interates through each sorted "x" value
	% the outer loop interates through each average from "averages" 

        matchedcounter = 0;
        positives = 1%0;
        negatives = 1%0;

        for j = 1:20000:length-2905

	% this should just go from 1 to length but this is very slow so we set it to jump through

            if str2double(x(j,k)) < str2double(averages(i))

		% if each element in "x" is the less than each element in "averages" (i.e. potential threshhold values)
		% then we set the value to 0

                trialresults{j} = 0;
                negatives = negatives + 1;

            else

		% otherwise its set to 1

                trialresults{j} = 1;
                positives = positives + 1;

            end

		% then with the "trialresults" we check if it matched to the actual result ("sortedresults")

            if trialresults{j} == sortedresults{j}

        % this then increments the "matchedcounter" if they are the same

                matchedcounter = matchedcounter + 1;

            end

        end

	% at the end of each feature we check if the "matchedcounter" is greater than the master "counter"
	% if the amount of matches ("matchedcounter") for the i'th threshold ("averages") is greater
	% than the current maxiumum ("counter") then set the current maximum ("counter") to "matchedcounter" 

        if matchedcounter > counter

            counter = matchedcounter;

	% then counter_position is set to "i" so whatever average had the highest matches ("matchedcounter") can be referenced with "counter_postion" 

            counter_position = i;
            
            stored_positives = positives
            stored_negatives = negatives
            

        end

    end

    % we can then get the best threshhold for this feature from "averages" using the "counter_postion" variable

    best_thresh = averages(counter_position);

    % this then stores the "best_thresh" into an array ("best_thresh_ary") of every features best threshhold from "averages"

    best_thresh_ary = [best_thresh_ary, best_thresh];
    
    positive_ary = [positive_ary stored_positives];
    
    negative_ary = [negative_ary stored_negatives];
    
    best_thresh
    stored_positives
    stored_negatives

end

best_thresh_ary
positive_ary
negative_ary

%class(cell2mat(positive_ary(1)))
%class(test_values1)

entropies = {};
remainders = {};
%gains = {};

%e1 = entropy(34.0,20.0)
%p1 = cell2mat(positive_ary(1))
%n1 = cell2mat(negative_ary(1))
%class(p1)
%class(n1)
%e2 = entropy(4,0)
%p2 = str2double(positive_ary(2))
%n2 = str2double(negative_ary(2))
%e3 = entropy(p2,n2)
%test = test_values1(1)
%test2 = test_values2(1)
%e4 = entropy(test,test2)
%e5 = entropy(test_values1{2},test_values2{2})

gain_position = 1;
best_gain = 0;

for i = 1:3%48
    p = cell2mat(positive_ary(i))
    n = cell2mat(negative_ary(i))
    ent = entropy(p,n)
    %entropies = [entropies,ent];
    remainder = ((cell2mat(positive_ary(i)))/(cell2mat(positive_ary(i))+cell2mat(positive_ary(i))))*entropy(cell2mat(positive_ary(i)),1) + ((cell2mat(negative_ary(i)))/(cell2mat(positive_ary(i))+cell2mat(positive_ary(i))))*entropy(1,cell2mat(negative_ary(i)));
    %remainders = [remainders,remainder];
    gain = ent-remainder;
    %gains = [gains,gain];
    if gain > best_gain
        best_gain = gain;
        gain_position = i;
    end
    
    gain
    
end

best_features = features(:,gain_position)
best_threshold = best_thresh_ary(gain_position)

end

