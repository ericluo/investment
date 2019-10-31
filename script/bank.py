#%%
import pandas as pd
b = pd.read_excel("E:\\OneDrive\\data\\banks.xlsx", index_col=0).T
list(b.columns)
b[['净利差','净息差']].plot()

# %%
b