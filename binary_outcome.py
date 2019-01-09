import pymc3 as pm
import numpy as np

nA = 30
nB = 50
sA = 3
sB = 5

with pm.Model() as model:
    # Priors
    priorA = pm.Beta('priorA', alpha=1, beta=1)
    priorB = pm.Beta('priorB', alpha=1, beta=1)

    # Likelihood
    likeA = pm.Binomial('likeA', n=nA, p=priorA, observed=sA)
    likeB = pm.Binomial('likeB', n=nB, p=priorB, observed=sB)

    # Metrics
    rateDiff = pm.Deterministic('rateDiff', priorA - priorB)

    # Inference
    trace = pm.sample(draws=2000, step=pm.Metropolis(), start=pm.find_MAP(), progressbar=True)

if __name__ == "__main__":
    vals = trace.get_values('rateDiff', combine=True, squeeze=True)
    print(f'P[A-B] < 0:    {np.mean(vals < 0)}')
    print(f'P[A-B] >= 0:   {np.mean(vals >= 0)}')
