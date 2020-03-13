#grep "images" wiki/* > href.txt

library(tidyverse)

parse_a <- function(x){

	str_replace_all(x, ".*?(<a.*?</a>)", "\\1") %>%
		str_split(" ") %>%
		unlist() %>%
		str_subset("href") %>%
		str_replace(".*?\\\"", "") %>%
		str_replace("\\\".*", "")


}

scan("href.txt", sep="\n", what=character(), quiet=TRUE) %>% str_subset("^wiki\\/File", negate=TRUE) %>% map(parse_a) %>% unlist() %>% str_subset("\\/w\\/images") %>% str_subset("http", negate=TRUE) %>% unique %>% write("href_missing.txt")
