library(httr)
require(httr)
install.packages("httpuv")
library("httpuv")
myapp <- oauth_app("github",key="f4a0559a529d341e8964",secret = "6cabb8b2ea01d6d0659266adbea7baab157070d9")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
gtoken <- config(token = github_token)
get_respon <- GET("https://api.github.com/users/jtleek/repos")
get_respon
json_resp <- content(get_respon)
json_resp[[5]]
