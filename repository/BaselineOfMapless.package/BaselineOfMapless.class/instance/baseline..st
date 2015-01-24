baselines
baseline: spec
  <baseline>
  spec
    for: #'common'
    do: [ 
      spec
        baseline: 'GLASS1'
          with: [ 
              spec
                loads: #('GsSqueakCommon');
                repository: 'github://glassdb/glass:master/repository' ];
        yourself.
      spec
        package: 'Mapless'
          with: [ spec requires: #('GLASS1' 'JSON' 'JSONExtensions') ];
        package: 'JSONExtensions'
          with: [ spec requires: #('JSON' 'Collections-OrderPreservingDictionary') ];
        package: 'Collections-OrderPreservingDictionary';
        package: 'JSON';
        yourself.
      spec
        group: 'default' with: #('Core');
        group: 'Core' with: #('Mapless');
        group: 'Tests' with: #();
        group: 'CI' with: #('Core' 'Tests');
        yourself ]