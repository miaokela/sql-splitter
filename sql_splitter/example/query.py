from sql_splitter import SqlLoader


# Configure the path of the sql folder
SqlLoader.SQL_FILE_PATH = "/Users/kela/Program/open-sources/sql-splitter/sql_splitter/example/sql"
loader = SqlLoader()

# All sql statements are loaded while the application is running
loader.preload_all_sqls()
print(f'All sqls: {loader.sqls}')

# Obtain sql based on sql_id
sql = loader.get(
    "user.index.query_user_info", options={}
)
print(f"current sql: {sql}")
