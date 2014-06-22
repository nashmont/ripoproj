PS In my download of the files of the course project there is no file named "CodeBook.md"

### Working directory description

  .the working directory do contain these files
  
  .activity_labels.txt
  
  .features.txt
  
  .features_info.txt
  
  .subject_test.txt
  
  .subject_train.txt
  
  .X_test.txt
  
  .X_train.txt
  
  .y_test.txt
  
  .y_train.txt

### Trainnig dataset formation

  -read Trainning datasets from the working directory
  
  -keeping  only colones with mean and std and replacing characters in names
  
  -calculating means
  
  -calculating std
  
  -adding colone "subject" and colone "activity"
  
  -renaming colones

### Test dataset formation

  -read  test datasets from the working directory
  
  -keeping  only colones with mean and std and replacing characters in names
  
  -calculating means
  
  -calculating std
  
  -adding colone "subject" and colone "activity"
  
  -renaming colones

### Merging and arranging data according to subjects and activities

  -merging the train dataset(data13) and test dataset(data23)  
  
  -adding a Descriptive acitivity names
  
  -obtainnig the (data) dataset which is the union of the two   described datasets
  
  -saving tidy dataset (data) in file "mydata.txt"

### New dataset for averages

  -calculating average of mesures by "subject" anD By "activity" for all colones (means and std)
  
  -rename colones with descriptive names
  
  -saving the dataset of averages (data2)in file mydata2.txt in the working directory