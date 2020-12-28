alias qcommit="git --no-optional-locks -c color.status=false status --porcelain=v1 | sed '/\?\?/d' | git commit -F -"
