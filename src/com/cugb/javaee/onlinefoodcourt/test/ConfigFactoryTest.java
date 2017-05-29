package com.cugb.javaee.onlinefoodcourt.test;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import com.cugb.javaee.onlinefoodcourt.utils.ConfigFactory;

public class ConfigFactoryTest {

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void test() {
		assertEquals("root", ConfigFactory.readProperty("username"));
	}

}
