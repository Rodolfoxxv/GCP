# Terraform Configuration

Este diretório contém os arquivos de configuração do Terraform para o nosso projeto.

## Estrutura do Diretório

- `main.tf`: Este arquivo contém a configuração principal do Terraform.
- `variables.tf`: Este arquivo define as variáveis usadas na configuração do Terraform.
- `output.tf`: Este arquivo define as saídas da configuração do Terraform.
- `provider.tf`: Este arquivo configura o provedor do Google Cloud para o Terraform.
- `gcs_bucket.tf`: Este arquivo contém a configuração para criar um bucket do Google Cloud Storage.
- `pubsub_topic.tf`: Este arquivo contém a configuração para criar um tópico PubSub.

## Como Usar

1. Certifique-se de que você tem o Terraform instalado na sua máquina.
2. Navegue até este diretório no seu terminal.
3. Execute `terraform init` para inicializar o diretório de trabalho do Terraform.
4. Execute `terraform plan` para criar um plano de execução.
5. Execute `terraform apply` para aplicar as mudanças.

Por favor, lembre-se de nunca compartilhar publicamente suas chaves de autenticação ou outras informações sensíveis.
