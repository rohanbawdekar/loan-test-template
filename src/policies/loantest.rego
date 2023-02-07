package loantest.get

import future.keywords.contains
import future.keywords.if
import future.keywords.in

default approve := false

approve if {

  some i
  input.user.properties.groups[_] == data.rules[i].approvalGroup
}
