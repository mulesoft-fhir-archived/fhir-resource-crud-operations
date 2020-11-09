pipeline {
  stage('Tirgger dev pipelines') {
    when {
      branch 'dev'
    }
    steps {
      build '../1hls-sys-fhir-r4-patient-api/dev'
    }
  }
}