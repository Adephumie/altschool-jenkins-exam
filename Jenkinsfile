pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-east-1"
    }

    parameters{
        choice(name: 'ENVIRONMENT', choices: ['create', 'destroy'], description: 'create and destroy cluster with one click')
    }

    stages {
        stage("Create prometheus") {
            when {
                expression { params.ENVIRONMENT == 'create' }
            }
            steps {
                script {
                    dir('prometheus') {
                        sh "aws eks --region us-east-1 update-kubeconfig --name demo"
                        sh "terraform init"
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }

        stage("Create nginx-controller") {
            when {
                expression { params.ENVIRONMENT == 'create' }
            }
            steps {
                script {
                    dir('nginx-controller') {
                        sh "terraform init"
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }

        stage("Deploy voting-app to EKS") {
            when {
                expression { params.ENVIRONMENT == 'create' }
            }
            steps {
                script {
                    dir('voting-app') {
                        sh "kubectl apply -f voting-app-deployment.yaml"
                    }
                }
            }
        }

        stage("Deploy sock-shop to EKS") {
            when {
                expression { params.ENVIRONMENT == 'create' }
            }
            steps {
                script {
                    dir('sock-shop') {
                        sh "kubectl apply -f sock-shop-deployment.yaml"
                    }
                }
            }
        }

        stage("Deploy ingress rule to EKS") {
            when {
                expression { params.ENVIRONMENT == 'create' }
            }
            steps {
                script {
                    dir('ingress-rule') {
                        sh "terraform init"
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }

        stage("destroy prometheus") {
            when {
                expression { params.ENVIRONMENT == 'destroy' }
            }
            steps {
                script {
                    dir('prometheus') {
                        sh "terraform destroy -auto-approve"
                    }
                }
            }
        }

        stage("Destroy voting-app in EKS") {
            when {
                expression { params.ENVIRONMENT == 'destroy' }
            }
            steps {
                script {
                    dir('voting-app') {
                        sh "terraform destroy -auto-approve"
                    }
                }
            }
        }

        stage("Destroy sock-shop in EKS") {
            when {
                expression { params.ENVIRONMENT == 'destroy' }
            }
            steps {
                script {
                    dir('sock-shop') {
                        sh "terraform destroy -auto-approve"
                    }
                }
            }
        }

        stage("Destroy ingress rule in EKS") {
            when {
                expression { params.ENVIRONMENT == 'destroy' }
            }
            steps {
                script {
                    dir('ingress-rule') {
                        sh "terraform destroy -auto-approve"
                    }
                }
            }
        }

        stage("destroy nginx-conroller") {
             when {
                expression { params.ENVIRONMENT == 'destroy' }
            }
            steps {
                script {
                    dir('nginx-controller') {
                         sh "terraform destroy -auto-approve"
                    }
                }
            }
        }
    }
}
