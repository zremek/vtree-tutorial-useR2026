remotes::install_github("JBGruber/paperboy")

library(paperboy)
pb_deliver("https://tinyurl.com/386e98k5") |> View()

pb_deliver("https://www.theguardian.com/us-news/ng-interactive/2025/apr/13/end-times-fascism-far-right-trump-musk") # error


pb_collect("https://www.theguardian.com/us-news/ng-interactive/2025/apr/13/end-times-fascism-far-right-trump-musk")

# https://github.com/JBGruber/paperboy 