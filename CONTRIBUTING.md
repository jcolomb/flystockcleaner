
#How to contribute

A fly stock cleaner app would be great, but I cannot do it alone!  

#Everyone
- Note that the development of flystockcleaner is going hand to hand with the development of rflybase, and that issues and code changes may need to be done there: https://github.com/ropensci/rflybase
- Write new issues or comment existing issues on github: give feedback, describe bugs, ask for new features,...
    Clearly describe the issue including steps to reproduce when it is a bug.
    For new features, state your problem clearly, make a second comment if you want to propose a solution to that problem.
    Be nice and enthousiastic!
- If you have seen another great tool in a different language (not R), you can indicate it in the issues. SQL queries of flybase are of particular interest!    


# Coders (fork, change, pull request)

- Fork the repository on GitHub, you will need a github account. 

- Make a new topic branch named after yourself or the issue and clone the repo (branch from the latest version, normally the master).

- Create a topic branch from where you want to base your work.
        This is usually the master branch.
        Only target release branches if you are certain your fix must be on that branch.
        Please avoid working directly on the master branch, create a branch with your name and work on it there.
    Make commits of logical units.
    (Check for unnecessary changes (whitespace) before committing.)
    Make sure your commit messages are in the proper format.
    
    Make sure you have added the necessary tests for your changes.
    Run all the tests to assure nothing else was accidentally broken.
    
-Submitting Changes

    Push your changes to a topic branch in your fork of the repository.
    Submit a pull request to the repository in the jcolomb repo.
    I will review the pull request, make merges, and publish the new version on shiny.io
    Mark the issue as done, BRAVO!
    
Any question? email me at julien.colomb@fu-berlin.de or open an issue.    
