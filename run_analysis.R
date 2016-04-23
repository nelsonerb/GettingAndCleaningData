# reads, cleans and combines training and test datasets
run_analysis <- function() {
    # change working directory to dataset directory
    original_directory <- getwd()
    setwd("UCI_HAR_dataset")
    
    # load and combine datasets
    train_data <- load_dataset("train")
    test_data <- load_dataset("test")
    all_data <-rbind(train_data,test_data)
    
    
    # change back to original working directory
    setwd(original_directory)

    # output data
    write.csv(all_data,file = "all_data.csv")

    # output summary data
    mean_data <- all_data %>% group_by(subject,activity) %>% summarise_each(funs(mean))
    write.csv(mean_data,file = "mean_data.csv")

}

# load dataset based on datasetname.
# the dataset name corresponds to the subdirectory
# with the specific dataset
load_dataset <- function(datasetname) {
    #define file names
    data_file_name <- paste(datasetname,"/X_",datasetname,".txt", sep = "")
    subject_file_name <- paste(datasetname,"/subject_",datasetname,".txt", sep = "")

    #load data and set column names
    data <- load_data(data_file_name)
    colnames(data) <- get_columns()

    # narrow down to only mean and standard deviation values
    data <- data[,grep("Mean|Std",colnames(data))]

    # load subject
    subject <- load_data(subject_file_name)
    colnames(subject) <- c("subject")
    
    # load activity
    activity <- load_activities(datasetname)
    
    # combine subject, activity and measure columns
    data <- cbind(subject,activity,data)

}

# load a file using standard parameters
load_data <- function(filename) {
    read.table(filename, sep = "" , header = F ,
                       na.strings ="", stringsAsFactors= F)
}

# get and clean up column names
get_columns <- function() {
    # load and clean up column names
    # only concerned cleaning mean and std columns since others
    # are not used in analysis
    col_names <- load_data("features.txt")
    col_names <- col_names$V2
    #replace t and f with more descriptive values
    col_names <- gsub("^f","freq",col_names)
    col_names <- gsub("^t","time",col_names)
    col_names <- gsub("\\(t","Time",col_names)
    col_names <- gsub("\\(f","Freq",col_names)
    #expand short names
    col_names <- gsub("Acc","Acceleration",col_names)
    col_names <- gsub("Mag","Magnitude",col_names)
    # camel case words in middle of name
    col_names <- gsub("mean","Mean",col_names)
    col_names <- gsub("std","Std",col_names)
    col_names <- gsub("entropy","Entropy",col_names)
    col_names <- gsub("energy","Energy",col_names)
    col_names <- gsub("gravity","Gravity",col_names)
    # remove special characters from names
    col_names <- gsub("\\)","",col_names)
    col_names <- gsub("\\(","",col_names)
    col_names <- gsub("-","",col_names)
    col_names <- gsub(",","",col_names)
}

# load the activities for a dataset
load_activities <- function(datasetname) {
    
    # load data from file
    activity_file_name <- paste(datasetname,"/y_",datasetname,".txt", sep = "")
    activity <- load_data(activity_file_name)
    
    # return data in form of labels
    activity_labels <- load_data("activity_labels.txt")
    merged = merge(activity,activity_labels, by.x = "V1", by.y = "V1" )
    merged$V2
}
