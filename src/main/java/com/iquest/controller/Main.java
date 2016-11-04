package com.iquest.controller;

import com.iquest.db.DBConnector;

import org.neo4j.driver.v1.Session;

/**
 * Created by marian.david on 11/4/2016.
 */
public class Main {
  public static void main(String[] args) {
    Session session = DBConnector.getSession();
    session.run("CREATE (u:User {name:'David', title:'Catalin'})");
    session.close();
  }
}
