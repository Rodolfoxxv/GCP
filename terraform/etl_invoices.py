import csv
import pandas as pd
import duckdb

# Lê o arquivo CSV com a biblioteca csv
with open('C:\\Users\\rodol\\Downloads\\archive\\Invoices.csv', 'r') as f:
    reader = csv.reader(f)
    data = list(reader)

# Corrige a coluna Participants
for row in data:
    row[5] = row[5].replace("['", "").replace("']", "").replace("' '", ";")

# Gera um DataFrame
df = pd.DataFrame(data[1:], columns=data[0])

# Passa o DataFrame para o DuckDB
duckdb_df = duckdb.from_df(df)



