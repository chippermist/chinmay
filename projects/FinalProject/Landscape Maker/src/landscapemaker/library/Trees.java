package landscapemaker.library;

import processing.core.*;

public class Trees {
	PApplet p;
	float tree_scale = (float) 0.75;
	float tree_step = 12;
	float tree_angle = 50;
	float tree_length = 180;
	float tree_length_limit = 20;

	public Trees(PApplet theParent) {
		p = theParent;
	}

	// done using following some online tutorial
	// similar to https://www.openprocessing.org/sketch/673674
	public void tree(float x, float y, float d, float ang, float L) {
		float ex = (float) (x + (d * Math.cos(PApplet.radians(ang))));
		float ey = (float) (y + (d * Math.sin(PApplet.radians(ang))));
		p.strokeWeight(1);
		p.stroke(50, 10, 0);
		p.fill(75, 35, 0);
		p.pushMatrix();
		p.translate(x, y);
		p.rotate(PApplet.radians(ang));	
		p.rect(-(d / 10), -(d / 10), (float) (d * 1.2), d / 5, d / 10);
		p.popMatrix();
		float a = p.random(20, 50);
		float a1 = p.random(-50, -20);
		if (d == L) {
			tree(ex, ey, (float) (d / 1.5), ang, L);

		}
		if ((d / 1.5) > 8) {
			tree(ex, ey, (float) (d / 1.5), a + ang, L);
			tree(ex, ey, (float) (d / 1.5), a1 + ang, L);
			a = p.random(20, 50) + ang;
			a1 = p.random(-50, -20) + ang;
			tree(ex, ey, d / 2, (a), L);
			tree(ex, ey, d / 2, (a1), L);

		}
		if (((d / 1.5) >= 66)) {
			a = p.random(20, 50) + ang;
			a1 = p.random(-50, -20) + ang;
			tree(ex, ey, d / 3, (a), L);
			tree(ex, ey, d / 3, (a1), L);

		}
		if (d == L) {
			a = p.random(10, 30) + ang;
			a1 = p.random(-30, -10) + ang;
			tree(ex, ey, (float) (d / 4.5), (a), L);
			tree(ex, ey, (float) (d / 4.5), (a1), L);

		}

		if ((d / 1.5) <= 12) {
			leaf(ex, ey, ang);
		}
	}

	public void leaf(float x, float y, float ang) {
		for (int i = -1; i < 2; i++) {
			float l = p.random(10, 19);
			float a = p.random(30, 61);
			p.pushMatrix();
			p.translate(x, y);
			p.rotate(PApplet.radians(ang + (i * a)));
			p.fill(0, 155, 0);
			p.stroke(0, 125, 0);
			p.beginShape();
			p.vertex(0, 0);
			p.bezierVertex(0, 0, (l / 4), (l / 2), l, 0);
			p.bezierVertex(l, 0, (l / 4), -(l / 2), 0, 0);
			p.vertex(0, 0);
			p.endShape();
			p.stroke(0, 125, 0);
			p.line(0, 0, 12, 0);
			p.popMatrix();
		}
	}

	public void grass(int height) {
		grass(height, p.random(0, 100), p.random(100, 255), p.random(0, 100), 200);
	}

	public void grass(int height, int limit) {
		grass(height, p.random(0, 100), p.random(100, 255), p.random(0, 100), limit);
	}

	// inspiration https://www.openprocessing.org/sketch/689952
	public void grass(int height, float r, float b, float g, int limit) {
		int slant = 100;
		int base = 10;
		int direction = 0;

		for (int i = 0; i < limit; ++i) {
			// code
			direction = (int) Math.floor(p.random(0, 2));
			if (direction == 0) {
				direction = -1;
			}
			int x = (int) Math.floor(p.random(0, p.width));
			int y = 800;
			base = 10;
			slant = (int) Math.floor(p.random(20, 100));
			height = (int) Math.floor(p.random(height - 20, height + 20));
			int colour1 = (int) p.random(0, r);
			int colour2 = (int) p.random(b, 255);
			int colour3 = (int) p.random(0, g);
			p.stroke(colour1, colour2, colour3);
			p.fill(colour1, colour2, colour3);
			p.quad(x, y, x + direction * slant, y - height, x + direction * slant, y - height, x + direction * base, y);
		}
	}
}
