// The script below is an example in which a MYSQL database connection has been created and it has some methods to READ, WRITE, UPDATE and DELETE (CRUD) data in the database.
// This example is based on https://github.com/fjenett/sql-library-processing/tree/master/examples/MySQL_example1

import de.bezier.data.sql.*;

MySQL msql;
public int recordCount = 0;
public String Username = "TMH"; //VOER JE NAAM HIER IN. BESTAAT UIT DRIE LETTERS EN KAN AL EERDER ZIJN GEBRUIKT
public int punten;

// This is a data model class to reflect the content of the User entity from the database.
class RecordUser{
 
   public String Username;
   public int punten;
 
   public RecordUser(String Username, int punten){
     this.Username = Username; 
     this.punten = punten;
   }   
}


String text[] = new String[2];


ArrayList<RecordUser> dbUsers; 
int positionYSpacing = 36;        // The spacing height between lines

String dbHostID = "oege.ie.hva.nl";    // ip address, domain or hostname such as localhost
String dbUsername = "prinzy";
String dbUserPass = "AvyYcRTK1z0dQ6"; //Q+d29QD#XFr6KN
String dbSchema = "zprinzy";
    
void DatabasePrep()
{
    //size( 1280, 720 );     // A randomly chosen window size
    //background(0);         // A black background because we would like to simulate old DOS style

    dbUsers = new ArrayList<RecordUser>();
    
    CreateDatabaseConnection();
    //AllScores(); // functie hier onder
}


void CreateDatabaseConnection()
{
    msql = new MySQL( this, dbHostID, dbSchema, dbUsername, dbUserPass );
}

void AllScores()
{
    if ( msql.connect() )
    {
      println("boop");
        println("doop");
        msql.query("INSERT INTO Highscore (Username, score) values ('"+ Username +"', '"+ punten +"')");
        println("drie");
        //msql.query("DELETE FROM Highscore WHERE Username = 'dud'");
        println( "Username \t\t score \t\t " );
        println( "==================================================" );
        msql.query("SELECT * FROM Highscore ORDER BY score DESC" );
        
        //int recordCount = 0; // aantal records in de database
        while( msql.next() )
        {        
          println(msql.getString("Username") + " \t\t " + msql.getInt("score") );
          dbUsers.add(new RecordUser(msql.getString("Username"), msql.getInt("score")));
          recordCount++;
        }
        println("Number of records: " + recordCount );
    }
    else
    {
        // connection failed !
        
        // - check your login, password
        // - check that your server runs on localhost and that the port is set right
        // - try connecting through other means (terminal or console / MySQL workbench / ...)
        println( " Failed to create MYSQL connection." );
    }
}


void DatabaseText(){
  
    textSize(50);      // A randomly chosen size
    //fill(51, 255, 0);  // old DOS green
    
    int positionY = positionYSpacing;
    text("Username", 100, positionY);
    text("Score", 250, positionY); 
    for(RecordUser record : dbUsers){
      
      text("" + record.Username, 100, positionY+50); 
      text("" + record.punten, 250, positionY+50);
      positionY += positionYSpacing;
    }

}
