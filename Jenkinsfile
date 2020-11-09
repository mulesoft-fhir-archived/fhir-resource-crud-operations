pipeline {
  agent {
    label 'bat-builder'
  }
  stages {
    stage('Tirgger dev pipelines') {
      when {
        branch 'issue-1'
      }
      steps {
        build 'Certified_Demos/1HLS-Demo/FHIR R4 Payer/1hls-sys-fhir-r4-patient-api/dev'
      }
    }
  }
}