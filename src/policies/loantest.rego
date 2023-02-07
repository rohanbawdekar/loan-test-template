package loantest.get

import future.keywords.contains
import future.keywords.if
import future.keywords.in

default approve := false
default approve_2 := false
default approve_3 := false


approve if {

  some i
  input.user.properties.groups[_] == data.rules[i].approvalGroup
  input.resource.amount >= data.rules[i].lowerAmountLimit
  input.resource.amount < data.rules[i].upperAmountLimit
}

approval_group contains data.rules[i].approvalGroup if {
 some i
 input.resource.amount >= data.rules[i].lowerAmountLimit
 input.resource.amount < data.rules[i].upperAmountLimit
}


approve_2 if {
  some[i]
  input.user.properties.groups[_] == approval_group[i]
}

approve_3 if {
  input.user.properties.groups[_] == approval_group[_]
}
