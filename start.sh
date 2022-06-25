#!/bin/sh
# bin/mk eval "Mk.Repo.__adapter__.storage_down(Mk.Repo.config)"
bin/mk eval "Mk.Repo.__adapter__.storage_up(Mk.Repo.config)"
bin/mk eval "Mk.Release.migrate"
# bin/mk eval "Code.eval_file(Path.join([:code.priv_dir(:mk), \"repo\", \"seeds.exs\"]))"
bin/mk start