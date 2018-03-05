##### Data input & output #####
### cat {base}: Concatenate and Print ###
# Outputs the objects, concatenating the representations. cat performs much
# less conversion than print
stdout()
?stdout()
cat("Hello R users!\n")
a <- c(1,2,3)
cat("Here is a list: ", a, "\n")
cat("3 + 5 =", 3+ 5, "\n" )
cat("A test list: ", paste("Test", 1:3, sep="-"), "\n")

a1 <- 1.2123344
a2 <- 23.3
a3 <- 10/3
cat("iteration", "\t", "mathod-1","\t","method-2", "\t", "method-3\n")

for (i in 1:3){
  cat(i,"\t", round(a1, 3),"\t", round(a2, 3), "\t", round(a3, 3),"\n")
    a1 <- a1+i
    a2 <- a2*i
    a3 <- a3/i
}

cat("today", "is", date(), sep="\t", "\n")
### sprintf ### 
sprintf("%f", pi)
sprintf("%.3f", pi)
### cat() & print() ###
(x <- cat("hello"))
(y <- print("hello"))
str(x)
str(y)
cat("Today is: ", date(), "\n")
print("Today is: ", date()) # error
