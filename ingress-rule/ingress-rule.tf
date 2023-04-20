resource "kubernetes_ingress_v1" "voting-ingress" {
  metadata {
    name      = "azure-vote-front"
    labels = {
      name = "azure-vote-front"
    }
    annotations = {
      "kubernetes.io/ingress.class" : "nginx"
    }
  }

  spec {
    rule {
      host = "voting-app.funmilayofagoyinbo.com"
      http {
        path {
          backend {
            service{
              name = "azure-vote-front"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_ingress_v1" "result-ingress" {
  metadata {
    name      = "result-app"
    namespace = "voting-app"
    labels = {
      name = "voting-service"
    }
    annotations = {
      "kubernetes.io/ingress.class" : "nginx"
    }
  }

  spec {
    rule {
      host = "voting-result.funmilayofagoyinbo.com"
      http {
        path {
          backend {
            service{
            name = "result-service"
            port {
              number = 80
            }
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_ingress_v1" "micro-ingress" {
  metadata {
    name      = "sock-shop"
    namespace = "sock-shop"
    labels = {
      name = "front-end"
    }
    annotations = {
      "kubernetes.io/ingress.class" : "nginx"
    }
  }

  spec {
    rule {
      host = "the-sock-shop.funmilayofagoyinbo.com"
      http {
        path {
          backend {
            service{
              name = "front-end"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_ingress_v1" "prome-ingress" {
  metadata {
    name      = "promethues-grafana"
    namespace = "prometheus"
    labels = {
      name = "prometheus"
    }
    annotations = {
      "kubernetes.io/ingress.class" : "nginx"
    }
  }

  spec {
    rule {
      host = "grafana.funmilayofagoyinbo.com"
      http {
        path {
          backend {
            service{
              name = "prometheus-grafana"
              port {
               number = 9090
               }
          }
        }
      }
    }
  }
}
}

