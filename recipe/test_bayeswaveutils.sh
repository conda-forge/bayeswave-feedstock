#!/bin/bash

set -e

# BayesWave (RJMCMC)
BayesWave \
	--checkpoint \
	--ifo H1 \
	--ifo L1 \
	--psdlength 2.0 \
	--H1-cache LALSimAdLIGO \
	--L1-cache LALSimAdLIGO \
	--bayesLine \
	--updateGeocenterPSD \
	--waveletPrior \
	--Dmax 100 \
	--Niter 10000 \
	--signalOnly \
	--trigtime 1126259462.420000076 \
	--segment-start 1126259461.420000076 \
	--srate 256.0 \
	--seglen 2.0 \
	--window 1.0 \
	--H1-flow 20.0 \
	--L1-flow 20.0 \
	--psdstart 1126259461.420000076 \
	--outputDir . \
	--dataseed 1234 \
	--L1-timeslide 0.0 \
	--Nchain 2

# BayesWavePost (sampled params -> waveforms etc)
BayesWavePost \
	--ifo H1 \
	--ifo L1 \
	--psdlength 2.0 \
	--0noise \
	--signalOnly \
	--bayesLine \
	--dataseed 1234 \
	--trigtime 1126259462.420000076 \
	--segment-start 1126259461.420000076 \
	--srate 256.0 \
	--seglen 2.0 \
	--window 1.0 \
	--H1-flow 20.0 \
	--L1-flow 20.0 \
	--psdstart 1126259461.420000076 \
	--outputDir . \
	--H1-cache interp:./H1_fairdraw_asd.dat \
	--L1-cache interp:./L1_fairdraw_asd.dat \
	--L1-timeslide 0.0

# megaplot (webpage, plots)
megaplot.py .
