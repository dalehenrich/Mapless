baselines
baseline: spec
  <baseline>
  spec
    for: #'common'
    do: [ 
      spec
        package: 'Mapless-Core'
          with: [ spec requires: #('JSON' 'JSONExtensions') ];
        package: 'Mapless-Tests-Core'
          with: [ spec requires: #('Mapless-Core') ];
        package: 'Mapless-Mongo' with: [ spec requires: #('Mapless-Core') ];
        package: 'Mapless-Tests-Mongo'
          with: [ spec requires: #('Mapless-Tests-Core') ];
        package: 'Mapless-Redis' with: [ spec requires: #('Mapless-Core') ];
        package: 'Mapless-Tests-Redis'
          with: [ spec requires: #('Mapless-Tests-Core') ];
        package: 'JSONExtensions'
          with: [ spec requires: #('JSON' 'Collections-OrderPreservingDictionary') ];
        package: 'Collections-OrderPreservingDictionary';
        package: 'JSON';
        yourself.
      spec
        group: 'default' with: #('Core');
        group: 'Core' with: #('Mapless-Core');
        group: 'Mongo' with: #('Mapless-Mongo');
        group: 'Redis' with: #('Mapless-Redis');
        group: 'Tests'
          with: #('Mapless-Tests-Core' 'Mongo Tests' 'Redis Tests');
        group: 'Mongo Tests' with: #('Mapless-Tests-Mongo');
        group: 'Redis Tests' with: #('Mapless-Tests-Redis');
        yourself ].
  spec
    for: #'gemstone'
    do: [ 
      spec
        baseline: 'GLASS1'
          with: [ 
              spec
                loads: #('GsSqueakCommon');
                repository: 'github://glassdb/glass:master/repository' ];
        yourself.
      spec
        package: 'Mapless-GemStone'
          with: [ spec requires: #('Mapless-Core' 'GLASS1') ];
        package: 'Mapless-Tests-GemStone'
          with: [ spec requires: #('Mapless-Tests-Core') ];
        package: 'JSON' with: [ spec requires: #('GLASS1') ];
        yourself.
      spec
        group: 'GemStone' with: #('Mapless-GemStone');
        group: 'GemStone Tests' with: #('Mapless-Tests-GemStone');
        group: 'Tests' with: #('GemStone Tests');
        group: 'CI' with: #('GemStone Tests');
        yourself ]