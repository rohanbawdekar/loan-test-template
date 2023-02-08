package loantest.get

import future.keywords.contains
import future.keywords.if
import future.keywords.in

default approve := false


approval_group contains data.rules[i].approvalGroup if {
 some i
 input.resource.amount >= data.rules[i].lowerAmountLimit
 input.resource.amount < data.rules[i].upperAmountLimit
}

approve if {
  input.user.properties.groups[_] == approval_group[_]
}
