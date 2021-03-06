#!groovy
void setBuildStatus(String message, String state) {
  step([
      $class: "GitHubCommitStatusSetter",
      reposSource: [$class: "ManuallyEnteredRepositorySource", url: "https://github.com/REGIORGIO/jenkins_test"],
      contextSource: [$class: "ManuallyEnteredCommitContextSource", context: "Robot tests"],
      errorHandlers: [[$class: "ChangingBuildStatusErrorHandler", result: "UNSTABLE"]],
      statusResultSource: [ $class: "ConditionalStatusResultSource", results: [[$class: "AnyBuildResult", message: message, state: state]] ]
  ]);
}
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
               sh 'python3 -m coverage run -m robot.run  --outputdir reports  .'
               sh 'python3 -m coverage xml'
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
                    passThreshold       : 60,
                    unstableThreshold   : 40,
                    otherFiles          : "**/*.png,**/*.jpg",
                  ]
                )
              sh 'cat codecov.yml | curl --data-binary @- https://codecov.io/validate'
              sh 'curl -s https://codecov.io/bash | bash -s'
            }
          }  
          success {
            setBuildStatus("Build succeeded", "SUCCESS");
            
            script {
              sh 'cat /home/georgy/jenkins/git_token.txt | docker login docker.pkg.github.com -u REGIORGIO --password-stdin'
              sh 'docker build -t docker.pkg.github.com/regiorgio/jenkins_test/simple_python_script:latest .'
              sh 'docker push docker.pkg.github.com/regiorgio/jenkins_test/simple_python_script:latest'
            }
          }
          failure {
            setBuildStatus("Build failed", "FAILURE");
          }
  } 
}  
