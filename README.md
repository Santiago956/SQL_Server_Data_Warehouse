# 📦 Data Warehouse com SQL Server

Este projeto implementa um Data Warehouse utilizando SQL Server, seguindo uma arquitetura moderna em camadas que organiza os dados desde a ingestão bruta até a disponibilização para consumo analítico.

---

## ✔️ Requisitos do Projeto

### Objetivo

Desenvolver um data warehouse moderno utilizando SQL Server para consolidar dados de vendas, possibilitando a elaboração de relatórios analíticos para tomada de decisão.

### Especificações

- Consolidar dados de múltiplas fontes (CRM, ERP, CSV) em uma única plataforma analítica.

- Garantir que os dados passem por etapas claras de tratamento e refino.

- Combinar ambas fontes em um único modelo de dados acessível para consultas analíticas.

- Providenciar documentação clara do modelo de dados para times de analitycs e stakeholders.

## :hammer: Implementação

### 📐 Arquitetura da Solução

![Diagrama de Arquitetura](docs/diagrama_de_arquitetura.png)

A solução é composta por:

- **Fontes**: CRM, ERP e arquivos CSV
- **Data Warehouse**: SQL Server

  - **Camadas**: Bronze, Prata e Ouro

- **Consumidores**: Power BI, consultas SQL e Machine Learning

Na pasta 'docs' estão contidas mais ilustrações da arquitetura do projeto e o fluxo de dados.

### 🚀 Tecnologias Utilizadas

- SQL Server
- T-SQL
- Draw.io
- Notion

### 📂 Estrutura do Repositório

```
LICENSE
README.md
├── datasets/
│   ├── source_crm/
│   │   ├── cust_info.csv
│   │   ├── prd_info.csv
│   │   └── sales_details.csv
│   └── source_erp/
│       ├── CUST_AZ12.csv
│       ├── LOC_A101.csv
│       └── PX_CAT_G1V2.csv
├── docs/
│   ├── diagrama_data_flow.png
│   ├── diagrama_de_arquitetura.png
│   ├── diagrama_de_integracao.png
│   └── diagrama_modelo_logico.png
├── src/
│   ├── init_database.sql
│   ├── bronze/
│   │   ├── ddl_bronze.sql
│   │   └── load_bronze.sql
│   ├── ouro/
│   │   └── ddl_ouro.sql
│   └── prata/
│       ├── ddl_prata.sql
│       └── load_prata.sql
└── tests/
    ├── teste_qualidade_ouro.sql
    └── teste_qualidade_prata.sql
```
---

### Dicionário de Dados para a camada Ouro

#### 1. **ouro.dim_customers**

| Nome da Coluna  | Tipo de Dado | Descrição                                                                 |
| --------------- | ------------ | ------------------------------------------------------------------------- |
| customer_key    | INT          | Chave substituta que identifica cada registro de cliente individualmente. |
| customer_id     | INT          | Identificador numérico único de cada cliente.                             |
| customer_number | NVARCHAR(50) | Identificador alfanumérico do cliente.                                    |
| first_name      | NVARCHAR(50) | Primeiro nome do cliente.                                                 |
| last_name       | NVARCHAR(50) | Sobrenome do cliente.                                                     |
| country         | NVARCHAR(50) | País onde o cliente reside por extenso (ex: 'Germany').                   |
| marital_status  | NVARCHAR(50) | Estado civil do cliente (ex: 'Married', 'Single').                        |
| gender          | NVARCHAR(50) | O sexo/gênero do cliente (ex: 'Male', 'Female', 'n/a').                   |
| birthdate       | DATE         | Data de nascimento do cliente em formato YYYY-MM-DD (ex: 1976-10-06).     |
| create_date     | DATE         | Data em que o cliente foi registrado no sistema.                          |

#### 2. **ouro.dim_products**

| Nome da Coluna | Tipo de Dado | Descrição                                                                                                        |
| -------------- | ------------ | ---------------------------------------------------------------------------------------------------------------- |
| product_key    | INT          | Chave substituta que identifica cada registro de produto individualmente.                                        |
| product_id     | INT          | Identificador único atribuído ao produto para rastreamento e referência interna.                                 |
| product_number | NVARCHAR(50) | Código alfanumérico estruturado que representa o produto, frequentemente usado para categorização ou inventário. |
| product_name   | NVARCHAR(50) | Nome descritivo do produto, incluindo detalhes como tipo, cor e tamanho.                                         |
| category_id    | NVARCHAR(50) | Identificador único para a categoria do produto, vinculando à sua classificação de alto nível.                   |
| category       | NVARCHAR(50) | Classificação mais ampla do produto (ex: Bicicletas, Componentes) para agrupar itens relacionados.               |
| subcategory    | NVARCHAR(50) | Classificação mais detalhada do produto dentro da categoria, como tipo de produto.                               |
| maintenance    | NVARCHAR(50) | Indica se o produto requer manutenção (ex: 'Sim', 'Não').                                                        |
| cost           | INT          | O custo ou preço base do produto, medido em unidades monetárias.                                                 |
| product_line   | NVARCHAR(50) | A linha ou série específica de produtos à qual o produto pertence (ex: Estrada, Montanha).                       |
| start_date     | DATE         | A data em que o produto ficou disponível para venda ou uso, armazenada em formato YYYY-MM-DD.                    |

#### 3. **ouro.fact_sales**

| Nome da Coluna | Tipo de Dado | Descrição                                                                                        |
| -------------- | ------------ | ------------------------------------------------------------------------------------------------ |
| order_number   | NVARCHAR(50) | Identificador alfanumérico único para cada pedido de venda (ex: 'SO54496').                      |
| product_key    | INT          | Chave substituta que vincula o pedido à tabela de dimensão de produtos.                          |
| customer_key   | INT          | Chave substituta que vincula o pedido à tabela de dimensão de clientes.                          |
| order_date     | DATE         | A data em que o pedido foi realizado.                                                            |
| shipping_date  | DATE         | A data em que o pedido foi enviado ao cliente.                                                   |
| due_date       | DATE         | A data em que o pagamento do pedido estava vencido.                                              |
| sales_amount   | INT          | O valor monetário total da venda para o item da linha, em unidades monetárias inteiras (ex: 25). |
| quantity       | INT          | O número de unidades do produto pedido para o item da linha (ex: 1).                             |
| price          | INT          | O preço por unidade do produto para o item da linha, em unidades monetárias inteiras (ex: 25).   |

## 📋 Próximos Passos

### Construção de Relatório Power BI

O próximo passo envolve a criação de um relatório interativo no Power BI que utilize o modelo de dados consolidado na camada Ouro do Data Warehouse. Este relatório permitirá:

- Visualização de métricas de vendas em tempo real
- Análise de performance por região e período
- Segmentação de clientes e produtos
- Dashboards executivos para tomada de decisão estratégica

A integração com SQL Server será realizada através de conexões diretas às tabelas da camada Ouro, garantindo que os dados apresentados estejam sempre atualizados e alinhados com a fonte única de verdade.

## 🧾 Licença

Projeto disponibilizado sob licença MIT.
