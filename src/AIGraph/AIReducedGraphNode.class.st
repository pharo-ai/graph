"
Node used by the MalReducedGraph algorithm.
It has an additional instance variable to track merged nodes.
"
Class {
	#name : #AIReducedGraphNode,
	#superclass : #AINodeWithPreviousAndNext,
	#instVars : [
		'mergedNodes'
	],
	#category : #AIGraph
}

{ #category : #accessing }
AIReducedGraphNode >> label [
	^ ''
]

{ #category : #accessing }
AIReducedGraphNode >> mergedNodes [
	^ mergedNodes
]

{ #category : #setting }
AIReducedGraphNode >> mergedNodes: aNodeList [
	mergedNodes := aNodeList
]
