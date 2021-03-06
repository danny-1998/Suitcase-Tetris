// The script below is an example in which a MYSQL database connection has been created and it has some methods to READ, WRITE, UPDATE and DELETE (CRUD) data in the database.
// This example is based on https://github.com/fjenett/sql-library-processing/tree/master/examples/MySQL_example1
//by yves and Danny
import de.bezier.data.sql.*;

MySQL msql;
public int recordCount = 0;
public String Username = "err";
public String Password;
public int punten;
public int databaseID;
public String databaseName;
public String databasePass;
public int highscore;
public int time;
public int gamesPlayed;

// This is a data model class to reflect the content of the User entity from the database.
class RecordUser {

  public String Username;
  public String Password;
  public int punten;

  public RecordUser(String Username, int punten) {
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
  if ( msql.connect() ) //conncect met database
  {
    println("boop");
    println("doop");
    println("I'm in");
    msql.query("INSERT INTO Highscore (User_id, score) values("+ databaseID +", "+ punten +")"); //doe een query
    //msql.query("DELETE FROM Highscore WHERE Username = 'dud'"); //delete a specific user entry
    println( "Username \t\t score \t\t " );
    println( "==================================================" );
    msql.query("SELECT Highscore.User_id, Highscore.score, User.Username FROM Highscore INNER JOIN User ON Highscore.User_id=User.User_id ORDER BY Highscore.score DESC");

    //int recordCount = 0; // aantal records in de database 
    while ( msql.next() ) { //als er in de database tabel nog entries zijn, ga dan nog eens door het volgende: 
      println(msql.getString("User_id") + " \t\t " + msql.getInt("score") ); 
      dbUsers.add(new RecordUser(msql.getString("User.Username"), msql.getInt("Highscore.Score"))); // idk om eerlijk te zijn 
      recordCount++;
    } 
    msql.query("SELECT User.Username, MAX(Highscore.score) FROM Highscore JOIN User ON User.User_id = Highscore.User_id WHERE Highscore.User_id = '"+ databaseID +"'"); 
    while (msql.next()) { 
      highscore = msql.getInt("MAX(Highscore.score)");
    }
    time = millis();
    msql.query("SELECT * FROM Stat WHERE User_id = " + databaseID);
    while(msql.next()){
    time += (msql.getInt("Time_played"));
    gamesPlayed = msql.getInt("Number_of_games");
    }
    println("runt dit?");
    msql.query("UPDATE Stat SET Time_played = " + time + ", Number_of_games = " + (gamesPlayed+1)+ " WHERE User_id = " + databaseID);
    println("dit runt");
  } else
  {
    // connection failed !

    // - check your login, password
    // - check that your server runs on localhost and that the port is set right
    // - try connecting through other means (terminal or console / MySQL workbench / ...)
    println( " Failed to create MYSQL connection." );
  }
}

boolean passcheck = false;

void Login() {
  println("beginning login process...");
  if (msql.connect() ) { //connecting to database
    println("starting query");
    msql.query("SELECT * FROM User WHERE Username = '" + home.userName + "'"); //query om te zoeken naar de username die je hebt opgeschreven op het inlogscherm
    println("query done");
    println("checking credentials...");
    while (msql.next()) { // dit moet je gebruiken als je msql.getString wilt gebruiken (for some reason)
      databaseName = msql.getString("Username");
      println("naam in database: " + databaseName);
      println("ingevoerde naam: " + home.userName);
      databasePass = msql.getString("Password");
      println("pass in database: " + databasePass);
      println("ingevoerde pass: " + home.passWord);
    }
    if (databaseName.equals(home.userName)) { //.equals gebruik je voor vergelijken van Strings in plaats van ==
      println("user exists");
      if (databasePass.equals(home.passWord)) {
        println("correct password, welcome " + home.userName);
        Username = home.userName;
        home.gameState = "levelSelect";
        msql.query("SELECT U.User_id FROM User U WHERE Username = '" + home.userName + "'"); 
        while (msql.next()) { 
          databaseID = msql.getInt("User_id"); 
          println(databaseID);
        }
        msql.query("SELECT * FROM Setting WHERE User_id = "+ databaseID);
        while (msql.next()) {
          home.slide = msql.getInt("Music_volume");
          home.on = msql.getInt("SFX_volume");
          home.xmas = msql.getInt("Xmas_mode");
          home.sprite = msql.getInt("Spriteset");
          println(home.slide);
        }
      } else {
        println("you stupid");
        passcheck = true;
      }
    } else {
      println("new user detected. making account...");
      msql.query("INSERT INTO User (Username, Password) values ('"+ home.userName +"', '"+ home.passWord +"')"); //stop een nieuwe user in de User tabel in de database met de naam en het wachtwoord wat is opgeschreven in het startscherm
      println("new user created");
      msql.query("SELECT User_id FROM User WHERE Username = '" + home.userName + "'");
      println("check user_id");
      while (msql.next()) {
        databaseID = msql.getInt("User_id");
        println("User_id = " + databaseID);
      }
      msql.query("INSERT INTO Setting (User_id, Music_volume, SFX_volume, Spriteset, Xmas_mode) VALUES ('"+ databaseID +"', '100', '0', '0', '0')");
      println("default settings created");
      msql.query("INSERT INTO Stat (User_id, Time_played, Number_of_games) VALUES ('"+ databaseID +"', '0', '0')");
      println("default test data created");
      Username = home.userName;
      home.gameState = "levelSelect";
    }
  } else
  {
    // connection failed !

    // - check your login, password
    // - check that your server runs on localhost and that the port is set right
    // - try connecting through other means (terminal or console / MySQL workbench / ...)
    println( " Failed to create MYSQL connection." );
  }
}



void DatabaseText() {

  textSize(50);      // A randomly chosen size
  //fill(51, 255, 0);  // old DOS green

  int positionY = positionYSpacing;
  text("Personal Best", 500, positionY); 
  text(home.userName, 500, positionY*2); 
  text(highscore, 650, positionY*2); 
  text("Username", 100, positionY);
  text("Score", 250, positionY); 
  for (RecordUser record : dbUsers) {

    text(record.Username, 100, positionY+50); 
    text(record.punten, 250, positionY+50);
    positionY += positionYSpacing;
  }
}
