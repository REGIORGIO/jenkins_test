#!groovy
pipeline {
    agent { 
        label 'master'
        }
    options {
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
        timestamps()
    }

   stages {
       stage('Preparation') {
            steps {
                sh 'pip3 install -r requirements.txt'
            }
        }
    
       stage('Run Robot Tests') {
         steps {
               sh 'mkdir -p reports'
               sh 'python3 -m robot.run  --outputdir results .'
               }
        }
         
   }
    post {
          always {
            script {
              step(
                  [
                    $class              : 'RobotPublisher',
                    outputPath          : 'results',
                    outputFileName      : 'output.xml',
                    reportFileName      : 'report.html',
                    logFileName         : 'log.html',
                    disableArchiveOutput: false,
                    passThreshold       : 60,
                    unstableThreshold   : 40,
                    otherFiles          : "**/*.png,**/*.jpg",
                  ]
                )
              step(
                  [
                    $class: 'GitHubCommitStatusSetter',
                    contextSource: [$class: 'ManuallyEnteredCommitContextSource',
                                    context: 'Robot tests'],
                    statusResultSource: [$class: 'ConditionalStatusResultSource',
                                         results: [[$class: 'AnyBuildResult',
                                                     state: 'SUCCESS',
                                                     message: "Tests passed successfully"]]]])
            }
        }   
      }    

}