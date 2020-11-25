Class {
	#name : #MLDominanceTest,
	#superclass : #TestCase,
	#instVars : [
		'dom'
	],
	#category : #'MLGraph-Tests'
}

{ #category : #running }
MLDominanceTest >> setUp [
	super setUp.
	dom := MLDominance new
]

{ #category : #tests }
MLDominanceTest >> testCycle [
	| a b c |
	MLGraphFixture cycleGraph: dom.
	dom run.
	dom nodes
		do: [ :n | 
			n model = $c
				ifTrue: [
					self assert: n isDominant.
					self deny: n isDominated ]
				ifFalse: [ self deny: n isDominant.
					n model = $d
						ifTrue: [ self deny: n isDominated ]
						ifFalse: [ self assert: n isDominated ] ] ].
	a := dom findNode: $a.
	b := dom findNode: $b.
	c := dom findNode: $c.
	self assert: a find equals: c.
	self assert: b find equals: c
]

{ #category : #tests }
MLDominanceTest >> testSimple [
	| a b c d |
	MLGraphFixture simpleGraph: dom.
	dom run.
	dom nodes
		do: [ :n | 
			n model = $a
				ifTrue: [ 
					self assert: n isDominant.
					self deny: n isDominated ]
				ifFalse: [ self deny: n isDominant ] ].
	a := dom findNode: $a.
	b := dom findNode: $b.
	c := dom findNode: $c.
	d := dom findNode: $d.
	self assert: b find equals: a.
	self deny: c isDominated.
	self deny: d isDominated
]
