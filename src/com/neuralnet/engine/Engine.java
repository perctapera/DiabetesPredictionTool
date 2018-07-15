package com.neuralnet.engine;

import com.neuralnet.Network;

public abstract class Engine extends Network {

	private final static int INPUT = 7;
	private static final int HIDDEN = 15;
	private static final int OUTPUT = 1;

	protected Engine() {
		super(INPUT, HIDDEN, OUTPUT);
	}

}
