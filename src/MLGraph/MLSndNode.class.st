Class {
	#name : #MLSndNode,
	#superclass : #MLNodeWithPreviousAndNext,
	#instVars : [
		'visited',
		'bfsAncestor'
	],
	#category : #MLGraph
}

{ #category : #accessing }
MLSndNode >> bfsAncestor [
	^ bfsAncestor
]

{ #category : #accessing }
MLSndNode >> bfsAncestor: anObject [
	bfsAncestor := anObject
]

{ #category : #accessing }
MLSndNode >> visited [
	^ visited
]

{ #category : #accessing }
MLSndNode >> visited: anObject [
	visited := anObject
]
