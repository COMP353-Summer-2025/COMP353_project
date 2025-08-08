from flask import Flask, render_template, request
import mysql.connector

app = Flask(__name__)


connection = mysql.connector.connect(
    host="luc353.encs.concordia.ca",
    user="luc353_1",
    password="comp353p",
    database="luc353_1"
)

tables = [
    "Locations", "ClubMembers", "TeamPlayers", "FamilyMembers", "SecondaryFamilyMembers", "FamilyMemberLocation",
    "Personnel", "PersonnelLocation", "Hobbies", "ClubMemberHobbies",
    "Teams", "TeamFormations", "MemberFamilyRelations", "EmailLogs", "Payments"
]

@app.route('/')
def home():
    return render_template('home.html', tables=tables)

@app.route('/table/<table_name>')
def show_table(table_name):
    if table_name not in tables:
        return f"Table {table_name} not found.", 404
    cursor = connection.cursor(dictionary=True)
    cursor.execute(f"SELECT * FROM {table_name}")
    rows = cursor.fetchall()
    
    # If the table is empty, get columns from the description to avoid an error
    if not rows:
        cursor.execute(f"DESCRIBE {table_name}")
        columns = [field['Field'] for field in cursor.fetchall()]
    else:
        columns = rows[0].keys()
    
    return render_template('table_view.html', table=table_name, columns=columns, rows=rows)

# Add create_table and delete_table routes
@app.route('/create_table', methods=['POST'])
def create_table():
    table_name = request.form['table_name']
    column_definitions = request.form['columns']
    try:
        cursor = connection.cursor()
        cursor.execute(f"CREATE TABLE {table_name} ({column_definitions})")
        connection.commit()
        tables.append(table_name)
        return f"Table {table_name} created successfully! <a href='/'>Return</a>"
    except Exception as e:
        return f"Error creating table: {e} <a href='/'>Return</a>"


@app.route('/delete_table', methods=['POST'])
def delete_table():
    table_name = request.form['delete_table_name']
    if table_name not in tables:
        return f"Table {table_name} not found. <a href='/'>Return</a>"
    try:
        cursor = connection.cursor()
        cursor.execute(f"DROP TABLE {table_name}")
        connection.commit()
        tables.remove(table_name)
        return f"Table {table_name} deleted successfully! <a href='/'>Return</a>"
    except Exception as e:
        return f"Error deleting table: {e} <a href='/'>Return</a>"

@app.route('/insert_row/<table>', methods=['POST'])
def insert_row(table):
    cursor = connection.cursor()
    columns = request.form.to_dict()
    filtered_columns = {k: v for k, v in columns.items() if v}
    
    if not filtered_columns:
        return f"No data submitted. <a href='/table/{table}'>Return</a>"

    col_names = ', '.join(filtered_columns.keys())
    placeholders = ', '.join(['%s'] * len(filtered_columns))
    values = list(filtered_columns.values())

    try:
        cursor.execute(f"INSERT INTO {table} ({col_names}) VALUES ({placeholders})", values)
        connection.commit()
        return f"Row inserted into {table} successfully. <a href='/table/{table}'>Return</a>"
    except Exception as e:
        return f"Error inserting row into {table}: {e} <a href='/table/{table}'>Return</a>"


@app.route('/edit_row/<table>', methods=['POST'])
def edit_row(table):
    cursor = connection.cursor()
    pk_column = request.form['pk_column']
    pk_value = request.form['pk_value']
    updates = {k: v for k, v in request.form.items() if k not in ['pk_column', 'pk_value'] and v.strip()}

    if not updates:
        return f"No fields to update. <a href='/table/{table}'>Return</a>"

    set_clause = ', '.join([f"{k} = %s" for k in updates])
    values = list(updates.values()) + [pk_value]

    try:
        cursor.execute(f"UPDATE {table} SET {set_clause} WHERE {pk_column} = %s", values)
        connection.commit()
        return f"Row updated in {table} successfully. <a href='/table/{table}'>Return</a>"
    except Exception as e:
        return f"Error editing row in {table}: {e} <a href='/table/{table}'>Return</a>"


@app.route('/delete_row/<table>', methods=['POST'])
def delete_row(table):
    cursor = connection.cursor()
    pk_column = request.form['pk_column']
    pk_value = request.form['pk_value']

    try:
        cursor.execute(f"DELETE FROM {table} WHERE {pk_column} = %s", (pk_value,))
        connection.commit()
        return f"Row deleted from {table} successfully. <a href='/table/{table}'>Return</a>"
    except Exception as e:
        return f"Error deleting row from {table}: {e} <a href='/table/{table}'>Return</a>"


# This must be at the end of the file
if __name__ == '__main__':
    app.run(debug=True)