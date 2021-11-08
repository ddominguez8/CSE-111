import sqlite3
from sqlite3 import Error

# Some sample code provided by Florin Rusu.
# 2021/11/07

def openConnection(_dbFile):
    print("++++++++++++++++++++++++++++++++++")
    print("Open database: ", _dbFile)

    conn = None
    try:
        conn = sqlite3.connect(_dbFile)
        print("success")
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")

    return conn

def closeConnection(_conn, _dbFile):
    print("++++++++++++++++++++++++++++++++++")
    print("Close database: ", _dbFile)

    try:
        _conn.close()
        print("success")
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def createTable(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Create table")
    try: 
        sql = """CREATE TABLE warehouse(
                    w_warehousekey decimal (9,0) not null,
                    w_name char(100) not null,
                    w_capacity decimal(6,0) not null,
                    w_suppkey decimal(9,0) not null,
                    w_nationkey decimal(2,0) not null)"""
        _conn.execute(sql)

        _conn.commit()
    except Error as e:
        _conn.rollback()
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def dropTable(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Drop tables")

    try: 
        sql = "DROP TABLE warehouse"
        _conn.execute(sql)

        _conn.commit()
    except Error as e: 
        _conn.rollback()
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def populateTable(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Populate table")
        # Make two warehouses for each supplier.
    try:
        count = 0
        sql = """SELECT s_suppkey, n_name, s_nationkey, s_name
                FROM supplier, nation
                WHERE s_nationkey = n_nationkey""" 
        cur = _conn.cursor()
        cur.execute(sql)
        rows = cur.fetchall()
        for row in rows:
            name = row[3] + "___" + row[1]
            count = count + 1
            insertWarehouse(_conn,count,row[0],name,row[2])
            count = count + 1
            insertWarehouse(_conn,count,row[0],name,row[2])
    except Error as e: 
        _conn.rollback()
        print(e)



    print("++++++++++++++++++++++++++++++++++")

def insertWarehouse(_conn, _count, _suppkey, _nationname, _nationkey):
    try:
        sql = """INSERT INTO warehouse(w_warehousekey,
                    w_name, w_capacity, w_suppkey, w_nationkey)
                    VALUES(?, ?, 10, ?, ?)"""
        args = [_count, _nationname, _suppkey, _nationkey]
        _conn.execute(sql, args)

        _conn.commit()
    except Error as e:
        _conn.rollback()
        print(e)
    
def Q1(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q1")
    try:
        sql = """SELECT *
                FROM warehouse;"""
        cur = _conn.cursor()
        cur.execute(sql)
        
        # l = '{:>14} {:^30} {:^30} {:^30} {:^30}'.format("w_warehousekey","w_name","w_capacity", "w_suppkey","w_nationkey")
        # str.format equivalence just with f-strings for faster loads.
        l = f"{'w_warehousekey':>10} {'w_name':^30} {'w_capacity':^30} {'w_suppkey':^30} {'s_nationkey':^30}\n"
        with open("output/1.out", "w") as f:
            f.write(l)
        rows = cur.fetchall()
        for row in rows: 
            # l = '{:>14} {:<} {:=} {:^30} {:^30}'.format(row[0],row[1],row[2],row[3],row[4])
            l = f"{row[0]:>14} {row[1]:<} {row[2]:>20} {row[3]:>30} {row[4]:>30}\n" 
            with open("output/1.out", "a") as f:
                f.write(l)
    except Error as e:
        _conn.rollback()
        print(e)
    print("++++++++++++++++++++++++++++++++++")


def Q2(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q2")
    # try:
    #     sql = """ """
    #     cur = _conn.cursor()
    #     cur.execute(sql)
        
    #     #l = f"\n"
    #     with open("output/2.out", "w") as f:
    #         f.write(l)
    #     rows = cur.fetchall()
    #     for row in rows: 
    #         l = f"\n" 
    #         with open("output/2.out", "a") as f:
    #             f.write(l)
    # except Error as e:
    #     _conn.rollback()
    #     print(e)
    print("++++++++++++++++++++++++++++++++++")


def Q3(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q3")
    #     try:
    #     sql = """ """
    #     cur = _conn.cursor()
    #     cur.execute(sql)

    #     #l = f"\n"
    #     with open("output/3.out", "w") as f:
    #         f.write(l)
    #     rows = cur.fetchall()
    #     for row in rows: 
    #         l = f"\n" 
    #         with open("output/3.out", "a") as f:
    #             f.write(l)
    # except Error as e:
    #     _conn.rollback()
    #     print(e)
    print("++++++++++++++++++++++++++++++++++")


def Q4(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q4")
    #     try:
    #     sql = """ """
    #     cur = _conn.cursor()
    #     cur.execute(sql)

    #     #l = f"\n"
    #     with open("output/4.out", "w") as f:
    #         f.write(l)
    #     rows = cur.fetchall()
    #     for row in rows: 
    #         l = f"\n" 
    #         with open("output/4.out", "a") as f:
    #             f.write(l)
    # except Error as e:
    #     _conn.rollback()
    #     print(e)
    print("++++++++++++++++++++++++++++++++++")


def Q5(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q5")
    #     try:
    #     sql = """ """
    #     cur = _conn.cursor()
    #     cur.execute(sql)

    #     #l = f"\n"
    #     with open("output/5.out", "w") as f:
    #         f.write(l)
    #     rows = cur.fetchall()
    #     for row in rows: 
    #         l = f"\n" 
    #         with open("output/5.out", "a") as f:
    #             f.write(l)
    # except Error as e:
    #     _conn.rollback()
    #     print(e)
    print("++++++++++++++++++++++++++++++++++")


def main():
    database = r"tpch.sqlite"

    # create a database connection
    conn = openConnection(database)
    with conn:
        dropTable(conn)
        createTable(conn)
        populateTable(conn)

        Q1(conn)
        Q2(conn)
        Q3(conn)
        Q4(conn)
        Q5(conn)

    closeConnection(conn, database)


if __name__ == '__main__':
    main()
