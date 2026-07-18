# Hetzner VPS Infrastructure

Reusable Terraform module (`modules/vps/`) plus one directory per deployment (`envs/<name>/`). Each env has its own local state, its own `provider "hcloud"` block, and its own Hetzner API token - nothing is shared between environments except the module code.

State is kept local (`envs/<name>/terraform.tfstate`), gitignored, never committed. No remote backend, no Terraform workspaces: the environment directory itself is the isolation boundary. This is fine for personal, single-operator infra with no CI apply - the two real tradeoffs are no state locking and no off-machine backup, worth knowing but not a blocker here.

## Usage

```sh
cd envs/atlas
direnv allow                 # nested .envrc files need their own allow, see gotcha below
terraform init
terraform plan
terraform apply
```

### Required `.envrc.local` variables

Secrets are never written to a tracked file - only to `envs/<name>/.envrc.local` (gitignored), sourced automatically by each env's `.envrc` (`source_up` + `source_env_if_exists .envrc.local`).

| Variable | Used for | Where to get it |
|---|---|---|
| `TF_VAR_hcloud_token` | `provider "hcloud"` auth | Hetzner Cloud Console → Security → API Tokens |

```sh
# envs/<name>/.envrc.local
export TF_VAR_hcloud_token="..."
```

**Gotcha:** direnv requires `direnv allow` separately for *each* `.envrc` file, including nested ones - allowing the repo root doesn't cascade to `envs/<name>/.envrc`. If vars aren't loading, `direnv status` from inside the env dir will show the env's `.envrc` as "Found" but not "Loaded"; run `direnv allow` from that directory to fix it.

**Don't debug with `direnv export` / bare `env`** - they print resolved secret values to stdout. If you ever do and the output lands somewhere logged (a screen share, an AI tool, a CI log), treat those secrets as compromised and rotate them.

## Adding a new environment

```sh
cp -r envs/atlas envs/<new-name>
rm -rf envs/<new-name>/.terraform envs/<new-name>/.terraform.lock.hcl envs/<new-name>/.envrc.local
```

Edit `envs/<new-name>/main.tf` to override any `module "vps"` inputs that should differ (server name, location, network CIDR, etc. - see `modules/vps/README.md` for the full input list). Set the new environment's `hcloud_token` via its own `.envrc.local` (a different Hetzner project typically means a different token). Then `terraform init` fresh - no changes needed to `modules/vps/`.

See `modules/vps/README.md` for the module's full inputs/outputs/resources reference.
