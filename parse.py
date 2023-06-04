import csv
import mysql.connector as sql
from mysql.connector import Error

# Funcao que executa uma stored procedure com os argumentos de um ficheiro CSV
def execute_procedure_from_csv(connection, cursor, filename, procedure_name, num_arguments):
    try:
        with open(filename, 'r') as file:
            csvreader = csv.reader(file)
            next(csvreader)  # da skip a primeira linha do ficheiro (cabecalho)

            for row in csvreader:
                # da skip a linhas vazias
                arguments = [row[i] for i in range(num_arguments)]
                
                # executa a stored procedure com os argumentos da linha atual
                cursor.callproc(procedure_name, arguments)
                
            # faz commit das alteracoes
            connection.commit()
            print("Stored procedure executed successfully.")
    except Exception as e:
        print("Error executing stored procedure:", e)

try:
    connection = sql.connect(
        host="127.0.0.1",
        database="autovrumvrum",
        user="root",
        password="lapata2002"
    )

    if connection.is_connected():
        db_Info = connection.get_server_info()
        print("Connected to MySQL Server version ", db_Info)
        cursor = connection.cursor()
        cursor.execute("select database();")
        record = cursor.fetchone()
        print("You're connected to database: ", record)

        execute_procedure_from_csv(connection, cursor, "./CSV/fornecedor.csv", "insere_fornecedor", 3)
        execute_procedure_from_csv(connection, cursor, "./CSV/funcionario.csv", "insere_funcionario", 5)
        execute_procedure_from_csv(connection, cursor, "./CSV/clientes.csv", "insere_cliente", 5)
        execute_procedure_from_csv(connection, cursor, "./CSV/carros.csv", "insere_carro", 9)
        execute_procedure_from_csv(connection, cursor, "./CSV/compra.csv", "insere_compra", 5)
        execute_procedure_from_csv(connection, cursor, "./CSV/venda.csv", "insere_venda", 5)
        execute_procedure_from_csv(connection, cursor, "./CSV/testdrive.csv", "insere_TestDrive", 4)
        execute_procedure_from_csv(connection, cursor, "./CSV/telemovelCliente.csv", "insere_tlm_Cliente", 2)
        execute_procedure_from_csv(connection, cursor, "./CSV/emailCliente.csv", "insere_email_Cliente", 2)
        execute_procedure_from_csv(connection, cursor, "./CSV/emailFornecedor.csv", "insere_email_Fornecedor", 2)
        execute_procedure_from_csv(connection, cursor, "./CSV/telemovelFornecedor.csv", "insere_tlm_Fornecedor", 2)
        execute_procedure_from_csv(connection, cursor, "./CSV/telemovelFuncionario.csv", "insere_tlm_Funcionario", 2)
        execute_procedure_from_csv(connection, cursor, "./CSV/emailFuncionario.csv", "insere_email_Funcionario", 2)
        execute_procedure_from_csv(connection, cursor, "./CSV/emailFuncionario.csv", "insere_email_Funcionario", 2)
   
except Error as e:
    print("Error while connecting to MySQL", e)
finally:
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("MySQL connection is closed")


