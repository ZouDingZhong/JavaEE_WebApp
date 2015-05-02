package com.zoudingzhon.tankwar;
import java.awt.Color;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.Toolkit;

/**
 * �������������ʾ��ը��
 * @author �޶���
 *
 */
public class Bomb {
	private int x=100,y=100;
	private boolean isLive = true;
	private int number = 0;
	private boolean init = false;

	//	ͨ��URL�ķ�������ͼƬ
	private static Toolkit tk = Toolkit.getDefaultToolkit();
	private static Image[] imgs = {
		tk.getImage(Bomb.class.getClassLoader().getResource("images/0.gif")),
		tk.getImage(Bomb.class.getClassLoader().getResource("images/1.gif")),
		tk.getImage(Bomb.class.getClassLoader().getResource("images/2.gif")),
		tk.getImage(Bomb.class.getClassLoader().getResource("images/3.gif")),
		tk.getImage(Bomb.class.getClassLoader().getResource("images/4.gif")),
		tk.getImage(Bomb.class.getClassLoader().getResource("images/5.gif")),
		tk.getImage(Bomb.class.getClassLoader().getResource("images/6.gif")),
		tk.getImage(Bomb.class.getClassLoader().getResource("images/7.gif")),
		tk.getImage(Bomb.class.getClassLoader().getResource("images/8.gif")),
		tk.getImage(Bomb.class.getClassLoader().getResource("images/9.gif")),
		tk.getImage(Bomb.class.getClassLoader().getResource("images/10.gif"))
	};
	
	public boolean getIsLive()
	{
		return isLive;
	}
	
	public Bomb(int x,int y)
	{
		this.x = x;
		this.y = y;
	}
	/**
	 * ͨ������ķ���������ըͼƬ
	 * @param g
	 */
	public void draw(Graphics g)
	{
		if(number == imgs.length)
		{
			isLive = false;
			return;
		}
		
		/*�˴������������һ���ڵ�����ը��
		����ԭ����*/
		if(!init)
		{
			for (int i = 0; i < imgs.length; i++) {
				g.drawImage(imgs[i], -100, -100, null);
			}			
			init = true;
		}
		
		g.drawImage(imgs[number], x, y, null);
		number++;
	}

}
