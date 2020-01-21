package landscapemaker.library;

import processing.core.*;

public class Mountains {
	PApplet p;

	public Mountains(PApplet theParent) {
		p = theParent;
	}

	public void mountains(int H, int S, int B, int interval) {
		int numMountains = 10;
		// define the colors
		p.colorMode(PConstants.HSB, 360, 100, 100);

		// FIND THE REFERENCE Y OF EACH MOUNTAIN:
		float y0 = p.width - 500; // fist reference y
		int i0 = interval; // initial interval

		float[] cy = new float[numMountains]; // initialize the reference y array
		for (int j = 0; j < 10; j++) {
			cy[9 - j] = y0;
			y0 -= i0 / PApplet.pow((float) 1.2, j);
		}

		// DRAW THE MOUNTAINS/
		float dx = 0;

		for (int j = 1; j < numMountains; j++) {
			float a = p.random(-p.width / 2, p.width / 2); // random discrepancy between the sin waves
			float b = p.random(-p.width / 2, p.width / 2); // random discrepancy between the sin waves
			float c = p.random(2, 4); // random amplitude for the second sin wave
			float d = p.random(40, 50); // noise function amplitude
			float e = p.random(-p.width / 2, p.width / 2); // adds a discrepancy between the noise of each mountain

			for (int x = 0; x < p.width; x++) {
				float y = cy[j]; // y = reference y
				y += 10 * j * PApplet.sin(2 * dx / j + a); // first sin wave oscillates according to j (the closer the
															// mountain, the bigger the amplitude and smaller the
															// frequency)
				y += c * j * PApplet.sin(5 * dx / j + b); // second sin wave has a random medium amplitude (affects more
															// the further mountains) and bigger frequenc
				y += d * j * p.noise((float) (1.2 * dx / j + e)); // first noise function adds randomness to the
																	// mountains, amplitude depends on a random number
																	// and increases with j, frequency decrases with j
				y += 1.7 * j * p.noise(10 * dx); // second noise function simulates the canopy, it has high frequency
													// and small amplitude depending on j so it is smoother on the
													// further mountains

				p.strokeWeight(2);
				p.stroke(H - 110, S - 75, B - 10);
				p.line(x, y, x, p.height);

				dx += 0.02;
			}

			// ADD MIST
			for (int i = p.height; i > cy[j]; i -= 3) {
				float alfa = PApplet.map(i, cy[j], p.height, 0, 360 / (j + 1)); // alfa is begins bigger for the further
																				// mountains
				p.strokeWeight(3); // interval of 3 for faster rendering
				p.stroke(360, 360, 360, alfa);
				p.line(0, i, p.width, i);
			}
		}
	}

	@SuppressWarnings("static-access")
	public void mountains(int numberOfRanges) {
		p.beginShape();
		long seed = 0;
		for (int line = 0; line < numberOfRanges; line++) {

			p.noiseSeed(seed);
			p.beginShape();
			p.vertex(0, p.height);
			for (int x = 0; x * 100 < p.width; x += .01) {
				p.vertex(x * 100, p.map(p.noise(x), 0, 1, 0, p.height));
			}

			p.vertex(p.width, p.height);
			p.endShape();
			seed++;
		}
		p.endShape();
	}

}
