Class {
	#name : #AIHitsFixtureTest,
	#superclass : #TestCase,
	#instVars : [
		'hits'
	],
	#category : #'AIGraph-Tests'
}

{ #category : #running }
AIHitsFixtureTest >> setUp [
	super setUp.
	hits := AIHits new
]

{ #category : #tests }
AIHitsFixtureTest >> testComplexCycle [
	AIGraphFixture complexCycleGraph: hits.
	self shouldnt: [ hits run ] raise: Error
]

{ #category : #tests }
AIHitsFixtureTest >> testComplexWCycle [
	AIGraphFixture complexWeightedGraph: hits.
	self shouldnt: [ hits run ] raise: Error
]

{ #category : #tests }
AIHitsFixtureTest >> testCycle [
	AIGraphFixture cycleGraph: hits.
	self shouldnt: [ hits run ] raise: Error
]

{ #category : #tests }
AIHitsFixtureTest >> testNestedCycle [
	AIGraphFixture nestedCycleGraph: hits.
	self shouldnt: [ hits run ] raise: Error
]

{ #category : #tests }
AIHitsFixtureTest >> testSimple [
	AIGraphFixture simpleGraph: hits.
	self shouldnt: [ hits run ] raise: Error
]

{ #category : #tests }
AIHitsFixtureTest >> testSimpleW [
	AIGraphFixture simpleWeightedGraph: hits.
	self shouldnt: [ hits run ] raise: Error
]
