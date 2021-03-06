Class {
	#name : #AIDijkstraEdge,
	#superclass : #AIWeightedEdge,
	#instVars : [
		'visited'
	],
	#category : #AIGraph
}

{ #category : #initialization }
AIDijkstraEdge >> initialize [ 

	super initialize.
	weight := 1.
	visited := false
]

{ #category : #accessing }
AIDijkstraEdge >> isVisited [

	^ visited
]

{ #category : #accessing }
AIDijkstraEdge >> visited: aBoolean [

	visited := aBoolean 
]
