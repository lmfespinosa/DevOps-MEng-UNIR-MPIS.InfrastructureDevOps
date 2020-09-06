resource "azuredevops_build_definition" "build-dev" {
  project_id = data.azuredevops_project.project.id
  name       = "Terraform-CI-CD-dev"
  path       = "\\Pipelines-Dev"

  depends_on = [null_resource.clone_infrastructure_repo]

  ci_trigger {
    use_yaml = true
  }

  repository {
    repo_type   = "TfsGit"
    repo_id     = azuredevops_git_repository.infrastructure_repository.id
    branch_name = azuredevops_git_repository.infrastructure_repository.default_branch
    yml_path    = "terraform-pipeline.yml"
  }

  variable_groups = [
    azuredevops_variable_group.vars.id
  ]

  variable {
    name  = "azuresubscriptionid"
    value = "$(AZURE_SUSCRIPTION_ID)"
    is_secret = false
  }

  variable {
    name      = "azuretenantid"
    value     = "$(AZURE_TENANT_ID)"
    is_secret = false
  }

  variable {
    name      = "terraformclientid"
    value     = "$(AZURE_CLIENT_ID)"
    is_secret = false
  }

  variable {
    name      = "terraformclientsecret"
    value     = "$(PAT_PORTAL)"
    is_secret = false
  }

  variable {
    name      = "orgserviceurl"
    value     = "$(ORG_SERVICE_URL)"
    is_secret = false
  }

  variable {
    name      = "personalaccesstoken"
    value     = "$(PAT_DEVOPS)"
    is_secret = false
  }

  variable {
    name      = "devopsprojectname"
    value     = "$(DEVOPS_PROJECT_NAME)"
    is_secret = false
  }

  variable {
    name      = "orgserviceurl"
    value     = "$(ORG_SERVICE_URL)"
    is_secret = false
  }

  variable {
    name      = "orguser"
    value     = "$(ORG_USER)"
    is_secret = false
  }

}

resource "null_resource" "execute-pipe-dev" {

#az account set --subscription "Company Subscription"
    #connection {
    #    type = "ssh"
    #    user = "azureuser"
    #    password = "azureuser@2018"
    #    host = "13.92.255.50"
    #    port = 22
    #}
    #provisioner "file" {
    #    source = "script.sh"
    #    destination = "/tmp/script.sh"
    #}

    provisioner "local-exec" {
        command = "echo ${var.pat_devops} | az devops login && az devops configure --defaults organization=${var.org_service_url} && az pipelines run --project=${data.azuredevops_project.project.id} --name=Terraform-CI-CD-dev --org=${var.org_service_url}/"
        
    }

    depends_on = [azuredevops_build_definition.build-dev]
}

##az extension add --name azure-devops