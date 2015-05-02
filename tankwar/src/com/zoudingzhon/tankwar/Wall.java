package com.zoudingzhon.tankwar;
import java.awt.Color;
import java.awt.Graphics;
import java.awt.Rectangle;
/**
 * �ܼ򵥾����м���ϰ���
 * @author �޶���
 *
 */
public class Wall {
	private int x=350,y=100;
	public final int HEIGHT = 250;
	public final int WIDTH = 40;
	
	public void draw(Graphics g)
	{
		g.setColor(Color.BLACK);
		g.fillRect(x, y, WIDTH , HEIGHT);
	}
	
	public Rectangle getRect()
	{
		return(new Rectangle(x,y,WIDTH,HEIGHT));
	}

}
