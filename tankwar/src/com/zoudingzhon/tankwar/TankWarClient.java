package com.zoudingzhon.tankwar;

import java.awt.Color;
import java.awt.Font;
import java.awt.Frame;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;

/**
 * �����������ܵ��� ���еĻ��ƿ��ƶ�Ҫͨ��������˽���
 * @author �޶���
 *
 */
public class TankWarClient extends Frame {

	public static int SIZE_X = 800;
	public static int SIZE_Y = 600;
	
//	�����ӵ��뱬ը�͵з�̹�˵�����
	List<Bullet> bullets = new ArrayList<Bullet>();
	private Tank myTank;
    List<Tank> tanks = new LinkedList<Tank>();
    List<Bomb> bombs = new ArrayList<Bomb>();
    Wall wall = new Wall();
    Image offScreenImage = null;
    
//    ս���Ĳ������빹��ĵط�
	public void frameLaunch()
	{
//		������ͨ�������ļ������ó�ʼ̹������
	    int initEnemyTankAmount = PropertyMgr.getInitEnemyTankAmount();
		for(int i=0;i<initEnemyTankAmount;i++)
		{
			Tank t =new Tank((int)(770*Math.random()),(int)(30+540*Math.random()),false,this);
			tanks.add(t);
		}
		this.setBackground(Color.GRAY);
		this.setResizable(false);
		this.setTitle("TankWar");
		this.setSize(SIZE_X, SIZE_Y);
		this.setLocation(300, 100);
		this.setVisible(true);
		this.addKeyListener(new KeyMoniter());
		this.addWindowListener(new WindowAdapter()
		{
			public void windowClosing(WindowEvent e) {				
			System.exit(0);
			}
		});
		myTank = new Tank(200,200,true,this);		
		new Thread(new PaintThread()).start();
	}
	/**
	 * ���Ƶĵط�
	 * ����������װ�Ķ����ڻ��ƺ�Ҫ�ж��Ƿ��������� ���ǵľ��Ƴ�
	 */
	public void paint(Graphics g)
	{
		g.setColor(Color.YELLOW);
		g.drawString("My bullet amount :"+bullets.size(), 30, 50);
		g.drawString("Enemy tanks amount :"+tanks.size(), 30, 70);
		g.drawString("Bombs amount :"+bombs.size(), 30, 90);
		g.drawString("My tank blood left  :"+myTank.blood, 30, 110);
		if(!myTank.getIsLive())
		{
			bombs.add(new Bomb(myTank.getx(),myTank.gety()));
		}
		for(int i=0;i<bombs.size();i++)
		{
			bombs.get(i).draw(g);
			if(!bombs.get(i).getIsLive()) bombs.remove(i);
		}
		
		for(int i=0;i<tanks.size();i++)
		{		
			tanks.get(i).draw(g);
			
//			ײ̹����ײǽ����
			tanks.get(i).crashTanks(tanks);
			tanks.get(i).crashMyTank(myTank);	
			tanks.get(i).crashWall(wall);
			
			if(!tanks.get(i).getIsLive())
				{
					bombs.add(new Bomb(tanks.get(i).getx(),tanks.get(i).gety()));
					tanks.remove(i);
				}
		}
		
		for(int i=0;i<bullets.size();i++)
		{
			bullets.get(i).draw(g);
			bullets.get(i).isLive = bullets.get(i).judgeLive();
			bullets.get(i).isShootWall(wall);
//			��������̹�����ж��Ƿ����̹��
			for(int j=0;j<tanks.size();j++)
			{
				tanks.get(j).judgeLive(bullets.get(i));
				myTank.judgeLive(bullets.get(i));
			}
			if(!bullets.get(i).isLive) 
				{
				bullets.remove(i);
				}
		}
		
		wall.draw(g);
		if(!myTank.getIsLive())
		{
			g.setColor(Color.RED);
			g.setFont(new Font("����",Font.BOLD,120));
			g.drawString("GAME OVER", 150, 300);
		}
		myTank.drawLife(g);
		myTank.draw(g);
		myTank.crashWall(wall);
	}
	
//	ͨ��˫������������˸ ���ò�˵Ч���ܺ�
	public void update(Graphics g) {
		if(offScreenImage == null) {
			offScreenImage = this.createImage(SIZE_X, SIZE_Y);
		}
		Graphics gOffScreen = offScreenImage.getGraphics();
		Color c = gOffScreen.getColor();
		gOffScreen.setColor(Color.GRAY);
		gOffScreen.fillRect(0, 0, SIZE_X, SIZE_Y);
		gOffScreen.setColor(c);
		paint(gOffScreen);
		g.drawImage(offScreenImage, 0, 0, null);
	}

	
	public static void main(String[] args) {
		new TankWarClient().frameLaunch();
	}

//	���������ػ�Ƶ�ʵ��߳�
	public class PaintThread implements Runnable
	{
		@Override
		public void run() {
			while(true)
			{
				try {
					Thread.sleep(50);
					repaint();			
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		}
		
	}
	
	private class KeyMoniter extends KeyAdapter
	{
		@Override
		public void keyReleased(KeyEvent e) {
			int key = e.getKeyCode();
			myTank.keyReleased(key);
		}
		@Override
		public void keyPressed(KeyEvent e) {
			int key = e.getKeyCode();
			myTank.setKey(key);
		} 
	}

}
