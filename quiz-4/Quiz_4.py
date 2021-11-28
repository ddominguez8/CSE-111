import sqlite3
from sqlite3 import Error


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


def createPriceRange(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Create PriceRange")
    try: 
        sql = """CREATE VIEW PriceRange(maker, type, minPrice, maxPrice)
            AS
            SELECT pr.maker, pr.type, MIN(pc.price), MAX(pc.price)
            FROM PC pc, Product pr
            WHERE pr.model = pc.model
            GROUP BY pr.maker
            UNION 
            SELECT pr.maker, pr.type, MIN(l.price), MAX(l.price)
            FROM Laptop l, Product pr
            WHERE pr.model = l.model 
            GROUP BY pr.maker
            UNION 
            SELECT pr.maker, pr.type, MIN(p.price), MAX(p.price)
            FROM Printer p, Product pr
            WHERE pr.model = p.model 
            GROUP BY pr.maker;"""
        _conn.execute(sql)
        _conn.commit()

    except Error as e: 
        _conn.rollback()
        print(e)
    print("++++++++++++++++++++++++++++++++++")


def printPriceRange(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Print PriceRange")

    try: 
        sql = """SELECT * 
            FROM PriceRange
            ORDER BY maker, type ASC;"""
        cur = _conn.cursor()
        cur.execute(sql)
        rows = cur.fetchall()

        l = '{:<10} {:<20} {:>20} {:>20}'.format("maker", "product", "minPrice", "maxPrice")
        print(l)
        for row in rows:
            l = f"{row[0]:<10} {row[1]:<20} {row[2]:>20} {row[3]:>20}"
            print(l)
    except Error as e: 
        _conn.rollback()
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def insertPC(_conn, _maker, _model, _speed, _ram, _hd, _price):
    print("++++++++++++++++++++++++++++++++++")
    l = 'Insert PC ({}, {}, {}, {}, {}, {})'.format(_maker, _model, _speed, _ram, _hd, _price)
    print(l)
    try: 
        sql = """INSERT INTO PC(model, speed, ram, hd, price) VALUES(?, ?, ?, ?, ?);"""
        args = [_model, _speed, _ram, _hd, _price]
        
        _conn.execute(sql, args)
        _conn.commit()
        
        sql = """INSERT INTO Product(maker, model, type) VALUES(?, ?, 'pc')"""
        args = [_maker, _model]
        _conn.execute(sql, args)
        _conn.commit()

    except Error as e:
        _conn.rollback()
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def updatePrinter(_conn, _model, _price):
    print("++++++++++++++++++++++++++++++++++")
    l = 'Update Printer ({}, {})'.format(_model, _price)
    print(l)
    try: 
        sql = """UPDATE Printer 
            SET price = ? 
            WHERE model = ? ;"""
        args = [_price, _model]
        _conn.execute(sql, args)
        _conn.commit()
    
    except Error as e:
        _conn.rollback()
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def deleteLaptop(_conn, _model):
    print("++++++++++++++++++++++++++++++++++")
    l = 'Delete Laptop ({})'.format(_model)
    print(l)

    try: 
        sql = """DELETE FROM Laptop
            WHERE model = ?;"""
        args = [_model]
        _conn.execute(sql, args)
        _conn.commit()

    except Error as e: 
        _conn.rollback()
        print(e)
    print("++++++++++++++++++++++++++++++++++")


def main():
    database = r"data.sqlite"

    # create a database connection
    conn = openConnection(database)
    with conn:
        createPriceRange(conn)
        printPriceRange(conn)

        file = open('input.in', 'r')
        lines = file.readlines()
        for line in lines:
            print(line.strip())

            tok = line.strip().split(' ')
            if tok[0] == 'I':
                insertPC(conn, tok[2], tok[3], tok[4], tok[5], tok[6], tok[7])
            elif tok[0] == 'U':
                updatePrinter(conn, tok[2], tok[3])
            elif tok[0] == 'D':
                deleteLaptop(conn, tok[2])

            printPriceRange(conn)

        file.close()

    closeConnection(conn, database)


if __name__ == '__main__':
    main()
