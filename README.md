# GCP
PythonCurso

# Projeto Terraform

Este projeto usa o Terraform para criar um bucket no Google Cloud Storage e um tópico no Google Cloud Pub/Sub.

## Arquivos

- `provider.tf`: Define o provedor do Terraform (Google Cloud Platform).
- `variables.tf`: Define as variáveis usadas em outros arquivos.
- `terraform.tfvars`: Atribui valores às variáveis definidas em `variables.tf`.
- `gcs_bucket.tf`: Define um recurso do tipo `google_storage_bucket`, que cria um bucket no Google Cloud Storage.
- `pubsub_topic.tf`: Define um recurso do tipo `google_pubsub_topic`, que cria um tópico no Google Cloud Pub/Sub.
- `outputs.tf`: Define as saídas que serão exibidas quando o Terraform for executado.

## Relações entre os arquivos do Terraform

Os arquivos do Terraform em seu projeto trabalham juntos de maneira semelhante a como as tabelas em um banco de dados se relacionam. Aqui está uma explicação detalhada:

- `provider.tf`: Este arquivo é como a "tabela de provedores" em um banco de dados. Ele define qual provedor de nuvem (neste caso, o Google Cloud Platform) será usado para criar e gerenciar recursos.
- `variables.tf` e `terraform.tfvars`: Esses arquivos são como a "tabela de variáveis". `variables.tf` define quais variáveis existem (como as colunas em uma tabela de banco de dados), e `terraform.tfvars` fornece os valores para essas variáveis (como as linhas em uma tabela de banco de dados).
- `gcs_bucket.tf` e `pubsub_topic.tf`: Esses arquivos são como "tabelas de recursos". Eles definem os recursos que serão criados (como as linhas em uma tabela de banco de dados). Eles se referem às variáveis definidas em `variables.tf` e `terraform.tfvars` (como uma chave estrangeira em um banco de dados).
- `outputs.tf`: Este arquivo é como a "tabela de saídas". Ele define quais informações serão exibidas ao usuário após a execução do Terraform (como selecionar certas colunas para exibir em uma consulta de banco de dados).

## Uso

1. Defina suas variáveis em `terraform.tfvars`.
2. Execute `terraform init` para inicializar o Terraform.
3. Execute `terraform plan` para verificar as mudanças que serão feitas.
4. Execute `terraform apply` para aplicar as mudanças.

Depois de executar `terraform apply`, você verá o nome do bucket do Google Storage e o nome do tópico do Google Pub/Sub que foram criados.

