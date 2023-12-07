#!/usr/bin/env bash
#/ Usage: sling.sh
#/ Help intentionally left empty.

set -e

show_help() { grep ^#/ <"${0}" | cut -c4-; }
[ "${*}" == "-h" ] && show_help && exit 0

LOG_FILE="${HOME}/Library/Logs/sling.log"

BECOME_COMMAND="
	./commands/{} 2> >(tee -a ${LOG_FILE} >&2) \
	|| \
		( \
			echo './commands/{} failed' && \
			echo '${LOG_FILE}' | pbcopy && \
			echo 'Look at ${LOG_FILE} (in your clipboard)' && \
			echo 'Press <CR> to exit... ' && \
			read -r \
		)
"

find "./commands" \
	-type f \
	-exec basename {} \; \
	| sort \
	| fzf \
		--preview-window="bottom" \
		--preview="./commands/{} -h" \
		--bind="enter:become(${BECOME_COMMAND})"
