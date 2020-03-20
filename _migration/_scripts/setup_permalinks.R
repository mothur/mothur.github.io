library(tidyverse)

download_path <- "_download_files/"

process_path <- function(path){
	url <- paste0("https://mothur.org/", path)
	file <- str_replace(path, "w/images/./../", "")
	destfile <- paste0(download_path, file)

	download.file(url, destfile, quiet=T)

	permalink <- paste0(path, "/")
	redirect_to <- paste0("https://mothur.s3.us-east-2.amazonaws.com/wiki/", tolower(file))

	write(file=paste0("redirects/", file, ".md"),
		paste0("---\npermalink: ", permalink, "\nredirect_to: ", redirect_to, "\n---\n")
	)

}

paths <- scan("_helper_files/wiki_files.txt", what=character(), sep="\n", quiet=TRUE)

unlink(download_path, recursive=TRUE)
dir.create(download_path, showWarnings=FALSE)

map(paths, process_path)
