# run_analysis.R, John C. McDavid, 11-20-2015
# this code runs a summary analysis on datasets containing data from 30 subjects, 6 activities, and 561 feature variables
# see README.md and CodeBook.md files for descriprion of dat and procedures

# This is to calculate averages across observations of training and test dataset composites for 30 subjects and 6 activities


#
setwd("C:\\Users\\jcmcd\\Coursera - Getting and Cleaning Data")   # sety working directory

list.files("./UCI HAR Dataset/train")

# read features
features <- read.table("./UCI HAR Dataset/features.txt")  # 561

# read activity labels
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")  # 6

# reads in x_train ds; ncols = 561
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")  # 7352 x 561
ncol(xtrain)
nrow(xtrain)
str(xtrain)

# reads x_test dataset
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")  # 2947 x 561
ncol(xtest)

#reads activity codes for each obs
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")  # 7352 x 1, identifies activ 1-6
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")

# reads subject id for each obs
subtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")  # 7352 x 1, # subj in each obs
subtest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
unique(subtest)

# only need xtrain, ytrain, subjtrain; same for test  (68 = 33 mean, 33 sd, 1 id, 1 activ)
# select only nec cols from xtrain   (used mean, std but not meanfreq var)
#   other cols of poss (13)...294:296,373:375,452:454,513,526,539,552
xtrain2 <- xtrain[,c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,345:350,424:429,503:504,516:517,529:530,542:543)]
xtest2 <- xtest[,c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,345:350,424:429,503:504,516:517,529:530,542:543)]


# cbind xtrain2, subjtrain, ytrain     then same for test, layout same
alltrain <- cbind(xtrain2, subtrain, ytrain)
alltest <- cbind(xtest2, subtest, ytest)
ncol(alltrain)  # sb 68
ncol(alltest)  # sb 68

#rbind alltrain, alltest - combine datasets
master <- rbind(alltrain, alltest)
master2 <- master
nr <- nrow(master2)

# add descriptive label for activity instead of number
for (i in 1:nr) {
    master2[i,69] <- activity[master2[i,68],2]
}


# have to get col names from features txt file and then one col name for two other files
fnames <- as.character(features[c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,345:350,424:429,503:504,516:517,529:530,542:543),2])
fnames2 <- c(fnames[1:66], "Subject ID", "Activity NUm", "Activity Label")
names(master2) <- fnames2

# for final tidy data set
fnamesB <- paste("Avg.",fnames,sep="")   # for final tidy data set, then add fnames2...and del Activ Num
fnamesB2 <- c(fnamesB[1:66], "Subject ID", "Activity NUm", "Activity Label")
names(Signals) <- fnamesB2   # replace w final set name
#

# loop through df capturing average of each variable
#   what about NA, ...?
ftidy <- array(0,dim=c(30,6,66))
fcnt <- array(0,dim=c(30,6,66))
favg <- array(0,dim=c(30,6,66))
# ftidy <- NULL
# fcnt <- NULL
# favg <- NULL
nr <- nrow(master2)
for (i in 1:nr) {
    isub <- master2[i,67]
    iact <- master2[i,68]
    for (icol in 1:66) {
        ftidy[isub, iact, icol] <- ftidy[isub, iact, icol] + master2[i,icol]
        fcnt[isub, iact, icol] <- fcnt[isub, iact, icol] + 1
            }    
}

# make data frame for tidy data set
Signals <- data.frame(matrix(nrow=0, ncol=68))
class(Signals[,2]) <- "character"

fnamesB <- paste("Avg.",fnames,sep="")   # for final tidy data set, then add fnames2...and del Activ Num
fnamesB2 <- c("Subject ID", "Activity Label", fnamesB[1:66])
names(Signals) <- fnamesB2   # replace w final set name

# loop through to calculate averages (means) by subject, activity, selected feature
#    could be done by apply, dply, mean fcns - will do when can check more thoroughly
#    this works so is fine for now
j <- 0
for (isub in 1:30) {
    for (iact in 1:6) {
        j <- j + 1
        for (ivar in 1:66) {
            favg[isub,iact,ivar] <- ftidy[isub,iact,ivar] / fcnt[isub,iact,ivar]  #calc mean
            
            Signals[j,1] <- isub
            Signals[j,2] <- as.character(activity[iact,2])
            Signals[j,ivar+2] <- favg[isub,iact,ivar]           
        }
    }
    
}

# tidy data sety is Signals

