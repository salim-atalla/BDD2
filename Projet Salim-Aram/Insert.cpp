#include <iostream>
#include <fstream>

using namespace std;




void InsertElementToSQLFile (string fileName) {

    ofstream myfile;
    myfile.open (fileName, fstream::app);

    string InsertKeyword = "INSERT INTO";
    string tableName = "";
    string values = "VALUES";

    string line = "";

    cout << "Enter the table name .." << endl;
    cin >> tableName;

    while (tableName != "-") {
        cout << "Enter a new line .." << endl;
        cin >> line;

        while (line != "-" ) {
            myfile << InsertKeyword << " " << tableName << " " << values << " (" << line << "" << ");\n";
            cout << "Enter a new line .." << endl;
            cin >> line;
        }
        cout << "Enter the table name .." << endl;
        cin >> tableName;
    }

    myfile.close();
}






int main () {

    string file = "default.sql";

    cout << "Enter the file name .." << endl;
    cin >> file;

    InsertElementToSQLFile (file);

    return 0;
}