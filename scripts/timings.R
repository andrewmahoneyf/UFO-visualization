


if(Sys.info()[["user"]] == "jacquesdebar") {
  PROJECTDIR <- file.path("Users", "jacquesdebar", "Documents", "INFO201", "Assignments", "a7-collaboration-PAJJ")
  fileName <- "jacques_results.Rdat"
} else if(Sys.info()[["user"]] == "andrewmahoney-fernandes") {
  PROJECTDIR <- file.path("~", "Desktop", "Info-201", "a7-collaboration-PAJJ")
  fileName <- "andrew_results.Rdat"
} else if (Sys.info()[["user"]] == "sanghawk") {
  PROJECTDIR <- file.path("Users", "sanghawk", "Documents", "Winter '18", "INFO 201", "a7-collaboration","a7-collaboration-andrewmahoneyf")
  fileName <- "sanghawk_results.Rdat"
} 
