# search.py
# ---------
# Licensing Information:  You are free to use or extend these projects for 
# educational purposes provided that (1) you do not distribute or publish 
# solutions, (2) you retain this notice, and (3) you provide clear 
# attribution to UC Berkeley, including a link to 
# http://inst.eecs.berkeley.edu/~cs188/pacman/pacman.html
# 
# Attribution Information: The Pacman AI projects were developed at UC Berkeley.
# The core projects and autograders were primarily created by John DeNero 
# (denero@cs.berkeley.edu) and Dan Klein (klein@cs.berkeley.edu).
# Student side autograding was added by Brad Miller, Nick Hay, and 
# Pieter Abbeel (pabbeel@cs.berkeley.edu).


"""
In search.py, you will implement generic search algorithms which are called by
Pacman agents (in searchAgents.py).
"""

import util

class SearchProblem:
    """
    This class outlines the structure of a search problem, but doesn't implement
    any of the methods (in object-oriented terminology: an abstract class).

    You do not need to change anything in this clcdmass, ever.
    """

    def getStartState(self):
        """
        Returns the start state for the search problem.
        """
        util.raiseNotDefined()

    def isGoalState(self, state):
        """
          state: Search state

        Returns True if and only if the state is a valid goal state.
        """
        util.raiseNotDefined()

    def getSuccessors(self, state):
        """
          state: Search state

        For a given state, this should return a list of triples, (successor,
        action, stepCost), where 'successor' is a successor to the current
        state, 'action' is the action required to get there, and 'stepCost' is
        the incremental cost of expanding to that successor.
        """
        util.raiseNotDefined()

    def getCostOfActions(self, actions):
        """
         actions: A list of actions to take

        This method returns the total cost of a particular sequence of actions.
        The sequence must be composed of legal moves.
        """
        util.raiseNotDefined()


def tinyMazeSearch(problem):
    """
    Returns a sequence of moves that solves tinyMaze.  For any other maze, the
    sequence of moves will be incorrect, so only use this for tinyMaze.
    """
    from game import Directions
    s = Directions.SOUTH
    w = Directions.WEST
    return  [s, s, w, s, w, w, s, w]

class Nodo:
    def __init__(self, state, direccion, coste, parent):
        self.state = state
        self.parent = parent
        self.direccion = direccion
        self.coste = coste

    def __cmp__(self, nodaso):
        if nodaso == None: 
            return 1
        if self.state == nodaso.state:
            return 0
        return 1
    #http://stackoverflow.com/questions/12908933/overriding-cmp-python-function

    def getState(self):
        return self.state
    
    def getParent(self):
        return self.parent

    def getDireccion(self):
        return self.direccion

    def getCoste(self):
        return self.coste

def depthFirstSearch(problem):
    """
    Search the deepest nodes in the search tree first.

    Your search algorithm needs to return a list of actions that reaches the
    goal. Make sure to implement a graph search algorithm.

    To get started, you might want to try some of these simple commands to
    understand the search problem that is being passed in:

    print "Start:", problem.getStartState()
    print "Is the start a goal?", problem.isGoalState(problem.getStartState())
    print "Start's successors:", problem.getSuccessors(problem.getStartState())
    """
    "*** YOUR CODE HERE ***"
    return puta(problem, util.Stack(), meterNomal, nullHeuristic)

def meterNomal(lista, elemento, coste):
    lista.push(elemento)

def meterCoste(lista, elemento, coste):
    lista.push(elemento, coste)

def puta(problem, tipoCola, colaPusher, heuristic):
    """
    Search the deepest nodes in the search tree first.

    Your search algorithm needs to return a list of actions that reaches the
    goal. Make sure to implement a graph search algorithm.

    To get started, you might want to try some of these simple commands to
    understand the search problem that is being passed in:

    print "Start:", problem.getStartState()
    print "Is the start a goal?", problem.isGoalState(problem.getStartState())
    print "Start's successors:", problem.getSuccessors(problem.getStartState())
    """
    "*** YOUR CODE HERE ***"

    tengoSolucion = False
    listaNegra = util.Stack()                    
    cola = tipoCola
    colaPusher(cola, Nodo(problem.getStartState(), 0, None, None), 1)

    solucion = Nodo([0,0], 0, None, None)
    while cola.isEmpty() is False and tengoSolucion is False:
        nodo = cola.pop()
        while nodo in listaNegra.list:
            if cola.isEmpty():
                break;
            nodo = cola.pop()

        listaNegra.push(nodo)
        if problem.isGoalState(nodo.getState()):
            solucion = nodo
            tengoSolucion = True
            continue;
        hijos = problem.getSuccessors(nodo.getState())
        #print hijos
        
        for hijo in hijos:    
            #print tengoSolucion
            b = hijo
            a = Nodo(b[0], b[1], b[2], nodo)
            if not a in listaNegra.list:
                #colaPusher(cola, a, problem.getCostOfActions(encontrarCamino(a))+HeuristicaProaso(a, ))
                colaPusher(cola, a, problem.getCostOfActions(encontrarCamino(a))+heuristic(a.getState(), problem))
                #colaPusher(cola, a, problem.getCostOfActions(encontrarCamino(a))+manhattanHeuristic(a.getState(), problem))

    "IR ENCONTRANDO PARENTS"
    return encontrarCamino(solucion)
	
def encontrarCamino(solucion):
    camino = []
    selectedNodo = solucion
    while not selectedNodo.getParent() == None:
        #print selectedNodo.getParent()
        camino.append(selectedNodo.getDireccion())    
        selectedNodo2 = selectedNodo.getParent()  
        selectedNodo = selectedNodo2
    #camino.append(selectedNodo.getDireccion())        
    return invertir(camino)

def invertir(var):
        return var[::-1]

def breadthFirstSearch(problem):
    """Search the shallowest nodes in the search tree first."""
    "*** YOUR CODE HERE ***"
    return puta(problem, util.Queue(), meterNomal, nullHeuristic)

def uniformCostSearch(problem):
    """Search the node of least total cost first."""
    "*** YOUR CODE HERE ***"
    return puta(problem, util.PriorityQueue(), meterCoste, nullHeuristic)
    util.raiseNotDefined()

def nullHeuristic(state, problem=None):
    """
    A heuristic function estimates the cost from the current state to the nearest
    goal in the provided SearchProblem.  This heuristic is trivial.
    """
    return 0

def manhattanHeuristic(position, problem, info={}):
    "The Manhattan distance heuristic for a PositionSearchProblem"
    xy1 = position
    xy2 = problem.goal
    return abs(xy1[0] - xy2[0]) + abs(xy1[1] - xy2[1])

def euclideanHeuristic(position, problem, info={}):
    "The Euclidean distance heuristic for a PositionSearchProblem"
    xy1 = position
    xy2 = problem.goal
    return ( (xy1[0] - xy2[0]) ** 2 + (xy1[1] - xy2[1]) ** 2 ) ** 0.5

def aStarSearch(problem, heuristic=nullHeuristic):
    """Search the node that has the lowest combined cost and heuristic first."""
    "*** YOUR CODE HERE ***"
    return puta(problem, util.PriorityQueue(), meterCoste, heuristic)
    util.raiseNotDefined()


# Abbreviations
bfs = breadthFirstSearch
dfs = depthFirstSearch
astar = aStarSearch
ucs = uniformCostSearch
