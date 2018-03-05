##### R introduction #####
getwd()
setwd()
dir()  #查看目前目錄下的檔案
#
install.packages("rgl")  # 安裝套件
library(rgl) # 載入套件
detach(package:rgl) # 卸載套件  
remove.packages("rgl") # 移除套件
.libPaths() # 列出library安裝目錄
# 指定repositories
install.packages("rgl", repos = "http://cran.csie.ntu.edu.tw")
# 一次性安裝多個packages
options(repos="http://cran.csie.ntu.edu.tw")
pks <- c("rgl", "ggplot2", "maps", "e1071")
install.packages(pks)
lapply(pks, library, character.only = TRUE)
### library 和 requrie 的差別 ###
# condition 1. 載入已安裝的套件，且 using the command outside of a
# function definition，則: "require" or "library" 相同。

# condition 2. 載入未安裝的套件，則:
# library(foo): 程式停止with the message "Error in library(foo): there is no package called 'foo'." 
# require(foo): get a warning, but not an error. Your program will
# continue to run, only to crash later when you try to use a function
# from the library "foo"

### transferring installed packages ###
# 將安裝過的R套件轉移至另一台裝置中
# 1.store_packages.R
tmp = installed.packages()# stores a list of your currently installed packages
installedpackages = as.vector(tmp[is.na(tmp[,"Priority"]), 1])
save(installedpackages, file="installed_packages.rda")
# 2. restore_packages.R
load("installed_packages.rda")
for (count in 1:length(installedpackages)) install.packages(installedpackages[count])
# 更新套件
update.packages(checkBuilt=TRUE, ask=FALSE) 
# 若出現Would you like to use a personal library instead? 以管理員身分執行R

# 看R版本
sessionInfo()

### help ###
? t.test
help(t.test)
install.packages("rgl")
library(rgl)
demo(rgl)
library(ggplot2)
demo(ggplot2)# 不是全部都可以demo
### RStudio 快捷鍵 ###
## 控制台(Console)
# 游標移動到控制台 (Move cursor to Console): Ctrl+2
# 清除控制台 (Clear console): Ctrl+L
# 移動游標到行首 (Move cursor to beginning of line): Home
# 移動游標到行尾 (Move cursor to end of line): End
# 調出歷史指令 (Navigate command history): 上箭頭/下箭頭
# 彈出歷史指令 (Popup command history): Ctrl+上箭頭
# 中斷正在執行的指令 (Interrupt currently executing command): Esc

## 原始碼編輯區(Source)
# 游標移動到原始檔編輯區 (Move cursor to Source Editor): Ctrl+1
# 存檔 (Save active document): Ctrl+S
# 關閉當前檔案 (Close active document): Ctrl+W
# 執行當前行或者選擇的行 (Run current line/selection): Ctrl+Enter
# 執行當前檔 (Run current document): Ctrl+Alt+R
# 從檔案開頭執行到該行 (Run from document beginning to current line): Ctrl+Alt+B
# 行縮排 (Reindent lines) : Ctrl+I
# 註解(或消除)當前行或者所選程式碼 (Comment/uncomment current line/selection): Ctrl+Shift+C
# 跳轉到配對的括弧 (Jump to Matching Brace/Parentheses): Ctrl+P
# 刪除行 (Delete Line): Ctrl+D
# 選擇 (Select): Shift+箭頭

## 一般
# 尋找和替換 (Find and Replace): Ctrl+F; 尋找上一個 (Find Previous): Shift+F3; 尋找下一個(Find Next): F3
# 上一步 (Undo ): Ctrl+Z; 剪下 (Cut): Ctrl+X; 複制 (Copy): Ctrl+C; 貼上 (Paste): Ctrl+V; 全選 (Select All): Ctrl+A

library(dplyr)
install.packages("pillar")
library(pillar)
remove.packages(c("dplyr", "pillar"))
install.packages('dplyr', dependencies = TRUE)
library("foreach")
library("doParallel")
library("tcltk")
registerDoParallel(makeCluster(4))

n=1000
p <- foreach( i = 1:n) %dopar% {
  i
  
  if(!exists("pb")) pb <- tkProgressBar("Parallel task","completed %", min=1, max=100)
  
  setTkProgressBar( pb, i, title = paste("進度估計",i),paste(i/n , "%") )}
install.packages("rgl")
