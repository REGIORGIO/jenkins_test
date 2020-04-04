from libraries.Distributions import Distributions 


low = 1
up = 10
size = 10
dist = Distributions()
for _ in range(8):
	arr = dist.get_uniform_distribution(low, up, size=size)
	print('Expectation of an uniform distribution with parameters low={}, up={}, size={} is {}'.format(low, up, size, arr.mean()))
	size *= 10