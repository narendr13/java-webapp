pipeline{
	agent any
	tools {
  		maven 'maven'
	}
	environment{
		PATH = "$PATH:/usr/bin/docker/"
	}
	stages{
		stage("Git Checkout"){
			steps{
				git credentialsId: 'git', url: 'https://github.com/narendr13/java-webapp.git'
			}
		}
		stage("Maven Build "){
			steps{
				echo "Building has started"
				sh "mvn install -DskipTests"
			}
		}
		stage("Deployment"){
			steps{
			sshagent(['ssh']) {
				sh "scp -o StrictHostKeyChecking=no **/java-jsp-diary.war ubuntu@54.175.94.125:/opt/tomcat/webapps/"
				}
			}
		}
		stage("docker build"){
			steps{
				sshagent(['docker']) {
				script{
					sh "docker build -t naren818/java-jsp-diary ."
				}
				}
			}
		}
  }
}
