pipeline{
	agent any
	tools {
  		maven 'maven'
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
		stage("Maven Build "){
			steps{
			sshagent(['ssh']) {
				sh "scp /var/lib/jenkins/workspace/java-webapp/target/java-jsp-diary.war ubuntu@174.129.51.67 /opt/tomcat/webapps"
				}
			}
		}
  }
}
