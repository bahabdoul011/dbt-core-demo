# dbt BigQuery Project – Analytics Engineering

Bienvenue dans ce projet **dbt** basé sur **Google BigQuery**.  
Ce dépôt contient la couche de transformation analytique permettant de transformer
les données brutes en tables fiables, testées et prêtes pour l’analyse.

---

## 🚀 À propos de dbt

**dbt (data build tool)** est un outil de transformation de données qui permet de :

- Transformer les données directement dans BigQuery à l’aide de SQL
- Appliquer des bonnes pratiques de génie logiciel (tests, documentation, versioning)
- Construire une couche analytique fiable et maintenable

dbt se concentre sur le **T de ELT** : les données sont déjà chargées dans BigQuery.

---

## 🏗 Structure du projet

```text
├── analyses/             # Analyses SQL ad hoc
├── macros/               # Macros SQL réutilisables
├── models/               # Modèles dbt (transformations)
│   ├── staging/          # Données sources nettoyées
│   ├── intermediate/    # Logique métier intermédiaire
│   └── marts/           # Tables finales (facts & dimensions)
├── seeds/                # Données de référence statiques (CSV)
├── snapshots/            # Slowly Changing Dimensions (SCD)
├── tests/                # Tests personnalisés
├── dbt_project.yml       # Configuration du projet dbt
└── README.md
```

## 🧰 Prérequis

Python 3.9+

dbt installé avec l’adapter BigQuery

Accès à un projet Google Cloud

Droits sur BigQuery (datasets, tables)

* pip install dbt-core dbt-bigquery

### Configurer le fichier profiles.yml :

my_dbt_project:
  target: dev
  outputs:
    dev:
      type: bigquery
      method: oauth
      project: your-gcp-project
      dataset: dbt_dev
      location: EU
      threads: 4


### Using the starter project

Try running the following commands:
- dbt run
- dbt test

## 📊 Matérialisation BigQuery

Bonnes pratiques utilisées :

staging → view

intermediate → table

marts → table partitionnée et clusterisée

## Schéma de flux (ELT) – simple
  A[Sources / Raw tables (BigQuery)] --> B[dbt staging]
  B --> C[dbt intermediate]
  C --> D[dbt marts]
  D --> E[BI / Dashboards / Analytics]


## Schéma de structure des modèles (staging → marts)
  subgraph Models
    S[staging\n(clean + rename)] --> I[intermediate\n(joins + business logic)]
    I --> M[marts\n(facts + dimensions)]
  end


##✅ Qualité des données

Ce projet inclut :

Tests not_null et unique

Tests de relations entre tables

Tests métiers personnalisés

Vérification de fraîcheur des sources

Objectif : fiabilité et confiance dans les données analytiques.

## La documentation inclut :

Description des modèles

Détails des colonnes

Lineage des données

Sources BigQuery

## 🧠 Bonnes pratiques dbt + BigQuery

✔ Utilisation des sources
✔ Modèles staging légers
✔ Partitionnement pour réduire les coûts
✔ Clustering pour optimiser les performances
✔ Documentation des modèles finaux
✔ SQL lisible et modulaire

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
