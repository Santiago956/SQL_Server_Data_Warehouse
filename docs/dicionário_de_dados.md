# Dicionário de Dados para a camada Ouro

## Visão Geral

A Camada Ouro constitui uma representação de dados a nível de negócios, estruturada para dar suporte a casos de uso analíticos e de geração de relatórios.

### 1. **ouro.dim_customers**

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

### 2. **ouro.dim_products**

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

### 3. **ouro.fact_sales**

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
