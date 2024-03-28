

id: transform
namespace: dev
tasks:
  - id: sqlmesh
    type: io.kestra.plugin.sqlmesh.cli.SQLMeshCLI
    beforeCommands:
      - sqlmesh init duckdb
    commands:
      - sqlmesh plan --auto-apply


pip install "sqlmesh[bigquery]"

sqlmesh init bigquery