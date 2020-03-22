import numpy as np
from scipy.stats import poisson
import random
from robot.api.deco import keyword

class Distributions:
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    @keyword("Generate uniform array")
    def get_uniform_distribution(self, low, up, size):
        return np.random.randint(low, up, size=size)

    @keyword("Generate binomial array")
    def get_binomial_distribution(self, p, n, size):
        return np.random.binomial(n, p, size=size)

    @keyword("Generate geometric array")
    def get_geometric_distribution(self, p, size):
       return np.random.geometric(p, size=size)

    @keyword("Generate poisson array")
    def get_poisson_distribution(self, mu, size):
    # mu = 10
        return poisson.rvs(mu=mu, size=size)
