# resource "null_resource" "clone_user_repo" {

#     provisioner "local-exec" {
#         command = "git clone https://github.com/lmfespinosa/DevOps-MEng-UNIR-MPIS.User && cd DevOps-MEng-UNIR-MPIS.User && git branch -a && git checkout master && git fetch --tags && git tag && git branch -a && git remote rm origin && git remote add origin ${var.org_service_url}/${data.azuredevops_project.project}/_git/MPIS.User && git pull --allow-unrelated-histories origin master && git push --set-upstream origin master && cd .. && rmdir /s /Q DevOps-MEng-UNIR-MPIS.User"
#     }

#     depends_on = [data.azuredevops_project.project, azuredevops_git_repository.user_repository]
# }


# resource "null_resource" "clone_device_repo" {

#     provisioner "local-exec" {
#         command = "git clone https://github.com/lmfespinosa/DevOps-MEng-UNIR-MPIS.Device && cd DevOps-MEng-UNIR-MPIS.Device && git branch -a && git checkout master && git fetch --tags && git tag && git branch -a && git remote rm origin && git remote add origin ${var.org_service_url}/${data.azuredevops_project.project}/_git/MPIS.Device && git pull --allow-unrelated-histories origin master && git push --set-upstream origin master && cd .. && rmdir /s /Q DevOps-MEng-UNIR-MPIS.Device"
#     }

#     depends_on = [data.azuredevops_project.project, azuredevops_git_repository.device_repository]
# }

# resource "null_resource" "clone_spa_repo" {

#     provisioner "local-exec" {
#         command = "git clone https://github.com/lmfespinosa/DevOps-MEng-UNIR-MPIS.Admin.SPA && cd DevOps-MEng-UNIR-MPIS.Admin.SPA && git branch -a && git checkout master && git fetch --tags && git tag && git branch -a && git remote rm origin && git remote add origin ${var.org_service_url}/${data.azuredevops_project.project}/_git/MPIS.Admin.SPA && git pull --allow-unrelated-histories origin master && git push --set-upstream origin master && cd .. && rmdir /s /Q DevOps-MEng-UNIR-MPIS.Admin.SPA"
#     }

#     depends_on = [data.azuredevops_project.project, azuredevops_git_repository.spa_repository]
# }

# resource "null_resource" "clone_agent_repo" {

#     provisioner "local-exec" {
#         command = "git clone https://github.com/lmfespinosa/DevOps-MEng-UNIR-MPIS.InventoryAgent && cd DevOps-MEng-UNIR-MPIS.InventoryAgent && git branch -a && git checkout master && git fetch --tags && git tag && git branch -a && git remote rm origin && git remote add origin ${var.org_service_url}/${data.azuredevops_project.project}/_git/MPIS.InventoryAgent && git pull --allow-unrelated-histories origin master && git push --set-upstream origin master && cd .. && rmdir /s /Q DevOps-MEng-UNIR-MPIS.InventoryAgent"
#     }

#     depends_on = [data.azuredevops_project.project, azuredevops_git_repository.agent_repository]
# }

resource "null_resource" "clone_infrastructure_repo" {


    provisioner "local-exec" {
        #command = "git clone --mirror https://github.com/lmfespinosa/test-repo.git && cd test-repo.git && git remote add ${azuredevops_git_repository.repository.remote_url}.gt &&  git remote add origin ${azuredevops_git_repository.repository.remote_url}.git  && git push --force --set-upstream origin master ${azuredevops_git_repository.repository.remote_url}.git"
        #command = "git clone ${azuredevops_git_repository.repository.remote_url} && "
        command = "echo __personalaccesstoken__ | az devops login --organization ${var.org_service_url} && git clone https://github.com/lmfespinosa/DevOps-MEng-UNIR-MPIS.Infrastructure && cd DevOps-MEng-UNIR-MPIS.Infrastructure && git branch -a && git checkout master && git fetch --tags && git tag && git branch -a && git remote rm origin && git remote add origin https://__personalaccesstoken__@dev.azure.com/${var.org_user}/${data.azuredevops_project.project.project_name}/_git/MPIS.Infrastructure && git pull --allow-unrelated-histories origin master && git push https://__personalaccesstoken__@dev.azure.com/${var.org_user}/${data.azuredevops_project.project.project_name}/_git/MPIS.Infrastructure master && cd .. && rmdir /s /Q DevOps-MEng-UNIR-MPIS.Infrastructure"
    }

    depends_on = [data.azuredevops_project.project, azuredevops_git_repository.infrastructure_repository]
}

