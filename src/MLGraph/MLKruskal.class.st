"
Kruskal's algorithm is a greedy algorithm in graph theory that finds a minimum spanning tree for a connected weighted graph. This means it finds a subset of the edges that forms a tree that includes every vertex, where the total weight of all the edges in the tree is minimized. If the graph is not connected, then it finds a minimum spanning forest (a minimum spanning tree for each connected component).

See https://en.wikipedia.org/wiki/Kruskal%27s_algorithm
"
Class {
	#name : #MLKruskal,
	#superclass : #MLGraphAlgorithm,
	#instVars : [
		'sortBlock'
	],
	#category : #MLGraph
}

{ #category : #configuration }
MLKruskal >> edgeClass [
	^ MLWeightedEdge 
]

{ #category : #initialization }
MLKruskal >> initialize [
	super initialize.
	self minSpanningTree 
]

{ #category : #configuration }
MLKruskal >> maxSpanningTree [
	sortBlock := [:e1 :e2 | e1 weight > e2 weight]

]

{ #category : #configuration }
MLKruskal >> minSpanningTree [
	sortBlock := [:e1 :e2 | e1 weight < e2 weight]

]

{ #category : #configuration }
MLKruskal >> nodeClass [
	^ MLDisjointSetNode 
]

{ #category : #running }
MLKruskal >> run [
	| treeEdges |
	treeEdges := OrderedCollection new.
	nodes do: #makeSet.
	(edges asSortedCollection: sortBlock)
		reject: [ :edge | edge from find = edge to find ]
		thenDo: [ :edge | 
			edge from union: edge to.
			treeEdges add: edge ].
	^ treeEdges
]

{ #category : #configuration }
MLKruskal >> sortBlock: aBlock [
	sortBlock := aBlock
]
