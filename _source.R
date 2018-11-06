# Install Packages -----
listOfPackages <- c("knitr",
                    "bookdown"
)

newPackages <- listOfPackages[!(listOfPackages %in% installed.packages()[, "Package"])]

if(length(newPackages) > 0){
        install.packages(newPackages)
}

for(package in listOfPackages){
        require(package, character.only = TRUE)
}

# Create docs folder and nojekyll needed to publish the html output -----
dir.create("docs", showWarnings = FALSE)
file.create("docs/.nojekyll")

# Render Book -----
render_book("index.Rmd", output_format = "gitbook",   output_dir = "docs")
render_book("index.Rmd", output_format = "pdf_book",  output_dir = "docs")
render_book("index.Rmd", output_format = "epub_book", output_dir = "docs")

