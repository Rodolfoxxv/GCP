import pandas as pd
import duckdb

# Lê o arquivo CSV com o pandas
df = pd.read_csv('C:\\Users\\rodol\\Downloads\\archive\\Invoices.csv', quotechar='"')

# Corrige a coluna Participants
df['Participants'] = df['Participants'].str.replace("[", "").str.replace("]", "").str.replace(", ", ";").str.replace('"', '')

# Passa o DataFrame para o DuckDB
duckdb_df = duckdb.from_df(df)

# Salva o resultado como Invoices2.csv
duckdb_df.to_csv('\\Invoices2.csv')
