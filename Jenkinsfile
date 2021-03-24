pipeline {
    agent any
	tools
	{
		maven "Apache Maven 3.3.9"
		 jdk "javaa"
	}
	
    stages {
        stage('CheckOut')
        {
            steps
            {
                checkout scm
            }
        }
        stage('Build') 
        {
            steps 
            {
                echo 'Addition Program'
		            echo 'Building the program'
                bat  "mvn package"
            }
        }
	
        stage('Unit Test')
        {
            steps
            {
		            echo 'Testing Stage'
                bat 'mvn test'
            }
        }
        stage('Sonar Analysis') 
        {
            steps 
            {
		            echo 'Performing Sonar Analysis'
                withSonarQubeEnv("sonar")
                //withSonarQubeEnv(credentialsId: '5d535e8b-5b46-43e2-9766-beef95487a33', installationName: 'sonar-scanner') 
                {
                    //bat "mvn sonar:sonar"
			bat "mvn org.sonarsource.scanner.maven:sonar-maven-plugin:sonar"
                }   
            }
        }
	    stage("Quality Gate") {
		steps {
			sleep(10)
			timeout(time: 10, unit: 'MINUTES') {
			waitForQualityGate abortPipeline: true
				}
		}
}
        stage('Artifactory')
        {
	        steps
	        {
		        rtMavenDeployer (
    			    id: 'deployer',
		            serverId: 'Artifactory',
		            releaseRepo: 'example-repo-local',
		            snapshotRepo: 'example-repo-local' 
		        )
		        rtMavenRun (
		        pom: 'pom.xml',
		        goals: 'clean install',
		        deployerId: 'deployer'
			)
		        rtPublishBuildInfo (
		            serverId: 'Artifactory' 
		                )
	        }
	}

        stage('Release') {
            steps 
	    {
                echo 'Releasing'
            }
        }
	stage ('deploy')
	    {
		    steps
		    {
			    bat 'dir'
			    bat 'xcopy /S /Q /Y /F target\\*.war "C:\\Program Files\\Apache Software Foundation\\Tomcat 8.5\\webapps"'
			    //bat 'C:\\Program Files\\Apache Software Foundation\\Tomcat 8.5_Tomcat88\\bin\\catalina.bat restart'
		    }
	    }
    }
}
