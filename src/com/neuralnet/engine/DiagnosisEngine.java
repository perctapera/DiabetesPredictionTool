package com.neuralnet.engine;

class DiagnosisEngine extends Engine implements EngineInterface{

	@Override
	public void run(double[][] vector) {
		
		double[] set = new double[input];
		System.out.println("Run method");
		for (int i = 0; i < vector.length; i++) {
			for (int j = 0; j < input; j++) {
				set[j] = vector[i][j];
			}
			forwardPass(set);
			double count = 0;
			for (double z : oNeuron) {
				// int p = (int) z;
				// System.out.println("Output is " + z);
				count += z;
			}
			System.out.println((int) count);

		}
		
	}

}
