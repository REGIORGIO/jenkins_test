# Jenkins test

This repository is used for automated testing using Robot Framework and Jenkins.
When you push your code to the ***develop*** branch, Jenkins automatically runs tests, and the results of these tests are displayed next to your commit.

**Library** folder contains Python code that the Robot framework tests.
**Results** folder contains log.html, log.html, report.html - these are examples of how the Robot Framework works.
**Jenkinsfile** contains a description of Pipeline in Groovy.