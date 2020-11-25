"
A utility class to easily get circuits, i.e. SCC with more than one node.
"
Class {
	#name : #MLSccExtractor,
	#superclass : #MLGraphAlgorithm,
	#instVars : [
		'circuits'
	],
	#category : #MLGraph
}

{ #category : #accessing }
MLSccExtractor >> addCircuit: aCollectionOfNodes [
	
	circuits add: aCollectionOfNodes
]

{ #category : #accessing }
MLSccExtractor >> circuits [
	^ circuits
]

{ #category : #initialization }
MLSccExtractor >> initialize [ 

	super initialize.
	circuits := Set new.

]
