Class {
	#name : #MLDijkstraEdge,
	#superclass : #MLWeightedEdge,
	#instVars : [
		'visited'
	],
	#category : #MLGraph
}

{ #category : #initialization }
MLDijkstraEdge >> initialize [ 

	super initialize.
	weight := 1.
	visited := false
]

{ #category : #accessing }
MLDijkstraEdge >> isVisited [

	^ visited
]

{ #category : #accessing }
MLDijkstraEdge >> visited: aBoolean [

	visited := aBoolean 
]
