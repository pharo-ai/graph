Class {
	#name : #AIGraphEdgeTest,
	#superclass : #TestCase,
	#category : #'AIGraph-Tests'
}

{ #category : #tests }
AIGraphEdgeTest >> testPrintString [
	self
		assert: (AIGraphEdge with: 'model' from: 'from' to: 'to') printString
		equals:  '''from'' -> ''to'''.
]
