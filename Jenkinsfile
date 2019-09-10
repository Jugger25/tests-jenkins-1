//coment
pipeline {
  agent any
  stages{
    stage('Checkout-git'){
      steps{
        git poll: true, url: 'git@github.com:Jugger25/tests-jenkins-1.git'
      }
    }
    stage('InstallRequirements'){
      steps{
         sh '''
           bash -c "pip3 install -r requirements.txt"
         '''
       }
    }
    stage('TestApp'){ 
      steps{
         sh '''
           bash -c "cd src && pytest && cd .."
         '''
       }
    }
    stage('RunApp'){ 
      steps{
         sh '''
           bash -c "python3 src/main.py &"
         '''
       }
    }
    stage('BuildDocker'){ 
      steps{
         sh '''
           bash -c "docker build -t apptest:latest ."
         '''
       }
    }
    stage('PushDocker'){ 
      steps{
         sh '''
           bash -c "docker tag apptest:latest jugger25/apptest:latest && docker login -u jugger25 -p `cat passwd.txt` && docker push jugger25/apptest:latest && docker rmi apptest:latest"
         '''
       }
    }
  }
}
