package loantest.get

import future.keywords.contains
import future.keywords.if
import future.keywords.in

default approve := false

approval_group := data.group

approve if {
  input.user.properties.groups[_] == data.group
}

approve_2 if {
  input.user.properties.groups[_] == approval_group
}

approve_0 if {

  input.user.properties.groups[_] == data.rules[0].approvalGroup
}

approve_1 if {

  input.user.properties.groups[_] == data.rules[1].approvalGroup
}

approve_3 if {

  some i
  input.user.properties.groups[_] == data.rules[i].approvalGroup
}
