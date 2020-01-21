package landscapemaker.library;

import processing.core.*;

public class Sun {
	PApplet p;

	public Sun(PApplet theParent) {
		p = theParent;
	}

	// Inspired by https://processing.org/examples/star.html
	public void sun(String type, int x, int y, float radius) {
		// draw different types of circles
		switch (type) {
		case "CLASSIC":
			p.beginShape();
			p.circle(x, y, radius);
			p.endShape();
			break;
		case "SPOKES":
			float radius2 = radius + 20;
			int npoints = 40;
			float angle = PConstants.TWO_PI / npoints;
			float halfAngle = (float) (angle / 2.0);
			p.beginShape();
			for (float a = 0; a < PConstants.TWO_PI; a += angle) {
				float sx = x + PApplet.cos(a) * radius2;
				float sy = y + PApplet.sin(a) * radius2;
				p.vertex(sx, sy);
				sx = x + PApplet.cos(a + halfAngle) * radius;
				sy = y + PApplet.sin(a + halfAngle) * radius;
				p.vertex(sx, sy);
			}
			p.endShape();
			break;
		default:
			break;
		}

	}

}
