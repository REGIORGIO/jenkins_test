from robot.api.deco import keyword

class Numbers:
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

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