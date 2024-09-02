cwlVersion: v1.0
steps:
  read-potential-cases-i2b2:
    run: read-potential-cases-i2b2.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  other-type-2-diabetes---icduncat:
    run: other-type-2-diabetes---icduncat.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-i2b2/output
  type-2-diabetes-hyperosmolarity---icduncat:
    run: type-2-diabetes-hyperosmolarity---icduncat.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: other-type-2-diabetes---icduncat/output
  type-2-diabetes-unspecified---icduncat:
    run: type-2-diabetes-unspecified---icduncat.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: type-2-diabetes-hyperosmolarity---icduncat/output
  peripheral-type-2-diabetes---icduncat:
    run: peripheral-type-2-diabetes---icduncat.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: type-2-diabetes-unspecified---icduncat/output
  neurological-type-2-diabetes---icduncat:
    run: neurological-type-2-diabetes---icduncat.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: peripheral-type-2-diabetes---icduncat/output
  opthalamic-type-2-diabetes---icduncat:
    run: opthalamic-type-2-diabetes---icduncat.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: neurological-type-2-diabetes---icduncat/output
  renal-type-2-diabetes---icduncat:
    run: renal-type-2-diabetes---icduncat.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: opthalamic-type-2-diabetes---icduncat/output
  type-2-diabetes-mention---icduncat:
    run: type-2-diabetes-mention---icduncat.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: renal-type-2-diabetes---icduncat/output
  type-2-diabetes-kidney---icduncat:
    run: type-2-diabetes-kidney---icduncat.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: type-2-diabetes-mention---icduncat/output
  nonproliferative-type-2-diabetes---icduncat:
    run: nonproliferative-type-2-diabetes---icduncat.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: type-2-diabetes-kidney---icduncat/output
  moderate-type-2-diabetes---icduncat:
    run: moderate-type-2-diabetes---icduncat.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: nonproliferative-type-2-diabetes---icduncat/output
  type-2-diabetes-sever---icduncat:
    run: type-2-diabetes-sever---icduncat.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: moderate-type-2-diabetes---icduncat/output
  type-2-diabetes---icduncat:
    run: type-2-diabetes---icduncat.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: type-2-diabetes-sever---icduncat/output
  type-2-diabetes-circulatory---icduncat:
    run: type-2-diabetes-circulatory---icduncat.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: type-2-diabetes---icduncat/output
  arthropathy-type-2-diabetes---icduncat:
    run: arthropathy-type-2-diabetes---icduncat.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: type-2-diabetes-circulatory---icduncat/output
  type-2-diabetes-mellitus---icduncat:
    run: type-2-diabetes-mellitus---icduncat.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: arthropathy-type-2-diabetes---icduncat/output
  type-2-diabetes-hypoglycemia---icduncat:
    run: type-2-diabetes-hypoglycemia---icduncat.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule18
      potentialCases:
        id: potentialCases
        source: type-2-diabetes-mellitus---icduncat/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule19
      potentialCases:
        id: potentialCases
        source: type-2-diabetes-hypoglycemia---icduncat/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
  inputModule18:
    id: inputModule18
    doc: Python implementation unit
    type: File
  inputModule19:
    id: inputModule19
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
