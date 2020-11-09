pipeline {
  agent any
  stage('Tirgger dev pipelines') {
    when {
      branch 'issue-1'
    }
    steps {
      build '../1hls-sys-fhir-r4-patient-api/dev'
    }
  }
}