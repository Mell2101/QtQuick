function createTable(tx, name)
{
    const sql =
              "CREATE TABLE IF NOT EXISTS "+name +" ("+
              "id INTEGER PRIMARY KEY,"+
              "One TEXT NOT NULL,"+
              "Two TEXT NOT NULL,"+
              "Three TEXT NOT NULL,"+
              "Four  TEXT NOT NULL"+
              ");"

    tx.executeSql(sql)


}

function addDataTable(tx, name, id, argOne, argTwo, argThree, argFour)
{
    const sql =
              "INSERT INTO "+name+" "+
              'VALUES("%1","%2","%3","%4","%5");'.arg(id).arg(argOne).arg(argTwo).arg(argThree).arg(argFour)

    tx.executeSql(sql)
}

function readTable(tx, name, model)
{
    const sql = 'SELECT * FROM '+name;
    var result = tx.executeSql(sql)

    for(var i = 0; i < result.rows.length; ++i)
    {

        model.appendRow({
                        id:result.rows.item(i).id,
                        columnOne:result.rows.item(i).One,
                        columnTwo:result.rows.item(i).Two,
                        columnThree:result.rows.item(i).Three,
                        columnFour:result.rows.item(i).Four
                        })



    }


}

