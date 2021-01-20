"
A utility class to easily get circuits, i.e. SCC with more than one node.
"
Class {
	#name : #AISccExtractor,
	#superclass : #AIGraphAlgorithm,
	#instVars : [
		'circuits'
	],
	#category : #AIGraph
}

{ #category : #accessing }
AISccExtractor >> addCircuit: aCollectionOfNodes [
	
	circuits add: aCollectionOfNodes
]

{ #category : #accessing }
AISccExtractor >> circuits [
	^ circuits
]

{ #category : #initialization }
AISccExtractor >> initialize [ 

	super initialize.
	circuits := Set new.

]
