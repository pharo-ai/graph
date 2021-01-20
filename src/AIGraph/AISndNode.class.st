Class {
	#name : #AISndNode,
	#superclass : #AINodeWithPreviousAndNext,
	#instVars : [
		'visited',
		'bfsAncestor'
	],
	#category : #AIGraph
}

{ #category : #accessing }
AISndNode >> bfsAncestor [
	^ bfsAncestor
]

{ #category : #accessing }
AISndNode >> bfsAncestor: anObject [
	bfsAncestor := anObject
]

{ #category : #accessing }
AISndNode >> visited [
	^ visited
]

{ #category : #accessing }
AISndNode >> visited: anObject [
	visited := anObject
]
