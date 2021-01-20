Class {
	#name : #BaselineOfAIGraph,
	#superclass : #BaselineOf,
	#category : #BaselineOfAIGraph
}

{ #category : #baselines }
BaselineOfAIGraph >> baseline: spec [
  <baseline>
	spec
		for: #(common)
		do: [ 
			spec 
				package: 'AIGraph';
				package: 'AIGraph-Tests'.

			spec 
				group: 'Core' 						with: #('AIGraph');		
				group: 'Tests' 						with: #('AIGraph' 'AIGraph-Tests');
				group: 'default' 					with: #('Core' 'Tests') ]
]
