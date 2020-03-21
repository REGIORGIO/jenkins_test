from random import randint
from typing import List

from robot.api.deco import keyword


class ArrayGeneratorLibrary:
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    @keyword("Generate integer array")
    def generate_array(self, length: int, minimal: int, maximal: int) -> List[int]:
        result = []
        
        for i in range(int(length)):
            result.append(randint(int(minimal), int(maximal)))
        return result
	    

    @keyword("Find minimum")
    def find_min(self, a: int, b: int):
        if a > b:
        	return b
        else:
        	return a

    @keyword("Find maximum")
    def find_max(self, a: int, b: int):
        if a < b:
        	return b
        else:
        	return a