package com.neuralnet.engine;

import com.neuralnet.Network;

public class XORTrain extends Network {

	private double[][] trainSet = 
			{{0,0,0,0,0,0,0},
			{0,1,0,0,0,0,0,0},
			{1,0,0,0,0,0,0,0},
			{1,1}};
	private double[] targetSet = {0,1,1,0};
	private double learningRate = 1.0;
	private int trainingTimes = 10000;
	
	public XORTrain(int input, int hidden, int output) {
		super(input, hidden, output);
	}

	/*
	 * this method is used to test the network after training
	 */
	public void run(){
		double[] set = new double[input];
		System.out.println("Run method");
		for(int i = 0; i < trainSet.length; i++){
			for(int j = 0; j < input; j++){
				set[j] = trainSet[i][j];
			}
			forwardPass(set);
			for(double z : oNeuron){
				//int p = (int) z;
				System.out.println("Output is " + z);
			}

		}
	}
	
	/*
	 * this is the forward pass method for inputing data and 
	 * producing a processed output
	 */
	public void train(){
		double[] set = new double[input];
		int count = 0;
		
		while(count < trainingTimes){
			for(int i = 0; i < trainSet.length; i++){
				for(int j = 0; j < input; j++){
					set[j] = trainSet[i][j];
				}
				forwardPass(set);
				learn(targetSet[i]);
			}
			count ++;
		}
	}
	
	/*
	 * this is the back propagation method for adjusting the 
	 * weights
	 */
	public void learn(double target){
		double[] oErr = new double[output];
		double[] hErr = new double[hidden];
		
		//calculate output errors
		for(int i =0; i < output; i++){
			oErr[i] = oNeuron[i] * (1 - oNeuron[i]) * (target - oNeuron[i]);
			System.out.println("Output is " + oNeuron[i] + " //target is " + target);
		}
		
		//change hidden to output weights
		for(int i = 0; i < hidden; i++){
			for(int j = 0; j < output; j++){
				h_to_o_wts[i][j] += learningRate * oErr[j] * hNeuron[i];
			}
		}
		
		//back propagate output errors to calculate hidden errors
		for(int i = 0; i < hidden; i++){
			double[] err = new double[hidden];
			for(int j = 0; j < output; j++){
				err[i] += oErr[j] * h_to_o_wts[i][j];
			}
			hErr[i] = hNeuron[i] * (1 - hNeuron[i]) * err[i];
		}
		
		//change input to hidden weights
		for(int i = 0; i < input; i++){
			for(int j = 0; j < hidden; j++){
				i_to_h_wts[i][j] += learningRate * hErr[j] * iNeuron[i];
			}
		}
	}
}
