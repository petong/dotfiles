hs () { if [[ ! -z $1 ]];then history 0 | grep --color "$*";fi }

ssh-reagent () {
  for agent in /tmp/ssh-*/agent.*; do
    export SSH_AUTH_SOCK=$agent
    if ssh-add -l 2>&1 > /dev/null; then
      echo Found working SSH Agent:
      ssh-add -l
      return
    fi
  done
  echo Cannot find ssh agent - maybe you should reconnect and forward it?
}

kcc() {
  kubectl config get-contexts -o name | \
    fzf --bind "enter:execute(kubectl config use-context {} &&  kubectl config view --flatten --minify > ~/.kube/{}.yaml && export KUBECONFIG=~/.kube/{}.yaml)" --bind "enter:+accept";
}

kns() {
  kubectl get namespaces -o=jsonpath='{range .items[*]}{.metadata.name}{"\n"}{end}' | fzf \
    --bind "enter:execute(kubectl config set-context --current --namespace={} )" --bind "enter:+accept" \
    --bind "ctrl-\:execute(kubectl get {+} -o yaml | nvim )" \

}

kd() {
  #kubectl get all -o name | \
  # kubectl describe --namespace $(kubectl get all --all-namespaces --template '{{range .items}}{{.metadata.namespace}} {{.kind}}/{{.metadata.name}}{{"\n"}}{{end}}' | fzf | awk '{print tolower($0)}')
  #kubectl describe --namespace $(kubectl get all --all-namespaces --template '{{range .items}}{{.metadata.namespace}} {{.kind}}/{{.metadata.name}}{{"\n"}}{{end}}' ) | \
  kubectl api-resources --verbs=list --namespaced -o name | grep -v "events.events.k8s.io" | grep -v "events" | sort -u | \
    fzf --preview 'kubectl get {} -o yaml' \
        --bind "ctrl-\:execute(kubectl get {+} -o yaml | nvim )" \
        --bind "ctrl-r:reload(kubectl get $* -o name)" --header 'Press CTRL-R to reload' \
        --bind "ctrl-]:execute(kubectl edit {+})";
}

kubectlgetall() {
  for i in $(kubectl api-resources --verbs=list --namespaced -o name | grep -v "events.events.k8s.io" | grep -v "events" | sort | uniq); do
    echo "Resource:" $i
    kubectl -n ${1} get --ignore-not-found ${i}
  done
}
