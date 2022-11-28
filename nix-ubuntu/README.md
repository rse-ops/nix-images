# Nix Ubuntu

This will serve as a base container for nix environments (that should also
work in VS Code). We use an ubuntu base since our user base isn't entirely 
comfortable with nix yet.

## Example Usage

**under development**

```dockerfile
FROM ghcr.io/rse-ops/nix-ubuntu:ubuntu-22.04
COPY shell.nix shell.nix
RUN $HOME/.nix-profile/bin/nix-env -i -f shell.nix
```

To install from the rseops Nix User Repository (!!):

```bash
$ nix-env -f '<nixpkgs>' -iA nur.repos.rseops.conduit
```
