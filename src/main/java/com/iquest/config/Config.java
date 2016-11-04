package com.iquest.config;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class Config {
	private static final SessionFactory factory = new Configuration().configure().buildSessionFactory();

	public static SessionFactory getGlobalSessionFactory() {
		return factory;
	}
}
