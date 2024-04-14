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

mcd()
{
    test -d "$1" || mkdir "$1" && cd "$1"
}

sts() {
  eval "$(r-keychain env --env corp)"
  vault list -format=json aws/roles | jq -r '.[]' | \
  fzf --bind "enter:execute(eval jphtest={+})";
}

function ac {
  if [[ "$#" -eq 0 ]]; then
    profile=$(awk '/profile/ {print $2}' ~/.aws/config | tr -d ] | fzf)
  elif [[ "$#" -eq 1 ]]; then
    if [[ "$1" == "off" ]]; then
      unset AWS_SDK_LOAD_CONFIG
      unset AWS_DEFAULT_REGION
      unset AWS_PROFILE
      return 0
    else
      profile="$(profile_nicknames $1)"
    fi
  fi

  export AWS_PROFILE=$profile

  if [[ $profile == *prod* ]]; then
    region="eu-west-2"
  else
    region=$(region_nicknames $2)
  fi

  export AWS_DEFAULT_REGION=$region
  export AWS_SDK_LOAD_CONFIG=true
}

function profile_nicknames {
  case "$1" in
    corp) echo "corp-prod-infra";;
    dev1) echo "infra-platform-dev1-infra";;
    dev2) echo "infra-platform-dev2-infra";;
    nexus) echo "infra-platform-nexus-infra";;
    pipeline) echo "infra-platform-pipeline-infra";;
    integration-prod|intprod|iprod) echo "integration-prod-infra";;
    experimental|exp) echo "platform-experimental-infra";;
    netops|netops-prod) echo "netops-prod-infra";;
    platform-prod|v1prod) echo "platform-prod-infra";;
    platform-staging|v1staging) echo "platform-staging-infra";;
    ripplenet-prod|rn-prod|rnp|rnprod|v2prod) echo "ripplenet-prod-infra";;
    ripplenet-staging|rn-staging|rnstaging|v2staging) echo "ripplenet-staging-infra";;
    rnc|rnc-prod|rncprod|rncp) echo "ripplenet-xcurrent-prod-infra";;
    *) echo "$1";;
  esac
}

function region_nicknames {
  case "$1" in
    "")
      region="us-west-2";;
    usw2)
      region="us-west-2";;
    euw2)
      region="eu-west-2";;
    use1)
      region="us-east-1";;
    fzf)
      region=$(aws account list-regions | jq -r '.Regions[] | select(.RegionOptStatus!="DISABLED") | .RegionName' | fzf);;
    *)
      region="$2"
    ;;
  esac
  echo $region
}

function vault_login() {
  VAULT_TOKEN=$(vault login -field=token -method=ldap username=phicks password=$(security find-generic-password -s ldap -D rust-keyring -a phicks -w) )
  export VAULT_TOKEN
  #vault login -field=token -method=ldap username=phicks >  .vault_token
}

