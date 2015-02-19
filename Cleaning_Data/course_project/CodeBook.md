<h3>Code Book</h2>

<h2>Data</h2>
The data used comes from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

For description of files and data sets please see `README.txt` in zip archive.

<h2>Data transformations</h2>

Following transformations were performed by `run_analysis.R` script:

1. Test set and training set were combined
2. Test labels and training labels were combined
3. Only columns pertaining to mean and standard deviation were extracted
4. All activities identified by number were transformed to English names
5. An additional data set was created with only the avergages of each column

<h2>Output</h2>

Fields in output data set:
<br/>
Subject
Activity
tBodyAcc-mean()-X               
tBodyAcc-mean()-Y               
tBodyAcc-mean()-Z              
tGravityAcc-mean()-X            
tGravityAcc-mean()-Y           
tGravityAcc-mean()-Z            
tBodyAccJerk-mean()-X          
tBodyAccJerk-mean()-Y           
tBodyAccJerk-mean()-Z           
tBodyGyro-mean()-X            
tBodyGyro-mean()-Y             
tBodyGyro-mean()-Z              
tBodyGyroJerk-mean()-X          
tBodyGyroJerk-mean()-Y          
tBodyGyroJerk-mean()-Z        
tBodyAccMag-mean()              
tGravityAccMag-mean()           
tBodyAccJerkMag-mean()          
tBodyGyroMag-mean()            
tBodyGyroJerkMag-mean()         
fBodyAcc-mean()-X               
fBodyAcc-mean()-Y               
fBodyAcc-mean()-Z              
fBodyAcc-meanFreq()-X           
fBodyAcc-meanFreq()-Y           
fBodyAcc-meanFreq()-Z           
fBodyAccJerk-mean()-X          
fBodyAccJerk-mean()-Y           
fBodyAccJerk-mean()-Z  
fBodyAccJerk-meanFreq()-X     
fBodyAccJerk-meanFreq()-Y    
fBodyAccJerk-meanFreq()-Z      
fBodyGyro-mean()-X              
fBodyGyro-mean()-Y              
fBodyGyro-mean()-Z             
fBodyGyro-meanFreq()-X          
fBodyGyro-meanFreq()-Y          
fBodyGyro-meanFreq()-Z         
fBodyAccMag-mean()             
fBodyAccMag-meanFreq()          
fBodyBodyAccJerkMag-mean()      
fBodyBodyAccJerkMag-meanFreq()
fBodyBodyGyroMag-mean()        
fBodyBodyGyroMag-meanFreq()     
fBodyBodyGyroJerkMag-mean()     
fBodyBodyGyroJerkMag-meanFreq() 
tBodyAcc-std()-X              
tBodyAcc-std()-Y                
tBodyAcc-std()-Z              
tGravityAcc-std()-X          
tGravityAcc-std()-Y          
tGravityAcc-std()-Z             
tBodyAccJerk-std()-X            
tBodyAccJerk-std()-Y           
tBodyAccJerk-std()-Z          
tBodyGyro-std()-X              
tBodyGyro-std()-Y             
tBodyGyro-std()-Z             
tBodyGyroJerk-std()-X         
tBodyGyroJerk-std()-Y        
tBodyGyroJerk-std()-Z         
tBodyAccMag-std()              
tGravityAccMag-std()          
tBodyAccJerkMag-std()           
tBodyGyroMag-std()             
tBodyGyroJerkMag-std()          
fBodyAcc-std()-X              
fBodyAcc-std()-Y                
fBodyAcc-std()-Z                
fBodyAccJerk-std()-X            
fBodyAccJerk-std()-Y           
fBodyAccJerk-std()-Z            
fBodyGyro-std()-X               
fBodyGyro-std()-Y               
fBodyGyro-std()-Z              
fBodyAccMag-std()               
fBodyBodyAccJerkMag-std()       
fBodyBodyGyroMag-std()          
fBodyBodyGyroJerkMag-std()   
