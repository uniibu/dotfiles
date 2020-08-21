_node_complete() {
  local cur_word options
  cur_word="${COMP_WORDS[COMP_CWORD]}"
  if [[ "${cur_word}" == -* ]] ; then
    COMPREPLY=( $(compgen -W '--experimental-modules --perf-prof --perf-prof-unwinding-info --tls-min-v1.0 --pending-deprecation --tls-min-v1.2 --heap-prof-name --frozen-intrinsics --enable-source-maps --input-type --print --trace-sync-io --experimental-import-meta-resolve --experimental-report --experimental-worker --tls-keylog --insecure-http-parser --no-warnings --http-parser --report-on-signal --heap-prof-dir --inspect-port --no-node-snapshot --debug-brk --trace-tls --experimental-loader --tls-max-v1.2 --jitless --track-heap-objects --huge-max-old-generation-size --trace-deprecation --eval --perf-basic-prof-only-functions --disallow-code-generation-from-strings --http-server-default-timeout --stack-trace-limit --experimental-repl-await --prof-process --trace-uncaught --inspect-brk-node --max-old-space-size --redirect-warnings --policy-integrity --debug --abort-on-uncaught-exception --report-signal --report-uncaught-exception --harmony_numeric_separator --use-openssl-ca --openssl-config --experimental-policy --icu-data-dir --report-on-fatalerror --napi-modules --perf-basic-prof --v8-pool-size --tls-min-v1.1 --experimental-json-modules --trace-sigint --cpu-prof-name --interpreted-frames-native-stack --report-filename --tls-cipher-list --title --report-compact --debug-arraybuffer-allocations --trace-event-file-pattern --unhandled-rejections --fast_calls_with_arguments_mismatches --use-bundled-ca --require --completion-bash --check --inspect --experimental-wasm-modules --zero-fill-buffers --max-http-header-size --use-largepages --disable-proto --experimental-wasi-unstable-preview1 --trace-event-categories --v8-options --preserve-symlinks --test-udp-no-try-send --report-directory --security-revert --interactive --trace-warnings --trace-exit --throw-deprecation --heap-prof --help --heap-prof-interval --cpu-prof-interval --preserve-symlinks-main --experimental-vm-modules --force-context-aware --expose-internals --version --cpu-prof --no-force-async-hooks-checks --no-deprecation --heapsnapshot-signal --tls-min-v1.3 --tls-max-v1.3 --inspect-publish-uid --inspect-brk --es-module-specifier-resolution --experimental-specifier-resolution --cpu-prof-dir --debug-port --inspect= -r -p --debug= --debug-brk= -i --inspect-brk= --loader --prof-process --inspect-brk-node= -c -e --print <arg> -pe --trace-events-enabled -v --security-reverts -h' -- "${cur_word}") )
    return 0
  else
    COMPREPLY=( $(compgen -f "${cur_word}") )
    return 0
  fi
}
complete -o filenames -o nospace -o bashdefault -F _node_complete node node_g