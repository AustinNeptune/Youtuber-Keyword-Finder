# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

VideoStats = function(x){
  AllStats = tuber::get_all_comments(video_id = x)
  AllStats = AllStats %>% dplyr::select(textOriginal)
  AllVidComments = data.frame(AllStats)
  assign("AllVidComments2", AllVidComments, envir = .GlobalEnv)
  KeyWords = AllVidComments2 %>% unnest_tokens(word, textOriginal,) %>% count(word , sort=TRUE)
  KeyWords = data.frame(KeyWords)
  assign("Keywords", KeyWords, envir = .GlobalEnv)
  in.dt <- data.table::fread(infile, header = TRUE)
  in.dt <- in.dt[!duplicated(in.dt[, 1]), ]
  in.mat <- as.matrix(in.dt[, -1, with = FALSE])
  rownames(in.mat) <- unlist(in.dt[, 1, with = FALSE])
  in.mat
}
