Class {
	#name : #MLBreadthFirstSearchPathTest,
	#superclass : #TestCase,
	#instVars : [
		'bfsp'
	],
	#category : #'MLGraph-Tests'
}

{ #category : #running }
MLBreadthFirstSearchPathTest >> setUp [
	super setUp.
	bfsp := MLBreadthFirstSearchPath new
]

{ #category : #tests }
MLBreadthFirstSearchPathTest >> testAseGraph [
	MLGraphFixture aseCircuitGraph: bfsp.
	self assert: (#($a $b $c) hasEqualElements: (bfsp runFrom: $a to: $c)).
	self assert: (#($d $b $c) hasEqualElements: (bfsp runFrom: $d to: $c)).
	self assert: (#($e $a) hasEqualElements: (bfsp runFrom: $e to: $a)).
	self assert: (#($a $b $d $e) hasEqualElements: (bfsp runFrom: $a to: $e)).
	self assert: (#($d $b $c $f) hasEqualElements: (bfsp runFrom: $d to: $f)).
	self should: [ bfsp runFrom: $f to: $a ] raise: Error
]

{ #category : #tests }
MLBreadthFirstSearchPathTest >> testSimpleGraph [
	MLGraphFixture simpleGraph: bfsp.
	self assert: (#($a $b $c) hasEqualElements: (bfsp runFrom: $a to: $c)).
	self assert: (#($d $c) hasEqualElements: (bfsp runFrom: $d to: $c))
]
