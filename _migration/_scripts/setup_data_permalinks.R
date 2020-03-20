library(tidyverse)

process_path <- function(path){

	redirect_dir <- paste0("redirects/data/", str_replace(path, "^(.*)/.*", "\\1"))
	dir.create(redirect_dir, showWarnings=FALSE)

	md_file <- paste0("redirects/data/", path, ".md")


	old_url <- paste0(path)
	new_url <- paste0("https://mothur.s3.us-east-2.amazonaws.com/data/", path)

	permalink <- paste0("/", path, "/")
	redirect_to <- new_url

	write(file=md_file,
		paste0("---\npermalink: ", permalink, "\nredirect_to: ", redirect_to, "\n---\n")
	)

}

unlink("redirects/data", recursive=TRUE)
dir.create("redirects/data")

scan("_helper_files/data_files.txt", what=character(), sep="\n", quiet=TRUE) %>%
	map(., process_path)
