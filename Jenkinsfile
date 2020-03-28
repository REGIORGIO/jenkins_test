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
               sh 'python3 -m robot.run  --outputdir reports statistics_test.robot array_test.robot number_test.robot'
               
               }
        }
         
   }
    post {
          always {
            script {
              step(
                  [
                    $class              : 'RobotPublisher',
                    outputPath          : 'reports',
                    outputFileName      : 'output.xml',
                    reportFileName      : 'report.html',
                    logFileName         : 'log.html',
                    disableArchiveOutput: false,
                    passThreshold       : 80,
                    unstableThreshold   : 40,
                    otherFiles          : "**/*.png,**/*.jpg",
                  ]
                )
            }
        }   
      }    

}