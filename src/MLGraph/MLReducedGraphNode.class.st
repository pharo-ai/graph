"
Node used by the MalReducedGraph algorithm.
It has an additional instance variable to track merged nodes.
"
Class {
	#name : #MLReducedGraphNode,
	#superclass : #MLNodeWithPreviousAndNext,
	#instVars : [
		'mergedNodes'
	],
	#category : #MLGraph
}

{ #category : #accessing }
MLReducedGraphNode >> label [
	^ ''
]

{ #category : #accessing }
MLReducedGraphNode >> mergedNodes [
	^ mergedNodes
]

{ #category : #setting }
MLReducedGraphNode >> mergedNodes: aNodeList [
	mergedNodes := aNodeList
]
