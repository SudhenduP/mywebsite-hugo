---
title: "Learning basic epidemic models with Python"
---


The epidemic model is another intellectual source for information diffusion research. The first known mathematical model of epidemiology is formulated by Daniel Bernoulli (1760) when he studied the mortality rates in order to eradicate the smallpox. However, it was not until the early twentieth century that deterministic modeling of epidemiology started. Ross (1911) developed differential equation models of epidemics in 1911. Later, Kermack and McKendrick (1927) found the epidemic threshold and they argued that the density of susceptible must exceed a critical value to make the outbreak of an epidemic happen.

The mathematical models developed by epidemic research help clarify assumptions, variables, and parameters for diffusion research, lead to useful concepts (e.g., threshold, reproduction number), supply an experimental tool for testing theoretical conjectures, and forecast epidemic spreading in the future (Hethcote, 2009). Although epidemic models are simplifications of reality, they help us refine our understandings about the logic of diffusion beneath social realities (disease transmission, information diffusion through networks, and adoption of new technologies or behaviors). To understand the epidemic models in a better way, I will briefly review the basic epidemic models: SI, SIR, SIS, and the applications in networks.


### SI model
The SI model is the simplest possible model of infection. In the SI model, there are only two phases in the SI epidemic spreading process: Susceptible and Infectious.  Let S be the proportion of the population that are susceptible. Let I be the proportion of the population that are infectious. At the initial time, the proportion of people who are infected is x0, the proportion of people who are susceptible is S0. β is the transmission rate, and it incorporates the encounter rate between susceptible and infectious individuals together with the probability of transmission. Consider a “closed population” with no births, deaths, or migrations, and assume the mixing is homogeneous (e.g., the susceptible individuals are uniformly spread in a geographic area, and the probability of contracting the infection is uniformly the same for all actors (T. G. Lewis, 2011)), yielding βSI as the transmission term. Thus, the equation for SI model is:

            dS/dt= -βSI
            dI/( dt)= βSI

Given every individual in the system must be either susceptible or infected, I + S = 1. Thus, the equations above can be transformed to:

            dI/dt=βI(1-I)   

To solve this differential equation, we can get the cumulative growth curve as a function of time:

$$I[t]= \frac{x_{0} e^{\beta t }}{1-x_{0}+ x_{0} e^{\beta t }}$$

Interestingly, this is a logistic growth featured by its S-shaped curve. $$$x_{0}$$ is the initial value of I[t]. The curve grows exponentially shortly after the system is infected, and then saturates as the number of susceptible shrinks which makes it harder to find the next victims. Thus, it could be used to model the classic diffusion of innovations.
In the naive model of SI, once one is infected, it is always infectious. However, this is not realistic for many situations of disease spreading. For many diseases, people recover after a certain time because their immune systems act to fight with the diseases. There is usually a status of recovery denoted by R. Let γ denote the removal or recovery rate. Usually, researchers are more interested in its reciprocal (1/γ) which determines the average infectious period.

### SIR model
There are two stages of the dynamics of the SIR model. In the first stage, susceptible individuals become infected by the infectious ones with who they contact. Similar to the SI model, β is the transmission rate between individuals; In the second stage, infected individuals recover at the average rate γ. Given the premise that underlying epidemiological rates are constant, the differential equations of simple SIR model (with no births, deaths, or migrations) are:

           dS/dt= -βSI
           dI/( dt)= βSI- γI
           dR/dt= βI

However, the differential equations above could not be analytically solved. In practice, researchers can evaluate SIR model numerically, as it is showed in the figure below.

