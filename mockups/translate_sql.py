# %%
import sqlglot

# %%
in_sql_file = r"sqlmesh_bigquery\models\census_income_.sql"
with open(in_sql_file, "r", encoding="utf-8") as in_file:
    in_sql = in_file.read()
#  print(in_sql)
# %%
out_sql = sqlglot.transpile(
    in_sql.split(";")[1], read="duckdb", write="bigquery", identify=True, pretty=True
)[0]
print(out_sql)
# %%

# %%
