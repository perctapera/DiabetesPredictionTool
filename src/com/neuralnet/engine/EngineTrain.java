package com.neuralnet.engine;

import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class EngineTrain extends Engine {

	private double[][] trainSet = new double[461][7];
	private double[][] targetSet = new double[461][1];
	private double[][] testSet = new double[1][7];
	private double learningRate = 0.1;
	private int trainingTimes = 2000;

	public EngineTrain() {
		super();
	}

	/*
	 * this method is used to test the network after training
	 */
	// Should return data to the calling method in Production
	public double run() {
		
		double output = 0;
		double[] set = new double[input];
		//System.out.println("Run method");
		for (int i = 0; i < testSet.length; i++) {
			for (int j = 0; j < input; j++) {
				set[j] = testSet[i][j];
			}
			forwardPass(set);
			//double count = 0;
			for (double z : oNeuron) {
				// int p = (int) z;
				System.out.print("Output is " + z + ":\t\t\t\t\t\t");
				output = z;
			}
		//	System.out.println("Result no : " + i);
		}
		
		return output;
		
	}

	/*
	 * this is the forward pass method for inputing data and producing a
	 * processed output
	 */
	public void train() {
		double[] set = new double[input];
		double[] tSet = new double[output];
		int count = 0;
		
		System.out.println("Training...");
		while (count < trainingTimes) {
			for (int i = 0; i < trainSet.length; i++) {
				for (int j = 0; j < input; j++) {
					set[j] = trainSet[i][j];
				}
				forwardPass(set);
				for (int j = 0; j < targetSet[0].length; j++)
					tSet[j] = targetSet[i][j];
				learn(tSet);
			}
			count++;
		}
		System.out.println("Done training...");
	}

	/*
	 * this is the back propagation method for adjusting the weights
	 */
	public void learn(double[] target) {
		double[] oErr = new double[output];
		double[] hErr = new double[hidden];

		// calculate output errors
		for (int i = 0; i < output; i++) {
			// for(int j = 0; j < target.length; j++){
			oErr[i] = oNeuron[i] * (1 - oNeuron[i]) * (target[i] - oNeuron[i]);
			// System.out.println("Output is " + oNeuron[i] + " //target is " +
			// target[i]);
			// }
		}// System.out.println("\n");

		// change hidden to output weights
		for (int i = 0; i < hidden; i++) {
			for (int j = 0; j < output; j++) {
				h_to_o_wts[i][j] += learningRate * oErr[j] * hNeuron[i];
			}
		}

		// back propagate output errors to calculate hidden errors
		for (int i = 0; i < hidden; i++) {
			double[] err = new double[hidden];
			for (int j = 0; j < output; j++) {
				err[i] += oErr[j] * h_to_o_wts[i][j];
			}
			hErr[i] = hNeuron[i] * (1 - hNeuron[i]) * err[i];
		}

		// change input to hidden weights
		for (int i = 0; i < input; i++) {
			for (int j = 0; j < hidden; j++) {
				i_to_h_wts[i][j] += learningRate * hErr[j] * iNeuron[i];
			}
		}
	}

	public void readVectorData(String fileName) throws FileNotFoundException {

		java.io.File file = new java.io.File(fileName);
		@SuppressWarnings("resource")
		Scanner input = new Scanner(file);
		int row = 0;

		/*
		 * if (!input.)) { System.out.println("Source file " + args[0] +
		 * " does not exist"); System.exit(0); }
		 */
		while (input.hasNext()) {
			int col = 0;

			trainSet[row][col] = Double.parseDouble(input.next());
			col++;
			trainSet[row][col] = input.nextDouble();
			col++;
			trainSet[row][col] = input.nextDouble();
			col++;
			trainSet[row][col] = input.nextDouble();
			col++;
			trainSet[row][col] = input.nextDouble();
			col++;
			trainSet[row][col] = input.nextDouble();
			col++;
			trainSet[row][col] = input.nextDouble();
			col++;

			row++;
		}
	}

	public void saveWeights() throws IOException {

		java.io.File fileName = new java.io.File("ihweights.mf");
		FileWriter weight = new FileWriter(fileName, false);

		for (int i = 0; i < input; i++) {
			for (int j = 0; j < hidden; j++) {
				String w = String.valueOf(i_to_h_wts[i][j]);
				weight.write(w + "\t");
				weight.flush();
			}
		}
		weight.close();

		java.io.File file = new java.io.File("howeights.mf");
		FileWriter w = new FileWriter(file, false);
		for (int i = 0; i < hidden; i++) {
			for (int j = 0; j < output; j++) {
				String wt = String.valueOf(h_to_o_wts[i][j]);
				w.write(wt + "\t");
				w.flush();
			}
		}

		w.close();
	}
	
	@SuppressWarnings("resource")
	public void loadWeights() throws IOException {

	//	java.io.File fileName = new java.io.File(new FileInputStream());
		Scanner load_I_H = new Scanner(this.getClass().getClassLoader().getResourceAsStream("/ihweights.mf"));
		
		while(load_I_H.hasNext()) {
			for (int i = 0; i < 7; i++) {
				for(int j = 0; j < 15; j++) {
					i_to_h_wts[i][j] = load_I_H.nextDouble();
				}
			}
		}

	//	fileName = new java.io.File("/howeights.mf");
		Scanner load_H_O = new Scanner(this.getClass().getClassLoader().getResourceAsStream("/howeights.mf"));
		
		while(load_H_O.hasNext()) {
			for (int i = 0; i < 15; i++) {
				for(int j = 0; j < 1; j++) {
					h_to_o_wts[i][j] = load_H_O.nextDouble();
				}
			}
		}
	}

	public void readTargetData() throws FileNotFoundException {

		java.io.File file = new java.io.File("target.txt");
		@SuppressWarnings("resource")
		Scanner input = new Scanner(file);
		int row = 0;

		/*
		 * if (!input.)) { System.out.println("Source file " + args[0] +
		 * " does not exist"); System.exit(0); }
		 */
		while (input.hasNext()) {
			int col = 0;

			targetSet[row][col] = Double.parseDouble(input.next());

			row++;
		}
	}
	
	public void readTestData() throws FileNotFoundException {

		java.io.File file = new java.io.File("testSet.txt");
		@SuppressWarnings("resource")
		Scanner input = new Scanner(file);
		int row = 0;

		/*
		 * if (!input.)) { System.out.println("Source file " + args[0] +
		 * " does not exist"); System.exit(0); }
		 */
		while (input.hasNext()) {
			int col = 0;

			testSet[row][col] = Double.parseDouble(input.next());
			col++;
			testSet[row][col] = input.nextDouble();
			col++;
			testSet[row][col] = input.nextDouble();
			col++;
			testSet[row][col] = input.nextDouble();
			col++;
			testSet[row][col] = input.nextDouble();
			col++;
			testSet[row][col] = input.nextDouble();
			col++;
			testSet[row][col] = input.nextDouble();
			col++;

			row++;
		}
	}

	public void readMyData( float f1, float f2 , float f3 ,float f4 , float f5 , float f6 , float f7) throws FileNotFoundException {

	
			

			testSet[0][0] = f1;
			
			testSet[0][1] = f2;
			
			testSet[0][2] = f3;
			
			testSet[0][3] = f4;
			
			testSet[0][4] = f5;
			
			testSet[0][5] = f6;
		
			testSet[0][6] = f7;
		
	}
	
	public void testReadData() {
		for (int i = 0; i < targetSet.length; i++) {
			for (int j = 0; j < output; j++) {
				System.out.println(targetSet[i][j] + "\t");
			}
			// System.out.println(targetSet[i]);
			System.out.println("\n");
		}
	}
}
