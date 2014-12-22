
clean_data = function() {
	main_folder = "UCI HAR Dataset/"

	colnames = read_table_from(main_folder, "features.txt")[[2]]
	activities = read_table_from(main_folder, "activity_labels.txt")[[2]]

	# read test table
	test = read_table_from(main_folder, "test/X_test.txt")
	colnames(test) = colnames

	test["subject"] = read_table_from(main_folder, "test/subject_test.txt")[[1]]
	test["activity"] = read_table_from(main_folder, "test/y_test.txt")[[1]]

	# read train table
	train = read_table_from(main_folder, "train/X_train.txt")
	colnames(train) = colnames

	train["subject"] = read_table_from(main_folder, "train/subject_train.txt")[[1]]
	train["activity"] = read_table_from(main_folder, "train/y_train.txt")[[1]]
	
	# merge both tables
	merged_table = merge_training_and_test_sets(test, train)

	# label activities
	merged_table$activity = as.factor(merged_table$activity)
	levels(merged_table$activity) = activities
	
	# extract interesting columns
	extracted = extract_mean_std_activity_and_subject(merged_table)

	# aggregate and save file
	clean = aggregate(extracted[,1:79], by=list(subject=extracted$subject, activity=extracted$activity), FUN=mean)

	write.table(clean, "clean.txt", row.name=FALSE)
}


read_table_from = function(folder, file) {
	read.table(paste(folder, file, sep=""))
}

merge_training_and_test_sets = function(test, training) {
	rbind(test, training) 
}

extract_mean_std_activity_and_subject = function(table) {
	columns = grepl("(mean|std|activity|subject)", colnames(table))
	table[columns]
}


clean_data()
