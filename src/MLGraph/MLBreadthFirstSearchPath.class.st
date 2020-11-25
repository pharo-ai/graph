"
Breadth-first search (BFS) is an algorithm for traversing or searching tree or graph data structures. It starts at the tree root (or some arbitrary node of a graph, sometimes referred to as a `search key') and explores the neighbor nodes first, before moving to the next level neighbours. (source: Wikipedia)
"
Class {
	#name : #MLBreadthFirstSearchPath,
	#superclass : #MLGraphAlgorithm,
	#instVars : [
		'start',
		'end',
		'fifo'
	],
	#category : #MLGraph
}

{ #category : #configuration }
MLBreadthFirstSearchPath >> edgeClass [

	^ MLGraphEdge 
]

{ #category : #private }
MLBreadthFirstSearchPath >> end [
	^ end
]

{ #category : #private }
MLBreadthFirstSearchPath >> end: aDijsktraNode [
	end := aDijsktraNode
]

{ #category : #configuration }
MLBreadthFirstSearchPath >> nodeClass [

	^ MLBfsNode 
]

{ #category : #running }
MLBreadthFirstSearchPath >> run [
	
	| path |
	fifo := OrderedCollection withAll: start nextEdges.
	start firstDepth: 0.
	path := self run: 1.
	start notVisited .
	^ path
]

{ #category : #running }
MLBreadthFirstSearchPath >> run: depth [
	| edge path next |
	edge := fifo removeFirst.
	next := edge to.
	^ next = end
		ifTrue: [ OrderedCollection with: edge from model with: end model ]
		ifFalse:
			[ next visited
				ifFalse:
					[ fifo addAll: next nextEdges.
					next firstDepth: depth ].	"only add edges if node not already visited (avoid cycles on the path)"
			path := self run: depth + 1.	"continue recursion"
			(depth = next firstDepth) "out of stack"
				ifTrue: [
					(path first = next model) "backtrack along the path"
						ifTrue: [ path addFirst: edge from model ].	
					"reset visited for next run"
					next notVisited ].
			path ]	"stop recursion, start backtrack"
]

{ #category : #running }
MLBreadthFirstSearchPath >> runFrom: startModel to: endModel [
	self
		start: (self findNode: startModel);
		end: (self findNode: endModel).
	^ self run
]

{ #category : #private }
MLBreadthFirstSearchPath >> start [
	^ start
]

{ #category : #private }
MLBreadthFirstSearchPath >> start: aDijsktraNode [
	start := aDijsktraNode.

]
