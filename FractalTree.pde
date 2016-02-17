private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .5;  
private double bLength = 100;
public void setup() 
{   
	size(640,480);    
	noLoop(); 

} 
public void draw() 
{   
	background(0);   
	//strokeWeight((int)(Math.random()*3)+1);
	stroke((int)(Math.random()*50)+146, (int)(Math.random()*50)+146, (int)(Math.random()*50)+146, (int)(Math.random()*256)+100);
	line(320,480,320,380);   
	drawBranches(320, 380, bLength, 3*Math.PI/2);

} 

public void keyPressed()
{
	if (key == 'x')				
	{
		bLength++;
		redraw();
	}
	if (key == 'c')				
	{
		bLength--;
		redraw();
	}
}
/*
public void mouseDragged()
{
	//branchAngle = branchAngle + .1;
	bLength++;
	redraw();

	//reset
	if (key == ' ')				
	{
		bLength = 100;
	}
}
*/

public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	branchLength = branchLength*fractionLength;

	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);

	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);

	if(branchLength > smallestBranch)
	{
		drawBranches(endX1, endY1, branchLength, angle1);
		drawBranches(endX2, endY2, branchLength, angle2);
	}

} 
