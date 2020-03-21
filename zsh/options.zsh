setopt autocd
setopt histignorealldups
setopt histignorespace
setopt sharehistory
setopt inc_append_history
setopt no_flow_control

READNULLCMD=less
# This affects every invocation of `less`.
#
#   -i   case-insensitive search unless search string contains uppercase letters
#   -R   color
#   -F   exit if there is less than one page of content
#   -X   keep content on screen after exit
#   -M   show more info at the bottom prompt line
#   -x4  tabs are 4 instead of 8
export LESS=-iRFXMx4

