package com.neuralnet;

public abstract class Network {

	protected int input;
	protected int hidden;
	protected int output;

	protected double[] iNeuron;
	protected double[] hNeuron;
	protected double[] oNeuron;

	protected double[][] i_to_h_wts;
	protected double[][] h_to_o_wts;

	protected Network(int input, int hidden, int output) {
		this.input = input;
		this.hidden = hidden;
		this.output = output;
		iNeuron = new double[input];
		hNeuron = new double[hidden];
		oNeuron = new double[output];
		i_to_h_wts = new double[input][hidden];
		h_to_o_wts = new double[hidden][output];
		ini();
	}

	protected void ini() {
		// randomize input to hidden weights
		for (int i = 0; i < input; i++) {
			for (int j = 0; j < hidden; j++) {
				i_to_h_wts[i][j] = Math.random();
			}
		}

		// randomize hidden to output weights
		for (int i = 0; i < hidden; i++) {
			for (int j = 0; j < output; j++) {
				h_to_o_wts[i][j] = Math.random();
			}
		}

		System.out.println("Network initialised");
	}

	public void forwardPass(double[] pattern) {
		iNeuron = pattern;

		// input to hidden pass
		for (int i = 0; i < hNeuron.length; i++) {
			double sum = 0;
			for (int j = 0; j < iNeuron.length; j++) {
				sum += iNeuron[j] * i_to_h_wts[j][i];
			}
			hNeuron[i] = thresholdFunc(sum);
		}

		// hidden to output pass
		for (int i = 0; i < oNeuron.length; i++) {
			double sum = 0;
			for (int j = 0; j < hNeuron.length; j++) {
				sum += hNeuron[j] * h_to_o_wts[j][i];
			}
			oNeuron[i] = thresholdFunc(sum);
		}
	}

	// sigmoid function
	protected double thresholdFunc(double sum) {
		return 1 / (1 + Math.exp(-sum));
	}
}
