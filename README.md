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

<img width="1724" height="1036" alt="diagrama_de_arquitetura drawio" src="https://github.com/user-attachments/assets/3b59fa35-27da-4a7b-9ae4-e592782c170c" />

A solução é composta por:

- **Fontes**: CRM, ERP e arquivos CSV
- **Data Warehouse**: SQL Server
  
  - **Camadas**: Bronze, Prata e Ouro

- **Consumidores**: Power BI, consultas SQL e Machine Learning

### 🚀 Tecnologias Utilizadas

- SQL Server
- T-SQL
- Draw.io
- Notion

### 📂 Estrutura do Repositório
```
├── datasets/
│ ├── crm/
│ ├── erp/ 
│
├── docs/
│ ├── arquitetura/ 
│ ├── especificacoes/ 
│ └── modelos/
│
├── src/
│ ├── bronze/ # Scripts de ingestão (EL)
│ ├── prata/ # Scripts de tratamento e refino
│ └── ouro/ # Views e modelos analíticos
│
├── tests/
│ ├── qualidade/
│ ├── pipelines/
│ └── unit/ 
│
└── README.md # Documentação geral do projeto
```

## 🧾 Licença
Projeto disponibilizado sob licença MIT.
