package com.iquest.db;

import org.apache.log4j.Logger;
import org.neo4j.driver.v1.AuthTokens;
import org.neo4j.driver.v1.Driver;
import org.neo4j.driver.v1.GraphDatabase;
import org.neo4j.driver.v1.Session;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Created by marian.david on 11/4/2016.
 */
public class DBConnector {
  private static final String CREDENTIALS_FILE_PATH = "target/classes/credentials.properties";
  private static final String USERNAME_CREDENTIAL_PROPERTY = "neo4j.user";
  private static final String PASSWORD_CREDENTIAL_PROPERTY = "neo4j.password";

  private static Driver driver;
  final static Logger logger = Logger.getLogger(DBConnector.class);

  public DBConnector() {
    createDriver();
  }

  public static synchronized Session getSession() {
    if (driver == null) {
      logger.info("Graph driver wasn't created. Create driver..");
      driver = getInstance();
    }
    return driver.session();
  }

  public static synchronized Driver getInstance() {
    if (driver == null) {
      driver = new DBConnector().getDriver();
    }
    return driver;
  }

  private void createDriver() {
    Properties credentialsProp = new Properties();
    InputStream inputStream = null;
    try {
      inputStream = new FileInputStream(CREDENTIALS_FILE_PATH);
      credentialsProp.load(inputStream);

      logger.info("Read database credentials..");
      String dbUsername = credentialsProp.getProperty(USERNAME_CREDENTIAL_PROPERTY);
      String dbPassword = credentialsProp.getProperty(PASSWORD_CREDENTIAL_PROPERTY);

      driver = GraphDatabase.driver("bolt://localhost", AuthTokens.basic(dbUsername, dbPassword));
      logger.info("Graph driver was successfully created.");
    } catch (IOException ex) {
      logger.info("Database credentials cannot be obtained due to ." + ex.getMessage());
      ex.printStackTrace();
    } finally {
      if (inputStream != null) {
        try {
          inputStream.close();
        } catch (IOException ex) {
          logger.info("Stream that reads from property file cannot be close due to " + ex.getMessage());
          ex.printStackTrace();
        }
      }
    }
  }


  public Driver getDriver() {
    return driver;
  }
}
