Class {
	#name : #MLGraphEdgeTest,
	#superclass : #TestCase,
	#category : #'MLGraph-Tests'
}

{ #category : #tests }
MLGraphEdgeTest >> testPrintString [
	self
		assert: (MLGraphEdge with: 'model' from: 'from' to: 'to') printString
		equals:  '''from'' -> ''to'''.
]
