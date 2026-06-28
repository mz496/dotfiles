#!/usr/bin/env bash
#
# sync.sh — mirror Warp config between ~/.warp and this repo's warp/.warp/
#
# Pick a direction:
#   --local-to-repo   copy ~/.warp        -> repo warp/.warp/
#   --repo-to-local   copy repo warp/.warp/ -> ~/.warp
#
# Dry-run by default (shows what would change). Pass --force to apply.
# Both directions are exact mirrors (deletes extras in the destination),
# so they roundtrip.
#
# Safe to source or execute: it never calls `exit` on the parent shell,
# so it will not close your terminal for any reason.

# Detect whether we're being sourced; if so we must `return`, never `exit`.
_sync_sourced=0
if [ -n "${ZSH_VERSION:-}" ]; then
  case "${ZSH_EVAL_CONTEXT:-}" in *:file*) _sync_sourced=1 ;; esac
elif [ -n "${BASH_VERSION:-}" ]; then
  [ "${BASH_SOURCE[0]}" != "${0}" ] && _sync_sourced=1
fi

# All logic lives in a function so error paths use `return`, never `exit`.
# No `set -e` (it would abort an interactive shell when sourced).
_sync_main() {
  local script_dir repo local direction dry_run src dest arg usage rc
  usage="Usage: sync.sh {--local-to-repo|--repo-to-local} [--force]"

  script_dir="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)" || return 1
  repo="${script_dir}/.warp/"
  local="${HOME}/.warp/"

  direction=""
  dry_run=1
  for arg in "$@"; do
    case "$arg" in
      --local-to-repo) direction="local-to-repo" ;;
      --repo-to-local) direction="repo-to-local" ;;
      --force) dry_run=0 ;;
      *)
        echo "Unknown argument: $arg" >&2
        echo "$usage" >&2
        return 1
        ;;
    esac
  done

  case "$direction" in
    local-to-repo) src="$local"; dest="$repo" ;;
    repo-to-local) src="$repo";  dest="$local" ;;
    *)
      echo "Pick a direction: --local-to-repo or --repo-to-local" >&2
      echo "$usage" >&2
      return 1
      ;;
  esac

  if [ ! -d "$src" ]; then
    echo "Source does not exist: $src" >&2
    return 1
  fi

  mkdir -p "$dest" || return 1

  local flags=(-a --delete --itemize-changes --exclude='*.swp')
  if [ "$dry_run" -eq 1 ]; then
    flags+=(--dry-run)
    echo "DRY RUN — copying ${src} -> ${dest}"
    echo "No changes will be made. Re-run with --force to apply."
  else
    echo "Copying ${src} -> ${dest}"
  fi
  echo

  rsync "${flags[@]}" "$src" "$dest"
  rc=$?
  echo

  if [ "$rc" -ne 0 ]; then
    echo "rsync failed (exit $rc)." >&2
    return "$rc"
  fi

  if [ "$dry_run" -eq 1 ]; then
    echo "Dry run complete."
  else
    echo "Sync complete."
  fi
  return 0
}

_sync_main "$@"
_sync_rc=$?

# Return when sourced (don't kill the shell); exit only when executed.
if [ "$_sync_sourced" -eq 1 ]; then
  unset -f _sync_main 2>/dev/null
  unset _sync_sourced
  return "$_sync_rc" 2>/dev/null || true
else
  exit "$_sync_rc"
fi
