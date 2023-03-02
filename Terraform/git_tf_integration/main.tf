resource "github_repository" "git_frontend_repo" {
  name        = "frontendCICD"
  description = "My awesome codebase"

  visibility = "public"

}

resource "github_branch" "development" {
  repository = "frontendCICD"
  branch     = "development"
}

resource "github_branch_default" "default" {
  repository = github_repository.git_frontend_repo.name
  branch     = github_branch.development.branch
}

resource "github_branch_protection" "example" {
  repository_id = github_repository.git_frontend_repo.name
  # also accepts repository name
  # repository_id  = github_repository.example.name

  pattern          = "main"
  enforce_admins   = true
  allows_deletions = true

  required_status_checks {
    strict   = false
    contexts = ["ci/travis"]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews = true
    restrict_dismissals   = true
    dismissal_restrictions = [
      data.github_user.example.node_id,
      github_team.example.node_id,
      "/exampleuser",
      "exampleorganization/exampleteam",
    ]
  }

  push_restrictions = [
    data.github_user.example.node_id,
    "/exampleuser",
    "exampleorganization/exampleteam",
    # limited to a list of one type of restriction (user, team, app)
    # github_team.example.node_id
  ]

}

resource "github_repository" "example" {
  name = "test"
}

data "github_user" "example" {
  username = "example"
}

resource "github_team" "example" {
  name = "Example Name"
}

resource "github_team_repository" "example" {
  team_id    = github_team.example.id
  repository = github_repository.git_frontend_repo.name
  permission = "pull"
}
