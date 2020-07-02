###############################################################################
###############################################################################
###############################################################################

## I am loading packages ------------------------------------------------------

for(my_package in c(
    
    "openxlsx",
    "survival",
    "devEMF"
    
)){
    
    if(!(my_package %in% rownames(installed.packages()))){
    
        install.packages(
            my_package,
            dependencies = TRUE,
            repos = "http://cran.us.r-project.org"
        )
        
    }
    
    library(my_package, character.only = TRUE)
    
}


## ----------------------------------------------------------------------------

###############################################################################

## handling with zipping in R -------------------------------------------------

Sys.setenv(R_ZIPCMD = "C:/Rtools/bin/zip") 


## ----------------------------------------------------------------------------

###############################################################################

## I am setting the working directory -----------------------------------------

while(!"_script_.R" %in% dir()){
    
    setwd(choose.dir())
    
}

mother_working_directory <- getwd()


## ----------------------------------------------------------------------------

###############################################################################

## I am creating an output directory ---------------------------------------------

setwd(mother_working_directory)

if(!file.exists("_diagramy_")){
    
    dir.create(
        
        file.path(
            
            mother_working_directory,
            "_diagramy_"
            
        )
        
    )
    
}


## ----------------------------------------------------------------------------

###############################################################################
###############################################################################
###############################################################################

## dataset for the first image ------------------------------------------------

my_data <- data.frame(
    
    "time" = c(
        3, 4, 6, 8, 10, 10, 10, 10, 10, 10,
        1, 1, 2, 3, 3, 6, 7, 9, 10, 10
    ),
    "event" = c(
        T, T, T, T, F, F, F, F, F, F,
        T, T, T, T, T, T, T, F, F, F
    ),
    "group" = c(
        rep("first", 10),
        rep("second", 10)
    ),
    stringsAsFactors = FALSE
    
)


## ----------------------------------------------------------------------------

###############################################################################

## I am saving the first image ------------------------------------------------

setwd(
    paste(
        mother_working_directory,
        "_diagramy_",
        sep = "/"
    )
)

cairo_ps(
    file = "fig_1.eps",
    width = 4,
    height = 3,
    pointsize = 10
)

par(mar = c(4.1, 4.9, 0.1, 0.1))

plot(
    survfit(
        Surv(time, event) ~ group,
        data = my_data
    ),
    xlab = "time until the event of interest",
    ylab = expression(
        paste(
            hat(italic(P)),
            "(overall survival)"
        )
    ),
    lty = 1:2
)

legend(
    x = "bottomleft",
    legend = c(
        "first group",
        "second group"
    ),
    lty = 1:2,
    cex = 0.8
)

dev.off()

setwd(
    mother_working_directory
)


## ----------------------------------------------------------------------------

###############################################################################

## dataset for the second image -----------------------------------------------

my_new_data <- data.frame(
    
    "time" = c(
        3, 4, 6, 8, 10, 10, 10, 10, 10, 10,
        1, 1, 3, 5, 7, 9, 10, 10, 10, 10,
        5, 8, 9, 10, 10, 10, 10, 10, 10, 10,
        1, 1, 1, 1, 1, 2, 3, 6, 9, 10
    ),
    "event" = c(
        T, T, T, T, F, F, F, F, F, F,
        T, T, T, T, T, T, F, F, F, F,
        T, T, T, F, F, F, F, F, F, F,
        T, T, T, T, T, T, T, T, F, F
    ),
    "group" = c(
        rep("a", 10),
        rep("b", 10),
        rep("c", 10),
        rep("d", 10)
    ),
    stringsAsFactors = FALSE
    
)


## ----------------------------------------------------------------------------

###############################################################################

## I am saving the second image -----------------------------------------------

setwd(
    paste(
        mother_working_directory,
        "_diagramy_",
        sep = "/"
    )
)

cairo_ps(
    file = "fig_2.eps",
    width = 4,
    height = 3,
    pointsize = 10
)

par(mar = c(4.1, 4.9, 0.1, 0.1))

plot(
    survfit(
        Surv(time, event) ~ group,
        data = my_new_data
    ),
    xlab = "time until the event of interest",
    ylab = expression(
        paste(
            hat(italic(P)),
            "(overall survival)"
        )
    ),
    lty = c(1, 2, 1, 2),
    col = c("black", "black", "blue", "red"),
    lwd = 2
)

abline(
    v = seq(0, 10, 1),
    col = "darkgray",
    lty = "dotted"
)

abline(
    h = seq(0, 10, 1) / 10,
    col = "darkgray",
    lty = "dotted"
)

legend(
    x = "bottomleft",
    legend = c(
        "first group",
        "second group"#,
        #"orthogonal path above the first group's curve",
        #"orthogonal path below the second group's curve"
    ),
    lty = c(1, 2, 1, 2),
    lwd = 2,
    col = c("black", "black", "blue", "red"),
    cex = 0.8,
    bg = "white"
)

dev.off()

setwd(
    mother_working_directory
)


## ----------------------------------------------------------------------------

###############################################################################
###############################################################################
###############################################################################





## ----------------------------------------------------------------------------

###############################################################################
###############################################################################
###############################################################################





