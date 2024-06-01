import pandas as pd
import numpy as np

file_path = r'C:\Users\rodol\Downloads\Invoices.csv'

df = pd.read_csv(file_path, encoding='utf-8')

df['Meal_Price'] = df['Meal_Price'] + np.random.normal(0, 10, size=len(df))

meal_types = ['Breakfast', 'Lunch', 'Dinner']
df['Type_of_Meal'] = np.random.choice(meal_types, size=len(df), p=[0.2, 0.3, 0.5])

for column in ['Company_Id', 'Participants', 'Type_of_Meal']:
    if column == 'Participants':
        freq_table = df['Participants'].value_counts().reset_index()
    else:
        freq_table = df[column].value_counts().reset_index()

    freq_table.columns = [column, 'count']

    freq_table['rel_freq'] = freq_table['count'] / freq_table['count'].sum()

    freq_table['cum_freq'] = freq_table['rel_freq'].cumsum()

    freq_table.to_csv(f'C:\\Users\\rodol\\Downloads\\freq_{column}.csv', index=False)

df.to_csv(file_path, index=False)
