import sqlite3
from sqlite3 import Error

# Skeleton code provided by Florin Rusu. 
# 11/16/2021 David Dominguez

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


def create_View1(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Create V1")
    try:
        sql =""" CREATE VIEW V1 (c_custkey, c_name, c_address, c_phone, c_acctbal, c_mktsegment, c_comment, c_nation, c_region)
            AS 
            SELECT c_custkey, c_name, c_address, c_phone, c_acctbal, c_mktsegment, c_comment, n_name, r_name
            FROM customer, nation, region
            WHERE c_nationkey = n_nationkey 
            AND n_regionkey = r_regionkey;"""

        _conn.execute(sql)
        _conn.commit()
    except Error as e: 
        _conn.rollback()
        print(e)
    print("++++++++++++++++++++++++++++++++++")


def create_View2(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Create V2")
    try: 
        sql = """CREATE VIEW V2 (s_suppkey, s_name, s_address, s_phone, s_acctbal, s_comment, s_nation, s_region)
            AS
            SELECT s_suppkey, s_name, s_address, s_phone, s_acctbal, s_comment, n_name, r_name
            FROM supplier, nation, region 
            WHERE s_nationkey = n_nationkey 
            AND n_regionkey = r_regionkey;"""

        _conn.execute(sql)
        _conn.commit()
    except Error as e:
        _conn.rollback()
        print(e)
    print("++++++++++++++++++++++++++++++++++")


def create_View5(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Create V5")
    try: 
        # Figured out how to grab year from date via help from: https://www.designcise.com/web/tutorial/how-to-select-year-from-sqlite-date
        sql = """ CREATE VIEW V5 (o_orderkey, o_custkey, o_orderstatus, o_totalprice, o_orderyear, o_orderpriority, o_clerk, o_shippriority, o_comment)
            AS 
            SELECT o_orderkey, o_custkey, o_orderstatus, o_totalprice, strftime('%Y', o_orderdate) o_orderyear, o_orderpriority, o_clerk, o_shippriority, o_comment
            FROM orders;"""
        _conn.execute(sql)
        _conn.commit()

    except Error as e: 
        _conn.rollback()
        print(e)
    print("++++++++++++++++++++++++++++++++++")


def create_View10(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Create V10")
    try: 
        sql = """CREATE VIEW V10 (p_type, min_discount, max_discount) 
            AS
            SELECT DISTINCT p_type, MIN(l_discount), MAX(l_discount)
            FROM part, lineitem
            WHERE p_partkey = l_partkey 
            GROUP BY p_type; """
        _conn.execute(sql)
        _conn.commit()

    except Error as e: 
        _conn.rollback()
        print(e)
    print("++++++++++++++++++++++++++++++++++")


def create_View151(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Create V151")
    try: 
        sql = """CREATE VIEW V151 (c_custkey, c_name, c_nationkey, c_acctbal)
            AS 
            SELECT c_custkey, c_name, c_nationkey, c_acctbal 
            FROM customer
            WHERE c_acctbal > 0;"""

        _conn.execute(sql)
        _conn.commit()
    except Error as e: 
        _conn.rollback()
        print(e)
    print("++++++++++++++++++++++++++++++++++")


def create_View152(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Create V152")
    try: 
        sql = """CREATE VIEW V152 (s_suppkey, s_name, s_nationkey, s_acctbal)
            AS
            SELECT s_suppkey, s_name, s_nationkey, s_acctbal 
            FROM supplier
            WHERE s_acctbal < 0;"""
        _conn.execute(sql)
        _conn.commit()
    except Error as e: 
        _conn.rollback()
        print(e)
    print("++++++++++++++++++++++++++++++++++")


def Q1(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q1")
    try: 
        sql ="""SELECT c_name, sum(o_totalprice)
            FROM V1, orders 
            WHERE c_custkey = o_custkey AND
            c_nation = 'FRANCE' AND
            o_orderdate LIKE '1995-__-__'
            GROUP BY c_name;"""
        cur = _conn.cursor()
        cur.execute(sql)
        
        rows = cur.fetchall()
        for row in rows: 
            l = f"{row[0]:^10}|{row[1]:.2f}\n" 
            with open("output/1.out", "a") as f:
                f.write(l)
    except Error as e:
        _conn.rollback()
        print(e)
    print("++++++++++++++++++++++++++++++++++")


def Q2(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q2")
    try: 
        sql = """ SELECT s_region, count(*)
            FROM V2
            GROUP BY s_region;"""
    
        cur = _conn.cursor()
        cur.execute(sql)
        
        rows = cur.fetchall()
        for row in rows: 
            l = f"{row[0]}|{row[1]}\n" 
            with open("output/2.out", "a") as f:
                f.write(l)
    except Error as e:
        _conn.rollback()
        print(e)
    print("++++++++++++++++++++++++++++++++++")


def Q3(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q3")
    try: 
        sql = """ SELECT c_nation, COUNT(*)
            FROM V1, orders
            WHERE c_custkey = o_custkey
            AND c_region = 'AMERICA'
            GROUP BY c_nation;"""
    
        cur = _conn.cursor()
        cur.execute(sql)

        rows = cur.fetchall()
        for row in rows:
            l = f"{row[0]}|{row[1]}\n"
            with open("output/3.out", "a") as f: 
                f.write(l)
    except Error as e:
        _conn.rollback()
        print(e)
    print("++++++++++++++++++++++++++++++++++")


def Q4(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q4")
    try: 
        sql = """ SELECT s_name, COUNT(ps_partkey)
            FROM V2, part, partsupp
            WHERE p_partkey = ps_partkey
            AND ps_suppkey = s_suppkey
            AND s_nation = 'CANADA'
            AND p_size < 20
            GROUP BY s_name;"""
        cur = _conn.cursor()
        cur.execute(sql) 

        rows = cur.fetchall()
        for row in rows: 
            l = f"{row[0]}|{row[1]}\n"
            with open("output/4.out", "a") as f:
                f.write(l)
    
    except Error as e:
        _conn.rollback()
        print(e)
    print("++++++++++++++++++++++++++++++++++")


def Q5(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q5")
    try: 
        sql = """SELECT c_name, COUNT(*)
            FROM V1, V5
            WHERE c_nation = 'GERMANY'
            AND o_custkey = c_custkey
            AND o_orderyear like '1993'
            GROUP BY c_name;"""
        cur = _conn.cursor()
        cur.execute(sql) 

        rows = cur.fetchall()
        for row in rows: 
            l = f"{row[0]}|{row[1]}\n"
            with open("output/5.out", "a") as f:
                f.write(l)
    except Error as e:
        _conn.rollback()
        print(e)
    print("++++++++++++++++++++++++++++++++++")


def Q6(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q6")
    try: 
        sql = """SELECT s_name, o_orderpriority, COUNT(DISTINCT ps_partkey)
            FROM V5, supplier, partsupp, lineitem, nation
            WHERE l_orderkey = o_orderkey
            AND l_partkey = ps_partkey
            AND l_suppkey = ps_suppkey 
            AND ps_suppkey = s_suppkey
            AND s_nationkey = n_nationkey
            AND n_name = 'CANADA'
            GROUP BY s_name, o_orderpriority;"""
        cur = _conn.cursor()
        cur.execute(sql) 

        rows = cur.fetchall()
        for row in rows: 
            l = f"{row[0]}|{row[1]}|{row[2]}\n"
            with open("output/6.out", "a") as f:
                f.write(l)
    except Error as e:
        _conn.rollback()
        print(e)
    print("++++++++++++++++++++++++++++++++++")


def Q7(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q7")
    try: 
        sql = """SELECT c_nation, o_orderstatus, COUNT(*)
            FROM V1, V5
            WHERE o_custkey = c_custkey 
            AND c_region = 'AMERICA'
            GROUP BY c_nation, o_orderstatus;"""
        cur = _conn.cursor()
        cur.execute(sql) 

        rows = cur.fetchall()
        for row in rows: 
            l = f"{row[0]}|{row[1]}|{row[2]}\n"
            with open("output/7.out", "a") as f:
                f.write(l)
    except Error as e:
        _conn.rollback()
        print(e)
    print("++++++++++++++++++++++++++++++++++")


def Q8(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q8")
    try: 
        sql = """SELECT s_nation, COUNT(DISTINCT l_orderkey) as co
            FROM V2, V5, lineitem
            WHERE o_orderkey = l_orderkey
            AND l_suppkey = s_suppkey
            AND o_orderstatus = 'F'
            AND o_orderyear = '1995'
            GROUP BY s_nation 
            HAVING co > 50;"""
        cur = _conn.cursor()
        cur.execute(sql) 

        rows = cur.fetchall()
        for row in rows: 
            l = f"{row[0]}|{row[1]}\n"
            with open("output/8.out", "a") as f:
                f.write(l)
    except Error as e:
        _conn.rollback()
        print(e)
    print("++++++++++++++++++++++++++++++++++")


def Q9(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q9")
    try: 
        sql = """SELECT COUNT(DISTINCT o_clerk)
            FROM V2, V5, lineitem
            WHERE o_orderkey = l_orderkey
            AND l_suppkey = s_suppkey
            AND s_nation = 'UNITED STATES'"""
        cur = _conn.cursor()
        cur.execute(sql) 

        rows = cur.fetchall()
        for row in rows: 
            l = f"{row[0]}\n"
            with open("output/9.out", "a") as f:
                f.write(l)
    except Error as e:
        _conn.rollback()
        print(e)
    print("++++++++++++++++++++++++++++++++++")


def Q10(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q10")
    try: 
        sql = """SELECT p_type, min_discount, max_discount
            FROM V10
            WHERE p_type LIKE '%ECONOMY%'
            AND p_type LIKE '%COPPER%'
            GROUP BY p_type;"""

        cur = _conn.cursor()
        cur.execute(sql) 

        rows = cur.fetchall()
        for row in rows: 
            l = f"{row[0]}|{row[1]}|{row[2]}\n"
            with open("output/10.out", "a") as f:
                f.write(l)
    
    except Error as e:
        _conn.rollback()
        print(e)
    print("++++++++++++++++++++++++++++++++++")


def Q11(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q11")
    try: 
        sql = """SELECT s_region, s_name, MAX(s_acctbal)
            FROM V2 
            GROUP BY s_region;"""

        cur = _conn.cursor()
        cur.execute(sql) 

        rows = cur.fetchall()
        for row in rows: 
            l = f"{row[0]}|{row[1]}|{row[2]}\n"
            with open("output/11.out", "a") as f:
                f.write(l)
    except Error as e:
        _conn.rollback()
        print(e)
    print("++++++++++++++++++++++++++++++++++")


def Q12(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q12")
    try: 
        sql = """SELECT s_nation, MAX(s_acctbal) as mb
            FROM V2
            GROUP BY s_nation
            HAVING mb > 9000;"""
        cur = _conn.cursor()
        cur.execute(sql) 

        rows = cur.fetchall()
        for row in rows: 
            l = f"{row[0]}|{row[1]}\n"
            with open("output/12.out", "a") as f:
                f.write(l)
    except Error as e:
        _conn.rollback()
        print(e)
    print("++++++++++++++++++++++++++++++++++")


def Q13(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q13")
    try: 
        sql = """SELECT COUNT(*)
            FROM orders, lineitem, V1, V2
            WHERE o_orderkey = l_orderkey
            AND o_custkey = c_custkey 
            AND l_suppkey = s_suppkey 
            AND s_region = 'AFRICA' 
            AND c_nation = 'UNITED STATES';"""
        cur = _conn.cursor()
        cur.execute(sql) 

        rows = cur.fetchall()
        for row in rows: 
            l = f"{row[0]}\n"
            with open("output/13.out", "a") as f:
                f.write(l)
    
    except Error as e:
        _conn.rollback()
        print(e)
    print("++++++++++++++++++++++++++++++++++")


def Q14(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q14")
    try: 
        sql = """SELECT s_region, c_region, MAX(o_totalprice)
            FROM lineitem, V1, V2, orders
            WHERE l_suppkey = s_suppkey 
            AND l_orderkey = o_orderkey 
            AND o_custkey = c_custkey 
            GROUP BY s_region, c_region;"""
        
        cur = _conn.cursor()
        cur.execute(sql) 

        rows = cur.fetchall()
        for row in rows: 
            l = f"{row[0]}|{row[1]}|{row[2]}\n"
            with open("output/14.out", "a") as f:
                f.write(l)
    except Error as e:
        _conn.rollback()
        print(e)
    print("++++++++++++++++++++++++++++++++++")


def Q15(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q15")
    try: 
        sql = """SELECT COUNT(DISTINCT l_orderkey)
            FROM lineitem, V151, V152, orders
            WHERE l_suppkey = s_suppkey 
            AND l_orderkey = o_orderkey
            AND o_custkey = c_custkey;"""
        cur = _conn.cursor()
        cur.execute(sql) 

        rows = cur.fetchall()
        for row in rows: 
            l = f"{row[0]}\n"
            with open("output/15.out", "a") as f:
                f.write(l)
    except Error as e:
        _conn.rollback()
        print(e)
    print("++++++++++++++++++++++++++++++++++")


def main():
    database = r"tpch.sqlite"

    # create a database connection
    conn = openConnection(database)
    with conn:
        create_View1(conn)
        Q1(conn)

        create_View2(conn)
        Q2(conn)

        Q3(conn)
        Q4(conn)

        create_View5(conn)
        Q5(conn)

        Q6(conn)
        Q7(conn)
        Q8(conn)
        Q9(conn)

        create_View10(conn)
        Q10(conn)

        Q11(conn)
        Q12(conn)
        Q13(conn)
        Q14(conn)

        create_View151(conn)
        create_View152(conn)
        Q15(conn)

    closeConnection(conn, database)


if __name__ == '__main__':
    main()
