Use of SQL Spitter
==========================

Use YAML files to strip SQL statements from the program, and implement dynamic SQL through Jinja2.

.. pull-quote:: 
    Specify sql folder

.. code-block:: python

    from sql_splitter import SqlLoader


    # Configure the path of the sql folder
    SqlLoader.SQL_FILE_PATH = "/Users/kela/Program/open-sources/sql-splitter/sql_splitter/example/sql"
    loader = SqlLoader()

.. pull-quote:: 
    Load all sql statements

.. code-block:: python

    # All sql statements are loaded while the application is running
    loader.preload_all_sqls()
    print(f'All sqls: {loader.sqls}')


.. pull-quote:: 
    Gets the specified sql statement

.. code-block:: python

    # Obtain sql based on sql_id
    sql = loader.get(
        "user.index.query_user_info", options={}
    )
    print(f"current sql: {sql}")

.. pull-quote:: 
    Write sql statements sql/user/index.yml

.. code-block:: sql

    SELECT
        user.id,
        user.account_id,
        user.account_name,
        user.user_name,
        user.password,
        user.phone,
        user.is_delete,
        user.enable_flag,
        user.register_datetime,
        group.name AS group_name
    FROM user
    JOIN group ON user.group_id = group.id
    WHERE user.id = :user_id

.. pull-quote:: 
    Generate dynamic sql with the option parameter

.. code-block:: sql

    SELECT
        user.id,
        user.account_id,
        user.account_name,
        user.user_name,
        user.password,
        user.phone,
        user.is_delete,
        user.enable_flag,
        user.register_datetime,
        group.name AS group_name
    FROM user
    JOIN group ON user.group_id = group.id
    {% if user_id > 0 %}
    WHERE user.id = :user_id
    {% endif %}

.. code-block:: python

    # Obtain sql based on sql_id with option
    # Dynamic sql requires passing in parameters to be filtered
    sql = loader.get(
        "user.index.query_user_info", 
        options={
            'user_id': 1
        }
    )
    print(f"current sql: {sql}")
    # 生成的sql语句
    """
    SELECT
        user.id,
        user.account_id,
        user.account_name,
        user.user_name,
        user.password,
        user.phone,
        user.is_delete,
        user.enable_flag,
        user.register_datetime,
        group.name AS group_name
    FROM user
    JOIN group ON user.group_id = group.id
    WHERE user.id = :user_id
    """
    