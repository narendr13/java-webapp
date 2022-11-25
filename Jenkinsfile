pipeline{
	agent any
	tools {
  		maven 'maven'
	}
	environment{
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
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
				sh "scp -o StrictHostKeyChecking=no **/java-jsp-diary.war ubuntu@54.174.129.5:/opt/tomcat/webapps/"
				}
			}
		}
		stage("docker build"){
			steps{
				script{
					sh "chmod +rwx /root/var/"
					sh "docker build -t naren818/java-jsp-diary:v2 ."
				}
			}
		}
		stage("docker push"){
			steps{
				script{
					sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
					sh 'docker push naren818/java-jsp-diary:v2'
					}
				}
			
		}
  }
}
