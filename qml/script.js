function getRandom(previousValue) {
    return Math.floor(previousValue + Math.random() * 90) % 360;

}

// ======================================================================================
// function tocheck the extension of filename (log)

function check(filename) {
    var str = filename.toString();
    console.log(".xlsx");
        return str.endsWith(".xlsx") ? true : false;

}


// ======================================================================================

function fillUser() {

        var db = LocalStorage.openDatabaseSync("ann", "", "Employe management", 1000000);
        var result = "";
        var list_bareme = [];
        try {
            db.transaction(function (tx) {
                result = tx.executeSql('SELECT * FROM users');
                for (var i = 0; i < result.rows.length; i++) {
                    list_bareme.push([result.rows.item(i).noms, result.rows.item(i).type, result.rows.item(i).email, result.rows.item(i).tel, result.rows.item(i).password])
                   }
            })
        } catch (err) {
            console.log("Error while updating table in database: " + err)
        };
        return list_bareme;

}
