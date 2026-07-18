# Hetzner VPS Infrastructure

Reusable Terraform module (`modules/vps/`) plus one directory per deployment (`envs/<name>/`). Each env has its own state, its own `provider "hcloud"` block, and its own Hetzner API token - nothing is shared between environments except the module code.

By default, state is kept local (`envs/<name>/terraform.tfstate`), gitignored, never committed - fine for personal, single-operator infra with no CI apply. The tradeoffs are no locking and no off-machine backup. `atlas` opts into a remote backend (Cloudflare R2) instead, for durability; see below.

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
| `AWS_ACCESS_KEY_ID` | R2 remote state backend (only needed for envs using it, e.g. `atlas`) | Cloudflare dashboard → R2 → Manage API tokens |
| `AWS_SECRET_ACCESS_KEY` | R2 remote state backend (same as above) | Same R2 API token creation screen (shown once) |

```sh
# envs/<name>/.envrc.local
export TF_VAR_hcloud_token="..."
export AWS_ACCESS_KEY_ID="..."       # only if the env uses the R2 backend
export AWS_SECRET_ACCESS_KEY="..."   # only if the env uses the R2 backend
```

**Gotcha:** direnv requires `direnv allow` separately for *each* `.envrc` file, including nested ones - allowing the repo root doesn't cascade to `envs/<name>/.envrc`. If vars aren't loading, `direnv status` from inside the env dir will show the env's `.envrc` as "Found" but not "Loaded"; run `direnv allow` from that directory to fix it.

**Don't debug with `direnv export` / bare `env`** - they print resolved secret values to stdout. If you ever do and the output lands somewhere logged (a screen share, an AI tool, a CI log), treat those secrets as compromised and rotate them.

## Adding a new environment

```sh
cp -r envs/atlas envs/<new-name>
rm -rf envs/<new-name>/.terraform envs/<new-name>/.terraform.lock.hcl envs/<new-name>/.envrc.local
```

Edit `envs/<new-name>/main.tf` to override any `module "vps"` inputs that should differ (server name, location, network CIDR, etc. - see `modules/vps/README.md` for the full input list). Set the new environment's `hcloud_token` via its own `.envrc.local` (a different Hetzner project typically means a different token). If you don't need a remote backend, delete the `backend "s3"` block from the copied `providers.tf` to fall back to local state. Then `terraform init` fresh - no changes needed to `modules/vps/`.

See `modules/vps/README.md` for the module's full inputs/outputs/resources reference.
