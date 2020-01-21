package landscapemaker.library;

import processing.core.*;

public class Weather {
	PApplet p;

	public Weather(PApplet theParent) {
		p = theParent;
	}


	public void snowflake() {
		for (int i = 0; i < 6; ++i) {
			p.line(0, 0, 100, 0);
			p.line(50, 0, 75, 50);
			p.line(50, 0, 75, -50);
			p.point(80, 25);
			p.point(80, -25);
			p.rotate(PConstants.PI / 3);
		}
	}

	// simple snow
	@SuppressWarnings("static-access")
	public void snow(int quantity) {
		int width = p.width;
		int height = p.height;
		float[] xPosition = new float[quantity];
		float[] yPosition = new float[quantity];
		int[] flakeSize = new int[quantity];
		int[] direction = new int[quantity];
		int minFlakeSize = 1;
		int maxFlakeSize = 5;
		for (int i = 0; i < quantity; i++) {
			flakeSize[i] = p.round(p.random(minFlakeSize, maxFlakeSize));
			xPosition[i] = p.random(0, width);
			yPosition[i] = p.random(0, height);
			direction[i] = p.round(p.random(0, 1));
		}

		p.smooth();
		for (int i = 0; i < xPosition.length; i++) {

			p.ellipse(xPosition[i], yPosition[i], flakeSize[i], flakeSize[i]);

			if (direction[i] == 0) {
				xPosition[i] += p.map((float) flakeSize[i], (float) minFlakeSize, (float) maxFlakeSize, (float) .1,
						(float) .5);
			} else {
				xPosition[i] -= p.map((float) flakeSize[i], (float) minFlakeSize, (float) maxFlakeSize, (float) .1,
						(float) .5);
			}

			yPosition[i] += flakeSize[i] + direction[i];

			if (xPosition[i] > width + flakeSize[i] || xPosition[i] < -flakeSize[i]
					|| yPosition[i] > height + flakeSize[i]) {
				xPosition[i] = p.random(0, width);
				yPosition[i] = -flakeSize[i];
			}
		}
	}

}
