import pandas as pd
import numpy as np


file_path = r'C:\Users\rodol\Downloads\freqinvoice.csv'


df = pd.read_csv(file_path, encoding='utf-8')


df['Meal_Price'] = df['Meal_Price'] + np.random.normal(0, 10, size=len(df))


meal_types = ['Breakfast', 'Lunch', 'Dinner']
df['Type_of_Meal'] = np.random.choice(meal_types, size=len(df), p=[0.24, 0.33, 0.43])

# Salvar o DataFrame modificado
df.to_csv(file_path, index=False)
