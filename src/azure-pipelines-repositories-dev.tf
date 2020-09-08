resource "azuredevops_build_definition" "build-admin-spa-dev" {
  project_id = data.azuredevops_project.project.id
  name       = "MPIS.Admin.SPA-CI-CD-dev"
  path       = "\\Pipelines-Dev"

  depends_on = [null_resource.clone_spa_repo]

  ci_trigger {
    use_yaml = true
  }

  repository {
    repo_type   = "TfsGit"
    repo_id     = azuredevops_git_repository.spa_repository.id
    branch_name = azuredevops_git_repository.spa_repository.default_branch
    yml_path    = "public-spa-dev.yml"
  }

  # variable_groups = [
  #   azuredevops_variable_group.var_group_common.id
  # ]

#   variable {
#     name  = "azuresubscriptionid"
#     value = "$(AZURE_SUSCRIPTION_ID)"
#     is_secret = false
#   }

#   variable {
#     name      = "azuretenantid"
#     value     = "$(AZURE_TENANT_ID)"
#     is_secret = false
#   }

#   variable {
#     name      = "terraformclientid"
#     value     = "$(AZURE_CLIENT_ID)"
#     is_secret = false
#   }

#   variable {
#     name      = "terraformclientsecret"
#     value     = "$(PAT_PORTAL)"
#     is_secret = false
#   }

#   variable {
#     name      = "orgserviceurl"
#     value     = "$(ORG_SERVICE_URL)"
#     is_secret = false
#   }

#   variable {
#     name      = "personalaccesstoken"
#     value     = "$(PAT_DEVOPS)"
#     is_secret = false
#   }

#   variable {
#     name      = "devopsprojectname"
#     value     = "$(DEVOPS_PROJECT_NAME)"
#     is_secret = false
#   }

#   variable {
#     name      = "orgserviceurl"
#     value     = "$(ORG_SERVICE_URL)"
#     is_secret = false
#   }

#   variable {
#     name      = "orguser"
#     value     = "$(ORG_USER)"
#     is_secret = false
#   }

}

resource "azuredevops_build_definition" "build-user-dev" {
  project_id = data.azuredevops_project.project.id
  name       = "MPIS.User-CI-CD-dev"
  path       = "\\Pipelines-Dev"

  depends_on = [null_resource.clone_user_repo]

  ci_trigger {
    use_yaml = true
  }

  repository {
    repo_type   = "TfsGit"
    repo_id     = azuredevops_git_repository.user_repository.id
    branch_name = azuredevops_git_repository.user_repository.default_branch
    yml_path    = "user-pipeline.yml"
  }

}

resource "azuredevops_build_definition" "build-device-dev" {
  project_id = data.azuredevops_project.project.id
  name       = "MPIS.Device-CI-CD-dev"
  path       = "\\Pipelines-Dev"

  depends_on = [null_resource.clone_user_repo]

  ci_trigger {
    use_yaml = true
  }

  repository {
    repo_type   = "TfsGit"
    repo_id     = azuredevops_git_repository.device_repository.id
    branch_name = azuredevops_git_repository.device_repository.default_branch
    yml_path    = "device-pipeline.yml"
  }

}