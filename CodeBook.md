Original data have two groups train set and test set. reference files are features.txt and activity_labels.txt.

Each group has x_ , y_ , and sugject_ data.
x_ data contain 561 columns and each column has the experimental measurements.
y_ data contain activity information (1-6 different activities)
subject_ data contain human subject numbers.

activity_label.txt file matches activity number and activity information.
features.txt file contain 561 rows which describes column information of train.txt and test.txt.

selected.features vector is row numbers in features.txt which has mean or std.
selected.feature vector was used to extract mean and std containing columns from train.txt and test.txt data.

x_train, y_train, subject_train files are merged into train_All which has human subject numbers, activities and measurements.
test_All object also generated same way and test_All and train_All objects are merged into AllData.

activities in activity column were assigned by using activity_labels.

Finally, Mean.by.Group tidy object was generated from AllData.
AllData was pluged into group_by(activity, subject) then sent to summarize mean values.
