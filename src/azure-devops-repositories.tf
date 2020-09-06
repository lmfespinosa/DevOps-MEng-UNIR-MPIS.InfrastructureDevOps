# Create a specific Git repository by name
resource "azuredevops_git_repository" "user_repository" {
  project_id = data.azuredevops_project.project.id
  name       = "MPIS.User"

initialization {
    init_type = "Clean"

  }
 
}

resource "azuredevops_git_repository" "device_repository" {
  project_id = data.azuredevops_project.project.id
  name       = "MPIS.Device"

initialization {
    init_type = "Clean"

  }
 
}

resource "azuredevops_git_repository" "spa_repository" {
  project_id = data.azuredevops_project.project.id
  name       = "MPIS.Admin.SPA"

initialization {
    init_type = "Clean"

  }
 
}

resource "azuredevops_git_repository" "agent_repository" {
  project_id = data.azuredevops_project.project.id
  name       = "MPIS.InventoryAgent"

initialization {
    init_type = "Clean"

  }
 
}

resource "azuredevops_git_repository" "repository" {
  project_id = azuredevops_project.project.id
  name       = "MPIS.Infrastructure"

initialization {
    init_type = "Clean"

  }
 
}



