package com.test;

import java.io.IOException;

import com.neuralnet.engine.EngineTrain;

public class Test {
	private EngineTrain nn = new EngineTrain();
	
	public void train() throws IOException {
		nn.readVectorData("diabetes.txt");
		nn.readTargetData();
		nn.readTestData();
		nn.train();
		nn.run();
		nn.saveWeights();
	}
	
	// TO be changed
	public void start() throws IOException {
		nn.loadWeights();
	//	nn.readMyData(f1, f2, f3, f4, f5, f6, f7);
		nn.run();
	}

	public static void main(String[] args) throws IOException  {
		Test test = new Test();
		// test.train();  // For training only
		test.start();  // For system in production
	}

}
