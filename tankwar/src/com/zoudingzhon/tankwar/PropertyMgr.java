package com.zoudingzhon.tankwar;

import java.io.IOException;
import java.util.Properties;

/**
 * �������������ļ����� �Ѿ������ڴ� ʹ�þ�̬��������
 * @author �޶���
 *
 */
public class PropertyMgr {
	static Properties props;
	static
	{
	 props = new Properties();
	try {
		props.load(PropertyMgr.class.getClassLoader().getResourceAsStream("config/tankwar.properties"));
	} catch (IOException e1) {
		e1.printStackTrace();
	}
	}	
    static int initEnemyTankAmount = Integer.parseInt(props.getProperty("initEnemyTankAmount")); 
    static int getInitEnemyTankAmount ()
	{
		return initEnemyTankAmount;
	}
}