![](http://weblab.com.cityu.edu.hk/blog/chengjun/files/2013/03/p2.1-SIR.png)

	# -*- coding: utf-8 -*-

	###################################
	### Written by Ilias Soumpasis    #
	### ilias.soumpasis@ucd.ie (work) #
	### ilias.soumpasis@gmail.com	  #
	###################################

	import scipy.integrate as spi
	import numpy as np
	import pylab as pl

	beta=1.4247
	gamma=0.14286
	TS=1.0
	ND=70.0
	S0=1-1e-6
	I0=1e-6
	INPUT = (S0, I0, 0.0)

	def diff_eqs(INP,t):
		'''The main set of equations'''
		Y=np.zeros((3))
		V = INP
		Y[0] = - beta * V[0] * V[1]
		Y[1] = beta * V[0] * V[1] - gamma * V[1]
		Y[2] = gamma * V[1]
		return Y   # For odeint

	t_start = 0.0; t_end = ND; t_inc = TS
	t_range = np.arange(t_start, t_end+t_inc, t_inc)
	RES = spi.odeint(diff_eqs,INPUT,t_range)

	print RES

	#Ploting
	pl.plot(RES[:,0], '-bs', label='Susceptibles')  # I change -g to g--  # RES[:,0], '-g',
	pl.plot(RES[:,2], '-g^', label='Recovereds')  # RES[:,2], '-k',
	pl.plot(RES[:,1], '-ro', label='Infectious')
	pl.legend(loc=0)
	pl.title('SIR epidemic without births or deaths')
	pl.xlabel('Time')
	pl.ylabel('Susceptibles, Recovereds, and Infectious')
	pl.savefig('2.1-SIR-high.png', dpi=900) # This does, too
	pl.show()



### SIS model
Another extension of the SI model is the one that allows for reinfection.  If infected individuals are not immune to the diseases after their recovery, they can be infected more than once. The most simple model that captures this features is the SIS model. There are only two states: susceptible and infected, and infected individuals become susceptible after recovery. The differential equations for the simple SIS epidemic model are:
           dS/dt= γI-βSI
          dI/( dt)= βSI- γI


Given S + I = 1, the differential equations have the solution:

$$I[t]=(1-\frac{\gamma}{\beta}) \frac{C e^{(\beta - \gamma)t}}{1 + C e^{(\beta - \gamma)t}}$$

C is the integration constant in the form of $$C=\frac{ \beta x_{0}}{\beta-\gamma-\beta x_{0}} $$.

![](http://weblab.com.cityu.edu.hk/blog/chengjun/files/2013/03/p2.1-SIS.png)

	# -*- coding: utf-8 -*-

	import scipy.integrate as spi
	import numpy as np
	import pylab as pl

	beta=1.4247
	gamma=0.14286
	I0=1e-6
	ND=70
	TS=1.0
	INPUT = (1.0-I0, I0)

	def diff_eqs(INP,t):
		'''The main set of equations'''
		Y=np.zeros((2))
		V = INP
		Y[0] = - beta * V[0] * V[1] + gamma * V[1]
		Y[1] = beta * V[0] * V[1] - gamma * V[1]
		return Y   # For odeint

	t_start = 0.0; t_end = ND; t_inc = TS
	t_range = np.arange(t_start, t_end+t_inc, t_inc)
	RES = spi.odeint(diff_eqs,INPUT,t_range)

	print RES

	#Ploting
	pl.plot(RES[:,0], '-bs', label='Susceptibles')
	pl.plot(RES[:,1], '-ro', label='Infectious')
	pl.legend(loc=0)
	pl.title('SIS epidemic without births or deaths')
	pl.xlabel('Time')
	pl.ylabel('Susceptibles and Infectious')
	pl.savefig('2.5-SIS-high.png', dpi=900) # This does increase the resolution.
	pl.show()


One important contribution of epidemic models is the threshold phenomenon of epidemic diffusion existing in SIR model. The threshold of SIR model asks what factors determine whether an epidemic occur or fail. As the first step of analyzing the threshold of SIR model, the differential equation of SIR (dI/dt= βSI- βI) can be rewritten in the form:

dI/( dt)=(βS - β)I

If dI/dt is smaller than 0, the contagion will soon wither and die out. Thus, as a boundary condition, $$(\beta S- \gamma)$$ should be larger than 0, and S should be larger than γ/β. This is the threshold phenomenon (Kermack & McKendarick, 1927). Based on the rationales above, if the initial fraction of susceptible (S(0)) is less than γ/β, the infection would not be able to start the invasion in the population. Here  γ/β is defined as basic reproductive ratio $$R_{0}$$.

To summarize, “for an infectious disease with an average infectious period give by 1/γ and a transmission rate β, its basic reproductive ratio R0 is determined by γ/β. In a closed population, an infection with a specified R0 can invade only if there is a threshold fraction of susceptible greater than 1/γ ” (Keeling & Rohani, 2011, p. 21).

###The Other Extentions?
In the section above, I mainly focus on the deterministic models of epidemics. However, despite the many advantages of deterministic models, it can be difficult to include realistic population networks, to incorporate realistic probability distributions for the time spent in the infectious period, and to assess the probability of an outbreak. Thus, the stochastic epidemic simulations, such as stochastic differential equations, Markov Chain Monte Carlo (MCMC), and agent based modeling, have been used to remedy the defect.

Network epidemic models have also been developed to investigate the widespread and rapid propagations (e.g., the contagion of computer virus) through a network. Typically, the network epidemic is brought about by adjacent nodes through propagations along one or more links. Network epidemic models consider the topology of the network as well as infection rate, death rate, and state transitions. This line of research is interested in the following questions: under what conditions will an initial outbreak spread to a nontrivial portion of the population? What percentage of the population will eventually become infected? What is the effect of immunization policies? For example, Pastor-Satorras et al. (2001a, 2001b) study the spreading of epidemics in complex networks using the mean-field method for network SIS model. Their findings indicate that in exponential networks (e.g., random graph network, small-world network), there is the usual epidemic threshold below which there is no prevalence of epidemic. Yet, on a wide range of scale-free networks, there is an absence of an epidemic threshold, which implies that scale-free networks are prone to the spreading of epidemics, as well as other spreading phenomena, e.g., information diffusion. Based on this rationale of the absence of epidemic threshold, network scientists expect online information diffuse to a great proportion of the population.
