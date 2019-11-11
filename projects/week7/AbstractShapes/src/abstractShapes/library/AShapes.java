package abstractShapes.library;

import processing.core.*;

public class AShapes {
	private static PApplet pApp;

	public AShapes(PApplet theParent) {
		AShapes.pApp = theParent;
	}

	public void snowflake() {
		for (int i = 0; i < 6; ++i) {
			pApp.line(0, 0, 100, 0);
			pApp.line(50, 0, 75, 50);
			pApp.line(50, 0, 75, -50);
			pApp.point(80, 25);
			pApp.point(80, -25);
			pApp.rotate(PConstants.PI / 3);
		}
	}

	public void triangleNested(int width, int height, float boxWidth, float boxHeight, int divisions) {
		pApp.pushMatrix();
		pApp.colorMode(PConstants.HSB, 100);
		float color = divisions * PConstants.PI / 2;
		for (float i = 0; i < divisions; i++) {
			for (float j = 0; j <= i; j++) {
				float boxWidth2 = boxWidth - (boxWidth / divisions) * i;
				float boxHeight2 = boxHeight - (boxHeight / divisions) * i;
				float x = width / 2 - (boxWidth / divisions / 2) * i + j * (boxWidth / divisions);
				float y = height / 2 + (boxHeight / divisions / 2) * i;
				pApp.fill(color, color % 100, 50, 10);
				pApp.triangle(x, y - boxHeight2 / 2, x - boxWidth2 / 2, y + boxHeight2 / 2, x + boxWidth2 / 2,
						y + boxHeight2 / 2);
			}
			color += 0.5;
			if (color >= 100) {
				color = (float) (divisions * PConstants.PI / 2 - 0.5);
			}
		}
		noise();
		pApp.popMatrix();
	}

	private static void noise() {
		pApp.noStroke();
		pApp.strokeWeight(1);
		for (int i = 0; i < 10; i++) {
			pApp.fill(pApp.random(0, 255), pApp.random(0, 200));
		}
	}

	public void heart() {
		pApp.smooth();
		for (int i = 0; i < 61; i++) {
			float x = (float) (0.25 * (Math.pow(i, 2) * -1.0 + 40 * i + 1200) * Math.sin((PConstants.PI * i) / 180));
			float y = (float) (-0.25 * (Math.pow(i, 2) * -1.0 + 40 * i + 1200) * Math.cos((PConstants.PI * i) / 180));
			pApp.line(x, y, x, y); 
			pApp.line(-x, y, -x, y);
		}
	}

}
