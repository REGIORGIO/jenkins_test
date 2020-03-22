import numpy as np
from scipy.stats import poisson
import random
from robot.api.deco import keyword

class Distributions:

    @keyword("Generate uniform array")
    def get_uniform_distribution(self, low, up, size):
        return np.random.randint(low, up, size=size)


# print('мат. ожидание(теория) = ', (up + low) / 2)
# print('дисперсия(теория) = ', ((up - low + 1) ** 2 - 1) / 12)
# m = conversions.mean()
# print('мат. ожидание(практика) = ', m)
# d = np.var(conversions)
# print('дисперсия(практика) = ', d)

# биномиальный закон
    @keyword("Generate binomial array")
    def get_binomial_distribution(self, p, n, size):
        return np.random.binomial(n, p, size=size)

# print('мат. ожидание(теория) = ', (n * p))
# print('дисперсия(теория) = ', (p * n * (1 - p)))
# m = conversions.mean()
# print('мат. ожидание(практика) = ', m)
# d = np.var(conversions)
# print('дисперсия(практика) = ', d)
#
    @keyword("Generate geometric array")
    def get_geometric_distribution(self, p, size)
    # p = 0.5
       return np.random.geometric(p, size=size)

# print("геометрический")
# print('мат. ожидание(теория) = ', 1 / p)
# print('дисперсия(теория) = ', (1 - p)/(p ** 2))
# m = conversions.mean()
# print('мат. ожидание(практика) = ', m)
# d = np.var(conversions)
# print('дисперсия(практика) = ', d)
    @keyword("Generate poisson array")
    def get_poisson_distribution(self, mu, size):
    # mu = 10
        return poisson.rvs(mu=mu, size=size)
# print("Пуассона")
# print('мат. ожидание(теория) = ', mu)
# print('дисперсия(теория) = ', mu)
# m = conversions.mean()
# print('мат. ожидание(практика) = ', m)
# d = np.var(conversions)
# print('дисперсия(практика) = ', d)
# graph(conversions)

