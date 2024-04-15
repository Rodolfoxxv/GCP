import pandas as pd
import duckdb

# Lendo o arquivo CSV com o pandas e e também quando existe várias linhas.
df = pd.read_csv('\\Invoices.csv', quotechar='"')

# Corrige a coluna Participants
# O erro do GCP foi aspas não fechadas na coluna Participants. 
# removi os caracteres desnecessários e troquei as vírgulas por ponto e vírgula.
# O uso de  ponto e vírgula é  para contar facilmente o número de participantes.
# Substitui as aspas duplas por ponto e vírgula
# Primeiro, vamos dividir a string onde encontramos aspas duplas
split_df = df['Participants'].str.split('"', expand=True)

# Agora, vamos substituir as vírgulas por ponto e vírgula nas partes ímpares do DataFrame (que são as partes dentro das aspas)
split_df.loc[:, 1::2] = split_df.loc[:, 1::2].replace(',', ';', regex=True)

# Finalmente, vamos juntar tudo de volta em uma única string
df['Participants'] = split_df.apply(lambda row: ''.join(row.values.astype(str)), axis=1)

# Adiciona um replace para remover as quebras de linha
df['Participants'] = df['Participants'].str.replace('\n', ' ')

# Remove as aspas duplas restantes
df['Participants'] = df['Participants'].str.replace('"', '')

# Remove o primeiro apóstrofo e substitui o segundo por um ponto e vírgula
df['Participants'] = df['Participants'].str.replace("'", "", 1).str.replace("'", ";", 1)
def process_string(s):
    # Divide a string em sequências separadas por vírgulas
    sequences = s.split(',')
    processed_sequences = []
    for seq in sequences:
        # Divide a sequência em grupos separados por apóstrofos
        groups = seq.split("'")
        processed_groups = []
        for i in range(0, len(groups), 2):
            # Adiciona o grupo original à lista de grupos processados
            processed_groups.append(groups[i])
            # Se houver um próximo grupo, substitui o primeiro apóstrofo por um ponto e vírgula
            if i + 1 < len(groups) and groups[i + 1].strip():
                processed_groups.append(";" + groups[i + 1].strip())
        # Junta os grupos processados de volta em uma única sequência
        processed_sequence = ''.join(processed_groups)
        # Remove o ponto e vírgula extra no final da sequência, se houver
        processed_sequence = processed_sequence.rstrip(';')
        # Remove o segundo ponto e vírgula quando há um espaço entre dois pontos e vírgulas
        processed_sequence = processed_sequence.replace("; ;", ";")
        # Remove o ponto e vírgula antes de um ']', se houver
        processed_sequence = processed_sequence.replace(";]", "]")
        processed_sequences.append(processed_sequence)
    # Junta as sequências processadas de volta em uma única string
    processed_string = ','.join(processed_sequences)
    # Remove os colchetes no início e no final da string, se houver
    processed_string = processed_string.replace("[", "").replace("]", "")
    return processed_string

# Aplica a função a cada elemento na coluna 'Participants'
df['Participants'] = df['Participants'].apply(process_string)


# Passa o DataFrame para o DuckDB
#  o DuckDB, um banco de dados orientado a colunas.
duckdb_df = duckdb.from_df(df)

# Salva o resultado como Invoices2.csv
# Novo arquivo CSV com as corrigido.
duckdb_df.to_csv('Invoices2.csv')