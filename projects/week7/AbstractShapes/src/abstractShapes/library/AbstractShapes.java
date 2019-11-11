package abstractShapes.library;

import processing.core.*;

/**
 * This is a template class and can be used to start a new processing Library.
 * Make sure you rename this class as well as the name of the example package
 * 'template' to your own Library naming convention.
 * 
 * (the tag example followed by the name of an example included in folder
 * 'examples' will automatically include the example in the javadoc.)
 *
 * @example Hello
 */

public class AbstractShapes {

	// pApp is a reference to the parent sketch
	PApplet pApp;
	float strokeWeight;
	boolean noFill = true;
	boolean noStroke = false;
	static AShapes abstractShapeMaker;

	public final static String VERSION = "##library.prettyVersion##";

	/**
	 * a Constructor, usually called in the setup() method in your sketch to
	 * initialize and start the Library.
	 * 
	 * @example Hello
	 * @param theParent
	 */
	public AbstractShapes(PApplet theParent) {
		pApp = theParent;
		strokeWeight = 1;
		abstractShapeMaker = new AShapes(this.pApp);
		welcome();
		
	}

	private void welcome() {
		System.out.println("##library.name## ##library.prettyVersion## by ##author##");
	}

	public String printHelloWorld() {
		return "Hello, World!";
	}

	/**
	 * return the version of the Library.
	 * 
	 * @return String
	 */
	public static String version() {
		return VERSION;
	}

	public void noStroke() {
		noStroke = true;
	}

	public void strokeWeight(float weight) {
		this.strokeWeight = weight;
	}

	public void noFill() {
		noFill = true;
	}
	
	public void snowflake() {
		abstractShapeMaker.snowflake();
	}
	
	public void nestedTriangle(int width, int height, float boxWidth, float boxHeight, int divisions) {
		abstractShapeMaker.triangleNested(width, height, boxWidth, boxHeight, divisions);
	}
	
	public void heart() {
		abstractShapeMaker.heart();
	}
}
