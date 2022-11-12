# Playbooks

### If your shell is broken on a remote machine

If you are unable to get into a working shell on a remote machine (i.e. you are
effectively locked out), try getting into a minimal shell instead to allow you
to repair the problem. That is, try launching `bash` without any start-up files:

```
ssh <hostname> -t bash --noprofile --norc
```

### If your shell is broken on a local machine

If you are unable to get into a working shell on a local machine, try disabling
the start-up files for `bash` to see if they are the source of the problem.
That is, open a file browser and delete the `~/.bashrc` and `~/.bash_profile`
symlinks. Don't worry, we can recreate these symlinks later using the
`create_links.sh` script.
